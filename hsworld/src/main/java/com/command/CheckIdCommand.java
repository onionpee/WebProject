// 아이디 중복확인 커맨드

package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;

public class CheckIdCommand implements Command {


	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("user_id");
		System.out.println(id);
		int result = 0;
		
		try {
			result = new UserDAO().seleltAllId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
	}

}
