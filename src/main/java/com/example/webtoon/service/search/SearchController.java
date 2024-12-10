package com.example.webtoon.service.search;

import com.example.webtoon.dto.WebtoonVO;

import java.util.List;

public class SearchController {
    public List<WebtoonVO> searchWebtoons(String keyword, String genre) {
        return mdao.searchWebtoons(keyword, genre);
    }
}
