package com.chinasofti.dao.area;

import com.chinasofti.model.area.Dept;

import java.util.List;

public interface DeptDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);

    List<Dept> selectList(Dept dept);

    List<Dept> queryList(String companyid);
}