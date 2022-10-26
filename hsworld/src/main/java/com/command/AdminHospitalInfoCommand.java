package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class AdminHospitalInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		List<UserDTO> list = null;
		
		String hsname = (String)request.getParameter("hsname");
		
		try {
			list = new UserDAO().readByHospital(hsname);
			request.setAttribute("list", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
