package com.happystudy2.happystudy2management.core.service;

import com.happystudy2.happystudy2management.controller.UserController;
import com.happystudy2.happystudy2management.dao.user.view.UserPermissionViewMapper;
import com.happystudy2.happystudy2management.dao.user.view.UserRoleViewMapper;
import com.happystudy2.happystudy2management.domain.po.user.view.UserPermissionViewPO;
import com.happystudy2.happystudy2management.domain.po.user.view.UserRoleViewPO;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class UserHelper {
    private UserRoleViewMapper userRoleViewMapper;
    private UserPermissionViewMapper userPermissionViewMapper;

    public String currentUser(){
        String username = (String)SecurityUtils.getSubject().getPrincipal();
        return username;
    }

    public List<UserRoleViewPO> currentUserRole(){
        String username = currentUser();

        Example example = new Example(UserRoleViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("username", username);
        List<UserRoleViewPO> userRoleViewPOList = userRoleViewMapper.selectByExample(example);
        return userRoleViewPOList;
    }

    public List<UserPermissionViewPO> currentUserPermission(){
        String username = currentUser();

        Example example = new Example(UserPermissionViewPO.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("username", username);
        List<UserPermissionViewPO> userPermissionViewPOList = userPermissionViewMapper.selectByExample(example);
        return userPermissionViewPOList;
    }

}
