package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class hosSearchStepCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String hs = request.getParameter("hosName");
		
		request.setAttribute("hosName", hs);
		
	}

}
