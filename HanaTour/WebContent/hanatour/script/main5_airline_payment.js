$(function() {
	
	$("#pay_button").click(function() {
		// alert("click");
		$(this).closest("form").submit();
		
		/*	cors 보안정책
		$.ajax({
			type:"POST",
			async: true,
			url: "https://open-api.kakaopay.com/online/v1/payment/ready",
			data: JSON.stringify({
				// BODY 영역
			 	cid : "TC0ONETIME",
			    partner_order_id : "partner_order_id",
			    partner_user_id : "partner_user_id",

			    item_name : "초코파이",
			    quantity : 1,
			    total_amount : 2200,
			    tax_free_amount: 0,

			    approval_url : "http://localhost:8081",
			    fail_url : "http://localhost:8081",
			    cancel_url : "http://localhost:8081"		
			}),
			contentType: "application/json",
			headers: {
				"Authorization" : "SECRET_KEY DEV3D2F91386843D57D7C9A726D4B24CF74ABC5C"
			},
			dataType: "json",
			success: function(response) {
				console.log("kakao success", response);
			}, error: function(xhr, status, error) {
				console.log("kakao error", status, error);
			}, complete: function(xhr, status) {
				console.log("kakao complete", status);
			}
			
		})
		*/
	})
	
	
	
}) 