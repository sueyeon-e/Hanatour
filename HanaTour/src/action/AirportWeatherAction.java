package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WeatherDao;
import dto.WeatherDto;

public class AirportWeatherAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String iata = request.getParameter("weather_iata_real");
		
		WeatherDao wDao = new WeatherDao();
		ArrayList<WeatherDto> weatherList = wDao.getWeatehrListByIata(iata);
		request.setAttribute("weatherList", weatherList);
		
		
		request.getRequestDispatcher("hanatour/jsp/main5_airline/main5_1.jsp").forward(request, response);
		
	}
}
