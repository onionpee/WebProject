package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;

public class AdminHospitalUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		String name = request.getParameter("hsname");
		String location = request.getParameter("hslocal");
		String number = request.getParameter("hsnum");
		String subject = request.getParameter("subject");
		
		System.out.println("name : " + name);
		System.out.println("location : " + location);
		System.out.println("number : " + number);
		System.out.println("subject : " + subject);
		
		if ((name != null && name.trim().length() >0)) {
			try {
				cnt = new UserDAO().AdminUpdateHospital(name, location, number, subject);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);

	}

}
