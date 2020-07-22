package com.chinasofti.service.sys.impl;

import com.chinasofti.dao.sys.AuthDao;
import com.chinasofti.dao.sys.RoleAuthDao;
import com.chinasofti.dao.sys.RoleDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.Select;
import com.chinasofti.model.sys.Auth;
import com.chinasofti.model.sys.Role;
import com.chinasofti.model.sys.RoleAuth;
import com.chinasofti.service.sys.RoleService;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private AuthDao authDao;

    @Autowired
    private RoleAuthDao roleAuthDao;

    @Override
    public Role query(Long id) {
        Role role = roleDao.selectByPrimaryKey(id);
        List<Auth> auths = authDao.selectByRoleId(role.getId());
        List<String> ids = new ArrayList<String>();
        for(Auth auth : auths){
            ids.add(String.valueOf(auth.getId()));
        }
        role.setAuthids(String.join(",", ids));
        return role;
    }

    @Override
    @Transactional
    public int add(Role role, HttpSession session) {
        role.setCreateid(UserUtil.userid(session));
        role.setCreatetime(new Date());
        int count = roleDao.insertSelective(role);
        if(!StringUtils.isEmpty(role.getAuthids())){
            String[] ids = role.getAuthids().split(",");
            for(String id : ids){
                RoleAuth ra = new RoleAuth();
                ra.setRoleid(role.getId().intValue());
                ra.setAuthid(Integer.parseInt(id));
                roleAuthDao.insert(ra);
            }
        }
        return count;
    }

    @Override
    @Transactional
    public int edit(Role role, HttpSession session) {
        role.setModifyid(UserUtil.userid(session));
        role.setModifytime(new Date());
        int count = roleDao.updateByPrimaryKey(role);
        roleAuthDao.deleteByRoleId(role.getId());
        if(!StringUtils.isEmpty(role.getAuthids())){
            String[] ids = role.getAuthids().split(",");
            for(String id : ids){
                RoleAuth ra = new RoleAuth();
                ra.setRoleid(role.getId().intValue());
                ra.setAuthid(Integer.parseInt(id));
                roleAuthDao.insert(ra);
            }
        }
        return count;
    }

    @Override
    public int remove(Long id) {
        roleAuthDao.deleteByRoleId(id);
        return roleDao.deleteByPrimaryKey(id);
    }

    @Override
    public DataTables DataTables(Role role) {
        DataTables dt = new DataTables();
        int page = role.getStart() / role.getLength() + 1;
        PageHelper.startPage(page, role.getLength());
        List<Role> list = roleDao.selectList(role);
        //查询出每一个角色对应的权限
        for(Role r : list){
            List<Auth> auths = authDao.selectByRoleId(r.getId());
            r.setAuths(auths);
        }
        dt.setData(list);
        PageInfo<Role> pageInfo = new PageInfo<Role>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    public List<Select> select() {
        List<Role> roles = roleDao.select();
        List<Select> select = new ArrayList<Select>();
        for(Role role : roles){
            Select s = new Select();
            s.setId(role.getId().toString());
            s.setText(role.getName());
            select.add(s);
        }
        return select;
    }
}
