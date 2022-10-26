// 회원가입 커맨드

package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserDAO;
import com.beans.UserDTO;

public class SignupCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		String userId = request.getParameter("userid");
		String userPw = request.getParameter("userpw");
		String userName = request.getParameter("username");
		String userIp = request.getParameter("userIp");
		String userMail = request.getParameter("usermail");
		String userNum = request.getParameter("userNum");
		
		UserDTO dto = new UserDTO();
		dto.setUser_id(userId);
		dto.setUser_pw(userPw);
		dto.setUser_name(userName);
		dto.setUser_ip(userIp);
		dto.setUser_mail(userMail);
		dto.setUser_Num(userNum);
		
		if (userId != null && userId.trim().length() > 0) {
			try {
				cnt = new UserDAO().insert(dto);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("result", cnt);
		request.setAttribute("dto", dto);
		
	}
}
