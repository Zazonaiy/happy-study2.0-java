package com.happystudy2.happystudy2management.factory;

import com.happystudy2.happystudy2management.constants.enums.BussinessEnum.BaseBussinessEnum;
import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.core.domain.vo.TypeAble;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;

import java.util.Objects;

public class TypeFactory <E extends BaseBussinessEnum, V extends TypeAble> {
    private TypeVO typeVO;
    private V typeAble;

    public TypeFactory(){
        TypeVO.builder().build();
        typeAble = null;
    }
    public TypeFactory(E e){
        this.typeVO = TypeVO.builder().typeCode(e.getCode()).typeDescription(e.getDescription()).build();
    }

    public TypeFactory(E e, V v){
        this.typeVO = TypeVO.builder().typeCode(e.getCode()).typeDescription(e.getDescription()).build();
        this.typeAble = v;
    }

    public TypeFactory reload(TypeVO typeVO, V typeAble){
        this.typeVO = typeVO;
        this.typeAble = typeAble;
        return this;
    }
    public V bindTypeToVO(){
        if (Objects.isNull(typeAble)){
            return null;
        }
        typeAble.setTypeVO(typeVO);
        return typeAble;
    }
    public V bindTypeToVO(E e, V typeAble){
        typeAble.setTypeVO(TypeVO.builder().typeCode(e.getCode()).typeDescription(e.getDescription()).build());
        return typeAble;
    }
    public TypeVO getType(){
        return this.typeVO;
    }
    public static TypeVO getTypeBycodeDes(Integer code, String des){
        return TypeVO.builder().typeCode(code).typeDescription(des).build();
    }
}
