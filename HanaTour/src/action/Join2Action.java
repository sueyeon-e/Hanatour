package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.JoinDao;

public class Join2Action implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String agree1 = request.getParameter("main1_join2_agreement1");
		String agree2 = request.getParameter("main1_join2_agreement2");
		String agree3 = request.getParameter("main1_join2_agreement3");
		String agree4 = request.getParameter("main1_join2_agreement4");
		String agree5 = request.getParameter("main1_join2_agreement5");
		String agree6 = request.getParameter("main1_join2_agreement6");
		
		if( (agree1 != null) && ( agree1.equals("on") ) ) {
			agree1 = "T";
		} else {
			agree1 = "F";
		}
		
		if( (agree2 != null) && ( agree2.equals("on") ) ) {
			agree2 = "T";
		} else {
			agree2 = "F";
		}
		
		if( (agree3 != null) && ( agree3.equals("on") ) ) {
			agree3 = "T";
		} else {
			agree3 = "F";
		}
		
		if( (agree4 != null) && ( agree4.equals("on") ) ) {
			agree4 = "T";
		} else {
			agree4 = "F";
		}
		
		if( (agree5 != null) && ( agree5.equals("on") ) ) {
			agree5 = "T";
		} else {
			agree5 = "F";
		}
		
		if( (agree6 != null) && ( agree6.equals("on") ) ) {
			agree6 = "T";
		} else {
			agree6 = "F";
		}
		
		
		
		JoinDao jDao = new JoinDao();

		jDao.joinAgreementsCheckInsert(agree1, agree2, agree3, agree4, agree5, agree6);
		
		
		request.getRequestDispatcher("hanatour/jsp/main1_home/main1_join3.jsp").forward(request, response);
		
	}
}
