package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UpdateUserInfoDao;

public class EditPersonalInfoIdUpdateAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String loginId = (String)session.getAttribute("loginId");
		String changeId = request.getParameter("user_change_id");
		
		UpdateUserInfoDao uDao = new UpdateUserInfoDao();
		uDao.idUpdate(loginId, changeId);

		session.setAttribute("loginId", changeId);
		request.setAttribute("loginCheck", true);
		
		EditPersonalInfo2EntranceAction eAction = new EditPersonalInfo2EntranceAction();
		eAction.execute(request, response);
	}
	
}
