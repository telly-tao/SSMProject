package com.chinasofti.service.area;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface CompanyService {
    DataTables DataTables(Company company);

    int add(Company company, HttpSession session);

    Company query(Integer id);

    int edit(Company company, HttpSession session);

    int remove(Integer id);

    List<Company> queryCompany();
}
