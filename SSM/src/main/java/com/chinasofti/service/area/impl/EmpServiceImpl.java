package com.chinasofti.service.area.impl;

import com.chinasofti.dao.area.CompanyDao;
import com.chinasofti.dao.area.DeptDao;
import com.chinasofti.dao.area.EmpDao;
import com.chinasofti.dao.area.PositionDao;
import com.chinasofti.dao.setup.SetupDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;
import com.chinasofti.model.area.Dept;
import com.chinasofti.model.area.Emp;
import com.chinasofti.model.area.Position;
import com.chinasofti.model.setup.Setup;
import com.chinasofti.service.area.EmpService;
import com.chinasofti.util.Md5Util;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    EmpDao empDao;
    @Autowired
    CompanyDao companyDao;
    @Autowired
    SetupDao setupDao;
    @Autowired
    DeptDao deptDao;
    @Autowired
    PositionDao positionDao;

    @Override
    public DataTables DataTables(Emp emp) {
        DataTables dt = new DataTables();
        int page = emp.getStart() / emp.getLength() + 1;
        PageHelper.startPage(page, emp.getLength());
        List<Emp> list = empDao.selectList(emp);
        //所在公司查询
        for(Emp e : list){
            Company companie = companyDao.selectByPrimaryKey(e.getCompanyid());
            Dept dept=deptDao.selectByPrimaryKey(e.getDeptid());
            Position position=positionDao.selectByPrimaryKey(e.getPositionid());
            Setup setup=setupDao.selectByPrimaryKey(e.getSetupid());
            e.setCompany(companie);
            e.setDept(dept);
            e.setPosition(position);
            e.setSetup(setup);
        }
        dt.setData(list);
        PageInfo<Emp> pageInfo = new PageInfo<Emp>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public int add(Emp emp, HttpSession session) {
        emp.setCreateid(UserUtil.userid(session));
        emp.setCreatetime(new Date());
        return empDao.insertSelective(emp);
    }

    @Override
    public int remove(String id) {
        return empDao.deleteByPrimaryKey(id);
    }

    @Override
    public int edit(Emp emp, HttpSession session) {
        emp.setModifyid(UserUtil.userid(session));
        emp.setModifytime(new Date());
        return empDao.updateByPrimaryKeySelective(emp);
    }

    @Override
    public Emp query(String id) {
        return empDao.selectByPrimaryKey(id);
    }

    @Override
    public List<Emp> queryTE(String companyid) {
        return empDao.queryTE(companyid);
    }
    @Override
    public List<Emp> queryTA(String companyid) {
        return empDao.queryTA(companyid);
    }
    @Override
    public List<Emp> queryTR(String companyid) {
        return empDao.queryTR(companyid);
    }

    @Override
    @Transactional
    public void imp(MultipartFile file, HttpSession session) throws Exception {
        Workbook readwb = null;
        if(!file.isEmpty()){
            InputStream instream = file.getInputStream();
            readwb = Workbook.getWorkbook(instream);
            Sheet readsheet = readwb.getSheet(0);
            int rsRows = readsheet.getRows();
            int rsColumns = readsheet.getColumns();
            for (int i = 1; i < rsRows; i++) {
                Emp emp = new Emp();
                emp.setCreateid(UserUtil.userid(session));
                emp.setCreatetime(new Date());
                for (int j = 0; j < rsColumns; j++) {
                    Cell cell = readsheet.getCell(j, i);
                    switch (j){
                        case  0 : emp.setName(cell.getContents()); continue;
                        case  1 : emp.setSex(cell.getContents()); continue;
                        case  2 : emp.setCompanyid(Integer.parseInt(cell.getContents())); continue;
                        case  3 : emp.setDeptid(Integer.parseInt(cell.getContents())); continue;
                        case  4 : emp.setPositionid(Integer.parseInt(cell.getContents())); continue;
                        case  5 : emp.setSetupid(Integer.parseInt(cell.getContents())); continue;
                        case  6 : emp.setLev(cell.getContents()); continue;
                        case  7 : emp.setAway(cell.getContents()); continue;
                        case  8 : emp.setQq(cell.getContents()); continue;
                        case  9 : emp.setWechart(cell.getContents()); continue;
                        case  10 : emp.setEmail(cell.getContents()); continue;
                        case  11 : emp.setAddress(cell.getContents()); continue;
                    }
                    empDao.insertSelective(emp);
                }
            }
            instream.close();
        }
    }

}
