package com.chinasofti.service.biz;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.biz.Clazz;

import javax.servlet.http.HttpSession;

public interface ClazzService {
    int add(Clazz clazz, HttpSession session);

    DataTables DataTables(Clazz clazz);

    DataTables DataTablesCurrentData(Clazz clazz, HttpSession session);
}
