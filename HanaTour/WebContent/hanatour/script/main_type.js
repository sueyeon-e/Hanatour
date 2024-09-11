$(function() {

    $('.bxslider').bxSlider({
        auto: true,
        autoControls: true,
        stopAutoOnClick: true,
        pager: true,
        slideWidth: 1920
    });



    // 유형2 재생 <-> 클릭
    // $(".type2_control_bottom > div:nth-child(4) > a").click(function(e) {

    //     if ( $(this).find("img").attr("src") ==  "../../img/main5_airline/type2_stop.png") {
    //         $(this).find("img").attr("src", "../../img/main5_airline/type2_play.png");
    //     } else {
    //         $(this).find("img").attr("src", "../../img/main5_airline/type2_stop.png");
    //     }

    //     e.preventDefault();
    // });



    // 유형3 탭변경
    $(".type3_tab > div").click(function() {

        $(".type3_tab > div").removeClass("type3_tab_active");

        $(this).addClass("type3_tab_active");
    });






    // 유헝9 탭변경
    $(".type9_tab > div").click(function() {
        let index = $(this).index();
        console.log(index);

        $(this).parent().find(".type9_tab_active").removeClass("type9_tab_active");
        $(this).addClass("type9_tab_active");

        let type9_type8_container = $(".type9_type8_container");

        type9_type8_container.find(".type9_tab_active").removeClass("type9_tab_active"); 
        type9_type8_container.children().eq(index).addClass("type9_tab_active");

    });



    // 유형10 이미지 슬라이드
   
    // 왼쪽버튼
    $(".type10_slider_btn > div:nth-child(1)").click(function() {

        $(".type10_item_container").animate({left:"+=1200"}, 300, function(){
        });

        $(this).parent().find(".type10_btn_active").removeClass("type10_btn_active");
        $(this).addClass("type10_btn_active");

        $(".type10").css("background-color", "rgb(228, 243, 255)");

    });

    // 오른쪽버튼
    $(".type10_slider_btn > div:nth-child(2)").click(function() {

        $(".type10_item_container").animate({left:"-=1200"}, 300, function(){
        });

        $(this).parent().find(".type10_btn_active").removeClass("type10_btn_active");
        $(this).addClass("type10_btn_active");

        $(".type10").css("background-color", "rgb(235, 255, 254)");
    });



});