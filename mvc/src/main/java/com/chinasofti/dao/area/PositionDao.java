package com.chinasofti.dao.area;

import com.chinasofti.model.area.Position;

import java.util.List;

public interface PositionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Position record);

    int insertSelective(Position record);

    Position selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKey(Position record);

    List<Position> selectList(Position position);

    List<Position> queryList(String deptid);
}