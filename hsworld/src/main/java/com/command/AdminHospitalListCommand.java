package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Paging;
import com.beans.UserDAO;
import com.beans.UserDTO;

public class AdminHospitalListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO dao = new UserDAO();
		List<UserDTO> list = null;
		
		int page = 1;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		
		int count = 0;
		
		try {
			count = dao.getHospitalCount();
//			System.out.println("count : " + count);
		} catch ( SQLException e) {
			e.printStackTrace();
		}
		paging.setPage(page);
		paging.setTotalCount(count);
		System.out.println("page : " + page);
		System.out.println("count : " + count);
		
		try {
			list = dao.selectAllHospital(paging);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("hosList", list);
		request.setAttribute("paging", paging);

	}

}
