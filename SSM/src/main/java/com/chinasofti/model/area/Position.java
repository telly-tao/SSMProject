package com.chinasofti.model.area;

import com.alibaba.fastjson.annotation.JSONField;
import com.chinasofti.model.Page;

import java.util.Date;

public class Position extends Page {
    private Integer id;

    private String name;

    private Integer deptid;

    private String createid;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    private String modifyid;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date modifytime;

    private Dept dept;

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

    public Integer getDeptid() {
        return deptid;
    }

    public void setDeptid(Integer deptid) {
        this.deptid = deptid;
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

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }
}