$(function() {
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;	
		
		
		
	$(".container_right_body4 > a:nth-child(1)").click(function(e) {
		e.preventDefault();
		window.history.back();
	});
	
	
	
	$(".container_right_body4 > a:nth-child(2)").click(function(e) {
		e.preventDefault();
		
		let currentPwInput = $("input[name='current_pw']").val();
		let changePwInput = $("input[name='change_pw']").val();
		let changePwConfirmInput = $("input[name='change_pw_confirm']").val();
		
		if(currentPwInput == "" || changePwInput == "" || changePwConfirmInput == "") {
			alert("비밀번호를 입력해주세요.")
		} else if(!passwordValidation(changePwInput)){
			alert("신규 비밀번호의 형식을 확인해주세요.")
		} else if(changePwInput != changePwConfirmInput) {
			alert("신규 비밀번호를 확인해주세요.");
		} else {
			
			$.ajax({
				type: "GET",
				async: true,
				url: contextPath + "/MypageEditPersonalInfoPwUpdateServlet",
				data: {
					currentPwInput: currentPwInput,
					changePwInput: changePwInput,
					changePwConfirmInput: changePwConfirmInput
				},
				dataType: "json",
				success: function(response) {
					
					if(response.key1) {
						
						if(response.key2) {
							alert("비밀번호를 변경했습니다.");
							window.location.reload();
						} else {
							alert("변경하려는 비밀번호가 현재 비밀번호와 같습니다.");
						}
						
					} else {
						alert("현재 비밀번호가 일치하지 않습니다.")
					}
					
				}, error: function() {
					console.log("비밀번호 변경 에러");
				}, complete: function() {
					console.log("비밀번호 변경 종료")
				}
				
				
				
			}) // ajax
			
		} // else
		
		 
		
	});
	
	
	
	// 비밀번호 유효성 검사
    function passwordValidation(pw) {
        let pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d-!@#$%^*?_~]{8,16}$/;
        return pwRegex.test(pw);
    }
	
	
	
	
	
	
	
	
	
	
	
	
})