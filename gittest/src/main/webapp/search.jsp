<%@page import="com.jubging.domain.Community"%>
<%@page import="java.util.List"%>
<%@page import="com.jubging.domain.CommunityDAO2"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.FileOutputStream"%>
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
  <link rel="stylesheet" href="./css/search.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <title>::Jubging:: - Trands</title>

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
        <h2>HOME</h2>
      </a>
    </div>
    <div class="sidebarOption">
      <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
      <a href="./search.jsp">
        <h2>TREND</h2>
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
        <h2>PROFILE</h2>
      </a>
    </div>
    <div class="profile_btn" onclick="dropdown()">
      <div class="user_info"><% 
if(user_id.getUser_img() != null){
	byte[] imageData = Base64.getDecoder().decode(user_id.getUser_img());
	
	// 바이트 배열을 파일로 저장
	String imageFileName = "user_img_" + user_id.getUser_id() + ".jpg";
	String imagePath = request.getServletContext().getRealPath("/img/") + "user_img_" + user_id.getUser_id() + ".jpg"; // 이미지 파일 경로
     FileOutputStream fos = new FileOutputStream(imagePath);
     fos.write(imageData);
     fos.close();
     
     String imageUrl = request.getContextPath() + "/img/user_img_" + user_id.getUser_id() + ".jpg";
	
%>
          <img src="<%= imageUrl %>" alt="" class="user_profile_img" style="width: 55px; height: 55px;">
<%} else{%>
          <img src="./img/icon/profile_img.png" alt="" class="user_profile_img" style="width: 55px; height: 55px;">
<%} %>
        <div class="name">
          <p class="user_nick"><%= user_id.getUser_nick() %></p>
          <p class="user_id">@<%= user_id.getUser_id() %></p>
        </div>
        <div class="user_profile_op">
          <i class="fa-solid fa-angles-down"></i>
        </div>
      </div>
    </div>
    <div class="sidebar_dropdown-content" id="dropdown-content" onclick="logout()">
      <a href="LogoutCon"><p onclick="logout()">로그아웃</p></a>
    </div>
  </div>
  <!-- sidebar section end -->
  <section>
    <div class="profile_header"></div>
    <div class="follow_bx">
      <div class="trend_for_you">
        <nav>
          <h6>Trands for you</h6>
        </nav>
        <div class="trend_bx">
          <div class="rate">
            <li><a href="#">#todayweather <br>
                <p>108 posts</p>
              </a></li>
            <div class="interest">
              <button class="smile"><i class="fas fa-smile"></i> Interested</button>
              <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
            </div>
          </div>
          <div class="rate">
            <li><a href="#">#plogging <br>
                <p>67 posts</p>
              </a></li>
            <div class="interest">
              <button class="smile"><i class="fas fa-smile"></i> Interested</button>
              <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
            </div>
          </div>
          <div class="rate">
            <li><a href="#">#dongcheon<br>
                <p>34 posts</p>
              </a></li>
            <div class="interest">
              <button class="smile"><i class="fas fa-smile"></i> Interested</button>
              <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
            </div>
          </div>
          <div class="rate">
            <li><a href="#">#분리수거 <br>
                <p>27 posts</p>
              </a></li>
            <div class="interest">
              <button class="smile"><i class="fas fa-smile"></i> Interested</button>
              <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
            </div>
          </div>
          <div class="rate">
            <li><a href="#">#떡잎마을 방범대 <br>
                <p>14 posts</p>
              </a></li>
            <div class="interest">
              <button class="smile"><i class="fas fa-smile"></i> Interested</button>
              <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </section>

  <!-- 위젯 -->
  <div class="widgets">

    <div class="widgets_product_Container">
      <div class="widgets_header">
        <h2>친환경 상품</h2>
      </div>   
      <div class="slideshow-container">
        <div class="slide">
          <a href="https://cueclyp.com/product/C214TTUP02ZZF" target="_blank">
            <img src="./img/image_1619527405937_2500-removebg-preview.png">
          </a>
        </div>
        <div class="slide">
          <a href="https://www.neogift.kr/front/f_goods/f_Goods_Detail.asp?g_code=56928&cat_1=K&cat_2=468">
            <img src="./img/제목 없음-1.png">
          </a>
        </div>
        <div class="slide">
          <a href="https://cueclyp.com/product/C228BPRE01BKF" target="_blank">
            <img src="./img/image_1662602533288_2500-removebg-preview.png">
          </a>
        </div>
        <div class="slide">
          <a href="https://cueclyp.com/product/C232CAUP02ZZF-17" target="_blank">
            <img src="./img/image_1678424977558_2500-removebg-preview.png">
          </a>
        </div>
        <div class="slide">
          <a href="https://cueclyp.com/product/C214WAUP02ZZF-725" target="_blank">
            <img src="./img/image_1680053440516_1000-removebg-preview.png">
          </a>
        </div>
      </div>
      <div class="dot-container">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
        <span class="dot" onclick="currentSlide(5)"></span>
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
              <img src="./img/icon/cloud_forecast_rain_humidity_weather_icon_228446.png"
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
  </div>  
  <section>
    <div id='wrap'>
      <footer>
        <nav>
          <a href='#' target='_blank'>Blog</a> |
          <a href='https://github.com/2021-SMHRD-KDT-BigData-17/jubging' target='_blank'>Github</a>
        </nav>
        <p>
          <span>팀 : 떡잎방범대</span><br />
          <span>이메일 : leaf0000@gmail.com</span><br />
          <span> &copy; 2023 Jubging. All Rights Reserved.</span>
        </p>
      </footer>
    </div>
  </section>

  <!-- js file section -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>


