
$(document).ready(function() {

    $('#category_link').click(function(event) {
        event.preventDefault();
        $('#week_selector').slideToggle();
    });

    $('nav.main_category a').not('#category_link').click(function() {
        $('#week_selector').slideUp();
    });
});

//=============

$(document).ready(function() {

    $('#genre_link').click(function(event) {
        event.preventDefault();
        $('#genre_selector').slideToggle();
    });

    $('nav.main_category a').not('#genre_link').click(function() {
        $('#genre_selector').slideUp();
    });
});
//==================

$(document).ready(function() {

    $('#mypage_link').click(function(event) {
        event.preventDefault();
        $('#mypage_selector').slideToggle();
    });

    $('nav.main_category a').not('#mypage_link').click(function() {
        $('#mypage_selector').slideUp();
    });
});

//============================================

$(document).ready(function() {
    $(".main_category a").click(function() {
        $(".main_category a").removeClass("selected");
        $(this).addClass("selected");
    });
});

$(document).ready(function() {
    $(".week_selector a").click(function() {
        $(".week_selector a").removeClass("selected");
        $(this).addClass("selected");
    });
});

$(document).ready(function() {
    $(".genre_selector a").click(function() {
        $(".genre_selector a").removeClass("selected");
        $(this).addClass("selected");
    });
});

$(document).ready(function() {
    $(".mypage_selector a").click(function() {
        $(".mypage_selector a").removeClass("selected");
        $(this).addClass("selected");
    });
});


//======================================


