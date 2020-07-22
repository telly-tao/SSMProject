package com.chinasofti.service.sys.impl;

import com.chinasofti.dao.sys.AuthDao;
import com.chinasofti.dao.sys.RoleDao;
import com.chinasofti.dao.sys.UserDao;
import com.chinasofti.dao.sys.UserRoleDao;
import com.chinasofti.model.DataTables;
import com.chinasofti.model.sys.Auth;
import com.chinasofti.model.sys.Role;
import com.chinasofti.model.sys.User;
import com.chinasofti.model.sys.UserRole;
import com.chinasofti.service.sys.UserService;
import com.chinasofti.util.Md5Util;
import com.chinasofti.util.UserUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private AuthDao authDao;

    @Autowired
    private UserRoleDao userRoleDao;

    @Value("${file.dir}")
    String fileDir;

    @Override
    public User login(String id, String password) {
        User user = userDao.selectByPrimaryKey(id);
        if (user == null || !user.getPassword().equals(Md5Util.md5(password))) {
            user = null;
        }
        return user;
    }

    @Override
    @Transactional
    public int add(User user, HttpSession session) {
        int count = 0;
        user.setCreateid(UserUtil.userid(session));
        user.setCreatetime(new Date());
        user.setPassword(Md5Util.md5(user.getPassword()));
        count =  userDao.insertSelective(user);
        if(!StringUtils.isEmpty(user.getRoleids())){
            String[] ids = user.getRoleids().split(",");
            for(String id : ids){
                UserRole ur = new UserRole();
                ur.setUserid(user.getId());
                ur.setRoleid(Integer.parseInt(id));
                userRoleDao.insert(ur);
            }
        }
        return count;
    }

    @Override
    public DataTables DataTables(User user) {
        DataTables dt = new DataTables();
        int page = user.getStart() / user.getLength() + 1;
        PageHelper.startPage(page, user.getLength());
        List<User> list = userDao.selectList(user);
        //对每一条数据，进行角色查询
        for(User u : list){
            List<Role> roles = roleDao.selectByUserId(u.getId());
            u.setRoles(roles);
        }
        dt.setData(list);
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        dt.setiTotalDisplayRecords(pageInfo.getTotal());
        dt.setiTotalRecords(pageInfo.getTotal());
        return dt;
    }

    @Override
    @Transactional
    public int remove(String id) {
        userRoleDao.deleteByUserId(id);
        return userDao.deleteByPrimaryKey(id);
    }

    @Override
    public User query(String id) {
        User user = userDao.selectByPrimaryKey(id);
        List<Role> roles = roleDao.selectByUserId(user.getId());
        List<String> ids = new ArrayList<String>();
        for(Role role : roles){
            if(role == null) continue;
            ids.add(String.valueOf(role.getId()));
        }
        user.setRoleids(String.join(",",ids));
        return user;
    }

    @Override
    public int edit(User user, HttpSession session) {
        user.setModifyid(UserUtil.userid(session));
        user.setModifytime(new Date());
        if(!StringUtils.isEmpty(user.getPassword())){
            user.setPassword(Md5Util.md5(user.getPassword()));
        }
        if(!StringUtils.isEmpty(user.getRoleids())){
            userRoleDao.deleteByUserId(user.getId());
            String[] ids = user.getRoleids().split(",");
            for(String id : ids){
                UserRole ur = new UserRole();
                ur.setUserid(user.getId());
                ur.setRoleid(Integer.parseInt(id));
                userRoleDao.insert(ur);
            }
        }
        return userDao.updateByPrimaryKeySelective(user);
    }

    @Override
    public void upload(MultipartFile file, HttpSession session) {
        File dir = new File(fileDir);
        if(!dir.exists()){
            dir.mkdirs();
        }
        String fileName = file.getOriginalFilename();
        String extensions = fileName.substring(fileName.lastIndexOf("."),fileName.length());
        if(!file.isEmpty()){
            try {
                file.transferTo(new File(fileDir +"\\"+ UserUtil.userid(session) + extensions));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    @Transactional
    public void imp(MultipartFile file, HttpSession session) throws Exception {
        Workbook readwb = null;
        if(!file.isEmpty()){
            InputStream instream = file.getInputStream();
            readwb = Workbook.getWorkbook(instream);
            Sheet readsheet = readwb.getSheet(0);
            int rsRows = readsheet.getRows();
            int rsColumns = readsheet.getColumns();
            for (int i = 1; i < rsRows; i++) {
                User user = new User();
                user.setStatus("0");
                user.setCreateid(UserUtil.userid(session));
                user.setCreatetime(new Date());
                for (int j = 0; j < rsColumns; j++) {
                    Cell cell = readsheet.getCell(j, i);
                    switch (j){
                        case 0 : user.setId(cell.getContents());
                        continue;
                        case  1 : user.setName(cell.getContents());
                        continue;
                        case  2 : user.setPassword(Md5Util.md5(cell.getContents()));
                    }
                    userDao.insertSelective(user);
                }
            }
            instream.close();
        }
    }

    @Override
    //根据登录账号获取所有的权限地址集合
    public String selectAuthUrls(String id) {
        List<String> urlList = new ArrayList<String>();
        List<Role> roleList = roleDao.selectByUserId(id);
        for(Role role : roleList){
            if(role == null) continue;
            List<Auth> authList = authDao.selectByRoleId(role.getId());
            for(Auth auth : authList){
                if(auth == null) continue;
                urlList.add(auth.getUrl());
            }
        }
        return String.join(",", urlList);
    }

    @Override
    public void loadImg(HttpServletRequest request, HttpServletResponse response, String id) throws Exception{
        File file = new  File(fileDir + "\\" + id + ".jpg");
        if(!file.exists()){
            file = new File(request.getSession().getServletContext().getRealPath("") + "\\images\\head.jpg");
        }
        FileInputStream in = new FileInputStream(file);
        byte[] img = new byte[1024];
        OutputStream os = response.getOutputStream();
        int n = 0;
        while ((n = in.read(img)) != -1) {
            os.write(img, 0, n);// 将读取的内容，写入到输出流当中
        }
        os.flush();
        os.close();
        in.close();
    }

}
