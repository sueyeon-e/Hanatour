package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import dto.UserInfoDto;

public class LogInAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		HttpSession session = request.getSession();
		
		LoginDao lDao = new LoginDao();
		
		if ( lDao.loginCheck(id, pw) ) {
			
			UserInfoDto uDto =  lDao.getLoginUserDto(id);
			
			String name = uDto.getName();
			
			session.setAttribute("loginId", id);
			session.setAttribute("loginName", name);
			
			request.getRequestDispatcher("hanatour/jsp/main1_home/main1_1.jsp").forward(request, response);
			
		} else {
		
			request.getRequestDispatcher("hanatour/jsp/main1_home/main1_login.jsp").forward(request, response);
		}

		
		
	}
}
