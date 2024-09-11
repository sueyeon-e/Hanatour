package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FindUserInfoDao;

public class FindPwAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("find_pw_id");
		String name = request.getParameter("find_pw_name");
		
		String gender = request.getParameter("find_pw_gender");
		if( gender.equals("male") ) {
			gender = "M";
		} else if ( gender.equals("female") ) {
			gender = "F";
		} else {
			gender = "";
		}
		
		String birth = request.getParameter("find_pw_birth");
		String email = request.getParameter("find_pw_mail");
		
		FindUserInfoDao fDao = new FindUserInfoDao();
		
		
		request.setAttribute("findPw", fDao.findPw(id, name, gender, birth, email));
		
		request.getRequestDispatcher("hanatour/jsp/main1_home/main1_find_pw_result.jsp").forward(request, response);
		
	}
}
