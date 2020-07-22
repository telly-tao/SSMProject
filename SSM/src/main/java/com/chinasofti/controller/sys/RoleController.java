package com.chinasofti.controller.sys;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.Select;
import com.chinasofti.model.sys.Role;
import com.chinasofti.service.sys.RoleService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/sys/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/role.action")
    public String role(){
        return "sys/role";
    }

    @RequestMapping("/query.action")
    @ResponseBody
    public String query(Long id) {
        Role role  = roleService.query(id);
        return JSON.toJSONString(role, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/select.action")
    @ResponseBody
    public String select() {
        List<Select> roles  = roleService.select();
        return JSON.toJSONString(roles, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Role role, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = roleService.add(role, session);
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
    public String edit(Role role, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = roleService.edit(role, session);
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
    public String remove(Long id) {
        JsonUtil json = new JsonUtil();
        try {
            int count = roleService.remove(id);
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
    public String dataTables(Role role) {
        DataTables dataTables = roleService.DataTables(role);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }
}
