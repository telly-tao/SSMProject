package com.chinasofti.dao.sys;

import com.chinasofti.model.sys.Auth;

import java.util.List;

public interface AuthDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Auth record);

    int insertSelective(Auth record);

    Auth selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Auth record);

    int updateByPrimaryKey(Auth record);

    List<Auth> selectList(Integer pid);

    List<Auth> selectByRoleId(Long id);
}