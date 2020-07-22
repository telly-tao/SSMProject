package com.chinasofti.service.sys.impl;

import com.chinasofti.dao.sys.AuthDao;
import com.chinasofti.model.Tree;
import com.chinasofti.model.TreeSelect;
import com.chinasofti.model.sys.Auth;
import com.chinasofti.service.sys.AuthService;
import com.chinasofti.util.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthDao authDao;

    @Override
    public List<Tree> tree(String authids) {
        List<Tree> treeList = new ArrayList<Tree>();
        List<Auth> list = authDao.selectList(null);
        for (Auth auth : list) {
            Tree tree = new Tree();
            toTreeBean(auth, tree);
            List<Auth> children = authDao.selectList(auth.getId());
            List<Tree> ctList = new ArrayList<Tree>();
            for(Auth au : children){
                Tree tr = new Tree();
                toTreeBean(au, tr);
                tr.setChecked(setChecked(tr, authids));
                ctList.add(tr);
            }
            tree.setChildren(ctList);
            treeList.add(tree);
        }
        return treeList;
    }

    @Override
    public List<TreeSelect> treeSelect() {
        List<TreeSelect> treeList = new ArrayList<TreeSelect>();
        List<Auth> list = authDao.selectList(null);
        for (Auth auth : list) {
            TreeSelect tree = new TreeSelect();
            toTreeSelectBean(auth, tree);
            List<Auth> children = authDao.selectList(auth.getId());
            List<TreeSelect> ctList = new ArrayList<TreeSelect>();
            for(Auth au : children){
                TreeSelect tr = new TreeSelect();
                toTreeSelectBean(au, tr);
                ctList.add(tr);
            }
            tree.setChildren(ctList);
            treeList.add(tree);
        }
        return treeList;
    }

    @Override
    public List<Auth> menuList() {
        List<Auth> list = authDao.selectList(null);
        for (Auth auth : list) {
            List<Auth> cls = authDao.selectList(auth.getId());
            auth.setChildren(cls);
        }
        return list;
    }

    @Override
    @Transactional
    public int add(Auth auth, HttpSession session) {
        auth.setCreateid(UserUtil.userid(session));
        auth.setCreatetime(new Date());
        return authDao.insertSelective(auth);
    }

    @Override
    public Auth query(Integer id) {
        return authDao.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int edit(Auth auth, HttpSession session) {
        return  authDao.updateByPrimaryKeySelective(auth);
    }

    @Override
    @Transactional
    public int remove(Integer id) {
        return authDao.deleteByPrimaryKey(id);
    }

    private  void toTreeBean(Auth auth, Tree tree){
        tree.setId(String.valueOf(auth.getId()));
        tree.setTitle(auth.getName());
    }

    private  void toTreeSelectBean(Auth auth, TreeSelect tree){
        tree.setId(String.valueOf(auth.getId()));
        tree.setName(auth.getName());
    }

    private boolean setChecked(Tree tree, String authids){
        if(StringUtils.isEmpty(authids)) return false;
        for(String authid : authids.split(",")){
            if(tree.getId().equals(authid) && tree.getChildren() == null) return  true;
        }
        return false;
    }
}
