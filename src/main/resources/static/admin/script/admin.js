$(function () {
    // 디버깅용: .toggle-contentq 요소 확인
    console.log("토글 요소:", $('.toggle-contentq'));

    $(document).on('click', '.toggle-contentq', function (event)  {
        event.preventDefault(); // 기본 동작 방지

        // 디버깅용: 클릭된 요소 확인
        console.log("클릭된 요소:", this);

        var qseq = $(this).data('qseq'); // data-qseq 값 가져오기

        // 디버깅용: qseq 확인
        if (qseq !== undefined) {
            console.log(`선택된 qna의 qseq: ${qseq}`); // qseq 로그 출력
        } else {
            console.error("qseq 값이 정의되지 않았습니다.");
        }

        loadQreply(qseq);
    });

    function loadQreply(qseq){
        $.ajax({
            url:`/adminQreplyList`,
            method: "GET",
            async: true,
            data:{qseq:qseq},
            timeout: 10000,
            success:function (response){
                console.log('서버 응답:', response);

                if (response.qreplyList && response.qreplyList.length > 0) {
                    var html = '';
                    // 댓글 목록을 순차적으로 HTML에 추가
                    response.qreplyList.forEach(function (qreply) {
                        html += `
                            <form method="post" action="adminQreplyDelete">
                            <input type="hidden" name="qrseq" value="${qreply.qrseq}"/>
                            <input type="hidden" name="qseq" value="${qseq}"/>
                                <div class="qreply_title">
                    
                                    <div class="qreply_col">${qreply.qrcontent}</div>
                                    <div class="qreply_col">
                                        <fmt:formatDate value="${qreply.indate}" pattern="MM/dd hh:mm"/>
                                    </div>
                                    <div class="qreply_col">
                                        <input id="delete_button"  data-qrseq="${qreply.qrseq}" data-qseq="${qseq}"type="submit" value="삭제"/>
                                    </div>
                                </div>
                            </form>    
                            
                        `;
                    });

                    // 기존 댓글 부분을 새로 로드한 댓글로 업데이트
                    $(`#content-${qseq} .qreply`).html(html);
                } else {
                    // 댓글이 없으면 "댓글이 하나도 없습니다." 메시지 출력
                    $(`#content-${qseq} .qreply`).html('<div class="qreply_title"><div class="qreply_col">댓글이 하나도 없습니다.</div></div>');
                }
            },
            error:function(error){
                console.error('에러 발생:', error);
            }
        })
    }


    $(document).on('click', '#reply_button', function (event)  {
        event.preventDefault(); // 기본 동작 방지

        // 디버깅용: 클릭된 요소 확인
        console.log("클릭된 요소:", this);

        var qseq = $(this).data('qseq'); // data-qseq 값 가져오기

        // 디버깅용: qseq 확인
        if (qseq !== undefined) {
            console.log(`선택된 qna의 qseq: ${qseq}`); // qseq 로그 출력
        } else {
            console.error("qseq 값이 정의되지 않았습니다.");
        }

        insertQreply(qseq);

    });

    window.insertQreply = function (qseq) {
        var qrcontent = $(`#newReplyContent-${qseq}`).val();  // 댓글 내용 가져오기

        // 댓글 내용이 비어있는지 확인
        if (!qrcontent || qrcontent.trim() === '') {
            alert("댓글 내용을 입력해주세요.");
            return;  // 함수 종료
        }

        $.ajax({
            url: `/adminQreplyInsert`,  // 댓글 추가를 위한 URL
            method: 'POST',
            data: { qseq: qseq, qrcontent: qrcontent },
            success: function (response) {
                console.log('댓글 추가 성공:', response);
                $(`#newReplyContent-${qseq}`).val('');  // 입력창 초기화
            },
            error: function (error) {
                console.error('댓글 추가 실패:', error);
            }
        });
    }

    $(document).on('click', '#delete_button', function (event)  {
        event.preventDefault(); // 기본 동작 방지

        // 디버깅용: 클릭된 요소 확인
        console.log("클릭된 요소:", this);

        var qrseq = $(this).data('qrseq');
        var qseq = $(this).data('qseq');

        // 디버깅용: qseq 확인
        if (qseq !== undefined) {
            console.log(`선택된 qna의 qseq: ${qseq}`); // qseq 로그 출력
        } else {
            console.error("qseq 값이 정의되지 않았습니다.");
        }

        deleteReply(qrseq,qseq);

    });

    window.deleteReply = function (qrseq, qseq) {
        if (!confirm("댓글을 삭제하시겠습니까?")) return;

        $.ajax({
            url: `/adminQreplyDelete`,
            method: 'POST',
            data: { qrseq: qrseq, qseq:qseq },
            success: function () {
                console.log('댓글 삭제 성공');
                loadQreply(qseq); // 댓글 목록 새로고침
            },
            error: function (error) {
                console.error('댓글 삭제 실패:', error);
            }
        });
    };

});



