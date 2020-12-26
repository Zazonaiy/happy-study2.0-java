package com.happystudy2.happystudy2management.core.dao;

import com.happystudy2.happystudy2management.core.domain.po.BasePO;
import tk.mybatis.mapper.common.Mapper;

public interface BaseMapper<T extends BasePO> extends Mapper<T> {
}
