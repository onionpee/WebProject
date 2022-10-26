package com.command;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.CrapDAO;
import com.beans.CrapDTO;
import com.beans.Paging;

public class reviewListSearchCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CrapDAO dao = new CrapDAO();
		
		List<CrapDTO> list = null;
		List<CrapDTO> notice_List = null;
		
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
			count = dao.getReviewCount2(h2, keyword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		paging.setPage(page);
		paging.setTotalCount(count);
		
		try {
			list = dao.selectSearchReview(paging, h2, keyword);
			notice_List = dao.selectRecentNotice();
		} catch  (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("notice_List", notice_List);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		
	}

}
