package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OverseaMainAction implements OverseaAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputCheckin = "240805";
		String inputCheckout = "3";
		int inputRoom = 2;
		String inputCityName = "오사카";
		
		request.setAttribute("inputCheckin", inputCheckin);
		request.setAttribute("inputCheckout", inputCheckout);
		request.setAttribute("inputRoom", inputRoom);
		request.setAttribute("inputCityName", inputCityName);
		
		request.getRequestDispatcher("/hanatour/jsp/main6_oversea/oversea_main.jsp").forward(request, response);
	}

}
