$(function() {

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

    $(".container_right_body3_body2 > div > label").on("click", function(e) {
        e.preventDefault();
        if( $(this).hasClass("delete_account_option_active") ) {
            $(this).removeClass("delete_account_option_active");
            $(this).find("input").prop("checked", false);
        } else {
            $(this).addClass("delete_account_option_active");
            $(this).find("input").prop("checked", true);
        }


    });



	// 취소 버튼
	$(".container_right_body3_body5 > a:nth-child(1)").click(function(e) {
		e.preventDefault();
		window.history.back();
	});
	
	
	
	// 회원탈퇴 버튼
	$(".container_right_body3_body5 > a:nth-child(2)").click(function(e) {
		
		e.preventDefault();
		
		let pwInput = $("input[name='user_pw']").val();
		
		$.ajax({
			
			type: "GET",
			async: true,
			url: contextPath + "/MypageEditPersonalInfoDeleteAccountServlet",
			data: {
				pwInput: pwInput
			},			
			dataType: "json",
			success: function(response) {
				
				if( !response.key ) {
					alert("비밀번호가 일치하지 않습니다.");
				} else {
					alert("회원탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.");
					window.location.href = contextPath + "/FlightController?command=logout";
				}
				
			}, error: function() {
				console.log("회원탈퇴 error");
			}, complete: function() {
				console.log("회원탈퇴 complete");
			}
			
		});
		
		
	});
	







});