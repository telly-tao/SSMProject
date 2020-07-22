package com.chinasofti.service.area;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Emp;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface EmpService {
    DataTables DataTables(Emp emp);

    int add(Emp emp, HttpSession session);

    int remove(String id);

    int edit(Emp emp, HttpSession session);

    Emp query(String id);

    List<Emp> queryTE(String companyid);

    List<Emp> queryTA(String companyid);

    List<Emp> queryTR(String companyid);

    void imp(MultipartFile file, HttpSession session) throws Exception;
}
