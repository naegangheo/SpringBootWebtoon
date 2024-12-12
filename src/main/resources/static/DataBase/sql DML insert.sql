
truncate table member;
truncate table webtoon;
truncate table notice;
truncate table qna;
truncate table qreply;
truncate table reply;
truncate table admin;



INSERT INTO member (userid, pwd, name, gender, email, phone, address1, address2, address3, zip_num) VALUES
('hong1', '1234', 'hong1', 'M', 'hong1@abc.com', '010-1111-1111', NULL, NULL, NULL, NULL),
('hong2', '1234', 'hong2', 'F', 'hong2@abc.com', '010-1111-1112', NULL, NULL, NULL, NULL),
('hong3', '1234', 'hong3', 'M', 'hong3@abc.com', '010-1111-1113', NULL, NULL, NULL, NULL),
('hong4', '1234', 'hong4', 'F', 'hong4@abc.com', '010-1111-1114', NULL, NULL, NULL, NULL),
('hong5', '1234', 'hong5', 'M', 'hong5@abc.com', '010-1111-1115', NULL, NULL, NULL, NULL),
('hong6', '1234', 'hong6', 'F', 'hong6@abc.com', '010-1111-1116', NULL, NULL, NULL, NULL),
('hong7', '1234', 'hong7', 'M', 'hong7@abc.com', '010-1111-1117', NULL, NULL, NULL, NULL),
('hong8', '1234', 'hong8', 'F', 'hong8@abc.com', '010-1111-1118', NULL, NULL, NULL, NULL),
('hong9', '1234', 'hong9', 'M', 'hong9@abc.com', '010-1111-1119', NULL, NULL, NULL, NULL),
('hong10', '1234', 'hong10', 'F', 'hong10@abc.com', '010-1111-1120', NULL, NULL, NULL, NULL);

select * from member;


INSERT INTO webtoon (userid, subject, content, genre, week, image, image2, savefilename, savefilename2, indate, readcountF, readcountM, readcountN) VALUES
('hong1', '참교육', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 6, 1, 'title_img1.jpg', 'content_img1.png', NULL, NULL, '2023-10-12', 10, 20, 6000),
('hong1', '부활남', '나는 죽으면 3일 만에 부활한다!', 5, 2, 'title_img2.jpg', 'content_img2.png', NULL, NULL, '2023-12-10', 20, 40, 5900),
('hong1', '신석기녀', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 4, 3, 'title_img3.jpg', 'content_img3.png', NULL, NULL, '2024-01-10', 30, 60, 5800),
('hong1', '하우스키퍼', '''A.I가 인간에게 반역하는 것은 인간을 위해서이다.'' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 4, 4, 'title_img4.jpg', 'content_img4.png', NULL, NULL, '2024-03-10', 40, 80, 5700),
('hong1', '한림체육관', '"세상에서 가장 강한 남자가 되고 싶다.'' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 3, 5, 'title_img5.jpg', 'content_img5.png', NULL, NULL, '2024-05-10', 50, 100, 5600),
('hong1', '촉법소년', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 2, 6, 'title_img6.jpg', 'content_img6.png', NULL, NULL, '2024-10-10', 60, 120, 5500),
('hong2', '악의등교', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 3, 3, 'title_img7.jpg', 'content_img7.png', NULL, NULL, '2023-10-12', 70, 140, 5400),
('hong2', '사형 집행관', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 5, 4, 'title_img8.jpg', 'content_img8.png', NULL, NULL, '2023-12-10', 80, 160, 5300),
('hong2', '소년법칙', '나는 죽으면 3일 만에 부활한다!', 3, 5, 'title_img9.jpg', 'content_img9.png', NULL, NULL, '2024-01-10', 90, 180, 5200),
('hong2', '돈구멍', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 6, 6, 'title_img10.jpg', 'content_img10.png', NULL, NULL, '2024-03-10', 100, 200, 5100),
('hong2', '대장전', '''A.I가 인간에게 반역하는 것은 인간을 위해서이다.'' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 2, 7, 'title_img11.jpg', 'content_img11.png', NULL, NULL, '2024-05-10', 110, 220, 5000);

