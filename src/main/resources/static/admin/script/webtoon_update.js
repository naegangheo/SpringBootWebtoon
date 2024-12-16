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


// 폼 제출 전 유효성 검사
function validateForm() {

    const subject = document.getElementById("subject").value.trim();
    const content = document.getElementById("content").value.trim();
    const genre = document.querySelector('input[name="genre"]:checked');
    const week = document.querySelector('input[name="week"]:checked');


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


    return true; // 유효성 검사가 통과된 경우에만 true 반환




}

// 업로드 버튼 클릭 시 input[type="file"] 트리거
function triggerFileInput(inputId) {
    document.getElementById(inputId).click();
}

$(document).ready(function () {
    $('#uploadBtn').click(function (event) {
        event.preventDefault();  // 폼 기본 제출 방지

        const mainImage = $('#mainImage')[0].files[0];
        const contentImage = $('#contentImage')[0].files[0];

        if (!mainImage || !contentImage) {
            alert("모든 이미지를 선택하세요.");
            return;
        }

        const formData = new FormData();
        formData.append("mainImage", mainImage);
        formData.append("contentImage", contentImage);

        // 파일 업로드 AJAX 요청
        $.ajax({
            url: '/fileup',
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
        url: '/updateWebtoon',
        type: 'POST',
        data: JSON.stringify(webtoonData),
        contentType: 'application/json',
        success: function (response) {
            alert('웹툰 수정이 완료되었습니다!');
            window.location.href = '/'; // 저장 성공 후 리다이렉트
        },
        error: function () {
            alert('웹툰 수정 중 오류가 발생했습니다.');
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















