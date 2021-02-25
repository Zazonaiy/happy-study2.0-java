package com.happystudy2.happystudy2management.dao.user;

import com.happystudy2.happystudy2management.core.dao.BaseMapper;
import com.happystudy2.happystudy2management.domain.po.user.UserPO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper extends BaseMapper<UserPO> {
}
