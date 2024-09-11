<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/hanatour/css/main1_find_id.css">
</head>
<body>
    


    <div class="main1_find_id">
            <div class="main1_find_id_inner">

                <div class="main1_find_id_header">
                    <div>
                        <div></div>
                        <div>아이디 찾기</div>
                    </div>
                    <div></div>
                </div>

                <div class="main1_find_id_tab">

                    <div class="main1_find_id_tab_select">

                        <div class="main1_find_id_tab_active"> 
                            아이디 찾기
                        </div>

                        <div class="">
                            비밀번호 찾기
                        </div>

                    </div>




                    <div class=""> 
                        
                        <form action="${pageContext.request.contextPath}/FlightController" method="post">
                        	<input type="hidden" name="command" value="findId"/>
                            <div class="main1_find_id3_inner3">
                                <div class="main1_find_id3_inner3_title">이메일로 찾기</div>
                                <div class="main1_find_id3_inner3_name_gender">
                                    <!--
                                        main1_find_id3_inner3_name_pass
                                        main1_find_id3_inner3_name_fail
                                    -->
                                    <div class="
                                        main1_find_id3_inner3_name
                                    ">
                                        <input type="text" name="find_id_name" placeholder="이름"/>
                                        <div></div>
                                    </div>
                                    <div class="
                                        main1_find_id3_inner3_gender
                                    ">
                                        <!-- main1_find_id3_inner3_gender_active -->
                                        <div class="">
                                            <input type="radio" name="find_id_gender" value="male"/> 남
                                        </div>
                                        <div class="">
                                            <input type="radio" name="find_id_gender" value="female"/> 여
                                        </div>
                                    </div>
                                </div>
            
                                <div class="main1_find_id3_inner3_name_gender_validation">
                                    <div class="main1_find_id3_inner3_name_validation">
                                        <div class="main1_find_id3_inner3_name_validation1">
                                                이름을 형식에 맞게 입력해 주세요.(ex. 홍길동)
                                        </div>
                                        <div class="main1_find_id3_inner3_name_validation2">
                                                이름을 입력해 주세요.
                                        </div>
                                    </div>
                                    <div class="main1_find_id3_inner3_gender_validation">
                                            성별을 선택해 주세요.
                                    </div>
                                </div>
                                <!--
                                    main1_find_id3_inner3_birth_pass
                                    main1_find_id3_inner3_birth_fail
                                -->
                                <div class="
                                    main1_find_id3_inner3_birth
                                ">
                                    <div>
                                        <input type="text" name="find_id_birth" placeholder="생년월일"/>
                                        <div></div>
                                    </div>
                                    <div>
                                        <button type="button" class="main1_find_id3_inner3_birth_btn">실명인증 요청</button>
                                    </div>
                                    <div class="main1_find_id3_inner3_birth_validation">
                                        <div class="main1_find_id3_inner3_birth_validation1">
                                                생년월일을 형식에 맞게 입력해 주세요.(ex. 19991231)
                                        </div>
                                        <div class="main1_find_id3_inner3_birth_validation2">
                                                생년월일을 입력해 주세요.
                                        </div>
                                    </div>
                                </div>
                                <!-- main1_find_id3_inner3_mail_pass -->
                                <!-- main1_find_id3_inner3_mail_fail -->
                                <div class="
                                    main1_find_id3_inner3_mail
                                 
                                ">
                                    <div>
                                        <input type="text" name="find_id_mail" placeholder="이메일" disabled/>
                                    </div>
                                    <div>
                                        <button type="button" class="main1_find_id3_inner3_mail_btn" disabled>인증번호 요청</button>
                                    </div>
                                    <div class="main1_find_id3_inner3_mail_img"></div>
                                </div>
            
            
                                <!-- main1_find_id3_inner3_verification_code_pass -->
                                <div class="
                                    main1_find_id3_inner3_verification_code
                                ">
                                    <div>
                                        <input type="text" name="find_id_verification_code" placeholder="인증번호" disabled/>
                                    </div>
                                    <div>
                                        <button type="button" class="verification_code_btn" disabled>인증하기</button>
                                    </div>
                                    <div class="main1_find_id3_inner3_verification_code_img"></div>
                                </div>
            
                            </div>


                            <div class="
                                main1_find_id3_inner4
                            ">
                                    아이디 찾기
                                <input type="submit"/>
                            </div>





                        </form>


                    </div>
                    <!-- 아이디 찾기 -->





                </div>


            </div>



    </div>


</body>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/hanatour/script/main1_find_id.js"></script>
</html>