package com.chinasofti.service.area.impl;

import com.chinasofti.dao.area.CompanyDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;
import com.chinasofti.service.area.CompanyService;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    CompanyDao companyDao;

    @Override
    public DataTables DataTables(Company company) {
        DataTables dt=new DataTables();
        //获取页码
        int page = company.getStart()/company.getLength() +1;
        //开始分页
        PageHelper.startPage(page,company.getLength());

        List<Company> list = companyDao.selectList(company);
        dt.setData(list);
        //包装Page 对象
        PageInfo<Company> pageInfo = new PageInfo<Company>(list);
        //过滤后记录条数
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        //记录总数
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public int add(Company company, HttpSession session) {
        company.setCreateid(UserUtil.userid(session));
        company.setCreatetime(new Date());
        return companyDao.insertSelective(company);
    }

    @Override
    public Company query(Integer id) {
        return companyDao.selectByPrimaryKey(id);
    }

    @Override
    public int edit(Company company, HttpSession session) {
        company.setModifyid(UserUtil.userid(session));
        company.setModifytime(new Date());
        return companyDao.updateByPrimaryKeySelective(company);
    }

    @Override
    public int remove(Integer id) {
        return companyDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<Company> queryCompany() {
        return  companyDao.queryList();
    }
}
