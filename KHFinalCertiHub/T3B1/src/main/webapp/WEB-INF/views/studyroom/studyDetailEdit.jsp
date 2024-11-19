<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서티허브 - 스터디 정보</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/studyroom/mentorDetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/studyroom/studyDetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/studyroom/studyDetailEdit.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/studyroom/studyCreate.css">
    <script src="${pageContext.request.contextPath}/resources/static/js/studyroom/studyDetailEdit.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/common/common.js"></script>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

    <div class="wrapper padding">
        <div class="page-title font-size-title">스터디 정보</div>

        <div class="mentor-page">
            <div class="mentor-card">
                <div class="profile-img small">
                    <img src="<%=contextPath%>${study.studyImg}" class="rounded-circle" alt="Cinque Terre">
                </div>
                <div class="mentor-name font-size-subtitle">${study.managerName}</div>
                <div class="tag bgcolor4 font-size-content"><img src="<%=contextPath%>/resources/static/img/button/manager_icon.png">관리자</div>
                <div class="member-intro font-size-footer">${study.managerIntro}</div>
                <c:choose>
                    <c:when test="${study.studyRecruit eq 'Y'}">
                        <div class="tag valid bgcolor3"><img src="<%=contextPath%>/resources/static/img/button/valid_icon.png">모집중</div>
                        <button class="btn-primary">신청하기</button>
                    </c:when>
                    <c:otherwise>
                        <div class="tag valid bgcolor4"><img src="<%=contextPath%>/resources/static/img/button/stop_icon.png">모집마감</div>
                        <button class="btn-primary" disabled>신청불가</button>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="info-section">
                <div class="mentor-info">
                    <form id="studyForm" action="<%=contextPath%>/study/editStudy" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="studyNo" value="${study.studyNo}">
                        <input type="hidden" name="studyImg" value="${study.studyImg}">
                        <div class="font-size-title">스터디 그룹명</div>
                        <input type="text" class="form-control" name="studyName" value="${study.studyName}" required>

                        <div class="font-size-title">그룹 소개</div>
                        <textarea class="form-control" name="studyInfo">${study.studyInfo}</textarea>

                        <div class="font-size-title">
                            그룹 프로필
                        </div>

                        <div class="group-img">
                            <img id="profile" src="<%=contextPath%>${study.studyImg}" class="rounded-circle" alt="Cinque Terre">
                            <input type="file" name="profileImg" onchange="loadImg(this)">
                        </div>

                        <div class="font-size-title">
                            모집 여부
                        </div>

                        <div class="recruit-option"></div>
                    </form>

                    <div class="font-size-title">참여회원 (7명)</div>

                    <div class="search-member">
                        <div class="search-form">
                            <input type="text">
                            <button class="rounded-circle" onclick="alert('클릭됨')">
                                <img src="<%=contextPath%>/resources/static/img/button/search_icon.png">
                            </button> 
                        </div>
                    </div>

                    <div class="mentor-intro">

                        <div class="member">
                            <div class="member-info">
                                <div class="profile">
                                    <img src="<%=contextPath%>/resources/static/img/profile/profileTest.webp" class="rounded-circle" alt="Cinque Terre">
                                </div>
                                <div class="name font-size-content">
                                    DARKKILLERDK
                                </div>
                            </div>
                            <div>
                                <button class="close-button" data-bs-toggle="modal" data-bs-target="#banConfirm"><img src="<%=contextPath%>/resources/static/img/button/x_icon.png"></button>
                            </div>
                        </div>

                        <div class="member">
                            <div class="member-info">
                                <div class="profile">
                                    <img src="<%=contextPath%>/resources/static/img/profile/profileTest.webp" class="rounded-circle" alt="Cinque Terre">
                                </div>
                                <div class="name font-size-content">
                                    강남구불타는키보드워리어
                                </div>
                            </div>
                            <div>
                                <button class="close-button" data-bs-toggle="modal" data-bs-target="#banConfirm"><img src="<%=contextPath%>/resources/static/img/button/x_icon.png"></button>
                            </div>
                        </div>

                        <div class="member">
                            <div class="member-info">
                                <div class="profile">
                                    <img src="<%=contextPath%>/resources/static/img/profile/profileTest.webp" class="rounded-circle" alt="Cinque Terre">
                                </div>
                                <div class="name font-size-content">
                                    강남구불타는키보드워리어
                                </div>
                            </div>
                            <div>
                                <button class="close-button" data-bs-toggle="modal" data-bs-target="#banConfirm"><img src="<%=contextPath%>/resources/static/img/button/x_icon.png"></button>
                            </div>
                        </div>
                        <div class="member">
                            <div class="member-info">
                                <div class="profile">
                                    <img src="<%=contextPath%>/resources/static/img/profile/profileTest.webp" class="rounded-circle" alt="Cinque Terre">
                                </div>
                                <div class="name font-size-content">
                                    강남구불타는키보드워리어
                                </div>
                            </div>
                            <div>
                                <button class="close-button" data-bs-toggle="modal" data-bs-target="#banConfirm"><img src="<%=contextPath%>/resources/static/img/button/x_icon.png"></button>
                            </div>
                        </div>
                        <div class="member">
                            <div class="member-info">
                                <div class="profile">
                                    <img src="<%=contextPath%>/resources/static/img/profile/profileTest.webp" class="rounded-circle" alt="Cinque Terre">
                                </div>
                                <div class="name font-size-content">
                                    강남구불타는키보드워리어
                                </div>
                            </div>
                            <div>
                                <button class="close-button" data-bs-toggle="modal" data-bs-target="#banConfirm"><img src="<%=contextPath%>/resources/static/img/button/x_icon.png"></button>
                            </div>
                        </div>
                        <div class="member">
                            <div class="member-info">
                                <div class="profile">
                                    <img src="<%=contextPath%>/resources/static/img/profile/profileTest.webp" class="rounded-circle" alt="Cinque Terre">
                                </div>
                                <div class="name font-size-content">
                                    강남구불타는키보드워리어
                                </div>
                            </div>
                            <div>
                                <button class="close-button" data-bs-toggle="modal" data-bs-target="#banConfirm"><img src="<%=contextPath%>/resources/static/img/button/x_icon.png"></button>
                            </div>
                        </div>
                        <div class="member">
                            <div class="member-info">
                                <div class="profile">
                                    <img src="<%=contextPath%>/resources/static/img/profile/profileTest.webp" class="rounded-circle" alt="Cinque Terre">
                                </div>
                                <div class="name font-size-content">
                                    강남구불타는키보드워리어
                                </div>
                            </div>
                            <div>
                                <button class="close-button" data-bs-toggle="modal" data-bs-target="#banConfirm"><img src="<%=contextPath%>/resources/static/img/button/x_icon.png"></button>
                            </div>
                        </div>

                    </div>

                    <div class="load-member">
                        <button>더보기...</button>
                    </div>

                    <div class="button-section">
                        <button class="btn-primary" onclick="location.href='${pageContext.request.contextPath}/study/detail?no=${study.studyNo}'">취소하기</button>
                        <button type="submit"
                            form="studyForm"
                            class="btn-primary bgcolor1"
                            data-bs-toggle="modal" data-bs-target="#apply-modal"
                        >수정하기</button>
                    </div>
                </div>
            </div>

        </div>

        <div class="bottom-options">
            <button onclick="topScroll()" class="top-button rounded-circle"><img src="${pageContext.request.contextPath}/resources/static/img/button/arrow_up_icon.png"></button>
        </div>
    </div>

    <div class="modal" id="banConfirm">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">                
                <img 
                src="<%=contextPath%>/resources/static/img/logo/logo_big.png"
                ">
            </h4>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <div>강남구불타는키보드워리어</div>
                정말 스터디그룹에서 제외시키겠습니까?
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
                <button class="confirm" type="button" data-bs-dismiss="modal">확인</button>
                <button type="button" data-bs-dismiss="modal">취소</button>
            </div>
    
        </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>