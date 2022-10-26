package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class AdminHospitalUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String hsname = (String)request.getParameter("hsname");
		List<UserDTO> list = null;
		
		try {
			list = new UserDAO().readByHospital(hsname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		
		

	}

}
