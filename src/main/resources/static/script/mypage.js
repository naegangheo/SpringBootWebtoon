// 대표 이미지 및 웹툰 이미지 미리보기 함수
function previewImage(event, previewId) {
    const file = event.target.files[0];

    if (!file) {
        alert("이미지가 선택되지 않았습니다.");
        return;
    }

    // 파일 형식 검증 (이미지 파일만 허용)
    const allowedExtensions = ["image/jpeg", "image/png", "image/gif"];
    if (!allowedExtensions.includes(file.type)) {
        alert("이미지 파일만 업로드 가능합니다. (jpeg, png, gif)");
        return;
    }

    // 파일 크기 검증 (5MB 제한)
    const maxSize = 5 * 1024 * 1024; // 5MB
    if (file.size > maxSize) {
        alert("파일 크기는 5MB를 초과할 수 없습니다.");
        return;
    }

    // 이미지 미리보기 설정
    const reader = new FileReader();
    reader.onload = function (e) {
        const preview = document.getElementById(previewId);
        preview.src = e.target.result;
        preview.style.display = "block";
    };
    reader.readAsDataURL(file);
}

// 업로드 버튼 클릭 시 input[type="file"] 트리거
function triggerFileInput(inputId) {
    document.getElementById(inputId).click();
}
