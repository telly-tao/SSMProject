package com.chinasofti.service.setup;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.setup.Setup;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface SetupService {
    DataTables DataTables(Setup setup);

    int add(Setup setup, HttpSession session);

    Setup query(Integer id);

    int edit(Setup setup, HttpSession session);

    int remove(Integer id);

    List<Setup> querySetup(String companyid);
}
