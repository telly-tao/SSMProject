package com.chinasofti.controller.area;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Position;

import com.chinasofti.service.area.PositionService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/area/position")
public class PositionController {
    @Autowired
    PositionService  positionService;

    @RequestMapping("/position.action")
    public String position(){
        return "area/position";
    }

    @RequestMapping("/dataTables.action")
    @ResponseBody
    public String dataTables(Position position){

        DataTables dataTables = positionService.DataTables(position);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }



    @RequestMapping("/add.action")
    @ResponseBody
    public String add(Position position, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = positionService.add(position, session);
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
        Position position = positionService.query(id);
        return JSON.toJSONString(position, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/edit.action")
    @ResponseBody
    public String edit(Position position, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = positionService.edit(position, session);
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
            int count = positionService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
    @RequestMapping("/queryPosition.action")
    @ResponseBody
    public String queryPosition(String deptid){
        List<Position> positions = positionService.queryPosition(deptid);
        return JSON.toJSONString(positions, SerializerFeature.WriteMapNullValue);
    }
}
