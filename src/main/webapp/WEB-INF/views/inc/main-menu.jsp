<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div id="login-overlay" class="auth-overlay">
    <div id="login-container">
        <form method="POST" action="${path}/signup" enctype="multipart/form-data">
            <div class="header">
                <h4>로그인</h4>
                <div class="popup-close">
                    <input type="button" name="exit" id="exit" accept="image/*" style="display: none;">
                    <label for="exit">
                        <img class="exitImage" src="${path}/resources/static/images/close.svg" alt="종료버튼">
                    </label>
                </div>
            </div>

            <div id="signup-containerSon">
                <div class="form-group">
                    <div><label>이메일</label></div>
                    <div class="addon_input">
                        <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" required>
                    </div>
                </div>
                <div class="form-group">
                    <div><label>비밀번호</label></div>
                    <div class="addon_input">
                        <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요." required>
                        <div class="addon">
                            <button type="button" class="eye-button">
                                <img alt="보기" loading="lazy" width="20" height="15" decoding="async"
                                     src="${path}/resources/static/images/eye.svg" style="color: transparent;">
                            </button>
                        </div>
                    </div>
                    <div class="error-message-box">
                        <span class="error-message" id="emailorpassword-confirm-error"></span>
                    </div>
                </div>
            </div>


            <button type="submit" id="login-btn">로그인</button>
            <button type="submit" id="emailsignup-btn">✉️ 이메일 회원가입</button>

            <div class="divider">
                <span> sns 계정으로 간편 로그인 </span>
            </div>

            <div class="logo">
                <button type="button" class="google-button">
                    <img alt="구글" loading="lazy" width="20" height="15" decoding="async"
                         src="${path}/resources/static/images/icon_google.svg" style="color: transparent;">
                </button>
                <button type="button" class="kakao-button">
                    <img alt="카톡" loading="lazy" width="20" height="15" decoding="async"
                         src="${path}/resources/static/images/icon_kakao.svg" style="color: transparent;">
                </button>
                <button type="button" class="naver-button">
                    <img alt="네이버" loading="lazy" width="20" height="15" decoding="async"
                         src="${path}/resources/static/images/icon_naver.svg" style="color: transparent;">
                </button>
            </div>
        </form>
    </div>
</div>

