package com.happystudy2.happystudy2management.service;

import com.happystudy2.happystudy2management.domain.dto.user.UserEditDTO;
import com.happystudy2.happystudy2management.domain.po.user.UserPO;
import com.happystudy2.happystudy2management.domain.vo.user.UserEditVO;
import org.springframework.stereotype.Service;

public interface UserService {

    UserEditVO addUser(UserEditDTO userEditDTO);

    UserEditVO updatePassword(UserEditDTO userEditDTO);

    UserPO queryByUsername(String username);

    Boolean isMemberExist(Integer memberNo,Integer memberType);

    Boolean isUsernameExist(String username);
}
