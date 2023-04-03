<%@page import="com.jubging.domain.Community"%>
<%@page import="java.util.List"%>
<%@page import="com.jubging.domain.CommunityDAO2"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="com.jubging.domain.join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
join user_id = (join) session.getAttribute("user_id");
%>

<%
CommunityDAO2 dao = new CommunityDAO2();
List<Community> com = dao.SelectMember(user_id.getUser_id());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/Feed.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<title>::Jubging:: - Feed</title>
</head>

<body>
	<!-- sidebar section Start -->
	<div class="sidebar">
		<div class="sidebarOption_logo">
			<img src="./img/homelogo.png">
		</div>
		<div class="sidebarOption">
			<i class="fa-solid fa-house-chimney"></i> <a href="./Feed.jsp"><h2>HOME</h2></a>
		</div>
		<div class="sidebarOption">
			<i class="fa-sharp fa-solid fa-magnifying-glass"></i> <a
				href="./search.jsp"><h2>TREND</h2></a>
		</div>
		<div class="sidebarOption">
			<i class="fa-solid fa-envelope"></i> <a href="./todayspick.jsp"><h2>TODAY'S
					PICK</h2></a>
		</div>
		<div class="sidebarOption">
			<i class="fa-solid fa-user"></i> <a href="./profile_post.jsp"><h2>PROFILE</h2></a>
		</div>
		<div class="profile_btn" onclick="dropdown()">
			<div class="user_info">
				<%
				if (user_id.getUser_img() != null) {
					byte[] imageData = Base64.getDecoder().decode(user_id.getUser_img());

					// 바이트 배열을 파일로 저장
					String imageFileName = "user_img_" + user_id.getUser_id() + ".jpg";
					String imagePath = request.getServletContext().getRealPath("/img/") + "user_img_" + user_id.getUser_id() + ".jpg"; // 이미지 파일 경로
					FileOutputStream fos = new FileOutputStream(imagePath);
					fos.write(imageData);
					fos.close();

					String imageUrl = request.getContextPath() + "/img/user_img_" + user_id.getUser_id() + ".jpg";
				%>
				<img src="<%=imageUrl%>" alt="" class="user_profile_img"
					style="width: 55px; height: 55px;">
				<%
				} else {
				%>
				<img src="./img/icon/profile_img.png" alt=""
					class="user_profile_img" style="width: 55px; height: 55px;">
				<%
				}
				%>
				<div class="name">
					<p class="user_nick"><%=user_id.getUser_nick()%></p>
					<p class="user_id">
						@<%=user_id.getUser_id()%></p>
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

	<!-- feed section start -->
	<!-- post box -->
	<div class="feed">
		<div class="feed_header">
			<h2>홈</h2>
		</div>
		<div class="postbox">

			<div class="input_box">
				<div class="postbox_area">
					<textarea name="" cols="40" rows="3" placeholder="무슨 일이 일어나고 있나요?"
						id="contentInput"></textarea>
					<div class="postbox_tag"></div>
				</div>
			</div>
			<div class="postbox_image-container" id="selectedImage"></div>
			<div class="postbox_footer">
				<div class="footer-icon">
					<div class="add-img">
						<i class="far fa-file-image"><input type="file" name="c_img"
							style="display: none;" accept="image/*"></i>
					</div>
					<div class="add_map">
						<i class="fa-solid fa-location-dot"></i>
					</div>
					<div class="add_tage">
						<i class="fa-regular fa-hashtag" onclick="dropdown_tage()"></i>
					</div>
				</div>
				<div class="post-submit">
					<button class="postbox_btn">글쓰기</button>
				</div>
			</div>

			<div class="tag_wrapper" id="tage_dropdown-content">
				<div class="title">
					<i class="fa-solid fa-tags"></i>
					<h2>태그</h2>
				</div>
				<div class="tag_content">
					<div class="tag_box">

						<ul>
							<input type="text" name="" placeholder="원하는 태그를 입력 해 주세요" id="tag_input">
							<div class="tag_details">
								<button id="add_postboxTags">태그 추가</button>
							</div>
						</ul>

					</div>
				</div>
			</div>
		</div>
		<!-- post box end -->
		<!-- post list start-->
		<div class="post_list">
			<div class="post_list_box">
				<div class="content">
					<div class="post_profile" style="float: left;">
						<img src="./img/icon/profile_img.png" alt="">
					</div>
					<div class="user_name_time">
						<h5 name="user_nick">
							smhrd
							<p name="user_id">@smhrd_12345</p>
						</h5>
						<h6>
							<i class="far fa-clock" name="c_date"></i>25 mins
						</h6>
						<i class="fa-solid fa-trash-can" onclick="delete_postlist()"></i>
					</div>
					<div class="content_text" name="post-content">
						<span>오늘 비오려나 플로깅 하러 가야하는데! </span>
					</div>
					<div class="tags_output"></div>
					<div class="img_post_bx"></div>
					<div class="post_card_social_data">
						<div class="post_social_card">
							<i class="fas fa-comment"></i> <span name="comment_cnt">20</span>
							<!-- 댓글 수-->
						</div>
						<div class="post_social_card">
							<i class="fas fa-heart"></i> <span name="like_cnt">0</span>
						</div>
						<div class="post_social_card">
							<i class="fa-solid fa-map-location-dot"></i>
						</div>
					</div>
					<div class="dropdown-comment">

						<input type="text" name="commentInput">
						<button class="commentBtn">댓글입력</button>

					</div>
					<div class="comment_list"></div>
				</div>
			</div>
			<div class="post_list_box">
				<div class="content">
					<div class="post_profile" style="float: left;">
						<img src="./img/icon/profile_img.png" alt="">
					</div>
					<div class="user_name_time">
						<h5 name="user_nick">smhrd
							<p name="user_id">@smhrd_12345</p>
						</h5>
						<h6>
							<i class="far fa-clock" name="c_date"></i>2 hours
						</h6>
						<i class="fa-solid fa-trash-can"></i>
					</div>
					<div class="content_text" name="post-content">
						<span>오늘 동천에서 이만큼 주웠습니다! 뿌듯하네요.</span>
					</div>
					<div class="tags_output"></div>
					<div class="img_post_bx">
						<img src="./img/cantrash.jpg" alt=""> <img
							src="./img/trashduml.jpg" alt="">
					</div>
					<div class="post_card_social_data">
						<div class="post_social_card">
							<i class="fas fa-comment" onclick="dropdowncommentinput()"></i> <span
								id="comment_cnt">0</span>
							<!-- 댓글 수-->
						</div>
						<div class="post_social_card">
							<i class="fas fa-heart"></i> <span name="like_cnt">0</span>
						</div>
						<div class="post_social_card">
							<i class="fa-solid fa-map-location-dot"></i>
						</div>
					</div>
					<div class="dropdown-comment" id="commnet_input">

						<input type="text" id="commentInput">
						<button class="commentBtn">댓글입력</button>

					</div>
					<div class="comment_list" id="new_comment_list"></div>
				</div>
			</div>
			<div class="post_list_box">
				<div class="content">
					<div class="post_profile" style="float: left;">
						<img src="./img/icon/profile_img.png" alt="">
					</div>
					<div class="user_name_time">
						<h5 name="user_nick">smhrd
							<p name="user_id">@smhrd_12345</p>
						</h5>
						<h6>
							<i class="far fa-clock" name="c_date"></i>4 hours
						</h6>
						<i class="fa-solid fa-trash-can" onclick="delete_postlist()"></i>
					</div>
					<div class="content_text" name="post-content">
						<span>플로깅이란? 2016년 스웨덴에서부터 시작됐는데 '이삭을 줍는다'라는 뜻의 스웨덴어 '플로카
							업(plocka upp)'과 '뛰다'라는 뜻의 영어 단어 '조깅(jogging)'을 합친 말이다. 최근 환경과 그
							실천운동에 관심이 높아지면서 생긴 것으로, 운동을 하면서 쓰레기를 줍자는 말이다.</span> </span>
					</div>
					<div class="tags_output"></div>
					<div class="img_post_bx"></div>
					<div class="post_card_social_data">
						<div class="post_social_card">
							<i class="fas fa-comment"></i> <span name="comment_cnt">2</span>
							<!-- 댓글 수-->
						</div>
						<div class="post_social_card">
							<i class="fas fa-heart"></i> <span name="like_cnt">0</span>
						</div>
						<div class="post_social_card">
							<i class="fa-solid fa-map-location-dot"></i>
						</div>
					</div>
					<div class="dropdown-comment">

						<input type="text" name="commentInput">
						<button class="commentBtn">댓글입력</button>

					</div>
					<div class="comment_list">
						<div class="dropdown-comment_list">
							<div class="post_profile">
								<img src="./img/profile_3.png" alt="">
							</div>
							<div class="user_name_time_comment">
								<h5 name="user_nick">
									earthlover
									<p name="user_id">@earthlove_125</p>
									<h6>
										<i class="far fa-clock" name="c_date"></i>1 mins
									</h6>
									<i class="fa-solid fa-trash-can"></i>
								</h5>
							</div>
							<div class="comment_text">
								<span>처음 알았어요!</span>
							</div>
						</div>
						<div class="dropdown-comment_list">
							<div class="post_profile">
								<img src="./img/profile_2.png" alt="">
							</div>
							<div class="user_name_time_comment">
								<h5 name="user_nick">
									plogger
									<p name="user_id">@plogger_1004</p>
									<h6>
										<i class="far fa-clock" name="c_date"></i>1 mins
									</h6>
									<i class="fa-solid fa-trash-can"></i>
								</h5>
							</div>
							<div class="comment_text">
								<span>유익해요!</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- post list end-->
	</div>
	<!-- feed section end -->

	<!-- widget section Start -->
	<div class="widgets">
		<div class="widgets_product_Container">
			<div class="widgets_header">
				<h2>친환경 상품</h2>
			</div>
			<!-- Slider main container -->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<div class="product">
							<a href="https://cueclyp.com/product/C214WAUP02ZZF-725"> <img
								src="./img/image_1680053440516_1000-removebg-preview.png" alt="">
							</a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="product">
							<a
								href="https://www.neogift.kr/front/f_goods/f_Goods_Detail.asp?g_code=56928&cat_1=K&cat_2=468">
								<img src="./img/제목 없음-1.png" alt="">
							</a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="product">
							<a href="https://cueclyp.com/product/C232CAUP02ZZF-17"> <img
								src="./img/image_1678424977558_2500-removebg-preview.png" alt="">
							</a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="product">
							<a href="https://cueclyp.com/product/C214TTUP02ZZF"> <img
								src="./img/image_1619527405937_2500-removebg-preview.png" alt="">
							</a>
						</div>
					</div>
					<div class="swiper-slide">
						<div class="product">
							<a href="https://cueclyp.com/product/C228BPRE01BKF"> <img
								src="./img/image_1662602533288_2500-removebg-preview.png" alt="">
							</a>
						</div>
					</div>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>

		<div class="widgets_weather_Container">
			<div class="widgets_header">
				<h2>날씨</h2>
			</div>
			<div class="weather_card">
				<div class="error">
					<p>위치정보를 찾을 수 없습니다.</p>
				</div>
				<div class="weather">
					<img src="./img/icon/1530391_clouds_sun_sunny_weather.png"
						class="weather-icon">
					<h1 class="temp"></h1>
					<h2 class="city_result"></h2>
					<div class="details">
						<div class="col">
							<img
								src="./img/icon/cloud_forecast_rain_humidity_weather_icon_228446.png"
								alt="">
							<div class="col_text">
								<p class="humidity"></p>
								<p>습도</p>
							</div>
							<div class="col">
								<img src="./img/icon/wind_icon-icons.com_64274.png" alt="">
								<div class="col_text">
									<p class="windy_speed"></p>
									<p>풍속</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- widget section end -->
		<section>
			<div id='wrap'>
				<footer>
					<nav>
						<a href='#' target='_blank'>Blog</a> | <a
							href='https://github.com/2021-SMHRD-KDT-BigData-17/jubging'
							target='_blank'>Github</a>
					</nav>
					<p>
						<span>팀 : 떡잎방범대</span><br /> <span>이메일 : leaf0000@gmail.com</span><br />
						<span> &copy; 2023 Jubging. All Rights Reserved.</span>
					</p>
				</footer>
			</div>
		</section>

		<!-- map popup section Start -->
		<div class="popup">
			<header>
				<div class="close">
					<i class="fa-solid fa-xmark"></i>
				</div>
			</header>
			<div class="modal_content">
				<div class="map" style="width: 380px; height: 280px;"></div>
			</div>
		</div>

		<div class="popup_map">
			<header>
				<div class="close">
					<i class="fa-solid fa-xmark"></i>
				</div>
			</header>
			<div class="modal_content">
				<div class="map" style="width: 380px; height: 280px;"></div>
			</div>
		</div>

		<!-- popup section end -->

		<!-- js file section -->
		<script
			src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=cc62bb43e9feeb15374bcc3b80292f46"></script>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script src="https://kit.fontawesome.com/369266d994.js"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>







		<script>

  //사이드 바 안의 로그아웃 메뉴
