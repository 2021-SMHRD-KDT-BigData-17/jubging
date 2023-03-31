<%@page import="com.jubging.domain.join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%
join user_id = (join) session.getAttribute("user_id");
%>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/bulletinboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>bulletinboard</title>
</head>

<body>
  <!-- sidebar section Start -->
  <div class="sidebar">
    <div class="sidebarOption_logo">
      <img src="./img/homelogo.png">
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-house-chimney"></i>
      <a href="./Feed.jsp">
        <h2>홈</h2>
      </a>
    </div>
    <div class="sidebarOption">
      <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
      <a href="./search.jsp">
        <h2>트렌드</h2>
      </a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-envelope"></i>
      <a href="./todayspick.jsp">
        <h2>TODAY'S PICK</h2>
      </a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-user"></i>
      <a href="./profile_post.jsp">
        <h2>프로필</h2>
      </a>
    </div>
    <div class="profile_btn" onclick="dropdown()">
      <div class="user_info">
        <img src="./img/129.png" class="user_profile_img" style="width: 55px; height: 55px;">
        <div class="name">
          <p class="user_nick"><%=user_id.getUser_nick() %></p>
          <p class="user_id">@<%=user_id.getUser_id() %></p>
        </div>
        <div class="user_profile_op">
          <i class="fa-solid fa-angles-down"></i>
        </div>
      </div>
    </div>
    <div class="sidebar_dropdown-content" id="dropdown-content">
      <a href="LogoutCon"><p onclick="logout()">로그아웃</p></a>
    </div>
  </div>
  <!-- sidebar section end -->


  <!-- 게시물 섹션 -->

  <section>
    <div class="bulletinboard_header"></div>
    <div class="board_list_wrap">
      <table class="board_list">
        <caption>게시판 목록</caption>
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="num">11</td>
            <td class="tit">
              <a href="http://naver.com">순천 봉화산 둘레길</a>
            </td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">10</td>
            <td class="tit">순천 낙안읍성 둘레길</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">9</td>
            <td class="tit">순천 동천</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">8</td>
            <td class="tit">제주도 올레길</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">7</td>
            <td class="tit">섬진강 플로깅</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">6</td>
            <td class="tit">섬진강 플로깅</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">5</td>
            <td class="tit">섬진강 플로깅</td>
            <td>관리자</td>
            <td>2023-03-30</td>

          </tr>
          <tr>
            <td class="num">4</td>
            <td class="tit">섬진강 플로깅</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">3</td>
            <td class="tit">섬진강 플로깅</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">2</td>
            <td class="tit">섬진강 플로깅</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
          <tr>
            <td class="num">1</td>
            <td class="tit">섬진강 플로깅</td>
            <td>관리자</td>
            <td>2023-03-30</td>
          </tr>
        </tbody>
      </table>
      <div class="paging">
        <a href="#" class="num">1</a>
        <a href="#" class="num">2</a>
        <a href="#" class="num">3</a>
      </div>
    </div>
  </section>






















  <!-- js file section -->
  <script>
    function dropdown() {
      document.getElementById("dropdown-content").classList.toggle("show");
    }

    // 프로필 세팅 모달창

    const viewBtn = document.querySelector("#openmodal"),
      popup = document.querySelector(".popup"),
      close = popup.querySelector(".close");
    viewBtn.onclick = () => {
      popup.classList.toggle("show");
    };

    close.onclick = () => {
      viewBtn.click();
    };

    // 사이드바 기능

    const links = document.querySelectorAll('.sidebarOption a');

    const currentUrl = window.location.href;

    links.forEach(link => {
      if (link.href === currentUrl) {
        link.classList.add('active');
      } else {
        link.classList.add('default');
      }
    });

    const buttons = document.querySelectorAll('button');
    const selectedButton = document.querySelector('.selected');
    const selectedIndex = Array.from(buttons).indexOf(selectedButton);

    function moveLeft() {
      if (selectedIndex > 0) {
        selectedButton.classList.remove('selected');
        buttons[selectedIndex - 1].classList.add('selected');
      }
    }

    function moveRight() {
      if (selectedIndex < buttons.length - 1) {
        selectedButton.classList.remove('selected');
        buttons[selectedIndex + 1].classList.add('selected');
      }
    }

    document.addEventListener('keydown', function (event) {
      if (event.key === 'ArrowLeft') {
        moveLeft();
      } else if (event.key === 'ArrowRight') {
        moveRight();
      }
    });
  
  </script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>
</body>

</html>