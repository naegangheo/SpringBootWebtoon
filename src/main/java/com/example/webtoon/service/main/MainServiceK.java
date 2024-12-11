package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoK;
import com.example.webtoon.dto.WebtoonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class MainServiceK {

    @Autowired
     IMainDaoK mdaok; // Main DAO 인터페이스 의존성 주입

    public List<WebtoonVO> getBestListTop(int limit) {
        return mdaok.getBestListTop(limit);
    }


    // 이름 기준으로 가나다순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getNameList() {
        return mdaok.getNameList();
    }

    // 등록 날짜 기준으로 오름차순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getDayList() {
        return mdaok.getDayList();
    }

    // 조회수 기준으로 내림차순 정렬된 웹툰 리스트 가져오기
    public List<WebtoonVO> getbestlist() {
        List<WebtoonVO> list=mdaok.getbestlist();
        return list;
    }

    public WebtoonVO searchWebtoon(int wseq) {
        return mdaok.searchWebtoon(wseq);
    }

    public void insertWebtoon(WebtoonVO webtoon) {
        mdaok.insertWebtoon(webtoon);
    }

    public void saveWebtoon(WebtoonVO webtoon, MultipartFile mainImage, MultipartFile contentImage) {
        // 이미지 저장 로직
        if (!mainImage.isEmpty()) {
            String mainImagePath = saveImage(mainImage);
            webtoon.setSavefilename(mainImagePath);
        }
        if (!contentImage.isEmpty()) {
            String contentImagePath = saveImage(contentImage);
            webtoon.setSavefilename2(contentImagePath);
        }

        if (webtoon.getWseq() == 0) {
            mdaok.insertWebtoon(webtoon);
        } else {
            mdaok.updateWebtoon(webtoon);
        }
    }

    private String saveImage(MultipartFile image) {
        // 이미지 저장 경로 처리
        String imagePath = "경로/" + image.getOriginalFilename();

        String mainImagePath = "/images/title/";
        String contentImagePath = "/images/content/";
        // 실제 파일 저장 로직 추가
        return imagePath;
    }






}


