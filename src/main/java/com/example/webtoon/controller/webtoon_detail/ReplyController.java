package com.example.webtoon.controller.webtoon_detail;

import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.ReplyVO;
import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import com.example.webtoon.service.webtoon_detail.ReplyService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ResponseBody
@RequestMapping("/reply")
public class ReplyController {

    @Autowired
    private ReplyService rsv;

    // 댓글 등록
    @PostMapping("/add")
    @ResponseBody
    public Map<String, String> addReply(@RequestBody ReplyVO reply, HttpSession session) {
        Map<String, String> response = new HashMap<>();
        try {
            MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
            if (loginUser == null) {
                System.out.println("loginUser is null. Ensure user is logged in.");
                response.put("status", "failure");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }

            reply.setUserid(loginUser.getUserid());
            rsv.addReply(reply);

            response.put("status", "success");
            response.put("message", "댓글이 등록되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "failure");
            response.put("message", "댓글 등록 중 오류가 발생했습니다.");
        }
        return response;
    }



    // 댓글 리스트 조회
    @GetMapping("/list")
    @ResponseBody
    public List<ReplyVO> getReplyList(@RequestParam("wseq") int wseq) {
        return rsv.getReplyList(wseq);
    }

    // 댓글 수정
    @PostMapping("/update")
    @ResponseBody
    public Map<String, String> updateReply(@RequestBody ReplyVO reply) {
        Map<String, String> response = new HashMap<>();
        try {
            rsv.updateReply(reply);
            response.put("status", "success");
            response.put("message", "댓글이 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "failure");
            response.put("message", "댓글 수정 중 오류가 발생했습니다.");
        }
        return response;
    }

    // 댓글 삭제
    @PostMapping("/delete")
    @ResponseBody
    public Map<String, String> deleteReply(@RequestParam("reseq") int reseq, HttpSession session) {
        Map<String, String> response = new HashMap<>();
        try {
            MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
            if (loginUser == null) {
                response.put("status", "failure");
                response.put("message", "로그인이 필요합니다.");
                return response;
            }
            ReplyVO reply = rsv.getReplyById(reseq);
            if (!reply.getUserid().equals(loginUser.getUserid())) {
                response.put("status", "failure");
                response.put("message", "본인의 댓글만 삭제할 수 있습니다.");
                return response;
            }

            rsv.deleteReply(reseq);
            response.put("status", "success");
            response.put("message", "댓글이 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "failure");
            response.put("message", "댓글 삭제 중 오류가 발생했습니다.");
        }
        return response;
    }

    @Autowired
    MainServiceH msh;

    @GetMapping("/webtoonDetail")
    public String webtoonDetail(@RequestParam("wseq") int wseq, HttpSession session, Model model) {
        // 로그인 사용자 정보를 세션에서 가져옴
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        ReplyVO relpyUser =(ReplyVO) session.getAttribute("relpyUser");

        List<ReplyVO> replyList = rsv.getRepliesByWseq(wseq);

        int displayRow = 5;  // 한 페이지에 보여줄 공지사항 개수
        int startNum = 0;  // 첫 페이지에서 시작

        /*List<NoticeVO> list = msh.getNoticeList(displayRow, startNum);*/

        /*System.out.println("공지사항 목록: " + (list != null ? list : "null"));
        System.out.println("공지사항 목록 크기: " + (list != null ? list.size() : "null"));*/

        // JSP에 사용할 데이터 추가
        model.addAttribute("loginUser", loginUser);
        model.addAttribute("relpyUser", relpyUser);


        // 댓글 리스트 전달

        model.addAttribute("replyList", replyList);
        model.addAttribute("wseq", wseq);
        /*model.addAttribute("noticeList", list);*/


        return "webtoon_detail"; // JSP 파일 이름
    }







}

