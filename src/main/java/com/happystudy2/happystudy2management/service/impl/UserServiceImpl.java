package com.happystudy2.happystudy2management.service.impl;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.MemberTypeEnum;
import com.happystudy2.happystudy2management.constants.enums.errorEnum.impl.BussinessErrorCodeEnum;
import com.happystudy2.happystudy2management.constants.exception.BussinessExcecption;
import com.happystudy2.happystudy2management.core.service.PasswordHelper;
import com.happystudy2.happystudy2management.core.service.TypeMapper;
import com.happystudy2.happystudy2management.dao.user.RoleMapper;
import com.happystudy2.happystudy2management.dao.user.UserMapper;
import com.happystudy2.happystudy2management.dao.user.UserRoleMiddleMapper;
import com.happystudy2.happystudy2management.domain.dto.user.UserEditDTO;
import com.happystudy2.happystudy2management.domain.po.student.StudentPO;
import com.happystudy2.happystudy2management.domain.po.teacher.TeacherPO;
import com.happystudy2.happystudy2management.domain.po.user.RolePO;
import com.happystudy2.happystudy2management.domain.po.user.UserPO;
import com.happystudy2.happystudy2management.domain.po.user.UserRoleMiddlePO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import com.happystudy2.happystudy2management.domain.vo.user.UserEditVO;
import com.happystudy2.happystudy2management.service.StudentService;
import com.happystudy2.happystudy2management.service.TeacherService;
import com.happystudy2.happystudy2management.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {
    private final String admin = "admin";
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private UserRoleMiddleMapper userRoleMiddleMapper;

    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private PasswordHelper passwordHelper;
    @Autowired
    private TypeMapper typeMapper;

    @Transactional
    @Override
    public UserEditVO addUser(UserEditDTO userEditDTO) {
        Integer memberType = userEditDTO.getMemberType();
        Integer memberNo = userEditDTO.getMemberNo();
        if (!this.addUserCheck(userEditDTO)){
            return null;
        }
        String memberId = this.getMemberId(memberNo, memberType);
        if (Objects.isNull(memberId)){
            if (!admin.equals(memberId)){
                return null;
            }
            //管理员用户memberId可以为null
        }

        UserPO insert = passwordHelper.encryptPassword(typeMapper.map(userEditDTO, UserPO.class));
        insert.setMemberId(memberId);
        insert.setCreateUser(this.currentUser());
        insert.setLastModifyUser(this.currentUser());
        userMapper.insertSelective(insert);

        insert.setDeleted(false);
        UserPO select = userMapper.selectOne(insert);
        String userId = select.getId();
        RolePO rolePO = this.getRoleByMemberType(memberType);
        this.setUserRoleMiddle(userId, rolePO.getId());

        UserEditVO res = typeMapper.map(userEditDTO, UserEditVO.class);

        if (Objects.nonNull(memberId)){
            res.setMemberType(TypeVO.builder().typeCode(memberNo).typeDescription(MemberTypeEnum.descriptionOf(memberNo)).build());
        }
        res.setRoleId(rolePO.getId());
        res.setRoleName(rolePO.getRoleName());
        res.setRoleDescription(rolePO.getDescription());
        return res;
    }

    @Override
    public UserEditVO updatePassword(UserEditDTO userEditDTO){
        Boolean matchRes = this.passwordMatch(userEditDTO.getUsername(), userEditDTO.getPassword());
        UserPO userPO = queryByUsername(userEditDTO.getUsername());
        userPO.setPassword(userEditDTO.getNewPassword());
        userMapper.updateByPrimaryKeySelective(passwordHelper.encryptPassword(userPO));

        return typeMapper.map(userPO, UserEditVO.class);
    }

    @Override
    public UserPO queryByUsername(String username){
        if (StringUtils.isBlank(username)){
            return null;
        }
        Example example = new Example(UserPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("username", username);

        return userMapper.selectOneByExample(example);
    }

    @Override
    public Boolean isMemberExist(Integer memberNo,Integer memberType){
        if (MemberTypeEnum.STUDENT.getCode().equals(memberType)){
            StudentPO exist = studentService.queryByNo(memberNo);
            return Objects.nonNull(exist);
        }else if (MemberTypeEnum.TEACHER.getCode().equals(memberType)){
            TeacherPO exist = teacherService.queryByNo(memberNo);
            return Objects.nonNull(exist);
        }
        return false;
    }

    @Override
    public Boolean isUsernameExist(String username){
        UserPO userPO = queryByUsername(username);
        return Objects.isNull(userPO);
    }

    private String getMemberId(Integer memberNo, Integer memberType){
        if (MemberTypeEnum.STUDENT.getCode().equals(memberType)){
            StudentPO studentPO = studentService.queryByNo(memberNo);
            if (Objects.isNull(studentPO)){
                return null;
            }
            return studentPO.getId();
        }
        if (MemberTypeEnum.TEACHER.getCode().equals(memberType)){
            TeacherPO teacherPO = teacherService.queryByNo(memberNo);
            if (Objects.isNull(teacherPO)){
                return null;
            }
            return teacherPO.getId();
        }
        if (MemberTypeEnum.ADMIN.getCode().equals(memberType)){
            return admin;
        }
        return null;
    }

    private boolean addUserCheck(UserEditDTO userEditDTO){
        String username = userEditDTO.getUsername();

        UserPO exist = queryByUsername(username);
        if (Objects.nonNull(exist)){
            return false;
        }

        return true;
    }

    private Boolean setUserRoleMiddle(String userId, String roleId){
        UserRoleMiddlePO userRoleMiddlePO = new UserRoleMiddlePO();
        userRoleMiddlePO.setUserId(userId);
        userRoleMiddlePO.setRoleId(roleId);

        userRoleMiddleMapper.insertSelective(userRoleMiddlePO);
        return true;
    }

    private RolePO getRoleByMemberType(Integer memberType){
        String roleName;
        if (MemberTypeEnum.TEACHER.getCode().equals(memberType)){
            roleName = MemberTypeEnum.TEACHER.getDescription();
        }else if (MemberTypeEnum.STUDENT.getCode().equals(memberType)){
            roleName = MemberTypeEnum.STUDENT.getDescription();
        }else if (MemberTypeEnum.ADMIN.getCode().equals(memberType)){
            roleName = MemberTypeEnum.ADMIN.getDescription();
        }else {
            throw new BussinessExcecption(BussinessErrorCodeEnum.LOSE_ROLE);
        }

        Example example = new Example(RolePO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("deleted", false);
        criteria.andEqualTo("roleName", roleName);
        RolePO rolePO = roleMapper.selectOneByExample(example);
        if (Objects.isNull(rolePO)){
            throw new BussinessExcecption(BussinessErrorCodeEnum.LOSE_ROLE);
        }
        return rolePO;
    }

    private boolean passwordMatch(String username, String password){
        if (StringUtils.isBlank(username)||StringUtils.isBlank(password)){
            return false;
        }
        UserPO exist = this.queryByUsername(username);
        if (Objects.isNull(exist)){
            return false;
        }
        String dbPassword = exist.getPassword();
        String salt = exist.getPasswordSalt();
        String hexPass = passwordHelper.createCredentials(password, salt);
        if (StringUtils.isBlank(dbPassword)||StringUtils.isBlank(hexPass)){
            return false;
        }
        return hexPass.equals(dbPassword);
    }

    private String currentUser(){
        return (String)SecurityUtils.getSubject().getPrincipal();
    }
}
