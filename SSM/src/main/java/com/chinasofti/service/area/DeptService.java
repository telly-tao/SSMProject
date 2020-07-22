package com.chinasofti.service.area;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Dept;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface DeptService {
    DataTables DataTables(Dept dept);

    int add(Dept dept, HttpSession session);

    Dept query(Integer id);

    int edit(Dept dept, HttpSession session);

    int remove(Integer id);

    List<Dept> queryDept(String companyid);
}