function dropdown() {
    var dropdownContent = document.getElementById("dropdown-content");
    dropdownContent.classList.toggle("show");
  }
  
  
  
  function logout() {
    var dropdownContent = document.getElementById("dropdown-content");
    dropdownContent.classList.remove("show");
    // '로그아웃' 삭제 수행
  }
  

  // 사이드바 링크 활성화 부분//
  const links = document.querySelectorAll('.sidebarOption a');

  const currentUrl = window.location.href;
  
  links.forEach(link => {
    if (link.href === currentUrl) {
      link.classList.add('active');
    } else {
      link.classList.add('default');
    }
  }); 
  
  
  
  
  //태그입력 창 열기
  function dropdown_tage() {
    document.getElementById("tage_dropdown-content").classList.toggle("show_tag");
  }
  const addBtn = document.getElementById("add_postboxTags");
  const tagInput = document.getElementById("tag_input");
  const tagContainer = document.querySelector(".postbox_tag");

  addBtn.addEventListener("click", function() {
    const tagValue = tagInput.value.trim(); // 입력한 값의 앞뒤 공백 제거
    if (tagValue) { // 입력값이 있을 때만 실행
      const tag = document.createElement("span"); // 새로운 span 태그 생성
      tag.textContent = tagValue; // span 태그의 텍스트 콘텐츠에 입력한 값을 할당
      tagContainer.appendChild(tag); // 생성한 span 태그를 tagContainer에 추가
      tagInput.value = ""; // 입력필드 초기화
    }
  });