INSERT INTO webtoon (userid, subject, content, genre, week, image, image2, savefilename, savefilename2, indate, readcountF, readcountM, readcountN) VALUES
('hong3', '구룡', '세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 3, 1, 'title_img12.jpg', 'content_img12.png', NULL, NULL, '2023-10-12', 120, 240, 4900),
('hong3', '하이클래스', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 5, 2, 'title_img13.jpg', 'content_img13.png', NULL, NULL, '2023-12-10', 130, 260, 4800),
('hong3', '구세라', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 6, 3, 'title_img14.jpg', 'content_img14.png', NULL, NULL, '2024-01-10', 140, 280, 4700),
('hong3', '킹메이커', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 3, 4, 'title_img15.jpg', 'content_img15.png', NULL, NULL, '2024-03-10', 150, 300, 4600),
('hong3', '윈드브레이커', '나는 죽으면 3일 만에 부활한다!', 2, 4, 'title_img16.jpg', 'content_img16.png', NULL, NULL, '2024-05-10', 160, 320, 4500),
('hong3', '소녀의 세계', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 4, 5, 'title_img17.jpg', 'content_img17.png', NULL, NULL, '2024-10-10', 170, 340, 4400),
('hong4', '두번째 생일', '''A.I가 인간에게 반역하는 것은 인간을 위해서이다.'' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 4, 6, 'title_img18.jpg', 'content_img18.png', NULL, NULL, '2023-10-12', 180, 360, 4300),
('hong4', '활이피플', '세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 5, 7, 'title_img19.jpg', 'content_img19.png', NULL, NULL, '2023-12-10', 190, 380, 4200),
('hong4', '퀘스트 지상주의', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 6, 1, 'title_img20.jpg', 'content_img20.png', NULL, NULL, '2024-01-10', 200, 400, 4100),
('hong4', '절대검감', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 4, 3, 'title_img21.jpg', 'content_img21.png', NULL, NULL, '2024-03-10', 210, 420, 4000),
('hong4', '토마토가 돼라!', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 3, 2, 'title_img22.jpg', 'content_img22.png', NULL, NULL, '2024-05-10', 220, 440, 3900),
('hong4', '별난 식당', '나는 죽으면 3일 만에 부활한다!', 2, 3, 'title_img23.jpg', 'content_img23.png', NULL, NULL, '2024-10-10', 230, 460, 3800);

INSERT INTO webtoon (userid, subject, content, genre, week, image, image2, savefilename, savefilename2, indate, readcountF, readcountM, readcountN) VALUES
('hong5', '천재 타자가 강속구를 숨김', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 3, 2, 'title_img24.jpg', 'content_img24.png', NULL, NULL, '2023-10-12', 240, 480, 3700),
('hong5', '우아한 욕망', '\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 5, 1, 'title_img25.jpg', 'content_img25.png', NULL, NULL, '2023-12-10', 250, 500, 3600),
('hong5', '대신 살쪄주는 여자', '\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 6, 2, 'title_img26.jpg', 'content_img26.png', NULL, NULL, '2024-01-10', 260, 520, 3500),
('hong5', '망돌의 사생', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 4, 3, 'title_img27.jpg', 'content_img27.png', NULL, NULL, '2024-03-10', 270, 540, 3400),
('hong5', '회귀한 공작가의 막내도련님 암살자', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 3, 5, 'title_img28.jpg', 'content_img28.png', NULL, NULL, '2024-05-10', 280, 560, 3300),
('hong5', '기기괴괴2', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 2, 5, 'title_img29.jpg', 'content_img29.png', NULL, NULL, '2024-10-10', 290, 580, 3200),
('hong6', '기자매', '나는 죽으면 3일 만에 부활한다!', 2, 3, 'title_img30.jpg', 'content_img30.png', NULL, NULL, '2023-10-12', 300, 600, 3100),
('hong6', '아포칼립스에 집을 숨김', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 3, 4, 'title_img31.jpg', 'content_img31.png', NULL, NULL, '2023-12-10', 310, 620, 3000),
('hong6', '잘 헤어지는 방법', '\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 4, 5, 'title_img32.jpg', 'content_img32.png', NULL, NULL, '2024-01-10', 320, 640, 2900),
('hong6', '무벌전', '\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 5, 2, 'title_img33.jpg', 'content_img33.png', NULL, NULL, '2024-03-10', 330, 660, 2800),
('hong6', '어느날 갑자기 가슴이커짐', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 6, 3, 'title_img34.jpg', 'content_img34.png', NULL, NULL, '2024-05-10', 340, 680, 2700),
('hong6', '중세 판타지 속 망나니 경비조장', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 5, 5, 'title_img35.jpg', 'content_img35.png', NULL, NULL, '2024-10-10', 350, 700, 2600);

INSERT INTO webtoon (userid, subject, content, genre, week, image, image2, savefilename, savefilename2, indate, readcountF, readcountM, readcountN) VALUES
('hong7', '정신차려 전승연', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 4, 6, 'title_img36.jpg', 'content_img36.png', NULL, NULL, '2023-10-12', 360, 720, 2500),
('hong7', '시안부 천재가 살아남는 법', '나는 죽으면 3일 만에 부활한다!', 3, 2, 'title_img37.jpg', 'content_img37.png', NULL, NULL, '2023-12-10', 370, 740, 2400),
('hong7', '호붕빵 아저씨', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 2, 1, 'title_img38.jpg', 'content_img38.png', NULL, NULL, '2024-01-10', 380, 760, 2300),
('hong7', '사천당가', '\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 3, 2, 'title_img39.jpg', 'content_img39.png', NULL, NULL, '2024-03-10', 390, 780, 2200),
('hong7', '벤타블랙', '\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 4, 4, 'title_img40.jpg', 'content_img40.png', NULL, NULL, '2024-05-10', 400, 800, 2100),
('hong7', '최악의 세대', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 5, 5, 'title_img41.jpg', 'content_img41.png', NULL, NULL, '2024-10-10', 410, 820, 2000),
('hong8', '무적불패', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 5, 6, 'title_img42.jpg', 'content_img42.png', NULL, NULL, '2023-10-12', 420, 840, 1900),
('hong8', '신의탑', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 6, 1, 'title_img43.jpg', 'content_img43.png', NULL, NULL, '2023-12-10', 430, 860, 1800),
('hong8', '외모지상주의', '나는 죽으면 3일 만에 부활한다!', 5, 2, 'title_img44.jpg', 'content_img44.png', NULL, NULL, '2024-01-10', 440, 880, 1700),
('hong8', '별이상샵', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 4, 5, 'title_img45.jpg', 'content_img45.png', NULL, NULL, '2024-03-10', 450, 900, 1600),
('hong8', '무사만리행', '\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 3, 7, 'title_img46.jpg', 'content_img46.png', NULL, NULL, '2024-05-10', 460, 920, 1500),
('hong8', '전지적 독자시점', '\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 2, 6, 'title_img47.jpg', 'content_img47.png', NULL, NULL, '2024-10-10', 470, 940, 1400);

INSERT INTO webtoon (userid, subject, content, genre, week, image, image2, savefilename, savefilename2, indate, readcountF, readcountM, readcountN) VALUES
('hong9', '나노마신', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 3, 2, 'title_img48.jpg', 'content_img48.png', NULL, NULL, '2023-10-12', 480, 960, 1300),
('hong9', '독립일기', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 4, 1, 'title_img49.jpg', 'content_img49.png', NULL, NULL, '2023-12-10', 490, 980, 1200),
('hong9', '입학용병', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 5, 4, 'title_img50.jpg', 'content_img50.png', NULL, NULL, '2024-01-10', 500, 1000, 1100),
('hong9', '화산귀환', '나는 죽으면 3일 만에 부활한다!', 6, 5, 'title_img51.jpg', 'content_img51.png', NULL, NULL, '2024-03-10', 510, 1020, 1000),
('hong9', '나혼자 만렙 뉴비', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 5, 6, 'title_img52.jpg', 'content_img52.png', NULL, NULL, '2024-05-10', 520, 1040, 900),
('hong9', '조조코믹스', '\'A.I가 인간에게 반역하는 것은 인간을 위해서이다.\' A.I 혁명이 일어난 세계에서 사상 최악의 바이러스가 창궐하고 하스티의 주인 네빌은 좀비화가 된다. 세계연합정부는 환자들의 치료를 포기하고 감염확산을 막기 위해 좀비 학살 정책을 벌인다. 인간이 인간을 포기한 최악의 상황에서도 하스티는 주인인 네빌을 포기할 수 없었다. 좀비가 된 주인을 지키기 위한 A.I들의 처절한 사투가 시작된다.', 4, 7, 'title_img53.jpg', 'content_img53.png', NULL, NULL, '2024-10-10', 530, 1060, 800),
('hong10', '똑 닮은 딸', '\"세상에서 가장 강한 남자가 되고 싶다.\' 그릇된 강함을 실천하던 전영하가 한림체육관에 들어와 진정한 강함을 깨닫고 무도인으로 거듭나는 학원 액션물', 3, 5, 'title_img54.jpg', 'content_img54.png', NULL, NULL, '2023-10-12', 540, 1080, 700),
('hong10', '김부장', '대한민국은 X같은 법들로 가득하다 나를 지옥으로 밀어넣고도 처벌받지 않았던 ‘촉법소년’들 그 X같은 법의 결과물들에게, 지금부터 복수를 시작한다', 2, 4, 'title_img55.jpg', 'content_img55.png', NULL, NULL, '2023-12-10', 550, 1100, 600),
('hong10', '어쩌다보니 천생연분', '성적 우수, 용모 단정, 싸움 실력 평균 이상 그리고 약간의 정의로움. 1등급 모범생 김현성은 졸업을 앞둔 어느 날 옥상에서 떠밀려 식물인간이 되고 만다. 청각과 의식만 살아 있는 상태로 죽지도 못하고 지옥 같은 나날을 보낸 지 10년, 그는 불현듯 괴롭힘이 시작된 그날로 돌아온다.', 3, 6, 'title_img56.jpg', 'content_img56.png', NULL, NULL, '2024-01-10', 560, 1120, 500),
('hong10', '운명을 보는 회사원', '무너진 교권을 지키기 위해 교권보호국 소속 나화진의 참교육이 시작된다! <부활남> 채용택 작가 X <신석기녀> 한가람 작가의 신작!', 4, 2, 'title_img57.jpg', 'content_img57.png', NULL, NULL, '2024-03-10', 570, 1140, 400),
('hong10', '재벌집 막내아들', '나는 죽으면 3일 만에 부활한다!', 3, 4, 'title_img58.jpg', 'content_img58.png', NULL, NULL, '2024-05-10', 580, 1160, 300),
('hong10', '휴재일기', '불로불사 소녀와 시한부 청년의 피튀기는 로맨스', 6, 1, 'title_img59.jpg', 'content_img59.png', NULL, NULL, '2024-10-10', 590, 1180, 200);

select * from webtoon;



INSERT INTO qna (userid, pwd, subject, content, indate) VALUES
('hong1', '1234', 'subject1', 'content1', '2023-10-12'),
('hong2', '1234', 'subject2', 'content2', '2023-12-10'),
('hong3', '1234', 'subject3', 'content3', '2024-01-10'),
('hong4', '1234', 'subject4', 'content4', '2024-03-10'),
('hong5', '1234', 'subject5', 'content5', '2024-05-10'),
('hong6', '1234', 'subject6', 'content6', '2024-10-10'),
('hong7', '1234', 'subject7', 'content7', '2023-10-12'),
('hong8', '1234', 'subject8', 'content8', '2023-12-10'),
('hong9', '1234', 'subject9', 'content9', '2024-01-10'),
('hong10', '1234', 'subject10', 'content10', '2024-03-10'),
('hong1', '1234', 'subject11', 'content11', '2024-05-10'),
('hong2', '1234', 'subject12', 'content12', '2024-10-10'),
('hong3', '1234', 'subject13', 'content13', '2023-10-12'),
('hong4', '1234', 'subject14', 'content14', '2023-12-10'),
('hong5', '1234', 'subject15', 'content15', '2024-01-10'),
('hong6', '1234', 'subject16', 'content16', '2024-03-10'),
('hong7', '1234', 'subject17', 'content17', '2024-05-10'),
('hong8', '1234', 'subject18', 'content18', '2024-10-10'),
('hong9', '1234', 'subject19', 'content19', '2023-10-12'),
('hong10', '1234', 'subject20', 'content20', '2023-12-10'),
('hong1', '1234', 'subject21', 'content21', '2024-01-10'),
('hong2', '1234', 'subject22', 'content22', '2024-03-10'),
('hong3', '1234', 'subject23', 'content23', '2024-05-10'),
('hong4', '1234', 'subject24', 'content24', '2024-10-10'),
('hong5', '1234', 'subject25', 'content25', '2023-10-12'),
('hong6', '1234', 'subject26', 'content26', '2023-12-10'),
('hong7', '1234', 'subject27', 'content27', '2024-01-10'),
('hong8', '1234', 'subject28', 'content28', '2024-03-10'),
('hong9', '1234', 'subject29', 'content29', '2024-05-10'),
('hong10', '1234', 'subject30', 'content30', '2024-10-10'),
('hong1', '1234', 'subject31', 'content31', '2023-10-12'),
('hong2', '1234', 'subject32', 'content32', '2023-12-10'),
('hong3', '1234', 'subject33', 'content33', '2024-01-10'),
('hong4', '1234', 'subject34', 'content34', '2024-03-10'),
('hong5', '1234', 'subject35', 'content35', '2024-05-10'),
('hong6', '1234', 'subject36', 'content36', '2024-10-10'),
('hong7', '1234', 'subject37', 'content37', '2023-10-12'),
('hong8', '1234', 'subject38', 'content38', '2023-12-10'),
('hong9', '1234', 'subject39', 'content39', '2024-01-10'),
('hong10', '1234', 'subject40', 'content40', '2024-03-10');

select * from qna;



INSERT INTO admin (adminid, pwd, name, phone, email) VALUES
('scott', '1234', '홍길동', '010-1234-5678', 'scott@abc.com');

select * from admin;

INSERT INTO notice (adminid, pwd, subject, content, indate) VALUES
('scott', '1234', 'noticeSubject1', 'noteceContent1', '2023-10-12'),
('scott', '1234', 'noticeSubject2', 'noteceContent2', '2023-10-13'),
('scott', '1234', 'noticeSubject3', 'noteceContent3', '2023-10-15'),
('scott', '1234', 'noticeSubject4', 'noteceContent4', '2023-12-15'),
('scott', '1234', 'noticeSubject5', 'noteceContent5', '2024-03-01'),
('scott', '1234', 'noticeSubject6', 'noteceContent6', '2024-05-01'),
('scott', '1234', 'noticeSubject7', 'noteceContent7', '2024-07-01'),
('scott', '1234', 'noticeSubject8', 'noteceContent8', '2024-07-06'),
('scott', '1234', 'noticeSubject9', 'noteceContent9', '2024-07-07'),
('scott', '1234', 'noticeSubject10', 'noteceContent10', '2024-07-09'),
('scott', '1234', 'noticeSubject11', 'noteceContent11', '2024-08-09'),
('scott', '1234', 'noticeSubject12', 'noteceContent12', '2024-10-09'),
('scott', '1234', 'noticeSubject13', 'noteceContent13', '2024-12-09');

select * from notice;

INSERT INTO Qreply (qseq, adminid, qrcontent, indate) VALUES
(1, 'scott', 'qrcontent1', '2023-10-12'),
(5, 'scott', 'qrcontent2', '2023-12-10'),
(3, 'scott', 'qrcontent3', '2024-01-10'),
(2, 'scott', 'qrcontent4', '2024-03-10'),
(3, 'scott', 'qrcontent5', '2024-05-10'),
(5, 'scott', 'qrcontent6', '2024-10-10'),
(6, 'scott', 'qrcontent7', '2023-10-12'),
(8, 'scott', 'qrcontent8', '2023-12-10'),
(5, 'scott', 'qrcontent9', '2024-01-10'),
(7, 'scott', 'qrcontent10', '2024-03-10'),
(9, 'scott', 'qrcontent11', '2024-05-10'),
(10, 'scott', 'qrcontent12', '2024-10-10'),
(7, 'scott', 'qrcontent13', '2023-10-12'),
(5, 'scott', 'qrcontent14', '2023-12-10'),
(2, 'scott', 'qrcontent15', '2024-01-10'),
(3, 'scott', 'qrcontent16', '2024-03-10'),
(1, 'scott', 'qrcontent17', '2024-05-10'),
(1, 'scott', 'qrcontent18', '2024-10-10'),
(3, 'scott', 'qrcontent19', '2023-10-12'),
(5, 'scott', 'qrcontent20', '2023-12-10');

select * from qreply;

INSERT INTO reply (wseq, userid, rcontent, indate) VALUES
(1, 'hong1', 'reply1', '2023-10-12'),
(1, 'hong2', 'reply2', '2023-12-10'),
(3, 'hong3', 'reply3', '2024-01-10'),
(4, 'hong4', 'reply4', '2024-03-10'),
(5, 'hong5', 'reply5', '2024-05-10'),
(6, 'hong6', 'reply6', '2024-10-10'),
(3, 'hong7', 'reply7', '2023-10-12'),
(8, 'hong8', 'reply8', '2023-12-10'),
(9, 'hong9', 'reply9', '2024-01-10'),
(10, 'hong10', 'reply10', '2024-03-10'),
(11, 'hong1', 'reply11', '2024-05-10'),
(5, 'hong2', 'reply12', '2024-10-10'),
(13, 'hong3', 'reply13', '2023-10-12'),
(1, 'hong4', 'reply14', '2023-12-10'),
(6, 'hong5', 'reply15', '2024-01-10'),
(16, 'hong6', 'reply16', '2024-03-10'),
(17, 'hong7', 'reply17', '2024-05-10'),
(18, 'hong8', 'reply18', '2024-10-10'),
(19, 'hong9', 'reply19', '2023-10-12'),
(20, 'hong10', 'reply20', '2023-12-10'),
(1, 'hong1', 'reply21', '2024-01-10'),
(22, 'hong2', 'reply22', '2024-03-10'),
(23, 'hong3', 'reply23', '2024-05-10'),
(5, 'hong4', 'reply24', '2024-10-10'),
(34, 'hong5', 'reply25', '2023-10-12'),
(26, 'hong6', 'reply26', '2023-12-10'),
(3, 'hong7', 'reply27', '2024-01-10'),
(28, 'hong8', 'reply28', '2024-03-10'),
(4, 'hong9', 'reply29', '2024-05-10'),
(30, 'hong10', 'reply30', '2024-10-10');

select * from reply;

select * from admin;
select * from member;
select * from notice;
select * from qna;
select * from qreply;
select * from reply;
select * from webtoon;
