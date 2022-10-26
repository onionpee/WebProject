package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class AdminDeleteUserCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		String userid = request.getParameter("id");
		
		UserDTO dto = new UserDTO();
		dto.setUser_id(userid);
		
		if (userid != null && userid.trim().length() > 0) {
			try {
				cnt = new UserDAO().AdmindeleteUser(dto);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
	}

}