// 파일 선택 창 열기 및 이미지 프리뷰, 이미지 삭제
document.querySelector('.add-img').addEventListener('click', function() {
    document.querySelector('input[name="c_img"]').click();
});

document.querySelector('input[name="c_img"]').addEventListener('change', function(event) {
    var file = event.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        var img = document.createElement('img');
        img.src = e.target.result;
        document.querySelector('.postbox_image-container').innerHTML = '';
        document.querySelector('.postbox_image-container').appendChild(img);
        
        var icon = document.createElement('i');
        icon.classList.add('fa-solid', 'fa-xmark');
        icon.addEventListener('click', function() {
            document.querySelector('.postbox_image-container').removeChild(img);
            document.querySelector('.postbox_image-container').removeChild(icon);
        });
        
        document.querySelector('.postbox_image-container').appendChild(icon);
    };
    reader.readAsDataURL(file);
});

  //날씨 정보 기능 
  // Geolocation API에 액세스할 수 있는지를 확인
  if (navigator.geolocation) {
    //위치 정보를 얻기
    navigator.geolocation.getCurrentPosition (function(pos) {
        const lat = pos.coords.latitude;     // 위도
        const lon = pos.coords.longitude; // 경도
        
        const apikey='e89bb3afd798d5b46c49698f627bf5eb';
        const apiUrl = 'http://api.openweathermap.org/data/2.5/weather?'
        const weatherIcon =document.querySelector(".weather-icon")
       
        async function getWeather(){
        const response = await fetch(apiUrl+`lat=`+lat+`&lon=`+lon+`&lang=kr&APPID=${apikey}`);
        if(response.status==404){
            document.querySelector(".weather").style.display="none";
            document.querySelector(".error").style.display="block";
        }else{
            var data = await response.json();  
            console.log(data);
        // display weather data on webpage
        
        document.querySelector(".humidity").innerHTML = data.main.humidity+"<span>&nbsp;%</span>";        
        document.querySelector(".windy_speed").innerHTML = data.wind.speed+"<span>&nbsp;km/h</span>";        
        document.querySelector(".city_result").innerHTML = data.name;                
        document.querySelector(".temp").innerHTML = Math.round(Number(data.main.temp) - 273.15)+"<span>&nbsp;°C</span>";        
            
        if(data.weather[0].main=="Clear"){
            weatherIcon.src="./img/icon/1530392_weather_sun_sunny_temperature.png";
        }
        else if(data.weather[0].icon=="01n"){
            weatherIcon.src="./img/icon/1530382_weather_night_moon_moonlight.png";
        }
        else if(data.weather[0].icon=="04n"){
            weatherIcon.src="./img/icon/1530383_moon_weather_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Clouds"){
            weatherIcon.src="./img/icon/1530369_cloudy_weather_clouds_cloud.png";
        }
        else if(data.weather[0].icon=="02d"){
            weatherIcon.src="./img/icon/1530391_clouds_sun_sunny_weather.png";
        }
        else if(data.weather[0].id==500){
            weatherIcon.src="./img/icon/1530390_sunny_rain_cloudy_weather_clouds.png";
        }
        else if(data.weather[0].main=="Rain"){
            weatherIcon.src="./img/icon/1530364_rain_storm_shower_weather.png";
        }
        else if(data.weather[0].main=="Drizzle"){
            weatherIcon.src="./img/icon/1530365_rain_cloud_drizzel_weather.png";
        }
        else if(data.weather[0].main=="Mist"){
            weatherIcon.src="./img/icon/1530368_foggy_weather_fog_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Snow"){
            weatherIcon.src="./img/icon/1530371_winter_snow_clouds_weather.png";
        } 
        document.querySelector(".weather").style.display="block";
        document.querySelector(".error").style.display="none";
  
        }
  
        
    };
        
        getWeather();
        
    });
        
  
  } else {
    alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
  }
  
  // 댓글창 보이기
  function dropdowncommentinput() {
  var dropdown = document.getElementById("commnet_input");
  if (dropdown.style.display === "none") {
    dropdown.style.display = "block";
  } else {
    dropdown.style.display = "none";
  }
}


