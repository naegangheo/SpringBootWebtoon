document.addEventListener('DOMContentLoaded', function () {
    const toggleHeaders = document.querySelectorAll('.toggle-header');
    const qnaFormModal = document.getElementById('qnaFormModal');
    const closeFormButton = document.getElementById('closeFormButton');
    const openFormButton = document.getElementById('openFormButton');
    const modalTitle = document.getElementById('modalTitle');
    const qseqInput = document.getElementById('qseq');
    const subjectInput = document.getElementById('subject');
    const contentTextarea = document.getElementById('content');
    const submitButton = document.getElementById('submitButton');

    // "toggle-header" 클릭 이벤트 (게시글 펼치기)
    toggleHeaders.forEach(header => {
        header.addEventListener('click', function (event) {
            // "수정" 버튼을 클릭했을 경우 이벤트 중지
            if (event.target.classList.contains('edit-button')) return;

            const targetId = this.getAttribute('data-target');
            const content = document.getElementById(targetId);

            // 모든 다른 열려있는 컨텐츠를 숨김
            document.querySelectorAll('.toggle-content.visible').forEach(el => {
                if (el !== content) {
                    el.classList.remove('visible');
                }
            });

            // 클릭한 컨텐츠만 토글
            content.classList.toggle('visible');
        });
    });

    // 문의하기 버튼 클릭 시 모달 열기
    if (openFormButton) {
        openFormButton.addEventListener('click', function () {
            modalTitle.textContent = '문의하기';
            qseqInput.value = '';
            subjectInput.value = '';
            contentTextarea.value = '';
            submitButton.textContent = '제출하기';
            qnaFormModal.style.display = 'flex'; // 중앙 표시
        });
    }

    // 수정 버튼 클릭 시 모달 열기
    document.querySelectorAll('.edit-button').forEach(button => {
        button.addEventListener('click', function (event) {
            event.stopPropagation();

            const qseq = this.getAttribute('data-qseq');
            const subject = this.getAttribute('data-subject');
            const content = this.getAttribute('data-content');

            modalTitle.textContent = '문의 수정';
            qseqInput.value = qseq;
            subjectInput.value = subject;
            contentTextarea.value = content;
            submitButton.textContent = '수정하기';
            qnaFormModal.style.display = 'flex';
        });
    });

    // 모달 닫기 버튼
    closeFormButton.addEventListener('click', function () {
        qnaFormModal.style.display = 'none';
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', function (event) {
        if (event.target === qnaFormModal) {
            qnaFormModal.style.display = 'none';
        }
    });
});

