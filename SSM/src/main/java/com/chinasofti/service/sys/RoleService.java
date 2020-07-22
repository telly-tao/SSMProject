package com.chinasofti.service.sys;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.Select;
import com.chinasofti.model.sys.Role;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface RoleService {
    Role query(Long id);

    int add(Role role, HttpSession session);

    int edit(Role role, HttpSession session);

    int remove(Long id);

    DataTables DataTables(Role role);

    List<Select> select();
}