$(document).ready(function() {
  $(".commentBtn").click(function() {
    // 입력된 댓글 텍스트를 가져옴
    var commentText = $("#commentInput").val();

    // 댓글 텍스트가 비어있는지 체크
    if (commentText === "") {
      alert("댓글을 입력해주세요.");
      return;
    }

    // 현재 날짜와 시간을 가져옴
    var now = new Date();
    var year = now.getFullYear().toString().slice(-2);
    var month = (now.getMonth() + 1).toString().padStart(2, '0');
    var day = now.getDate().toString().padStart(2, '0');
    var hour = now.getHours().toString().padStart(2, '0');
    var minute = now.getMinutes().toString().padStart(2, '0');

    // 날짜와 시간을 표시할 형식을 지정
    var dateFormat = year + "/" + month + "/" + day;
    var timeFormat = hour + ":" + minute;

    // 댓글 정보를 담는 HTML 코드 생성
    var commentHTML = '<div class="dropdown-comment_list">' +
                      '<div class="post_profile">' +
                      '<img src="./img/profile_3.png" alt="">' +
                      '</div>' +
                      '<div class="user_name_time_comment">' +
                      '<h5 name="user_nick">earthlover<p name="user_id">@earthlove_125</p><h6><i class="far fa-clock" name="c_date"></i>' + dateFormat + " " + timeFormat + '</h6></h5>' +
                      '<i class="fa-solid fa-trash-can" id="deletecomment"></i></div>'+
                      '<div class="comment_text">' +
                      '<span>' + commentText + '</span>' +
                      '</div>' +
                      '</div>';

    // #new_comment_list 아이디를 가진 요소에 새로운 댓글 추가
    $("#new_comment_list").append(commentHTML);

    // 입력 필드 초기화
    $("#commentInput").val("");

    // 댓글 수 증가
    var commentCnt = parseInt($("#comment_cnt").text());
    $("#comment_cnt").text(commentCnt + 1);

    // 삭제 버튼 클릭 이벤트 추가
    $("#deletecomment").last().click(function() {
      // 댓글 수 감소
      var commentCnt = parseInt($("#comment_cnt").text());
      $("#comment_cnt").text(commentCnt - 1);
      
      // 가장 가까운 .dropdown-comment_list 요소 삭제
      $(this).closest(".dropdown-comment_list").remove();
    });
  });
});





