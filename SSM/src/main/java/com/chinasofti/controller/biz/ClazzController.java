package com.chinasofti.controller.biz;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Dept;
import com.chinasofti.model.biz.Clazz;
import com.chinasofti.model.room.ClassRoom;
import com.chinasofti.service.biz.ClazzService;
import com.chinasofti.service.room.ClassRoomService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/biz/clazz")
public class ClazzController {

    @Autowired
    ClazzService clazzService;

    @RequestMapping("/current.action")
    public String current() {
        return "biz/current";
    }

    @RequestMapping("/all.action")
    public String all() {
        return "biz/all";
    }

    @RequestMapping("/clazz.action")
    public String clazz() {
        return "biz/clazz";
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Clazz clazz, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
             int count = clazzService.add(clazz, session);
            json.setMessage("保存成功！");
            json.setSuccess(true);
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("新增失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }

    @RequestMapping("/currentdata.action")
    @ResponseBody
    public String currentdata(Clazz clazz,HttpSession session){
        DataTables dataTables = clazzService.DataTablesCurrentData(clazz,session);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/alldata.action")
    @ResponseBody
    public String alldata(Clazz clazz){
        DataTables dataTables = clazzService.DataTables(clazz);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }
}


