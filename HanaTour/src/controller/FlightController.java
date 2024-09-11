package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AirlinePaymentAction;
import action.AirlinePaymentCancelAction;
import action.AirlinePaymentFailAction;
import action.AirlinePaymentSuccessAction;
import action.AirlineRoundtrip1Action;
import action.AirlineRoundtrip2Action;
import action.AirlineRoundtrip3Action;
import action.AirlineRoundtrip4ReservationAction;
import action.AirlineRoundtrip5Reservation2Action;
import action.AirlineRoundtrip6Reservation3Action;
import action.AirportWeatherAction;
import action.CommingSoonAction;
import action.EditPersonalInfo2EntranceAction;
import action.EditPersonalInfoAction;
import action.EditPersonalInfoChangePwAction;
import action.EditPersonalInfoDeleteAccountAction;
import action.EditPersonalInfoEmailUpdateAction;
import action.EditPersonalInfoEntranceAction;
import action.EditPersonalInfoIdUpdateAction;
import action.EditPersonalInfoPassportInfoDeleteAction;
import action.EditPersonalInfoPassportInfoUpdateAction;
import action.EditPersonalInfoPhoneUpdateAction;
import action.EditPersonalInfoSNSEntranceAction;
import action.FindIdAction;
import action.FindIdEntranceAction;
import action.FindPwAction;
import action.FindPwEntranceAction;
import action.Join1Action;
import action.Join2Action;
import action.Join3Action;
import action.Join4Action;
import action.JoinEntranceAction;
import action.LogInAction;
import action.LogOutAction;
import action.LoginEntracneAtcion;
import action.Main1Action;
import action.Main5Action;
import action.PersonalInfoEntranceAction;


@WebServlet("/FlightController")
public class FlightController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		
		Action action = null;
		
		switch (command) {
			
			// 준비중입니다.
			case "commingSoon" :
				action = new CommingSoonAction();
				break;
			
			// 메인 1 페이지 이동
			case "main1" :
				action = new Main1Action();
				break;
				
			// 로그인 화면
			case "loginEntrance" :
				action = new LoginEntracneAtcion();
				break;
				
			// 로그인
			case "login" :
				action = new LogInAction();
				break;
				
			case "logout" :
				action = new LogOutAction();
				break;	
			
			case "findIdEntrance" :
				action = new FindIdEntranceAction();
				break;
				
			case "findId" :
				action = new FindIdAction();
				break;
				
			case "findPwEntrance" :
				action = new FindPwEntranceAction();
				break;
				
			case "findPw" :
				action = new FindPwAction();
				break;
				
				
			// 회원가입 화면	
			case "joinEntrance" :
				action = new JoinEntranceAction();
				break;
				
			case "join1" :	
				action = new Join1Action();
				break;
				
			case "join2" : 
				action = new Join2Action();
				break;
			
			case "join3" : 
				action = new Join3Action();
				break;
			
			case "join4" : 
				action = new Join4Action();
				break;
				
			case "personalInfoEntrance" :
				action = new PersonalInfoEntranceAction();
				break;
				
			case "editPersonalInfo" :
				action = new EditPersonalInfoAction();
				break;
				
			case "editPersonalInfoEntrance" :
				action = new EditPersonalInfoEntranceAction();
				break;
				
			case "editPersonalInfo2Entrance" :
				action = new EditPersonalInfo2EntranceAction();
				break;
				
			case "editPersonalInfoIdUpdate" :
				action = new EditPersonalInfoIdUpdateAction();
				break;
				
			case "editPersonalInfoPhoneUpdate" :
				action = new EditPersonalInfoPhoneUpdateAction();
				break;
				
			case "editPersonalInfoEmailUpdate" :
				action = new EditPersonalInfoEmailUpdateAction();
				break;
				
			case "editPersonalInfoPassportInfoUpdate" :
				action = new EditPersonalInfoPassportInfoUpdateAction();
				break;
				
			case "editPersonalInfoPassportInfoDelete" :
				action = new EditPersonalInfoPassportInfoDeleteAction();
				break;
				
			case "editPersonalInfoSNSEntrance" :
				action = new EditPersonalInfoSNSEntranceAction();
				break;
			
			case "editPersonalInfoChangePw" :
				action = new EditPersonalInfoChangePwAction();
				break;
				
			case "editPersonalInfoDeleteAccount" :
				action = new EditPersonalInfoDeleteAccountAction();
				break;
			
			// 항공 페이지
				
			// 메인 5(항공) 페이지 이동
			case "main5" :
				action = new Main5Action();
				break;
				
			case "airportWeather" :
				action = new AirportWeatherAction();
				break;
				
			case "airlineRoundtrip1" :
				action = new AirlineRoundtrip1Action();
				break;
			
			case "airlineRoundtrip2" :
				action = new AirlineRoundtrip2Action();
				break;	
				
			case "airlineRoundtrip3" :
				action = new AirlineRoundtrip3Action();
				break;	
				
			case "airlineRoundtrip4Reservation" :
				action = new AirlineRoundtrip4ReservationAction();
				break;	
				
			case "airlineRoundtrip5Reservation2" :
				action = new AirlineRoundtrip5Reservation2Action();
				break;	
				
			case "airlineRoundtrip6Reservation3" :
				action = new AirlineRoundtrip6Reservation3Action();
				break;	
				
			case "airlinePayment" :
				action = new AirlinePaymentAction();
				break;	
				
			case "airlinePaymentSuccess" :
				action = new AirlinePaymentSuccessAction();
				break;
				
			case "airlinePaymentCancel" :
				action = new AirlinePaymentCancelAction();
				break;
				
			case "airlinePaymentFail" :
				action = new AirlinePaymentFailAction();
				break;
				
		}
		if(action != null) {
			action.execute(request, response);
		} else {
			action = new CommingSoonAction();
			action.execute(request, response);
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
