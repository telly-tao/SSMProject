package com.chinasofti.model.area;

import com.alibaba.fastjson.annotation.JSONField;
import com.chinasofti.model.Page;

import java.util.Date;
import java.util.List;

public class Dept extends Page {
    private Integer id;

    private String name;

    private Integer companyid;

    private String createid;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    private String modifyid;

    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date modifytime;

    private Company company;

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

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}