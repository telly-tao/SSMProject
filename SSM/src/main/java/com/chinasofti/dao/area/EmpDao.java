package com.chinasofti.dao.area;

import com.chinasofti.model.area.Emp;

import java.util.List;

public interface EmpDao {
    int deleteByPrimaryKey(String id);

    int insert(Emp record);

    int insertSelective(Emp record);

    Emp selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Emp record);

    int updateByPrimaryKey(Emp record);

    List<Emp> selectList(Emp emp);

    List<Emp> queryList();

    List<Emp> queryTE(String companyid);

    List<Emp> queryTA(String companyid);

    List<Emp> queryTR(String companyid);
}