package com.example.webtoon.controller;

import com.example.webtoon.dto.NoticeVO;
import com.example.webtoon.dto.WebtoonVO;
import com.example.webtoon.service.main.MainServiceH;
import com.example.webtoon.service.main.MainServiceL;
import com.example.webtoon.service.member.WebtoonService;
import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    public String main(Model model) {

        List<WebtoonVO> webtoon = sl.select_webtoon();
        List<WebtoonVO> list = msh.getNoticeList();
        List<WebtoonVO> last = sl.lastWebtoon();

        model.addAttribute("webtoon", webtoon);
        model.addAttribute("noticeList", list);
        model.addAttribute("last", last);
        return "main";

    }

    /* hashMap을 쓰려면 이렇게 써야하는데 위에 방식은 무슨방식인지 잘 모르겟어요
    List안에 hashmap을 넣은건지 잘 모르겟습니다. 구지 저렇게 할필요는 없는거 같은데 조금 이해가 잘되지 않아용
    public HashMap<String,Object> main(){
        HashMap<String, Object> result = new HashMap<>();
        List<WebtoonVO> list= sl.select_webtoon();
        List<NoticeVO> list = msh.getNoticeList();
        result.put("webtoon", list);
        result.put("noticeList",list);
        return result;
    }
    */

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
            //return "main"; // 검색어 없을 때 메인으로 리다이렉트?
        }

        // 제목 또는 작가명으로 검색
        List<WebtoonVO> searchResults = webtoonService.searchWebtoonsByKeyword(keyword);

        model.addAttribute("searchResults", searchResults);
        model.addAttribute("keyword", keyword);
        return "/webtoon/search";
    }

}