<div id="signup-overlay" class="auth-overlay">
    <div id="signup-container">
        <form method="POST" action="${path}/signup" enctype="multipart/form-data">
            <div class="header">
                <h4>이메일 회원가입</h4>
                <div class="popup-close">
                    <input type="button" name="exit" id="exit" accept="image/*" style="display: none;"
                           onclick='popupClose();'>
                    <label for="exit">
                        <img class="exitImage" src="${path}/resources/static/images/close.svg" alt="종료버튼">
                    </label>
                </div>
            </div>


            <div id="signup-containerSon">
                <div class="form-group">
                    <div class="profile-upload">
                        <input type="file" name="profileImage" id="profileImage" accept="image/*"
                               style="display: none;">
                        <label for="profileImage">
                            <img class="defaultprofile" src="${path}/resources/static/images/default-profile.svg"
                                 alt="기본프로필">
                            <img class="edit_icon" src="${path}/resources/static/images/edit_icon.svg" alt="편집아이콘">
                            <!-- 추가된 편집 아이콘입니당 건들지 마세요. -->
                        </label>
                    </div>
                    <div class="preview-image"></div>
                </div>

                <div class="form-group">
                    <div><label>이메일</label></div>
                    <div class="addon_input">
                        <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요." required>
                    </div>
                    <span class="error-message" id="email-error"></span>
                </div>

                <div class="form-group">
                    <div><label>비밀번호</label></div>
                    <div class="addon_input">
                        <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요." required>
                        <div class="addon">
                            <button type="button" class="eye-button">
                                <img alt="보기" loading="lazy" width="20" height="15" decoding="async"
                                     src="${path}/resources/static/images/eye.svg" style="color: transparent;">
                            </button>
                        </div>
                    </div>
                    <span class="error-message" id="password-error"></span>
                </div>

                <div class="form-group">
                    <div><label>비밀번호 재입력</label></div>
                    <div class="addon_input">
                        <input type="password" id="password-confirm" placeholder="비밀번호를 다시 입력해주세요." required>
                        <div class="addon">
                            <button type="button" class="eye-button">
                                <img alt="보기" loading="lazy" width="20" height="15" decoding="async"
                                     src="${path}/resources/static/images/eye.svg" style="color: transparent;">
                            </button>
                        </div>
                    </div>
                    <span class="error-message" id="password-confirm-error"></span>
                </div>

                <div class="form-group">
                    <div><label>이름</label></div>
                    <div class="addon_input">
                        <input type="text" name="name" id="name" placeholder="이름을 입력해주세요." required>
                    </div>
                    <span class="error-message" id="name-error"></span>
                </div>

                <div class="form-group">
                    <div><label>닉네임</label></div>
                    <div class="addon_input">
                        <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요." required>
                    </div>
                    <span class="error-message" id="nickname-error"></span>
                </div>

                <div class="form-group">
                    <div><label>성별</label></div>
                    <div class="radio-gender">
                        <label class="chk_round">
                            <input type="radio" name="gender" value="M" required>
                            <span class="radio-btn"></span>
                            <span class="label">남자</span>
                        </label>
                        <label class="chk_round">
                            <input type="radio" name="gender" value="F" required>
                            <span class="radio-btn"></span>
                            <span class="label">여자</span>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <div><label>출생년도</label></div>
                    <div class="addon_input">
                        <input type="date" name="birthday" id="birthday" placeholder="출생년도를 선택해주세요." required>
                    </div>
                </div>

                <div class="form-group">
                    <div><label>활동지역</label></div>
                    <div class="addon_input">
                        <select name="locationId" id="locationId" required>
                            <option value="">활동지역을 선택해주세요</option>
                            <c:forEach items="${locations}" var="location">
                                <option value="${location.locationId}">${location.locationName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div><label>소개</label></div>
                    <div class="addon_textarea">
                        <textarea name="intro" maxlength="600" placeholder="자유롭게 소개글을 작성해주세요. (200자 이하)"></textarea>
                    </div>
                </div>

            </div>
            <button type="submit" id="signup-btn">회원가입</button>
        </form>
    </div>
</div>

<header id="main-menu">
    <a href="${path}/home">
        <img class="menu-logo" src="${path}/resources/static/images/logo.svg" alt="로고">
    </a>
    
    <!-- 수정전 -->
    <%--
    <nav>
        <ul>
            <li id="nav-home"><a href="${path}/home">홈</a></li>
            <li id="nav-course"><a href="${path}/course">코스</a></li>
            <li id="nav-community"><a href="${path}/community">커뮤니티</a></li>
            <li id="nav-club"><a href="${path}/club">모임</a></li>
            <li id="nav-mypage"><a href="${path}/mypage">나의 등산</a></li>
            <li class="log-out">로그아웃</li>
            <li class="log-in">로그인</li>
        </ul>
    </nav>
    --%>
    
    <!-- 수정후 -->
    <!-- header 부분 수정 -->
	<nav>
	    <ul>
	        <li id="nav-home"><a href="${path}/home">홈</a></li>
	        <li id="nav-course"><a href="${path}/course">코스</a></li>
	        <li id="nav-community"><a href="${path}/community">커뮤니티</a></li>
	        <li id="nav-club"><a href="${path}/club">모임</a></li>
	        <li id="nav-mypage"><a href="${path}/mypage">나의 등산</a></li>
	        <c:choose>
	            <c:when test="${empty sessionScope.loginMember}">
	                <!-- 비로그인 상태 -->
	                <li class="log-in">로그인</li>
	            </c:when>
	            <c:otherwise>
	                <!-- 로그인 상태 -->
	                <li class="log-out">로그아웃</li>
	            </c:otherwise>
	        </c:choose>
	    </ul>
	</nav>
   
    
</header>


