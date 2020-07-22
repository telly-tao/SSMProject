package com.chinasofti.controller.area;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Dept;
import com.chinasofti.model.area.Emp;
import com.chinasofti.service.area.EmpService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/area/emp")
public class EmpController {

    @Autowired
    EmpService empService;

    @RequestMapping("/emp.action")
    public String emp(){
        return "area/emp";
    }

    @RequestMapping("/dataTables.action")
    @ResponseBody
    public String dataTables(Emp emp){

        DataTables dataTables = empService.DataTables(emp);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Emp emp, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = empService.add(emp, session);
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
    public String query(String id) {
        Emp emp = empService.query(id);
        return JSON.toJSONString(emp, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/edit.action")
    @ResponseBody
    public String edit(Emp emp, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = empService.edit(emp, session);
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
            int count = empService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
    @RequestMapping("/queryTE.action")
    @ResponseBody
    public String queryTE(String companyid){
        List<Emp> emps = empService.queryTE(companyid);
        return JSON.toJSONString(emps, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/queryTA.action")
    @ResponseBody
    public String queryTA(String companyid){
        List<Emp> emps = empService.queryTA(companyid);
        return JSON.toJSONString(emps, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/queryTR.action")
    @ResponseBody
    public String queryTR(String companyid){
        List<Emp> emps = empService.queryTR(companyid);
        return JSON.toJSONString(emps, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/imp.action")
    public String imp(MultipartFile file, HttpSession session){
        try {
            empService.imp(file, session);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "area/emp";
    }
}
