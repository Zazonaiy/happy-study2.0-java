package com.happystudy2.happystudy2management.util;

import com.alibaba.fastjson.JSONArray;
import com.google.common.collect.Lists;
import com.happystudy2.happystudy2management.global.front.model.MenuModel;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.ClassPathResource;
import com.happystudy2.happystudy2management.global.front.dataContainer.MenuContainer;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class XmlReader {
    public static void initMenuXml(){
        if (!MenuContainer.MENU_LIST.isEmpty()){
            return ;
        }
        try{
            ClassPathResource classPathResource = new ClassPathResource("dataxml/front/menu.xml");
            InputStream is = classPathResource.getInputStream();
            SAXReader reader = new SAXReader();
            Document document = reader.read(is);
            Element root = document.getRootElement();
            List<Element> menuList = root.elements();
            //JSONArray menuJsonArray = MenuContainer.MENU_DATA;
            List<MenuModel> menuArray = MenuContainer.MENU_LIST;
            for (Element menuElem : menuList){
                MenuModel menuModel = new MenuModel(1);
                menuModel.setId(menuElem.attributeValue("id"));
                menuModel.setName(menuElem.attributeValue("name"));
                menuModel.setIcon(menuElem.attributeValue("icon"));
                menuModel.setUrl(menuElem.attributeValue("url"));

                //二级菜单
                List<Element> subMenuList = menuElem.elements();
                if (!subMenuList.isEmpty()){
                    for (Element subMenuElem : subMenuList){
                        MenuModel subMenuModel = new MenuModel(2);
                        subMenuModel.setId(subMenuElem.attributeValue("id"));
                        subMenuModel.setName(subMenuElem.attributeValue("name"));
                        subMenuModel.setIcon(subMenuElem.attributeValue("icon"));
                        subMenuModel.setUrl(menuModel.getUrl()+subMenuElem.attributeValue("url"));
                        subMenuModel.setPreId(menuModel.getId());
                        subMenuModel.setPreName(menuModel.getName());
                        subMenuModel.setPreUrl(menuModel.getUrl());

                        //三级菜单
                        List<Element> subSubMenuList = subMenuElem.elements();
                        if (!subSubMenuList.isEmpty()){
                            for (Element subSubMenuElem : subSubMenuList){
                                MenuModel subSubMenuModel = new MenuModel(3);
                                subSubMenuModel.setId(subSubMenuElem.attributeValue("id"));
                                subSubMenuModel.setName(subSubMenuElem.attributeValue("name"));
                                subSubMenuModel.setIcon(subSubMenuElem.attributeValue("icon"));
                                subSubMenuModel.setUrl(subMenuModel.getUrl()+subSubMenuElem.attributeValue("url"));
                                subSubMenuModel.setPreId(subMenuModel.getId());
                                subSubMenuModel.setPreName(subMenuModel.getName());
                                subSubMenuModel.setPreUrl(subMenuModel.getUrl());
                                subMenuModel.getSubMenuList().add(subSubMenuModel);
                            }
                        }
                        menuModel.getSubMenuList().add(subMenuModel);
                    }
                }
                menuArray.add(menuModel);
            }

        } catch (IOException | DocumentException e){
            e.printStackTrace();
        }
    }
}
