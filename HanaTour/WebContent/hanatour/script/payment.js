$(function() {
    // 가격 단위에 쉼표 찍어주기
    $(".comma").each(function() {
        let text = $(this).text();
        let formattedText = text.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $(this).text(formattedText);
    });

// 결제 방법을 안넣으면 넘어가기 막기 
	
	$("#pay_button").click(function(e) {
    let radio = $("input[name='payment_method']:checked");
    let price = $("#price_parameter").text().trim(); // 또는 .val() 사용
    let reservationIdx = $("#reservation_parameter").attr("reservationIdx");

    // alert(price);
    // alert(reservationIdx);

    if (!radio.length) {
        e.preventDefault();
        alert("결제 방식을 선택해주세요");
    } else {
        var IMP = window.IMP;
        if (IMP) { // IMP가 정의되어 있는지 확인
            IMP.init('imp31361047');
            IMP.request_pay({
                pg: "kakaopay",
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: '결제',
                amount: $("#payTotalMoney").val(), // 가격이 텍스트 노드에 있을 경우
                buyer_email: '구매자 이메일',
                buyer_name: '구매자 이름',
                buyer_tel: '구매자 번호',
                buyer_addr: '구매자 주소',
                buyer_postcode: '구매자 주소',
                m_redirect_url: 'redirect url'
            }, function(rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
					alert(msg);
					//location.href = '/HanaTour/ReservationCheckServlet'
                    location.href = 'TourController?command=reservationCheck';
                } else {
                    var msg = '결제에 실패하였습니다.';
                    alert(rsp.error_msg); // 에러 메시지 출력
                }
            });
        } else {
            alert('결제 모듈이 로드되지 않았습니다.');
        }
    }
});

 
	
// 카카오 페이 결제 보기	
	/*$("#payButton").click(function() {
			var IMP = window.IMP; 
		    IMP.init('imp31361047'); 
		    IMP.request_pay({
		    	pg : "kakaopay", 
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '결제',
		        amount : $("#price_parameter").val(), //파라미터 받기
		        buyer_email : '구매자 이메일',
		        buyer_name : '구매자 이름',
		        buyer_tel : '구매자 번호',
		        buyer_addr : '구매자 주소',
		        buyer_postcode : '구매자 주소',
		        m_redirect_url : 'redirect url'
		    }, function(rsp) {
		        if ( rsp.success ) {
		            var msg = '결제가 완료되었습니다.';
		            location.href='결제완료후 갈 url';
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            rsp.error_msg;
		            
		        }
		    });
		}); */
	
	
});