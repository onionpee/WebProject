package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class UpdateUserCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		UserDTO dto = new UserDTO();
		dto.setUser_id(userid);
		dto.setUser_pw(password);
		dto.setUser_mail(email);
		dto.setUser_Num(phone);
		
		if (password != null && email != null) {
			try {
				cnt = new UserDAO().updateUser(dto);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
	}

}
