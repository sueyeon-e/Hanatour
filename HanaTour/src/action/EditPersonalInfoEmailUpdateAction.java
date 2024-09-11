package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UpdateUserInfoDao;

public class EditPersonalInfoEmailUpdateAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		String loginId = (String)session.getAttribute("loginId");
		String email = request.getParameter("user_email");
		
		UpdateUserInfoDao uDao = new UpdateUserInfoDao();
		uDao.emailUpdate(loginId, email);
		
		request.setAttribute("loginCheck", true);
		
		EditPersonalInfo2EntranceAction eAction = new EditPersonalInfo2EntranceAction();
		eAction.execute(request, response);
	}
	
}
