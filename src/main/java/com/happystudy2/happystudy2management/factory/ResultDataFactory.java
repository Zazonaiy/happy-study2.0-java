package com.happystudy2.happystudy2management.factory;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ParamStateEnum;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import org.apache.commons.compress.utils.Lists;

import java.util.Collection;
import java.util.List;

public class ResultDataFactory <T extends BaseVO> {
    private List<BaseVO> data;

    public ResultDataFactory(T ...data){
        this.data = Lists.newArrayList();
        for (T t : data){
            this.data.add(t);
        }
    }
    public ResultDataFactory(Collection<T> data){
        this.data = Lists.newArrayList();
        for (T t : data){
            this.data.add(t);
        }
    }

    public ResultData<BaseVO> success(String description){
        return ResultData.builder().state(ParamStateEnum.SUCCESS.getCode()).resData(data).description(description).build();
    }
    public ResultData<BaseVO> success(){
        return ResultData.builder().state(ParamStateEnum.SUCCESS.getCode()).resData(data).build();
    }

    public ResultData<BaseVO> warning(String description){
        return ResultData.builder().state(ParamStateEnum.WARNING.getCode()).resData(data).description(description).build();
    }
    public ResultData<BaseVO> warning(){
        return ResultData.builder().state(ParamStateEnum.WARNING.getCode()).resData(data).build();
    }

    public ResultData<BaseVO> error(String description){
        return ResultData.builder().state(ParamStateEnum.ERROR.getCode()).resData(data).description(description).build();
    }
    public ResultData<BaseVO> error(){
        return ResultData.builder().state(ParamStateEnum.ERROR.getCode()).resData(data).build();
    }

}
