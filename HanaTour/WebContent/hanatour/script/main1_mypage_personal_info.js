



$(function() {



    $(".container_right_bottom2 > div > div").mouseenter(function() {
        $(this).css("border-color", "#5e2bb8");
        $(this).addClass("container_right_btn_hover_active");
        $(this).find("span").css("color", "#5e2bb8");
    });


    $(".container_right_bottom2 > div > div").mouseleave(function() {
        $(this).css("border-color", "#c2c2c2");
        $(this).removeClass("container_right_btn_hover_active")
        $(this).find("span").css("color", "#333");
    });




    $(".container_right_bottom2 > div > div").click(function() {
        $(this).find("a")[0].click();
    });



    // .container_right_btn_left > div,
    // .container_right_btn_right > div

})















