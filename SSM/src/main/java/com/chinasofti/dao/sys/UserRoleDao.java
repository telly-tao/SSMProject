package com.chinasofti.dao.sys;

import com.chinasofti.model.sys.UserRole;

public interface UserRoleDao {
    int insert(UserRole record);

    int insertSelective(UserRole record);

    void deleteByUserId(String id);
}