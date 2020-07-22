package com.chinasofti.dao.sys;

import com.chinasofti.model.sys.Role;

import java.util.List;

public interface RoleDao {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> selectList(Role role);

    List<Role> selectByUserId(String id);

    List<Role> select();
}