package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.LoginDao;
import dao.UpdateUserInfoDao;


@WebServlet("/MypageEditPersonalInfoDeleteAccountServlet")
public class MypageEditPersonalInfoDeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		LoginDao lDao = new LoginDao();
		
		String loginId = (String)session.getAttribute("loginId");
		String loginPw = (lDao.getLoginUserDto(loginId)).getPw();
		
		String userPwInput = request.getParameter("pwInput");
		
		JSONObject jObj = new JSONObject();
		
		if( loginPw.equals(userPwInput) ) {
			
			UpdateUserInfoDao uDao = new UpdateUserInfoDao();
			uDao.deleteAccount(loginId, loginPw);
			
			session.setAttribute("loginId", null);
			session.setAttribute("loginName", null);
			
			jObj.put("key", true);
			
		} else {
			jObj.put("key", false);
		}
		
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj.toString());
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

}
