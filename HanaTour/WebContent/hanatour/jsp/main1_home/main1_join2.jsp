<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main1_join2.css">
</head>
<body>
    <div class="main1_join2">
        <div class="main1_join2_inner">


            <div class="main1_join2_inner1">
                <div>
                    <div></div>
                    <div>약관동의</div>
                </div>
                <div></div>
            </div>

            <div class="main1_join2_inner2">
                	약관 내용에 먼저<br/>동의해 주세요.
            </div>

            <div class="main1_join2_inner3">

                <form action="${pageContext.request.contextPath}/FlightController" method="post">
                	<input type="hidden" name="command" value="join2"/>
                    <div class="main1_join2_inner3_header">
                        <label for="">
                            <!-- main1_join2_inner3_all_agreement -->
                            <span class="
                                main1_join2_inner3_header_img
                                
                            "></span>
                            <span>전체동의</span>
                        </label>
                    </div>

                    <div class="main1_join2_inner3_body">
                        <!-- main1_join2_agreement_active -->
                        <div class="">
                            <label for="main1_join2_agreement1">
                                <span class="main1_join2_inner3_body_img"></span>
                                <input type="checkbox" name="main1_join2_agreement1" id="main1_join2_agreement1"/>
                                <span>(필수) <span>하나투어 이용약관</span> 동의</span>
                            </label>
                        </div>

                        <div>
                            <label for="main1_join2_agreement2">
                                <span class="main1_join2_inner3_body_img"></span>
                                <input type="checkbox" name="main1_join2_agreement2" id="main1_join2_agreement2"/>
                                <span>(필수) <span>개인정보 수집 및 이용</span>에 대한 동의</span>
                            </label>
                        </div>

                        <div>
                            <label for="main1_join2_agreement3">
                                <span class="main1_join2_inner3_body_img"></span>
                                <input type="checkbox" name="main1_join2_agreement3" id="main1_join2_agreement3"/>
                                <span>(필수) <span>개인정보 제3자 제공</span>에 대한 동의</span>
                            </label>
                        </div>

                        <div>
                            <label for="main1_join2_agreement4">
                                <span class="main1_join2_inner3_body_img"></span>
                                <input type="checkbox" name="main1_join2_agreement4" id="main1_join2_agreement4"/>
                                <span>(선택) <span>위치기반서비스 이용약관</span> 동의</span>
                            </label>
                        </div>

                        <div>
                            <label for="main1_join2_agreement5">
                                <span class="main1_join2_inner3_body_img"></span>
                                <input type="checkbox" name="main1_join2_agreement5" id="main1_join2_agreement5"/>
                                <span>(선택) <span>마케팅 활용 및 광고성 정보 수신동의</span></span>
                            </label>
                        </div>

                        <div>
                            <label for="main1_join2_agreement6">
                                <span class="main1_join2_inner3_body_img"></span>
                                <input type="checkbox" name="main1_join2_agreement6" id="main1_join2_agreement6"/>
                                <span>(선택) <span>마케팅목적 제3자 제공</span>에 대한 동의</span>
                            </label>
                        </div>
                       
                    </div>


                    <div class="main1_join2_submit_btn">
                        	다음
                        <input type="submit" value="다음"/>
                    </div>

                </form>
            </div>


        </div>
    </div>



</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main1_join2.js"></script>
</html>