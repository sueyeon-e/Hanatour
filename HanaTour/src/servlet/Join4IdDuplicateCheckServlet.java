package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.JoinDao;

@WebServlet("/Join4IdDuplicateCheckServlet")
public class Join4IdDuplicateCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("key");
		
		JSONObject jObj = new JSONObject();
		JoinDao jDao = new JoinDao();
		
		
		jObj.put("key", jDao.joinIdDuplicateCheck(id));
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print( jObj.toString() );
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

}
