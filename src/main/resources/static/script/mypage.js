
    // 이미지 미리보기 함수
    function previewM(event) {
        const mainImage = document.getElementById('mainImagePreview');
        mainImage.src = URL.createObjectURL(event.target.files[0]);
        mainImage.style.display = "inline";
    }

    function previewC(event) {
        const contentImage = document.getElementById('contentImagePreview');
        contentImage.src = URL.createObjectURL(event.target.files[0]);
        contentImage.style.display = "inline";
    }

