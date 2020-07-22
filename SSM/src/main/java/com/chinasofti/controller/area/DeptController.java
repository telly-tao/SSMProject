package com.chinasofti.controller.area;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;
import com.chinasofti.model.area.Dept;
import com.chinasofti.service.area.CompanyService;
import com.chinasofti.service.area.DeptService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/area/dept")
public class DeptController {

    @Autowired
    DeptService deptService;
    @Autowired
    CompanyService companyService;

    @RequestMapping("/dept.action")
    public String dept(){
        return "area/dept";
    }

    @RequestMapping("/dataTables.action")
    @ResponseBody
    public String dataTables(Dept dept){

        DataTables dataTables = deptService.DataTables(dept);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Dept dept, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = deptService.add(dept, session);
            json.setSuccess(true);
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("新增失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
    @RequestMapping("/query.action")
    @ResponseBody
    public String query(Integer id) {
        Dept dept = deptService.query(id);
        return JSON.toJSONString(dept, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/edit.action")
    @ResponseBody
    public String edit(Dept dept, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = deptService.edit(dept, session);
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
            int count = deptService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
    @RequestMapping("/queryDept.action")
    @ResponseBody
    public String queryDept(String companyid){
        List<Dept> depts = deptService.queryDept(companyid);
        return JSON.toJSONString(depts, SerializerFeature.WriteMapNullValue);
    }
}
