package com.chinasofti.model.biz;

import com.alibaba.fastjson.annotation.JSONField;
import com.chinasofti.model.Page;
import com.chinasofti.model.area.Emp;
import com.chinasofti.model.area.Position;
import com.chinasofti.model.room.ClassRoom;
import com.chinasofti.model.setup.Setup;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Clazz extends Page {
    private Integer id;

    private String name;

    private Integer companyid;

    private Integer setupid;

    private String properties;

    private Integer classroomid;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startdate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date enddate;

    private String te;

    private String ta;

    private String tr;

    private Integer num;

    private String mark;

    private String createid;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    private String modifyid;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date modifytime;

    //自定义
    private ClassRoom classroom;
    private Emp empta;
    private Emp empte;
    private Emp emptr;
    private Setup setup;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCompanyid() {
        return companyid;
    }

    public void setCompanyid(Integer companyid) {
        this.companyid = companyid;
    }

    public Integer getSetupid() {
        return setupid;
    }

    public void setSetupid(Integer setupid) {
        this.setupid = setupid;
    }

    public String getProperties() {
        return properties;
    }

    public void setProperties(String properties) {
        this.properties = properties == null ? null : properties.trim();
    }

    public Integer getClassroomid() {
        return classroomid;
    }

    public void setClassroomid(Integer classroomid) {
        this.classroomid = classroomid;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getTe() {
        return te;
    }

    public void setTe(String te) {
        this.te = te == null ? null : te.trim();
    }

    public String getTa() {
        return ta;
    }

    public void setTa(String ta) {
        this.ta = ta == null ? null : ta.trim();
    }

    public String getTr() {
        return tr;
    }

    public void setTr(String tr) {
        this.tr = tr == null ? null : tr.trim();
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark == null ? null : mark.trim();
    }

    public String getCreateid() {
        return createid;
    }

    public void setCreateid(String createid) {
        this.createid = createid == null ? null : createid.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getModifyid() {
        return modifyid;
    }

    public void setModifyid(String modifyid) {
        this.modifyid = modifyid == null ? null : modifyid.trim();
    }

    public Date getModifytime() {
        return modifytime;
    }

    public void setModifytime(Date modifytime) {
        this.modifytime = modifytime;
    }

    public ClassRoom getClassroom() {
        return classroom;
    }

    public void setClassroom(ClassRoom classroom) {
        this.classroom = classroom;
    }

    public Emp getEmpta() {
        return empta;
    }

    public void setEmpta(Emp empta) {
        this.empta = empta;
    }

    public Emp getEmpte() {
        return empte;
    }

    public void setEmpte(Emp empte) {
        this.empte = empte;
    }

    public Emp getEmptr() {
        return emptr;
    }

    public void setEmptr(Emp emptr) {
        this.emptr = emptr;
    }

    public Setup getSetup() {
        return setup;
    }

    public void setSetup(Setup setup) {
        this.setup = setup;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}