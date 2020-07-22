package com.chinasofti.controller.sys;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.Tree;
import com.chinasofti.model.TreeSelect;
import com.chinasofti.model.sys.Auth;
import com.chinasofti.service.sys.AuthService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/sys/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @RequestMapping("/auth.action")
    public String auth(){
        return "sys/auth";
    }

    @RequestMapping("/tree.action")
    @ResponseBody
    public String tree(String authids){
        List<Tree> tree = authService.tree(authids);
        return JSON.toJSONString(tree, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/treeSelect.action")
    @ResponseBody
    public String treeSelect(){
        List<TreeSelect> tree = authService.treeSelect();
        return JSON.toJSONString(tree, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Auth auth, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            authService.add(auth, session);
            json.setSuccess(true);
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("新增失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/edit.action")
    @ResponseBody
    public String edit(Auth auth, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            authService.edit(auth, session);
            json.setSuccess(true);
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("修改失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/remove.action")
    @ResponseBody
    public String remove(Integer id) {
        JsonUtil json = new JsonUtil();
        try {
            authService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/query.action")
    @ResponseBody
    public String query(Integer id) {
        Auth auth  = authService.query(id);
        return JSON.toJSONString(auth, SerializerFeature.WriteMapNullValue);
    }

}
