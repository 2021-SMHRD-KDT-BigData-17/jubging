<%@page import="com.jubging.domain.join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
join user_id = (join) session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/profile_post.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>::Jubging:: - Profile</title>
</head>

<body>
  <!-- sidebar section Start -->
  <div class="sidebar">
    <div class="sidebarOption_logo">
      <img src="./img/homelogo.png">
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-house-chimney"></i>
      <a href="./Feed.jsp"><h2>홈</h2></a>
    </div>
    <div class="sidebarOption">
      <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
      <a href="./search.jsp"><h2>탐색하기</h2></a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-envelope"></i>
      <h2>TODAY'S PICK</h2>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-user"></i>
      <a href="./profile_post.jsp"><h2>프로필</h2></a>
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

  <!-- profile box -->

  <section>
    <div class="profile_header">
    </div>
    <div class="profile_post_follow_bx">
      <div class="profile_bx">
        <div class="profile_card">
          <img src="./img/icon/profile_img.png" alt="" class="profile_img">
          <h5 name="user_nick"><%=user_id.getUser_nick() %></h5>
          <h6 name="usesr_id">@<%=user_id.getUser_id() %></h6>
          <address>
            <a href="#">
              <i class="fa-solid fa-location-dot"></i>
              Sun Cheon
            </a>
            <a href="#">
              <i class="fa-solid fa-earth-asia"></i>
            </a>
          </address>
          <p><%=user_id.getUser_situation() %></p>
        </div>
        <div class="activity_bx">
          <div class="activity_card_bx">
            <i class="fas fa-eye"></i>
            <h6>Activity</h6>
          </div>
          <div class="activity_card_bx">
            <i class="fas fa-bolt"></i>
            <h6>Moments</h6>
          </div>
          <div class="activity_card_bx">
            <i class="fas fa-user-friends"></i>
            <h6>Friends</h6>
          </div>
          <div id="openmodal"  class="activity_card_bx">
            <i  class="fas fa-cog"></i>
            <h6>Edit Profile</h6>
          </div>
        </div>
      </div>
      <div class="post_follow_bx">
        <div class="post">
          <nav>
            <ul>
              <li><a class = "postnav" href="./profile_post.jsp">Post</a></li>
              <li><a class = "likenav" href="./profile_like.jsp">Like</a></li>
            </ul>
            <i class="fas fa-ellipsis-h"></i>
          </nav>
          <div class="post_main_bx">
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/icon/profile_img.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    <%=user_id.getUser_nick() %>
                    <p name="user_id">@<%=user_id.getUser_id() %></p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
                </div>
                <div class = "content_text_bx">
                  <span class = content_text>오늘 비오려나 플로깅 하러 가야하는데!</span>
                </div>
                <div class="post_card_social_data">
                  <div class="post_social_card">
                    <i class="fas fa-comment"></i>
                    <span name="comment_cnt">20</span><!-- 댓글 수-->
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-heart"></i>
                    <span name="like_cnt">1004</span>
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-share"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/icon/profile_img.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    <%=user_id.getUser_nick() %>
                    <p name="user_id">@<%=user_id.getUser_id() %></p> 
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>2 hours</h6>
                </div>
                <div class = "content_text_bx">
                  <span class="content_text">오늘 동천에서 이만큼 주웠습니다! 뿌듯하네요.</span>
                </div>
                <div class="image_post_bx">
                  <img src="./img/cantrash.jpg" alt="">
                  <img src="./img/trashduml.jpg" alt="">
                </div>
                <div class="post_card_social_data">
                  <div class="post_social_card">
                    <i class="fas fa-comment"></i>
                    <span name="comment_cnt">120</span><!-- 댓글 수-->
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-heart"></i>
                    <span name="like_cnt">10.4k</span>
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-share"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/icon/profile_img.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    <%=user_id.getUser_nick() %>
                    <p name="user_id">@<%=user_id.getUser_id() %></p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>4 hours</h6>
                </div>
                <div class = "content_text_bx">
                <span class="content_text">플로깅이란? 2016년 스웨덴에서부터 시작됐는데 '이삭을 줍는다'라는 뜻의 스웨덴어 '플로카 업(plocka upp)'과 '뛰다'라는 뜻의 영어 단어 '조깅(jogging)'을 합친 말이다. 최근 환경과 그 실천운동에 관심이 높아지면서 생긴 것으로, 운동을 하면서 쓰레기를 줍자는 말이다.</span>
                </div> 
                <div class="post_card_social_data">
                  <div class="post_social_card">
                    <i class="fas fa-comment"></i>
                    <span name="comment_cnt">120</span><!-- 댓글 수-->
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-heart"></i>
                    <span name="like_cnt">10.4k</span>
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-share"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      <div class="tag_bx">
        <div class="trend_for_you">
          <nav>
            <h6>Trands for you  <i class="fas fa-cog"></i> </h6>  
          </nav>
          <div class="trend_bx">
            <div class="rate">
              <li><a href="#">#today weather <br><p>937k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#plogging <br><p>1.37k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#dongcheon <br><p>3.2k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#분리수거 <br><p>7.1k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#떡잎마을 방범대 <br><p>3.1k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <a href="/gittest/src/main/webapp/folde2/search.html"><button class="see_more">SEE MORE</button></a>
          </div>          
        </div> 
      </div>
    </div>
  </section>

  <!-- Profile setting modal -->
 
  <div class="popup">
    <header>
      <div class="close"><i class="fa-solid fa-xmark"></i></div>
    </header>
    <div class="content">
        <div class="profile-text">
          <div class="imgbox">
            <img src="./img/icon/profile_img.png" alt="">
          </div>
            <div class="upload">
                <div class="round">
                  <input type="file">
                  <i class="fas fa-camera" style="color:#fff"></i>
              </div>
            </div>
            <div class="text">
                <span class="name"><%=user_id.getUser_nick() %></span>
                <span class="profile_content">
                    <%=user_id.getUser_situation() %>
                </span>
            </div>
        </div>
        <form action="saveCon">
            <textarea class ="nickarea" name = "user_nick" placeholder="닉네임을 입력하세요"></textarea>
            <textarea class ="profilearea" name = "user_situation" placeholder="프로필 내용을 입력하세요"></textarea>
            <div class="button">
                <button class="save" type="sumbit">저장</button>
            </div>
          </form>
    </div>
  </div>


  <!-- js file section -->
  <script>
    function dropdown() {
    document.getElementById("dropdown-content").classList.toggle("show");
    }

    // 프로필 세팅 모달창

const viewBtn = document.querySelector("#openmodal"),
    popup = document.querySelector(".popup"),
    close = popup.querySelector(".close");
    viewBtn.onclick = ()=>{
      popup.classList.toggle("show");
    };

    close.onclick = ()=>{
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


  </script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>
</body>

</html>