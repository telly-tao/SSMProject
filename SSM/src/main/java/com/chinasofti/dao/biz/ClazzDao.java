package com.chinasofti.dao.biz;

import com.chinasofti.model.biz.Clazz;

import java.util.List;

public interface ClazzDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Clazz record);

    int insertSelective(Clazz record);

    Clazz selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Clazz record);

    int updateByPrimaryKey(Clazz record);

    List<Clazz> selectList(Clazz clazz);

    List<Clazz> currentSelectList(String userid);
}