<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main1_login.css">
</head>
<body>
    
    <div class="main1_login_form">
        <div class="main1_login_form_inner">

            <div class="main1_login_form1">
                <div></div>
                <div>
                    <h1>로그인</h1>
                </div>
            </div>

            <div class="main1_login_form2">
                <div>
                    <img src="${pageContext.request.contextPath}/hanatour/img/main1_login/img_logo_hana_660x148.png" alt="">
                </div>
            </div>

            <div class="main1_login_form3">
                <form action="${pageContext.request.contextPath}/FlightController" method="post">
                	<input type="hidden" name="command" value="login"/>
                    <div class="main1_login_form3_id">
                        <input type="text" name="user_id" placeholder="아이디(이메일계정)"/>
                        <span class=""></span>
                    </div>
                    <div class="main1_login_form3_pw">
                        <input type="password" name="user_pw" placeholder="비밀번호"/>
                        <span class=""></span>
                    </div>
                    <div class="main1_login_form3_after_click1">
                        	아이디를 입력해주세요
                    </div>
                    <div class="main1_login_form3_after_click2">
                        	아이디를 이메일 형식에 맞게 입력해 주세요.(ex. hana@hanatour.com)
                    </div>
                    <label for="main1_login_submit">
                        <!-- main1_login_form3_login_btn_active -->
                        <div class="
                            main1_login_form3_login_btn
                        ">
                            <div>로그인</div>
                            <input type="submit" id="main1_login_submit"/>
                        </div>
                    </label>
                </form>
            </div>

            <div class="main1_login_form4">
                <div class="
                    main1_login_form4_left
                ">
                    <label for="">
                        <div class="main1_login_form4_left_img"></div>
                        <div>아이디 저장</div>
                    </label>
                </div>
                <div class="main1_login_form4_right">
                    <div>
                        <a href="${pageContext.request.contextPath}/FlightController?command=findIdEntrance">아이디 찾기</a>
                    </div>
                    <div>|</div>
                    <div> 
                        <a href="${pageContext.request.contextPath}/FlightController?command=findPwEntrance">비밀번호 찾기</a>
                    </div>
                </div>
            </div>

            <div class="main1_login_form5">
                
                <div class="main1_login_form5_left">
                    	간편하게<br/>로그인하기
                </div>
                <div class="main1_login_form5_right">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            
            <div class="main1_login_form6">
                	회원가입하고 
                <span>회원 전용 할인/혜택</span>
                	을 받아보세요!
            </div>

            <div class="main1_login_form7">
                	통합 회원 가입하기
            </div>

            <div class="main1_login_form8">
                	비회원 예약조회
            </div>

        </div>
        <!-- main1_login_form_inner -->
    </div>


</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main1_login.js"></script>
</html>