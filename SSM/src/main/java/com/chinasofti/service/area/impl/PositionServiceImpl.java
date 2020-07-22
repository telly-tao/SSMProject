package com.chinasofti.service.area.impl;

import com.chinasofti.dao.area.DeptDao;
import com.chinasofti.dao.area.PositionDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Dept;
import com.chinasofti.model.area.Position;
import com.chinasofti.service.area.PositionService;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Service
public class PositionServiceImpl implements PositionService {
    @Autowired
    PositionDao positionDao;
    @Autowired
    DeptDao deptDao;
    @Override
    public DataTables DataTables(Position position) {
        DataTables dt = new DataTables();
        int page = position.getStart() / position.getLength() + 1;
        PageHelper.startPage(page, position.getLength());
        List<Position> list = positionDao.selectList(position);
        //对每一条数据，进行角色查询
        for(Position p : list){
            Dept dept = deptDao.selectByPrimaryKey(p.getDeptid());
            p.setDept(dept);
        }
        dt.setData(list);
        PageInfo<Position> pageInfo = new PageInfo<Position>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public int add(Position position, HttpSession session) {
        position.setCreateid(UserUtil.userid(session));
        position.setCreatetime(new Date());
        return positionDao.insertSelective(position);
    }

    @Override
    public Position query(Integer id) {
        return positionDao.selectByPrimaryKey(id);
    }

    @Override
    public int edit(Position position, HttpSession session) {
        position.setModifyid(UserUtil.userid(session));
        position.setModifytime(new Date());
        return positionDao.updateByPrimaryKeySelective(position);
    }

    @Override
    public int remove(Integer id) {
        return positionDao.deleteByPrimaryKey(id);
    }

    @Override
    public List<Position> queryPosition(String deptid) {
        return positionDao.queryList(deptid);
    }
}
