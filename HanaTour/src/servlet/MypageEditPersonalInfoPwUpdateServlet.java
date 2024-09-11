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
import dto.UserInfoDto;


@WebServlet("/MypageEditPersonalInfoPwUpdateServlet")
public class MypageEditPersonalInfoPwUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		LoginDao lDao = new LoginDao();
		
		String loginId = (String)session.getAttribute("loginId");
		String loginPw = (lDao.getLoginUserDto(loginId)).getPw(); 
		
		
		String currentPw = request.getParameter("currentPwInput");
		String changePw = request.getParameter("changePwInput");
		String changePwConfirm = request.getParameter("changePwConfirmInput");
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("key1", true);
		if( !loginPw.equals(currentPw) ) { // 현재 비밀번호 불일치
			jObj.put("key1", false);
		} else {
			
			if( loginPw.equals(changePw) && changePw.equals(changePwConfirm) ) {
				jObj.put("key2", false);
			} else { 
				jObj.put("key2", true);
				UpdateUserInfoDao uDao = new UpdateUserInfoDao();
				uDao.pwUpdate(loginId, loginPw, changePw);
				session.setAttribute("loginPw", changePw);
			}
		}
		
		response.setContentType("apllication/json; charset=utf-8");
		response.getWriter().print(jObj.toString());
	}
	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

}
