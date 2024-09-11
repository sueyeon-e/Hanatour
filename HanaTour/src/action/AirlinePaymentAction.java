package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class AirlinePaymentAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		URL url = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		
		String authorization = "SECRET_KEY DEV3D2F91386843D57D7C9A726D4B24CF74ABC5C";
		
		// POST - Header 설정
		connection.setRequestMethod("POST");
		connection.setRequestProperty("Authorization", authorization);
		connection.setRequestProperty("Content-Type", "application/json");
		
		int totalPrice = Integer.parseInt( request.getParameter("total_price") );
		double totalPriceDouble = totalPrice * 0.1;
		
		JSONObject jObj = new JSONObject();
		jObj.put("cid", "TC0ONETIME"); // 가맹점 코드(변경 X)
		jObj.put("partner_order_id", "fl123456"); // 가맹점 주문번호
		jObj.put("partner_user_id", "HanaTour");  // 가맹점 회원 id
		jObj.put("item_name", "항공권");  // 상품명
		jObj.put("quantity", 1);  // 수량
		jObj.put("total_amount", totalPriceDouble);  // 상품 총액
		jObj.put("tax_free_amount", 0);  // 결제 성공시 redirect url
		
		// 결제 성공시 redirect url
		jObj.put("approval_url", "http://localhost:9090/HanaTourGit/hanatour/jsp/main5_airline/main5_airline_payment_success.jsp");
		// 결제 취소시 redirect url
		jObj.put("fail_url", "http://localhost:9090/HanaTourGit/hanatour/jsp/main5_airline/main5_airline_payment_fail.jsp");  
		// 결제 실패시 redirect url
		jObj.put("cancel_url", "http://localhost:9090/HanaTourGit/hanatour/jsp/main5_airline/main5_airline_payment_cancel.jsp");  
		
		
		
		connection.setDoOutput(true); // request의 Body 허용
		try ( OutputStream os = connection.getOutputStream() ) {
			byte[] input = jObj.toString().getBytes("UTF-8");
			os.write(input, 0, input.length);
		}
			
		
		JSONObject rObj = null;
		String tid = "";
		String createdAt = "";
		String nextUrl = "";
		
		request.setAttribute("tid", tid);
		request.setAttribute("createdAt", createdAt);
		
		try (BufferedReader br = new BufferedReader(
                new InputStreamReader(connection.getInputStream(), "utf-8"))) {
            StringBuilder responseBuilder = new StringBuilder();
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                responseBuilder.append(responseLine.trim());
            }
            
            // 클라이언트에게 응답
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            
            JSONParser parser = new JSONParser();
            try {
            	rObj = (JSONObject) parser.parse(responseBuilder.toString());
            	nextUrl = (String)rObj.get("next_redirect_pc_url");
            } catch (org.json.simple.parser.ParseException e ) {
            	e.printStackTrace();
			}
        }		
		response.sendRedirect(nextUrl);
		
	}
}
