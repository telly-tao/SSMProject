package com.chinasofti.service.sys;

import com.chinasofti.model.Tree;
import com.chinasofti.model.TreeSelect;
import com.chinasofti.model.sys.Auth;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AuthService {

    List<Tree> tree(String authids);

    List<TreeSelect> treeSelect();

    List<Auth> menuList();

    int add(Auth auth, HttpSession session);

    Auth query(Integer id);

    int edit(Auth auth, HttpSession session);

    int remove(Integer id);
}