<script>
  function dropdown() {
    var dropdownContent = document.getElementById("dropdown-content");
    dropdownContent.classList.toggle("show");
  }
  
  
  
  function logout() {
    var dropdownContent = document.getElementById("dropdown-content");
    dropdownContent.classList.remove("show");
    // '로그아웃' 삭제 수행
  }


//날씨 정보 기능 
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
      //위치 정보를 얻기
      navigator.geolocation.getCurrentPosition(function (pos) {
        const lat = pos.coords.latitude;     // 위도
        const lon = pos.coords.longitude; // 경도

        const apikey = 'e89bb3afd798d5b46c49698f627bf5eb';
        const apiUrl = 'http://api.openweathermap.org/data/2.5/weather?'
        const weatherIcon = document.querySelector(".weather-icon")

        async function getWeather() {
          const response = await fetch(apiUrl + `lat=` + lat + `&lon=` + lon + `&lang=kr&APPID=${apikey}`);
          if (response.status == 404) {
            document.querySelector(".weather").style.display = "none";
            document.querySelector(".error").style.display = "block";
          } else {
            var data = await response.json();
            console.log(data);
            // display weather data on webpage

            document.querySelector(".humidity").innerHTML = data.main.humidity + "<span>&nbsp;%</span>";
            document.querySelector(".windy_speed").innerHTML = data.wind.speed + "<span>&nbsp;km/h</span>";
            document.querySelector(".city_result").innerHTML = data.name;
            document.querySelector(".temp").innerHTML = Math.round(Number(data.main.temp) - 273.15) + "<span>&nbsp;°C</span>";

            if (data.weather[0].main == "Clear") {
              weatherIcon.src = "./img/icon/1530392_weather_sun_sunny_temperature.png";
            }
            else if (data.weather[0].icon == "01n") {
              weatherIcon.src = "./img/icon/1530382_weather_night_moon_moonlight.png";
            }
            else if (data.weather[0].icon == "04n") {
              weatherIcon.src = "./img/icon/1530383_moon_weather_clouds_cloudy.png";
            }
            else if (data.weather[0].main == "Clouds") {
              weatherIcon.src = "./img/icon/1530369_cloudy_weather_clouds_cloud.png";
            }
            else if (data.weather[0].icon == "02d") {
              weatherIcon.src = "./img/icon/1530391_clouds_sun_sunny_weather.png";
            }
            else if (data.weather[0].main == "Rain") {
              weatherIcon.src = "./img/icon/1530364_rain_storm_shower_weather.png";
            }
            else if (data.weather[0].main == "Drizzle") {
              weatherIcon.src = "./img/icon/1530365_rain_cloud_drizzel_weather.png";
            }
            else if (data.weather[0].main == "Mist") {
              weatherIcon.src = "./img/icon/1530368_foggy_weather_fog_clouds_cloudy.png";
            }
            else if (data.weather[0].main == "Snow") {
              weatherIcon.src = "./img/icon/1530371_winter_snow_clouds_weather.png";
            }
            document.querySelector(".weather").style.display = "block";
            document.querySelector(".error").style.display = "none";

          }


        };

        getWeather();

      });


    } else {
      alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
  }



    // 사이드바 활성화 기능

    const links = document.querySelectorAll('.sidebarOption a');

    const currentUrl = window.location.href;

      links.forEach(link => {
        if (link.href === currentUrl) {
          link.classList.add('sidebar_active');
      } else {
          link.classList.add('default');
      }
    });


  var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("slide");
    var dots = document.getElementsByClassName("dot");
    if (n > slides.length) {
        slideIndex = 1;
    }
    if (n < 1) {
        slideIndex = slides.length;
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
    setTimeout(function() {
        showSlides(slideIndex += 1);
    }, 5000); // 3초마다 슬라이드 전환
}


</script>
  
</body>

</html>