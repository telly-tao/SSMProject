package com.chinasofti.dao.room;

import com.chinasofti.model.room.ClassRoom;
import com.chinasofti.model.sys.User;

import java.util.List;

public interface ClassRoomDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ClassRoom record);

    int insertSelective(ClassRoom record);

    ClassRoom selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ClassRoom record);

    int updateByPrimaryKey(ClassRoom record);

    List<ClassRoom> selectList(ClassRoom room);

    List<ClassRoom> queryList(String companyid);

    List<ClassRoom> queryNum(String calssroomid);
}