package com.example.webtoon.dto;

import lombok.Data;

@Data
public class Paging {

    private int page=1;
    private int totalCount;
    private int beginPage;
    private int endPage;
    private int displayRow=10;
    private int displayPage=10;
    private boolean prev;
    private boolean next;
    private int startNum;
    private int endNum;   // 사용되지 않을 예정
    private int genre;

    public void calPaging(){
        endPage = ( (int)Math.ceil( page/(double)displayPage ) ) * displayPage;
        beginPage = endPage - (displayPage - 1);
        int totalPage = (int)Math.ceil( totalCount/(double)displayRow );
        if(totalPage<endPage){
            endPage = totalPage;
            next = false;
        }else{
            next = true;
        }
        prev = (beginPage==1)?false:true;
        startNum = (page-1)*displayRow;
        endNum = page*displayRow;
    }

}
