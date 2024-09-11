package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UpdateUserInfoDao;

public class EditPersonalInfoPassportInfoDeleteAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		String loginId = (String)session.getAttribute("loginId");
		
		UpdateUserInfoDao uDao = new UpdateUserInfoDao();
		uDao.passportDelete(loginId);
	
		request.setAttribute("loginCheck", true);
		
		EditPersonalInfo2EntranceAction eAction = new EditPersonalInfo2EntranceAction();
		eAction.execute(request, response);
	}
}