// 좋아요 색깔 , 숫자
const heartIcons = document.querySelectorAll('.fas.fa-heart');
    const likeCounts = document.querySelectorAll('[name="like_cnt"]');
    let isLiked = [];

    for (let i = 0; i < heartIcons.length; i++) {
    isLiked.push(false); // Initialize all isLiked variables to false
    heartIcons[i].addEventListener('click', function() {
    if (!isLiked[i]) {
        heartIcons[i].style.color = 'red';
        likeCounts[i].textContent = Number(likeCounts[i].textContent) + 1;
        isLiked[i] = true;
      } else {
        heartIcons[i].style.color = 'rgb(0,0,0,0.2)';
        likeCounts[i].textContent = Number(likeCounts[i].textContent) - 1;
        isLiked[i] = false;
      }
      });
    }
;
  
  
   

  //게시물  삭제

function delete_postlist() {
  const dropdownCommentList = document.querySelector('.post_list_box');
  dropdownCommentList.remove();
}

const delete_list = document.querySelector('.fa-trash-can');
delete_list.addEventListener('click', delete_postlist);





//지도 확인 기능
var popup = document.querySelector(".popup");

// Select all the map location icon elements
var mapLocationIcons = document.querySelectorAll(".fa-location-dot");

// Add a click event listener to each map location icon
mapLocationIcons.forEach(function(mapLocationIcon) {
  mapLocationIcon.addEventListener("click", function() {
    // Get the user's current location using geolocation
    navigator.geolocation.getCurrentPosition(function(position) {
      // Toggle the visibility of the popup
      popup.classList.toggle("show");

      // Create the map centered on the user's location
      var mapContainer = popup.querySelector('.map');
      var mapOption = {
        center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
        level: 3,
        mapTypeId : kakao.maps.MapTypeId.ROADMAP
      }; 
      var map = new kakao.maps.Map(mapContainer, mapOption);
      var mapTypeControl = new kakao.maps.MapTypeControl();

      // Add a marker to the map at the user's location
      var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude),
        draggable: true,
        map: map
      });

      // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      // Add a click listener to the popup's close button
      var close = popup.querySelector(".close");
      close.onclick = function() {
        // Remove the popup from the page
        popup.classList.remove("show");

        // Remove the map and marker objects
        marker.setMap(null);
        map = null;
      };
    }, function(error) {
      // Handle geolocation errors
      console.error(error);
      if (popup.classList.contains("show")) {
        popup.classList.remove("show");
      }
      alert("위치 정보를 찾을 수 없습니다.");
    });
  });
});


