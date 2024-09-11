package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.UpdateUserInfoDao;
import dao.UserInfoDuplicateCheck;


@WebServlet("/MypageEditPersonalInfoEmailDuplicateCheckServlet")
public class MypageEditPersonalInfoEmailDuplicateCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("key");
		
		
		UserInfoDuplicateCheck uDao = new UserInfoDuplicateCheck();
		boolean emailDuplicateCheck = uDao.emailDuplicateCheck(email);
		
		JSONObject jObj = new JSONObject();
		jObj.put("key", emailDuplicateCheck);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj.toString());
	}



}
