package com.chinasofti.dao.sys;

import com.chinasofti.model.sys.RoleAuth;

public interface RoleAuthDao {
    int insert(RoleAuth record);

    int insertSelective(RoleAuth record);

    void deleteByRoleId(Long id);
}