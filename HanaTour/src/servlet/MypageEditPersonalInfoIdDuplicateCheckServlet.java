package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.UserInfoDuplicateCheck;

@WebServlet("/MypageEditPersonalInfoIdDuplicateCheckServlet")
public class MypageEditPersonalInfoIdDuplicateCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("key");
		
		UserInfoDuplicateCheck iDao = new UserInfoDuplicateCheck();
		boolean idDuplicateCheck = iDao.idDuplicateCheck(id);
		
		if(!idDuplicateCheck) {
			request.setAttribute("tempChangeId", id);
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("key", idDuplicateCheck);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj.toString());
	}

}
