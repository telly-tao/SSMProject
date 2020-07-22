package com.chinasofti.util;

import com.chinasofti.model.sys.User;

import javax.servlet.http.HttpSession;

public class UserUtil {

	public static String userid(HttpSession session) {
		String userid = null;
		Object obj = session.getAttribute("user");
		if (obj != null) {
			User user = (User) obj;
			userid = user.getId();
		}
		return userid;
	}

}
