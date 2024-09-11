package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDao;

public class Join4Action implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("join_id2");
		
		String phone = request.getParameter("join_phone");
		String pw = request.getParameter("join_pw");
		String foreigner = request.getParameter("join_foreigner");
		
		if( foreigner != null ) {
			foreigner = "T";
		} else {
			foreigner = "F";
		}
		
		JoinDao jDao = new JoinDao();
		jDao.joinInputPhoneNumberPassword(id ,phone, pw, foreigner);
		
		request.getRequestDispatcher("hanatour/jsp/main1_home/main1_join5.jsp").forward(request, response);
	}
}
