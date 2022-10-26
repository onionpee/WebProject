// 로그인 커맨드

package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class LoginCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		String userId = request.getParameter("userid");
		String userPw = request.getParameter("userpw");
		
		UserDTO dto = new UserDTO();
		dto.setUser_id(userId);
		dto.setUser_pw(userPw);
		
		if (userId != null && userId.trim().length() > 0) {
			try {
				cnt = new UserDAO().login(dto);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("어드민 ? : " + dto.getAdmin());
		request.setAttribute("admin", dto.getAdmin());
		request.setAttribute("userid", userId);
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
	}
}
