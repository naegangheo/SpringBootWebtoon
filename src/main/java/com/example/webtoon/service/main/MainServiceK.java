package com.example.webtoon.service.main;

import com.example.webtoon.dao.main.IMainDaoK;
import com.example.webtoon.dto.WebtoonVO;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Service
public class MainServiceK {

    @Autowired
     IMainDaoK mdaok; // Main DAO 인터페이스 의존성 주입
    @Autowired
    private ServletContext context;


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

    /*----------------------------------------------------------------------------*/

    // 파일 업로드 처리 메서드
    public HashMap<String, Object> uploadFile(MultipartFile file, String folder) {
        HashMap<String, Object> result = new HashMap<>();

        // 파일 저장 경로
        String path = context.getRealPath("/images/" + folder);
        File directory = new File(path);
        if (!directory.exists()) {
            directory.mkdirs(); // 디렉토리가 없으면 생성
        }

        try {
            // 파일명 생성
            Calendar today = Calendar.getInstance();
            long timestamp = today.getTimeInMillis();
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String saveFilename = folder + "_" + timestamp + fileExtension;

            // 파일 저장 경로
            String uploadPath = path + "/" + saveFilename;

            // 파일 저장
            file.transferTo(new File(uploadPath));

            // 결과 정보 저장
            result.put("STATUS", "SUCCESS");
            result.put("originalFilename", originalFilename);
            result.put("saveFilename", saveFilename);
        } catch (IOException e) {
            e.printStackTrace();
            result.put("STATUS", "FAILURE");
        }

        return result;
    }

    // 웹툰 데이터 저장 메서드
    public boolean saveWebtoon(WebtoonVO webtoonVO) {
        try {
            // DB 저장 호출
            if (webtoonVO.getWseq() == 0) {
                mdaok.insertWebtoon(webtoonVO); // 신규 등록
            } else {
                mdaok.updateWebtoon(webtoonVO); // 수정
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 특정 웹툰 조회 메서드
    public WebtoonVO getWebtoonById(int wseq) {
        return mdaok.findWebtoonById(wseq);
    }


}
























