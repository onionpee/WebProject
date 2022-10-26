package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class DeleteUserCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
//		String userId = (String)request.getAttribute("userid");
		String userId = request.getParameter("userid");
		String userPw = request.getParameter("userpw");
		System.out.println(userId);
		System.out.println(userPw);
		
		UserDTO dto = new UserDTO();
		dto.setUser_id(userId);
		dto.setUser_pw(userPw);
		
		if (userId != null && userId.trim().length() > 0) {
			try {
				cnt = new UserDAO().deleteUser(dto);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
		
	}

}
