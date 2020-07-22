package com.chinasofti.dao.setup;

import com.chinasofti.model.setup.Setup;

import java.util.List;

public interface SetupDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Setup record);

    int insertSelective(Setup record);

    Setup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Setup record);

    int updateByPrimaryKey(Setup record);

    List<Setup> selectList(Setup setup);

    List<Setup> queryList(String companyid);
}