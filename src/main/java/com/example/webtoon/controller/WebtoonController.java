package com.example.webtoon.controller;

import com.example.webtoon.dto.MemberVO;
import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import com.example.webtoon.service.main.MainServiceL;
import com.example.webtoon.service.member.WebtoonService;
import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.awt.*;
import java.util.HashMap;
import java.util.List;

@Controller
public class WebtoonController {

    @Autowired
    MainServiceL sl;
    @Autowired
    MainServiceH msh;
    @Autowired
    WebtoonService webtoonService;

    @GetMapping("/")
    public ModelAndView main(Model model) {

        ModelAndView mav = new ModelAndView();

        List<WebtoonVO> webtoon = sl.select_webtoon();
        List<WebtoonVO> list = msh.getNoticeList();
        List<WebtoonVO> last = sl.lastWebtoon();


        model.addAttribute("webtoon", webtoon);
        model.addAttribute("noticeList", list);
        model.addAttribute("last", last);

        mav.setViewName("main");

        return mav;

    }




//    @GetMapping("/webtoonview")
//    public String webtoon_view() {
//        return "/webtoon/webtoon_view";
//
//    }

    /*@GetMapping("/created")
    public String mypage() {
        return "mypage/webtoon_insert";
    }*/


//    @GetMapping("/writeFrom")
//    public String mypage() {
//        return "/mypage/webtoon_insert";
//    }


//    ajax(sg)

//    @GetMapping("/webtoon/genre")
//    @ResponseBody
//    public List<WebtoonVO> filterByGenre(@RequestParam("genre") String genre) {
//        return sl.selectByGenre(genre);
//    }

    @GetMapping("/search")
    public String search(@RequestParam String keyword, Model model) {
        if (keyword.isEmpty()) {
            model.addAttribute("error", "검색어를 입력해주세요.");
            //return "main"; //검색어 없을 때 굳이 메인으로 갈지 고민..
        }
        List<WebtoonVO> searchResults = webtoonService.searchWebtoonsByKeyword(keyword);/*제목이나 작가명으로 검색*/

        int resultCount = searchResults.size();// 검색 결과 개수
        model.addAttribute("resultCount", resultCount); // 검색 결과 개수 추가
        model.addAttribute("searchResults", searchResults);
        model.addAttribute("keyword", keyword);


        List<WebtoonVO> noticeList = msh.getNoticeList(); /*공지사항 데이터*/
        model.addAttribute("noticeList", noticeList);
        List<WebtoonVO> webtoon = sl.select_webtoon(); /*인기리스트*/
        model.addAttribute("webtoon", webtoon);
        List<WebtoonVO> last = sl.lastWebtoon(); /*최신 웹툰*/
        model.addAttribute("last", last);

        return "/webtoon/search";
    }

}
