<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main1_join4.css">
</head>
<body>
    
    <div class="main1_join4">
        <div class="main1_join4_inner">

            <div class="main1_join4_inner1">
                <div>
                    <div></div>
                    <div>정보입력</div>
                </div>
                <div></div>
            </div>

            <div class="main1_join4_inner2">
                    거의 다 왔어요!<br/>고객님의 정보를 입력해주세요.
            </div>

            <div class="main1_join4_inner3">
                    하나투어는 고객님의 정보를 안전하게 관리합니다.
            </div>


            <div class="main1_join4_inner4">

                <!-- main1_join4_inner4_id_pass -->
                <!-- main1_join4_inner4_id_fail -->
                <form 	action="" 
                		class="main1_join4_form1"
                >
                    <div class="
                        main1_join4_inner4_id
                    ">
                        <div>
                            <input type="text" name="join_id" placeholder="아이디(영문 소문자  + 숫자)"/>
                        </div>
                        <div class="main1_join4_inner4_id_img"></div>
                        <div></div>
                        <div class="main1_join4_inner4_id_pass_text">가입할 수 있는 아이디입니다.</div>
                        <div class="main1_join4_inner4_id_fail_text">사용할 수 없는 아이디입니다.</div>
                        <div class="main1_join4_inner4_id_btn">중복확인</div>
                    </div>
                    <input type="submit"/>
                </form>



                <form action="${pageContext.request.contextPath}/FlightController" class="main1_join4_form2" method="post">
                	<input type="hidden" name="command" value="join4"/>
                    <div class="main1_join4_inner4_name_gender">
                        <div class="
                            main1_join4_inner4_name
                        ">
                            <input type="text" name="join_name" value="${requestScope.joinName}" placeholder="이름" disabled/>
                            <div></div>
                        </div>
                        <div class="
                            main1_join4_inner4_gender
                        ">
                            <!-- main1_join4_inner4_gender_active -->
                            <div class="${requestScope.joinGenderMale}">
                                <input type="radio" name="join_gender" value="male" disabled/> 남
                            </div>
                            <div class="${requestScope.joinGenderFemale}">
                                <input type="radio" name="join_gender" value="female" disabled/> 여
                            </div>
                        </div>
                    </div>
                    
                    <div class="
                        main1_join4_inner4_birth
                    ">
                        <div>
                            <input type="text" name="join_birth" value="${requestScope.joinBirth}" placeholder="생년월일" disabled/>
                        </div>
                    </div>
                    <!-- main1_join4_inner4_phone_pass -->
                    <!-- main1_join4_inner4_phone_fail -->
                    <div class="
                        main1_join4_inner4_phone
                    ">
                        <div class="main1_join4_inner4_phone_input">
                            <input type="text" name="join_phone" placeholder="휴대폰번호(-를 빼고 입력해주세요.)"/>
                            <div></div>
                        </div>
                        <div class="main1_join4_inner4_foreigner">
                            <label for="">
                                <!-- main1_join4_inner4_foreigner_checked -->
                                <div class="">
                                    <input type="checkbox" name="join_foreigner"/>
                                </div>
                                <div>외국인</div>
                            </label>
                        </div>
                    </div>
                    <!-- main1_join4_inner4_phone_validation_fail -->
                    <div class="
                        main1_join4_inner4_phone_validation
                    ">
                            휴대폰 번호를 형식에 맞게 입력해 주세요.
                    </div>
                    <!-- main1_join4_inner4_pw_pass -->
                    <!-- main1_join4_inner4_pw_fail -->
                    <div class="
                        main1_join4_inner4_pw
                    ">
                        <div>
                            <input type="password" name="join_pw" placeholder="비밀번호"/>
                        </div>
                        <div></div>
                    </div>
                    <!-- main1_join4_inner4_pw_validation_fail -->
                    <div class="
                        main1_join4_inner4_pw_validation
                    ">
                            비밀번호는 영문 소문자, 대문자, 숫자, 특수문자 중 2개 이상을 조합하여 8자 이상 16자 이하로 입력해주세요. (특수문자는 -!@#$%^*?_~만 허용됩니다.)
                    </div>
                    <!-- main1_join4_inner4_pw_confirm_pass -->
                    <!-- main1_join4_inner4_pw_confirm_fail -->
                    <div class="
                        main1_join4_inner4_pw_confirm
                    ">
                        <div>
                            <input type="password" name="join_pw_confirm"  placeholder="비밀번호 확인"/>
                        </div>
                        <div></div>
                    </div>
                    <!-- main1_join4_inner4_pw_confirm_validation_fail -->
                    <div class="
                        main1_join4_inner4_pw_confirm_validation
                    ">
                            비밀번호를 다시 한 번 확인해 주세요.
                    </div>
                    <input type="text" name="join_id2"/>  
                </form>


            </div>


            <!-- main1_join4_inner5_active -->
            <div class="main1_join4_inner5">
                다음
            </div>



        </div>
        <!-- main1_join4_inner -->
    </div>


</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main1_join4.js"></script>
</html>