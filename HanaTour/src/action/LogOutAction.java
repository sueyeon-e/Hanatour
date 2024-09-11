package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		session.setAttribute("loginId", null);
		session.setAttribute("loginName", null);
		
		request.getRequestDispatcher("hanatour/jsp/main1_home/main1_1.jsp").forward(request, response);
		
	}
}
