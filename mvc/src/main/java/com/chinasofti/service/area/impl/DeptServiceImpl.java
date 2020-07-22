package com.chinasofti.service.area.impl;

import com.chinasofti.dao.area.CompanyDao;
import com.chinasofti.dao.area.DeptDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;
import com.chinasofti.model.area.Dept;
import com.chinasofti.service.area.DeptService;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    DeptDao deptDao;
    @Autowired
    CompanyDao companyDao;
    @Override
    public DataTables DataTables(Dept dept) {
        DataTables dt = new DataTables();
        int page = dept.getStart() / dept.getLength() + 1;
        PageHelper.startPage(page, dept.getLength());
        List<Dept> list = deptDao.selectList(dept);
        //所在公司查询
        for(Dept d : list){
            Company companie = companyDao.selectByPrimaryKey(d.getCompanyid());
            d.setCompany(companie);
        }
        dt.setData(list);
        PageInfo<Dept> pageInfo = new PageInfo<Dept>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public int add(Dept dept, HttpSession session) {
        dept.setCreateid(UserUtil.userid(session));
        dept.setCreatetime(new Date());
        return deptDao.insertSelective(dept);
    }

    @Override
    public Dept query(Integer id) {
        return deptDao.selectByPrimaryKey(id);
    }

    @Override
    public int edit(Dept dept, HttpSession session) {
        dept.setModifyid(UserUtil.userid(session));
        dept.setModifytime(new Date());
        return deptDao.updateByPrimaryKeySelective(dept);
    }

    @Override
    public int remove(Integer id) {
        return deptDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<Dept> queryDept(String companyid) {
        return deptDao.queryList(companyid);
    }
}
