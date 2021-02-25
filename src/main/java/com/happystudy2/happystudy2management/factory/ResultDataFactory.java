package com.happystudy2.happystudy2management.factory;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.impl.ParamStateEnum;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.ResultData;
import lombok.Builder;
import lombok.Data;
import org.apache.commons.compress.utils.Lists;

import java.util.Collection;
import java.util.List;

public class ResultDataFactory <T extends BaseVO> {
    private List<BaseVO> data;

    private List<Object> extData;

    public ResultDataFactory(){
        this.data = Lists.newArrayList();
        this.extData = Lists.newArrayList();
    }

    public ResultDataFactory(Object ...data){
        this.data = Lists.newArrayList();
        this.extData = Lists.newArrayList();
        for (Object obj : data){
            if (obj instanceof BaseVO){
                this.data.add((BaseVO) obj);
            }else {
                this.extData.add(obj);
            }
        }
        //for (T t : data){
        //    this.data.add(t);
        //}
    }
    public ResultDataFactory(Collection<Object> data){
        this.data = Lists.newArrayList();
        this.extData = Lists.newArrayList();
        for (Object obj : data){
            if (obj instanceof BaseVO){
                this.data.add((BaseVO) obj);
            }else {
                this.extData.add(obj);
            }
        }
        //for (T t : data){
        //    this.data.add(t);
        //}
    }

    public Object addData(Object data){
        if (data instanceof BaseVO){
            this.data.add((BaseVO) data);
        }else{
            extData.add(data);
        }
        //this.data.add(data);
        //return data;
        return data;
    }

    public ResultData<BaseVO> success(String description){
        return ResultData.builder().state(ParamStateEnum.SUCCESS.getCode()).resData(data).extData(extData).description(description).build();
    }
    public ResultData<BaseVO> success(){
        return ResultData.builder().state(ParamStateEnum.SUCCESS.getCode()).resData(data).extData(extData).build();
    }

    public ResultData<BaseVO> warning(String description){
        return ResultData.builder().state(ParamStateEnum.WARNING.getCode()).resData(data).extData(extData).description(description).build();
    }
    public ResultData<BaseVO> warning(){
        return ResultData.builder().state(ParamStateEnum.WARNING.getCode()).resData(data).extData(extData).build();
    }

    public ResultData<BaseVO> error(String description){
        return ResultData.builder().state(ParamStateEnum.ERROR.getCode()).resData(data).extData(extData).description(description).build();
    }
    public ResultData<BaseVO> error(){
        return ResultData.builder().state(ParamStateEnum.ERROR.getCode()).resData(data).extData(extData).build();
    }

}
