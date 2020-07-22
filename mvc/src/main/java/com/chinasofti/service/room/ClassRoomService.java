package com.chinasofti.service.room;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.room.ClassRoom;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface ClassRoomService {
    DataTables DataTables(ClassRoom room);

    int add(ClassRoom classRoom, HttpSession session);

    int remove(Integer id);

    int edit(ClassRoom classRoom, HttpSession session);

    ClassRoom query(Integer id);

    List<ClassRoom> queryClassRoom(String companyid);

}
