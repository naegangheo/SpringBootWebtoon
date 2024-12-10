
function previewImage(event, previewId) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onload = function (e) {
        const preview = document.getElementById(previewId);
        preview.src = e.target.result;
        preview.style.display = "block";
    };
    reader.readAsDataURL(file);
}

