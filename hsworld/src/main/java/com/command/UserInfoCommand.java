package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;
import com.beans.UserDAO;
import com.beans.UserDTO;

public class UserInfoCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		List<UserDTO> list = null;
		
		String userid = (String)request.getParameter("id");
		
		try {
			list = new CrapDAO().readByUser(userid);
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
