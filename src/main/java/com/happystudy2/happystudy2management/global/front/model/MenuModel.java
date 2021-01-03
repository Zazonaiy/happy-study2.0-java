package com.happystudy2.happystudy2management.global.front.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@EqualsAndHashCode
public class MenuModel {
    private String id;
    private String name;
    private String icon;
    private String url;
    private Integer level;
    private String preId;
    private String preName;
    private String preUrl;
    private List<MenuModel> subMenuList;

    public MenuModel (Integer level){
        this.level = level;
        this.subMenuList = new ArrayList<>();
    }
    public MenuModel(Integer level, List<MenuModel> array){
        this.level = level;
        this.subMenuList = array;
    }
}
