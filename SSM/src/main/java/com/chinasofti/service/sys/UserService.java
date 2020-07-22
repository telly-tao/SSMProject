package com.chinasofti.service.sys;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.sys.User;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface UserService {

    User login(String id, String password);

    int add(User user, HttpSession session);

    DataTables DataTables(User user);

    int remove(String id);

    User query(String id);

    int edit(User user, HttpSession session);

    void upload(MultipartFile file, HttpSession session);

    void imp(MultipartFile file, HttpSession session) throws Exception;

    String selectAuthUrls(String id);

    void loadImg(HttpServletRequest request, HttpServletResponse response, String id) throws Exception;
}
