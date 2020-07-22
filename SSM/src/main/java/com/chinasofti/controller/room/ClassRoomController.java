package com.chinasofti.controller.room;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Dept;
import com.chinasofti.model.room.ClassRoom;
import com.chinasofti.model.sys.User;
import com.chinasofti.service.room.ClassRoomService;
import com.chinasofti.util.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/room/classroom")
public class ClassRoomController {
    @Autowired
    ClassRoomService classRoomService;

    @RequestMapping("/classroom.action")
    public String classRoom(){
        return "room/classroom";
    }

    @RequestMapping("/dataTables.action")
    @ResponseBody
    public String dataTables(ClassRoom room) {
        DataTables dataTables = classRoomService.DataTables(room);
        return JSON.toJSONString(dataTables, SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/add.action")
    @ResponseBody
    public String add(ClassRoom classRoom, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = classRoomService.add(classRoom, session);
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
        ClassRoom classRoom = classRoomService.query(id);
        return JSON.toJSONString(classRoom, SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/edit.action")
    @ResponseBody
    public String edit(ClassRoom classRoom, HttpSession session) {
        JsonUtil json = new JsonUtil();
        try {
            int count = classRoomService.edit(classRoom, session);
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
            int count = classRoomService.remove(id);
            json.setSuccess(true);
            json.setMessage("删除成功");
        } catch (Exception e) {
            json.setSuccess(false);
            json.setMessage("删除失败:" + e.getMessage());
            e.printStackTrace();
        }
        return JSON.toJSONString(json);
    }
    @RequestMapping("/queryClassRoom.action")
    @ResponseBody
    public String queryClassRoom(String companyid){
        List<ClassRoom> classRooms = classRoomService.queryClassRoom(companyid);
        return JSON.toJSONString(classRooms, SerializerFeature.WriteMapNullValue);
    }

}
