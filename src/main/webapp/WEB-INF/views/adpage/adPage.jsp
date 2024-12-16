<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랜덤 광고 이미지와 텍스트</title>
    <style>
        /* 기본 여백 제거 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box; /* 패딩과 보더를 포함한 크기 계산 */
        }

        html, body {
            width: 100%;
            height: 100%;
            overflow-x: hidden; /* 수평 스크롤바 제거 */
        }

        /* 광고 컨테이너 */
        .ad-container {
            width: 300px;
            height: 250px;
            margin: 0 auto; /* 가운데 정렬 */
            border: 1px solid #ddd;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden; /* 넘치는 부분 제거 */
            padding: 5px; /* 내부 여백 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
            cursor: pointer; /* 클릭 커서 */
        }

        /* 이미지 정렬 */
        .ad-container img {
            width: 100%; /* 가로 전체 */
            height: 150px; /* 고정 높이 */
            object-fit: cover; /* 비율 유지 + 꽉 채우기 */
            display: block; /* 이미지 아래 여백 제거 */
            margin: 10px 0px 5px 0px; /* 가운데 정렬 */
        }

        /* 텍스트 스타일 */
        .ad-text {
            margin-top: 10px;
            font-size: 13px;
            color: #333;
        }

        #ad-text-1, #ad-text-2 {
            margin-top: 0px;
            height: 16px; /* 높이 설정 */
        }

        #ad-text-3 {
            height: 16px; /* 높이 설정 */
            margin: 10px 0 10px 0; /* 위아래 마진 */
            color: grey;
        }
    </style>
</head>
<body>
<!-- 전체 광고를 클릭 가능하게 변경 -->
<div class="ad-container" id="ad-container">
    <img id="ad-image" src="" alt="광고 이미지">
    <strong class="ad-text" id="ad-text-1"></strong>
    <p class="ad-text" id="ad-text-2"></p>
    <div style="display: flex; justify-content: space-between;">
        <div class="ad-text" id="ad-text-3"></div>
        <div class="ad-text">더 알아보기 ＞</div>
    </div>
</div>

<script>
    // 광고 데이터 배열
    const ads = [
        {
            image: "images/adImages/img.png",
            text1: "알뜰바나나 2팩+2팩 최대 55%할인",
            text2: "바나나 2개 받고 2개 더!",
            text3: "스미후루코리아",
            link: "https://plusdeal.naver.com/smartstore?esk=HCgsJTsQIXj3lzPQBknLNyyyV4%2Fu1%2B5fioPsRGt8hV%2FfjTrehepmgNOSZ6yMaqfT6Ra8Mnm%2Brks%3D"
        },
        {
            image: "images/adImages/20241216_112313.png",
            text1: "해비치호텔앤드리조트 제주 특가 이벤트",
            text2: "연말연시 맞이 혜택!",
            text3: "지금 예약하면 할인!",
            link: "https://www.haevichi.com/jeju/ko/offers"
        },
        {
            image: "images/adImages/20241216_113629.png",
            text1: "20년 경험, 레오가구 슬라이딩 옷장",
            text2: "내맘대로 내부구성",
            text3: "레오가구",
            link: "https://brand.naver.com/reogagu/products/2036507928"
        }
    ];

    // 랜덤 광고 선택
    function loadRandomAd() {
        const randomIndex = Math.floor(Math.random() * ads.length);
        const ad = ads[randomIndex];

        // DOM 요소에 데이터 설정
        document.getElementById("ad-image").src = ad.image;
        document.getElementById("ad-text-1").innerText = ad.text1;
        document.getElementById("ad-text-2").innerText = ad.text2;
        document.getElementById("ad-text-3").innerText = ad.text3;

        // 광고 클릭 이벤트로 새 창 열기
        const adContainer = document.getElementById("ad-container");
        adContainer.onclick = function () {
            window.open(ad.link, '_blank'); // 새 창에서 열기
        };
    }

    // 페이지 로드 시 실행
    window.onload = loadRandomAd;
</script>
</body>
</html>
