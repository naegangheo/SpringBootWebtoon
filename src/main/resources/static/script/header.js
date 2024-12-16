
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
//main webtoonList where genre order by readcountT

var loginUser = {
    gender: `${loginUser != null ? loginUser.gender : "N"}` // 로그인하지 않은 경우 "N"으로 설정
};

$(function () {
    // 페이지 로드 시 초기 데이터 로드
    loadWebtoonsByGenre(2); // 기본 장르를 2로 설정하여 호출 (필요시 변경 가능)

    // 장르 버튼 클릭 이벤트
    $('.genre_button').click(function (event) {
        event.preventDefault(); // 기본 링크 동작 방지

        var genre = $(this).data('genre'); // 선택한 장르 값
        console.log('선택된 장르:', genre);
        console.log('로그인 유저 성별:', loginUser.gender);

        loadWebtoonsByGenre(genre); // 클릭한 장르로 웹툰 목록 로드
    });

    // AJAX를 이용한 데이터 로드 함수
    function loadWebtoonsByGenre(genre) {
        $.ajax({
            url: `/readCountByGenre`, // AJAX 요청 URL
            type: "GET",
            async: true,
            data: { genre: genre, gender: loginUser.gender }, // 요청 시 장르 및 성별 데이터 전송
            timeout: 10000,
            success: function (response) {
                console.log('서버 응답:', response);

                // 서버에서 받은 데이터로 HTML 생성
                let html = '';
                response.forEach(function (rcg) {
                    html += `
                        <div class="genre_item">
                            <a href="webtoon_view?wseq=${rcg.wseq}&gender=${loginUser.gender}">
                                <img src="/images/webtoon/webtoon_images/title_img/${rcg.image}" style="width: 150px" />
                            </a>
                            <a href="webtoon_view?wseq=${rcg.wseq}&gender=${loginUser.gender}">
                                제목 ${rcg.subject}
                            </a>
                            <div class="author">
                                <a href="webtoon_view?wseq=${rcg.wseq}&gender=${loginUser.gender}">
                                    저자 ${rcg.userid}
                                </a>
                            </div>
                            <div class="views">
                                👁 조회수 ${rcg.readcountM + rcg.readcountF + rcg.readcountN}
                            </div>
                        </div>`;
                });

                // 결과를 DOM에 추가
                $(".genre_img").html(html); // 기존 내용을 새 데이터로 교체
            },
            error: function (error) {
                console.error('에러 발생:', error);
            },
        });
    }
});

$(function () {
    loadWebtoonsByGender('T');
    $('.gender_button').click(function (event) {

        event.preventDefault('T');

        var gender=$(this).data('gender');
        console.log(gender);

        loadWebtoonsByGender(gender);

    });

    function loadWebtoonsByGender(gender){
        $.ajax({
            url:`/readCountByGender`,
            type: 'GET',
            async: true,
            data: { gender:gender},
            timeout: 10000,
            success: function (response) {
                console.log(response);

                let html = '';
                response.forEach(function (rbg, index) {
                    html += `
                        <div id="rank_list">
                            <label>${index+1}</label>
                            <div>
                                <a href="webtoon_view?wseq=${rbg.wseq}&gender=${loginUser.gender}">
                                    <img src="/images/webtoon/webtoon_images/title_img/${rbg.image}" style="width: 50px; padding-left: 10px;">
                                </a>
                                <a href="webtoon_view?wseq=${rbg.wseq}&gender=${loginUser.gender}">
                                    ${rbg.subject}
                                </a>
                            </div>
                        </div>`;
                });

                $("#rank").html(html);
            },
            error: function (error) {
                console.log(error);
            },
        });
    }
});


