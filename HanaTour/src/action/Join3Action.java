package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDao;

public class Join3Action implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("join_name");
		String gender = request.getParameter("join_gender");
		String birth = request.getParameter("join_birth");
		String email = request.getParameter("join_mail");
		
		request.setAttribute("joinName", name);
		request.setAttribute("joinBirth", birth);
	
		if( gender.equals("male") ) {
			gender = "M";
			request.setAttribute("joinGenderMale", "main1_join4_inner4_gender_active");
			request.setAttribute("joinGenderFemale", "");
		} else if ( gender.equals("female")) {
			gender = "F";
			request.setAttribute("joinGenderMale", "");
			request.setAttribute("joinGenderFemale", "main1_join4_inner4_gender_active");
		} else {
			request.setAttribute("joinGenderMale", "");
			request.setAttribute("joinGenderFemale", "");
		}
		
		JoinDao jDao = new JoinDao();
		jDao.joinVerification(name, gender, birth, email);
		
		
		request.getRequestDispatcher("hanatour/jsp/main1_home/main1_join4.jsp").forward(request, response);
	}
}
