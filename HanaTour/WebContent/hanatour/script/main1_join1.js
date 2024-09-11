$(function() {

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;

	const contextPath = origin + pathname;

    $(".main1_join1_inner1 > div:nth-child(1) > div:nth-child(1)").click(function() {
        window.history.back();
    })

	$(".main1_join1_inner1 > div:nth-child(2)").click(function() {
        window.location.href = contextPath + "/FlightController?command=main1";
    })
	
	$(".main1_join1_inner5").click(function() {
		window.location.href = contextPath + "/FlightController?command=join1";
	});
	
    
	$(".main1_join1_inner7").click(function() {
		alert("준비중입니다!");
	})

})