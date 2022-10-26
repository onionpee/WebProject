package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class GetMemberCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		String userid = (String)request.getAttribute("userid");
		String userid2 = request.getParameter("userid");
//		System.out.println(userid);
		System.out.println(userid2);
		
		UserDAO dao = new UserDAO();
		UserDTO dto = null;
		try {
			dto = dao.getUser(userid2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
		
		
	}

}
