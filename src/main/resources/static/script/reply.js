document.addEventListener("DOMContentLoaded", function () {
    // 댓글 유효성 검사
    function validateReplyForm() {
        const replyInput = document.getElementById("reply_input").value.trim();
        if (!replyInput) {
            alert("댓글을 입력해주세요.");
            return false;
        }
        if (replyInput.length > 500) {
            alert("댓글은 최대 500자까지 입력할 수 있습니다.");
            return false;
        }
        return true;
    }

    // 댓글 글자 수 카운터 업데이트
    const replyInput = document.getElementById("reply_input");
    if (replyInput) {
        replyInput.addEventListener("input", function () {
            const counter = document.getElementById("reply_counter");
            if (counter) {
                counter.textContent = `${this.value.length}/500`;
            }
        });
    }

    // 댓글 리스트 업데이트
    function updateReplyList(wseq) {
        fetch(`/reply/list?wseq=${wseq}`)
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Failed to fetch reply list");
                }
                return response.json();
            })
            .then((data) => {
                const replyListContainer = document.querySelector(".replylist");
                if (replyListContainer) {
                    replyListContainer.innerHTML = ""; // 기존 댓글 리스트 초기화
                    // 댓글이 하나도 없을 경우
                    if (data.length === 0) {
                        const noRepliesMessage = document.createElement("div");
                        noRepliesMessage.classList.add("no-replies-message"); // CSS 클래스 추가
                        noRepliesMessage.textContent = "댓글이 없습니다."; // 댓글이 없으면 메시지 추가
                        replyListContainer.appendChild(noRepliesMessage);
                    } else {
                        data.forEach((reply) => {
                            const replyItem = document.createElement("div");
                            replyItem.className = "reply-item";
                            replyItem.innerHTML = `
                            <div class="reply-author">${reply.userid}</div>
                            <div class="reply-content">${reply.rcontent}</div>
                            <div class="reply-date">${new Date(reply.indate).toLocaleString()}</div>
                        `;
                            // 삭제 버튼 생성
                            const deleteButton = document.createElement("button");
                            deleteButton.classList.add("delete-reply");
                            deleteButton.textContent = "삭제";

                            const loginUser = document.querySelector("#loginUser"); // 로그인한 사용자 정보 (예: ID)
                            if (loginUser && loginUser.value && reply.userid.trim() === loginUser.value.trim()) {
                                deleteButton.onclick = () => deleteReply(reply.reseq, wseq); // 삭제 함수 호출
                                replyItem.appendChild(deleteButton); // 삭제 버튼을 댓글 아이템에 추가
                            }

                            // 댓글 리스트 컨테이너에 댓글 추가
                            replyListContainer.appendChild(replyItem);
                        });
                    }
                }
            })
            .catch((error) => {
                console.error("댓글 리스트 업데이트 실패:", error);
            });
    }

    // 댓글 추가
    const replyForm = document.querySelector(".replyform");
    if (replyForm) {
        replyForm.addEventListener("submit", function (event) {
            event.preventDefault(); // 기본 폼 제출 방지
            const replyInputValue = document.getElementById("reply_input").value.trim();
            const wseq = new URLSearchParams(window.location.search).get("wseq");

            if (!validateReplyForm()) return;

            fetch("/reply/add", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    wseq,
                    rcontent: replyInputValue,
                }),
            })
                .then((response) => {
                    if (!response.ok) {
                        throw new Error("Failed to add reply");
                    }
                    return response.json();
                })
                .then(() => {
                    alert("댓글이 추가되었습니다.");
                    document.getElementById("reply_input").value = ""; // 입력창 초기화
                    updateReplyList(wseq); // 댓글 리스트 갱신
                })
                .catch((error) => {
                    console.error("댓글 추가 실패:", error);
                    alert("댓글 추가에 실패했습니다.");
                });
        });
    }

    // 댓글 삭제
    window.deleteReply = function (reseq, wseq) {
        if (!confirm("댓글을 삭제하시겠습니까?")) return;

        fetch(`/reply/delete?reseq=${reseq}`, { method: "POST" })
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Failed to delete reply");
                }
                return response.json();
            })
            .then((data) => {
                if (data.status === "success") {
                    alert(data.message); // 성공 메시지 출력
                    updateReplyList(wseq); // 댓글 리스트 갱신
                } else {
                    alert(data.message); // 실패 메시지 출력
                }
            })
            .catch((error) => {
                console.error("댓글 삭제 실패:", error);
                alert("댓글 삭제에 실패했습니다.");
            });
    };

    // 페이지 로드 시 댓글 리스트 초기화
    const wseq = new URLSearchParams(window.location.search).get("wseq");
    if (wseq) {
        updateReplyList(wseq);
    }
});
