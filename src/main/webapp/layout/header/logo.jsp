<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!------------------------------------------------------------------------------------------------------------------------------------------

    ### 로고 ###

    • 이미지개수 - 2개
    • 이미지 사이즈 - PC : 300 * 150 픽셀
    • FTP상의 이미지 경로 - /sde_design/skin번호/_wg/img/
    • <a href="링크주소"><img src="이미지주소" alt="" /></a>
    • 로고는 href="/" 로 절대 고정값입니다. 수정시 메인으로 연결되지 않을 수 있습니다.
    • 투명 PNG 파일로 만들어주세요.( 참고링크 - https://www.youtube.com/results?search_query=투명png만들기 )
    • logo_off.png - 마우스 올리기전
      logo_on.png  - 마우스 올렸을 때
    • 로고효과변경 - 아래 html중 class에 updown 이라고 적혀있는 부분
      upDown(위아래-기본값) / stop(효과없음) / fade(페이드) / left(좌우)

------------------------------------------------------------------------------------------------------------------------------------------->
<div class="logo rOver upDown">
    <a href="Controller?type=index">
        <img src="/shop/layout/header/img/logo_off_new.png" alt="" class="off -mov" />
        <img src="/shop/layout/header/img/logo_on_new.png" alt="" class="on -mov" />
    </a>
</div>