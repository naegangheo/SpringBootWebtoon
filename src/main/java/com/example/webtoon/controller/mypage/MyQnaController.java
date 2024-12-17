package com.example.webtoon.controller.mypage;

import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.dto.QnaVO;
import com.example.webtoon.dto.QreplyVO;
import com.example.webtoon.service.admin.AdminService;
import com.example.webtoon.service.member.QnaService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;

@Controller
public class MyQnaController {

    @Autowired
    AdminService adminService;
    @Autowired
    QnaService qnaService;

    @GetMapping("/myQna")
    public String getMyQna(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        } else {
            String userId = loginUser.getUserid(); // 사용자 ID
            HashMap<String, Object> qnaData = qnaService.getUserSpecificQnaList(request, userId);

            model.addAttribute("qnaList", qnaData.get("qnaList"));
            model.addAttribute("qnaReplyList", qnaData.get("qnaReplyList"));
            model.addAttribute("paging", qnaData.get("paging"));

            return "mypage/my_qna";
        }
    }

    @PostMapping("/insertQna")
    public String insertQna(@ModelAttribute QnaVO qnaVO,
                            HttpSession session,
                            RedirectAttributes redirectAttributes) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }

        // 유효성 검사
        if (qnaVO.getQseq() == null) {
            // 신규 QnA 작성
            qnaVO.setUserid(loginUser.getUserid());
            qnaService.insertQna(qnaVO);
        } else {
            // QnA 수정
            qnaVO.setUserid(loginUser.getUserid());
            qnaService.updateQna(qnaVO);
        }

        redirectAttributes.addFlashAttribute("message", "처리가 완료되었습니다.");
        return "redirect:/myQna";
    }

    @PostMapping("/deleteQna")
    public String deleteQna(@RequestParam("qseq") int qseq, HttpSession session, RedirectAttributes rttr) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        qnaService.deleteQna(qseq, loginUser.getUserid()); // 삭제 실행

        rttr.addFlashAttribute("message", "Q&A 게시글이 삭제되었습니다.");
        return "redirect:/myQna";
    }

    @GetMapping("/getReplies")
    @ResponseBody
    public List<QreplyVO> getReplies(@RequestParam("qseq") int qseq) {
        return qnaService.getReplies(qseq);
    }

}