package service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class WeatherService {

	
	public JSONArray openWeatherRequestList(double lat, double lon) {
		
		JSONArray jAry = new JSONArray();
		StringBuilder sb = new StringBuilder();
		
		try {
			
			String str = 
					"https://api.openweathermap.org/data/2.5/forecast"
					+ "?lat=" + lat + ""
					+ "&lon=" + lon + ""
					+ "&appid=85c80fd6193e205fe9cf2cfa627d6faa"
					+ "&mode=json"
					+ "&units=metric";
			URL url = new URL(str);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
			
	        String jsonResponse = sb.toString();
	        
	        JSONParser parser = new JSONParser();
	        JSONObject jObj = (JSONObject)parser.parse(jsonResponse);
	        jAry = (JSONArray)jObj.get("list");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
        String jsonResponse = sb.toString();
		
		return jAry;
	}
	
	
	public JSONObject openWeatherRequestCity(double lat, double lon) {
		
		JSONObject jObj = new JSONObject();
		StringBuilder sb = new StringBuilder();
		
		try {
			
			String str = 
					"https://api.openweathermap.org/data/2.5/forecast"
							+ "?lat=" + lat + ""
							+ "&lon=" + lon + ""
							+ "&appid=85c80fd6193e205fe9cf2cfa627d6faa"
							+ "&mode=json"
							+ "&units=metric";
			URL url = new URL(str);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			
			String jsonResponse = sb.toString();
			
			JSONParser parser = new JSONParser();
			JSONObject jObjParent = (JSONObject)parser.parse(jsonResponse);
			jObj =  (JSONObject)jObjParent.get("city");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String jsonResponse = sb.toString();
		
		return jObj;
	}
	
	
	
	
}
