function previewImage(event, previewId) {
    const file = event.target.files[0];

    if (!file) {
        alert("이미지가 선택되지 않았습니다.");
        return;
    }

    const preview = document.getElementById(previewId);
    if (!preview) {
        alert(`ID가 '${previewId}'인 미리보기 요소를 찾을 수 없습니다.`);
        return;
    }

    const reader = new FileReader();
    reader.onload = function (e) {
        preview.src = e.target.result;
        preview.style.display = "block";
    };
    reader.readAsDataURL(file);




}

// 업로드 버튼 클릭 시 input[type="file"] 트리거
function triggerFileInput(inputId) {
    document.getElementById(inputId).click();
}

// 폼 제출 전 유효성 검사
function validateForm() {

    const ruleAgree = document.getElementById("ruleAgree");
    const subject = document.getElementById("subject").value.trim();
    const content = document.getElementById("content").value.trim();
    const mainImage = document.getElementById("mainImage").files[0];
    const contentImage = document.getElementById("contentImage").files[0];
    const genre = document.querySelector('input[name="genre"]:checked');
    const week = document.querySelector('input[name="week"]:checked');

    if (!ruleAgree.checked) {
        alert("운영 원칙에 동의해야 합니다.");
        return false;
    }

    if (subject === "") {
        alert("작품명을 입력해 주세요.");
        return false;
    }

    if (!genre) {
        alert("장르를 선택해 주세요.");
        return false;
    }

    if (!week) {
        alert("요일을 선택해 주세요.");
        return false;
    }


    if (content === "") {
        alert("작품의 줄거리를 입력해 주세요.");
        return false;
    }

    if (!mainImage || !contentImage) {
        alert("대표 이미지와 웹툰 이미지를 모두 선택해 주세요.");
        return false;
    }



    return true; // 유효성 검사가 통과된 경우에만 true 반환

}



// 파일 업로드
$(document).ready(function () {
    $('.bottom_button button[type="submit"]').click(function (event) {
        event.preventDefault(); // 기본 폼 제출 방지

        if (!validateForm()) {
            return; // 유효성 검사 실패 시 종료
        }

        // 대표 이미지와 웹툰 이미지 업로드
        const mainImage = $('#mainImage')[0].files[0];
        alert(mainImage.name);
        const contentImage = $('#contentImage')[0].files[0];
        alert(contentImage.name)
        const formData = new FormData();

        if (mainImage) formData.append('mainImage', mainImage);
        if (contentImage) formData.append('contentImage', contentImage);

        // 파일 업로드 AJAX 요청
        $.ajax({
            url: '/uploadFile',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (uploadResponse) {
                console.log(uploadResponse);
                if (uploadResponse.mainImage && uploadResponse.contentImage) {
                    // 파일 업로드 성공 시 웹툰 데이터 저장 요청
                    saveWebtoon(uploadResponse.mainImage.savefilename, uploadResponse.contentImage.savefilename);
                } else {
                    alert('파일 업로드 실패. 다시 시도해 주세요.');
                }
            },
            error: function () {
                alert('파일 업로드 중 오류가 발생했습니다.');
            }
        });
    });
});

// 웹툰 데이터 저장 함수
function saveWebtoon(savefilename, savefilename2) {
    const webtoonData = {
        subject: $('#subject').val(),
        genre: $('input[name="genre"]:checked').val(),
        content: $('#content').val(),
        week: $('input[name="week"]:checked').val(),
        savefilename: savefilename,
        savefilename2: savefilename2,
        image: savefilename, // image 값 설정
        image2: savefilename2
    };

    $.ajax({
        url: '/insertWebtoon',
        type: 'POST',
        data: JSON.stringify(webtoonData),
        contentType: 'application/json',
        success: function (response) {
            alert('웹툰 저장이 완료되었습니다!');
            window.location.href = '/'; // 저장 성공 후 리다이렉트
        },
        error: function () {
            alert('웹툰 저장 중 오류가 발생했습니다.');
        }
    });
}



function updateCounter(inputId, counterId) {
    const input = document.getElementById(inputId);
    const counter = document.getElementById(counterId);
    const currentLength = input.value.length;
    const maxLength = input.getAttribute('maxlength');
    counter.textContent = `${currentLength}/${maxLength}`;
}

// 페이지 로드 시 초기화
window.onload = function () {
    updateCounter('subject', 'subjectCounter');
    updateCounter('content', 'contentCounter');
};















