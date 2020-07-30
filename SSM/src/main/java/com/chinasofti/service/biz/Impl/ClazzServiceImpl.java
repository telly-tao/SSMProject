package com.chinasofti.service.biz.Impl;

import com.alibaba.fastjson.annotation.JSONField;
import com.chinasofti.dao.area.EmpDao;
import com.chinasofti.dao.biz.ClazzDao;
import com.chinasofti.dao.room.ClassRoomDao;
import com.chinasofti.dao.setup.SetupDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Emp;
import com.chinasofti.model.biz.Clazz;
import com.chinasofti.model.room.ClassRoom;
import com.chinasofti.model.setup.Setup;
import com.chinasofti.service.biz.ClazzService;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class ClazzServiceImpl implements ClazzService {
    @Autowired
    ClassRoomDao classRoomDao;
    @Autowired
    ClazzDao clazzDao;
    @Autowired
    SetupDao setupDao;
    @Autowired
    EmpDao empDao;
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date date;
    @Override
    public int add(Clazz clazz, HttpSession session) {
        clazz.setCreateid(UserUtil.userid(session));
        clazz.setCreatetime(new Date());
        return clazzDao.insertSelective(clazz);
    }

    @Override
    public DataTables DataTables(Clazz clazz) {
        DataTables dt = new DataTables();
        int page = clazz.getStart() / clazz.getLength() + 1;
        PageHelper.startPage(page, clazz.getLength());
        List<Clazz> list = clazzDao.selectList(clazz);

        for(Clazz cl:list){
            //任职人员
            Emp empta=empDao.selectByPrimaryKey(cl.getTa());
            Emp empte=empDao.selectByPrimaryKey(cl.getTe());
            Emp emptr=empDao.selectByPrimaryKey(cl.getTr());
            cl.setEmpta(empta);
            cl.setEmpte(empte);
            cl.setEmptr(emptr);
            //技术方向
            Setup setup=setupDao.selectByPrimaryKey(cl.getSetupid());
            cl.setSetup(setup);
            //教室名
            ClassRoom classRoom=classRoomDao.selectByPrimaryKey(cl.getClassroomid());
            cl.setClassroom(classRoom);
            //根据结束日期判断班级状态0：正常，1：结束
            date = new Date();
            if(cl.getEnddate().before(date)){
                cl.setStatus(0);
            }else{
                cl.setStatus(1);
            }
        }
        dt.setData(list);
        PageInfo<Clazz> pageInfo = new PageInfo<Clazz>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public DataTables DataTablesCurrentData(Clazz clazz, HttpSession session) {
        DataTables dt = new DataTables();
        int page = clazz.getStart() / clazz.getLength() + 1;
        PageHelper.startPage(page, clazz.getLength());
        String userid=UserUtil.userid(session);
        List<Clazz> list = clazzDao.currentSelectList(userid);

        for(Clazz cl:list){
            //任职人员
            Emp empta=empDao.selectByPrimaryKey(cl.getTa());
            Emp empte=empDao.selectByPrimaryKey(cl.getTe());
            Emp emptr=empDao.selectByPrimaryKey(cl.getTr());
            cl.setEmpta(empta);
            cl.setEmpte(empte);
            cl.setEmptr(emptr);
            //技术方向
            Setup setup=setupDao.selectByPrimaryKey(cl.getSetupid());
            cl.setSetup(setup);
            //教室名
            ClassRoom classRoom=classRoomDao.selectByPrimaryKey(cl.getClassroomid());
            cl.setClassroom(classRoom);
            //根据结束日期判断班级状态0：正常，1：结束
            date = new Date();
            if(cl.getEnddate().before(date)){
                cl.setStatus(0);
            }else{
                cl.setStatus(1);
            }
        }
        dt.setData(list);
        PageInfo<Clazz> pageInfo = new PageInfo<Clazz>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }
}
