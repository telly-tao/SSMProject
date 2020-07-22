package com.chinasofti.service.setup.Impl;

import com.chinasofti.dao.area.CompanyDao;
import com.chinasofti.dao.setup.SetupDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;
import com.chinasofti.model.setup.Setup;
import com.chinasofti.service.setup.SetupService;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class SetupServiceImpl implements SetupService {

    @Autowired
    SetupDao setupDao;
    @Autowired
    CompanyDao companyDao;

    @Override
    public DataTables DataTables(Setup setup) {
        DataTables dt = new DataTables();
        int page = setup.getStart() / setup.getLength() + 1;
        PageHelper.startPage(page, setup.getLength());
        List<Setup> list = setupDao.selectList(setup);
        //所在公司查询
        for(Setup s : list){
            Company companie = companyDao.selectByPrimaryKey(s.getCompanyid());
            s.setCompany(companie);
        }
        dt.setData(list);
        PageInfo<Setup> pageInfo = new PageInfo<Setup>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public int add(Setup setup, HttpSession session) {
        setup.setCreateid(UserUtil.userid(session));
        setup.setCreatetime(new Date());
        return setupDao.insertSelective(setup);
    }

    @Override
    public Setup query(Integer id) {
        return setupDao.selectByPrimaryKey(id);
    }

    @Override
    public int edit(Setup setup, HttpSession session) {
        setup.setModifyid(UserUtil.userid(session));
        setup.setModifytime(new Date());
        return setupDao.updateByPrimaryKeySelective(setup);
    }

    @Override
    public int remove(Integer id) {
        return setupDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<Setup> querySetup(String companyid) {
        return setupDao.queryList(companyid);
    }
}