//게시물에 있는 지도 확인 부분

var popup_map = document.querySelector(".popup_map");

// Select all the map location icon elements
var mapLocationIcons = document.querySelectorAll(".fa-map-location-dot");

// Add a click event listener to each map location icon
mapLocationIcons.forEach(function(mapLocationIcon) {
  mapLocationIcon.addEventListener("click", function() {
    // Toggle the visibility of the popup
    popup_map.classList.toggle("show");

    // Create the map
    var mapContainer = popup_map.querySelector('.map');
    var mapOption = {
      center: new kakao.maps.LatLng(37.56675, 126.97870), //위도 경도 수정부분
      level: 3,
      mapTypeId : kakao.maps.MapTypeId.ROADMAP
    }; 
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // Add a marker to the map
    var marker = new kakao.maps.Marker({
      position: new kakao.maps.LatLng(37.56675, 126.97870), //마커 생성 위도 경도 수정 부분 
      draggable: true,
      map: map
    });

    // Add a click listener to the popup's close button
    var close = popup_map.querySelector(".close");
    close.onclick = function() {
      // Remove the popup from the page
      popup_map.classList.remove("show");

      // Remove the map and marker objects
      marker.setMap(null);
      map = null;
    };
  });
});



// 상품 소개 슬라이더
var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 4000,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    
//게시글 생성과 글 및 태그 이미지 반영 부분
var postBoxBtn = document.querySelector('.postbox_btn');

