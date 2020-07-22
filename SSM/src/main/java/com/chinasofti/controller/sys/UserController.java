package com.chinasofti.controller.sys;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.sys.Auth;
import com.chinasofti.model.sys.User;
import com.chinasofti.service.sys.AuthService;
import com.chinasofti.service.sys.UserService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/sys/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private AuthService authService;

    @RequestMapping("/user.action")
    public String user() {
        return "sys/user";
    }

    @RequestMapping("/userProfile.action")
    public String userProfile() {
        return "sys/userProfile";
    }

    @RequestMapping("/login.action")
    @ResponseBody
    public String login(String id, String password, HttpSession session) {
        JsonUtil json = new JsonUtil();
        User user = userService.login(id, password);
        if (user != null) {
            json.setSuccess(true);
            session.setAttribute("user", user);
            List<Auth> menuList = authService.menuList();
            session.setAttribute("menuList", menuList);
            String authUrls = userService.selectAuthUrls(user.getId());
            session.setAttribute("authUrls",authUrls);
        } else {
            json.setSuccess(false);
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/logout.action")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @RequestMapping("/query.action")
    @ResponseBody
    public String query(String id) {
        User user = userService.query(id);
        return JSON.toJSONString(user, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(User user, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = userService.add(user, session);
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
    public String edit(User user, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = userService.edit(user, session);
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
    public String remove(String id) {
        JsonUtil json = new JsonUtil();
        try {
            int count = userService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/dataTables.action")
    @ResponseBody
    public String dataTables(User user) {
        DataTables dataTables = userService.DataTables(user);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/imp.action")
    public String imp(MultipartFile file, HttpSession session){
        try {
            userService.imp(file, session);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "sys/user";
    }

    @RequestMapping("/upload.action")
    public String upload(MultipartFile file, HttpSession session){
        userService.upload(file, session);
        return "sys/userProfile";
    }

    @RequestMapping("/loadImg.action")
    @ResponseBody
    public void loadImg(HttpServletRequest request, HttpServletResponse response, String id) throws Exception {
       userService.loadImg(request, response, id);
    }

}
