package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDTO;
import com.beans.Paging;
import com.beans.UserDAO;
import com.beans.UserDTO;

public class AdminHosSearchListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO dao = new UserDAO();
		
		List<UserDTO> list = null;
		
		String h2 = (String)request.getAttribute("col");
		String keyword = (String)request.getAttribute("keyword");
		
		System.out.println("col2 : " + h2);
		System.out.println("key2 : " + keyword);
		
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		
		int count = 0;
		
		try {
			count = dao.getAdminHosCount(h2, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		try {
			list = dao.selectSearchAdminHos(paging, h2, keyword);
		} catch  (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("hosList", list);
		request.setAttribute("paging", paging);
		

	}

}
