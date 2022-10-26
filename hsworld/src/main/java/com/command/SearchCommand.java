// 병원 검색 커맨드

package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Paging;
import com.beans.UserDAO;
import com.beans.UserDTO;

public class SearchCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO dao = new UserDAO();
		List<UserDTO> list = null;
		
		String sW = (String)request.getAttribute("searchWord");

		
		System.out.println("searchWord : " + sW);

		UserDTO dto = new UserDTO();
//		dto.setSubject(searchWord);
//		dto.setLocation(searchWord);
//		dto.setHsname(searchWord);

		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging = new Paging();
		
		
		int count = 0;
		try {
			count = dao.getHosCount(sW);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("page : " + page);
		System.out.println("count : " + count);
		paging.setPage(page);
		paging.setTotalCount(count);

		
		try {
			list = dao.search(paging, sW);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("searchWord", sW);
	}

	

}