// Get the postbox_tag element
var postboxTag = document.querySelector('.postbox_tag');
// Get the postbox_image-container element
var postboximg = document.querySelector('.postbox_image-container');
// Get the tags_output element
var tagsOutput = document.querySelector('.tags_output');
// Get the img_post_bx element
var imgOutput = document.querySelector('.img_post_bx');
// Add a click event listener to the button
postBoxBtn.addEventListener('click', function() {

    // Get the post_list element
    var postList = document.querySelector('.post_list');

  // Create a new post_list_box element
  var newPostListBox = document.createElement('div');
  newPostListBox.className = 'post_list_box';

  // Get the value of the textarea
  var postContent = document.getElementById('contentInput').value;
  document.getElementById('contentInput').value = '';
  var postTags = postboxTag.innerHTML;
  postboxTag.innerHTML=" ";
  var postimg = postboximg.innerHTML;
  postboximg.innerHTML=" ";
  postimg = postimg.replace('<i class="fa-solid fa-xmark"></i>', '');

  // Get the current date and time
var now = new Date();

// Format the date and time as a string
var dateString = now.toLocaleDateString();
var timeString = now.toLocaleTimeString();
  // Add content to the new post_list_box element
  newPostListBox.innerHTML = `
  <div class="content">
          <div class="post_profile" style="float: left;">
            <img src="./img/icon/profile_img.png" alt="">
          </div>
          <div class="user_name_time">
            <h5 name="user_nick">
              smhrd
              <p name="user_id">@smhrd_12345</p>
            </h5>
            <h6><i class="far fa-clock" name="c_date"></i>${dateString} ${timeString}</h6>
            <i class="fa-solid fa-trash-can" onclick="delete_postlist()"></i>
          </div>
          <div class="content_text" name="post-content">
            ${postContent}
          </div>
          <div class="tags_output">
            <span>${postTags}</span>
          </div>
          <div class="img_post_bx_post">
            <span>${postimg}<span>
          </div>
          <div class="post_card_social_data">
            <div class="post_social_card">
              <i class="fas fa-comment"  onclick="dropdowncommentinput()"></i>
              <span name="comment_cnt">0</span><!-- 댓글 수-->
            </div>
            <div class="post_social_card"">
              <i class="fas fa-heart"></i>
              <span name="like_cnt">0</span>
            </div>
            <div class="post_social_card">
              <i class="fa-solid fa-map-location-dot"></i>
            </div>
          </div>
          <div class="dropdown-comment">
            
              <input type="text" name="commentInput">
              <button class="commentBtn">댓글입력</button>
            
          </div>
          <div class="comment_list">
            
          </div>
        </div>
  `;

  // Append the new post_list_box element to the post_list element
  postList.appendChild(newPostListBox);
})
</script>
</body>
</html>