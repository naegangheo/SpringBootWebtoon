
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


//=============

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
// ======================================

$(document).ready(function() {
    $(".genre_selector a").click(function() {
        $(".genre_selector a").removeClass("selected");
        $(this).addClass("selected");
    });
});

//======================================
$(document).ready(function() {
    let currentIndex = 0; // 현재 슬라이드 인덱스
    const slideWidth = 1200; // 각 슬라이드 그룹의 너비
    const totalSlides = $('.image_wrapper').length; // 전체 슬라이드 그룹 개수

    // 이전 버튼 클릭
    $('.prev').click(function() {
        if (currentIndex > 0) {
            currentIndex--; // 슬라이드를 이전으로
            $('.image_container').css('transform', 'translateX(' + (-currentIndex * slideWidth) + 'px)');
            checkButtons(); // 버튼 상태 업데이트
        }
    });

    // 다음 버튼 클릭
    $('.next').click(function() {
        if (currentIndex < totalSlides - 1) { // 마지막 슬라이드까지만 이동
            currentIndex++; // 슬라이드를 다음으로
            $('.image_container').css('transform', 'translateX(' + (-currentIndex * slideWidth) + 'px)');
            checkButtons(); // 버튼 상태 업데이트
        }
    });

    // 버튼 상태 확인 (이동할 공간이 없으면 버튼 숨기기)
    function checkButtons() {
        // 이전 버튼이 필요 없다면 숨기기
        if (currentIndex === 0) {
            $('.prev').hide();
        } else {
            $('.prev').show();
        }

        // 다음 버튼이 필요 없다면 숨기기
        if (currentIndex === totalSlides - 1) {
            $('.next').hide();
        } else {
            $('.next').show();
        }
    }

    // 페이지 로드 시 초기 버튼 상태 설정
    checkButtons();
});