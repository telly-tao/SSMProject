package com.chinasofti.controller.setup;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Dept;
import com.chinasofti.model.setup.Setup;
import com.chinasofti.service.setup.SetupService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/setup/setup")
public class setup {
    
    @Autowired
    SetupService setupService;
    
    @RequestMapping("/setup.action")
    public String setup(){
        return "setup/setup";
    }

    @RequestMapping("/dataTables.action")
    @ResponseBody
    public String dataTables(Setup setup){

        DataTables dataTables = setupService.DataTables(setup);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Setup setup, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = setupService.add(setup, session);
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
        Setup setup = setupService.query(id);
        return JSON.toJSONString(setup, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/edit.action")
    @ResponseBody
    public String edit(Setup setup, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = setupService.edit(setup, session);
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
            int count = setupService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
    @RequestMapping("/querySetup.action")
    @ResponseBody
    public String querySetup(String companyid){
        List<Setup> setups = setupService.querySetup(companyid);
        return JSON.toJSONString(setups, SerializerFeature.WriteMapNullValue);
    }
   
}
