package com.chinasofti.dao.area;

import com.chinasofti.model.area.Company;

import java.util.List;

public interface CompanyDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);

    List<Company> selectList(Company company);

    List<Company> queryList();
}