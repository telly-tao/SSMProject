package com.chinasofti.service.room.Impl;

import com.chinasofti.dao.area.CompanyDao;
import com.chinasofti.dao.room.ClassRoomDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Company;
import com.chinasofti.model.room.ClassRoom;
import com.chinasofti.service.room.ClassRoomService;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class ClassRoomServiceImpl implements ClassRoomService {

    @Autowired
    ClassRoomDao classRoomDao;

    @Autowired
    CompanyDao companyDao;

    @Override
    public DataTables DataTables(ClassRoom room) {
        DataTables dt = new DataTables();
        int page = room.getStart() / room.getLength() + 1;
        PageHelper.startPage(page, room.getLength());
        List<ClassRoom> list = classRoomDao.selectList(room);
        //所在公司查询
        for(ClassRoom c : list){
            Company company = companyDao.selectByPrimaryKey(c.getCompanyid());
            c.setCompany(company);
        }
        dt.setData(list);
        PageInfo<ClassRoom> pageInfo = new PageInfo<ClassRoom>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public int add(ClassRoom classRoom, HttpSession session) {
        classRoom.setStatus("1");
        classRoom.setCreateid(UserUtil.userid(session));
        classRoom.setCreatetime(new Date());
        return classRoomDao.insertSelective(classRoom);
    }

    @Override
    public int remove(Integer id) {
        return classRoomDao.deleteByPrimaryKey(id);
    }

    @Override
    public int edit(ClassRoom classRoom, HttpSession session) {
        classRoom.setModifyid(UserUtil.userid(session));
        classRoom.setModifytime(new Date());
        return classRoomDao.updateByPrimaryKeySelective(classRoom);
    }

    @Override
    public ClassRoom query(Integer id) {
        return classRoomDao.selectByPrimaryKey(id);
    }

    @Override
    public List<ClassRoom> queryClassRoom(String companyid) {
        return classRoomDao.queryList(companyid);
    }
}
