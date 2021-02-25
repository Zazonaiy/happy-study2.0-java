package com.happystudy2.happystudy2management.controller;

import com.alibaba.fastjson.JSONObject;
import com.happystudy2.happystudy2management.constants.constants.bussiness.UrlMap;
import com.happystudy2.happystudy2management.global.front.dataContainer.MenuContainer;
import com.happystudy2.happystudy2management.global.front.model.MenuModel;
import com.happystudy2.happystudy2management.socket.WebSocket;
import com.happystudy2.happystudy2management.util.XmlReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(UrlMap.WELCOME_CONTROLLER)
public class WelcomeController {
    //@Autowired
    //private WebSocket webSocket;

    @RequestMapping("/home")
    public String index(){
        return "home2";
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request){
        //TODO return login
        return "home2";
    }

    @GetMapping("/getMenu")
    @ResponseBody
    public JSONObject getMenu(){
        XmlReader.initMenuXml();
        JSONObject result = new JSONObject();
        result.put("menu", MenuContainer.MENU_LIST);
        return result;
    }

}
