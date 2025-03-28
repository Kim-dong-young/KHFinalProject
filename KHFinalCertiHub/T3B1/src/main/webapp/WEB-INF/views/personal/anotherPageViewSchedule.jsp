<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- FullCalendar CSS (CDN) -->
        <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css" rel="stylesheet" />
        <!-- FullCalendar JS (CDN) -->
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
        
        <script src="${pageContext.request.contextPath}/resources/static/js/common/common.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/personal/anotherPageViewSchedule.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/personal/anotherPageViewSchedule.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/personal/commonPersonal.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/personal/anotherPageView.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/personal/personalMakeSc.css">
        <title>Document</title>
    </head>

    <body>
        <%@ include file="../common/header.jsp" %>
            

            <div class="wrapper padding">

                <div id="full-view">
                    <div class="top-view">
                        <div id="member-name" class="font-size-title">
                            
                        </div>
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="category-btn">
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off"
                            >
                            <label class="btn btn-outline-primary" for="btnradio1" onclick="location.href='<%=contextPath%>/personal/view?pno=${pno}'">프로필 정보</label>

                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"
                            checked>
                            <label class="btn btn-outline-primary" for="btnradio2" onclick="location.href='<%=contextPath%>/personal/viewSc?pno=${pno}'">스케줄</label>
                        </div>

                        <nav class="navbar bg-body-tertiary page-title font-size-subtitle" id="certiSelect">
                            <div class="container-fluid">
                                <div class="container-fluid" id="testdiv" data-bs-toggle="collapse"
                                data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                                aria-label="Toggle navigation">
                                    <a class="navbar-brand font-size-title" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#navbarNav" aria-controls="navbarNav">스케줄</a>
                                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                                        aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"><img src="<%=contextPath%>/resources/static/img/button/triangle_down.png" alt=""></span>
                                    </button>
                                </div>
                                
                                <div class="collapse navbar-collapse" id="navbarNav">
                                    <ul class="navbar-nav">
                                        <li class="nav-item">
                                            <a class="nav-link active" aria-current="page" href="<%=contextPath%>/personal/view?pno=${pno}">프로필 정보</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link active" aria-current="page" href="<%=contextPath%>/personal/viewSc?pno=${pno}">스케줄</a>
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <div id="middle-view">
                        <div class="left-view">
                            <div id="calendar">
                                <div id="calendar"></div>
                            </div>
                        </div>
                        <div class="right-view">
                            <div id="today-job-list">
                                <div class="font-size-subtitle">
                                    오늘의 할일
                                </div>
                                <div id="today-job-div-list">

                                </div>

                            </div>
                            <div id="notToday-job-list">
                                <div class="font-size-subtitle">
                                    일정 목록
                                </div>
                                <div id="notToday-job-div-list">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom-view">

                    </div>

                    

                    

                </div>
                
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h1 class="modal-title fs-5 font-size-title" id="exampleModalLabel">일정 생성</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="date-set">
                            <div id="start-date">
                                <input id="start-cal" type="date" required>
                                <input type="time" value="08:00">
                            </div>
                            <div class="font-size-title">
                                ~
                            </div>
                            <div id="end-date">
                                <input id="end-cal" type="date" required>
                                <input type="time" value="19:00">
                            </div>
                        </div>

                        <div id="setting-grid-stuff">
                            <img src="<%=contextPath%>/resources/static/img/personalPage/alarm.png" alt="">
                            <div id="alarm-select" class="custom-select">

                            </div>
                            <img src="<%=contextPath%>/resources/static/img/personalPage/Repeat.png" alt="">
                            <div id="repeat-select" class="custom-select">

                            </div>
                            <div>

                            </div>
                            <div id="repeat-count-select" class="custom-select">

                            </div>
                        </div>

                        <div id="repeat-count-input">
                            반복횟수 : <input type="text">
                        </div>

                        <div id="repeat-date-set">
                            <div id="repeat-start-date">
                                <input id="repeat-start-cal" type="date" required>
                                <input type="time" value="08:00">
                            </div>
                            <div class="font-size-title">
                                ~
                            </div>
                            <div id="repeat-end-date">
                                <input id="repeat-end-cal" type="date" required>
                                <input type="time" value="19:00">
                            </div>
                        </div>

                        
                        
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">일정 저장</button>
                    </div>
                </div>
                </div>
            </div>


            <%@ include file="../common/footer.jsp" %>
                
    </body>

    </html>