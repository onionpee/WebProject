package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class AdminUserSelectCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getParameter("id");
		List<UserDTO> list = null;
		
		try {
			list = new UserDAO().selectByUser(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		
	}

}
