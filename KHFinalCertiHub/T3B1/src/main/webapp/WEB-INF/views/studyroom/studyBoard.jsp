<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서티허브 - 스터디 그룹</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/studyroom/studyBoard.css">
    <script src="${pageContext.request.contextPath}/resources/static/js/studyroom/studyBoard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/common/common.js"></script>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    <div class="wrapper padding">
        <div class="page-title font-size-title">스터디 홍보 게시판</div>
        <form class="search-section" action="list">
            <div class="search-form">
                <input type="text" name="keyword">
                <button type="submit" class="rounded-circle">
                    <img src="<%=contextPath%>/resources/static/img/button/search_icon.png">
                </button> 
            </div>
        </form>

        <div class="board-title">
            <div class="page-title font-size-subtitle">
                스터디 모집 & 현황
            </div>
            <div class="search-option">
            </div>
        </div>

        <div class="board-content">
        </div>

        <div class="board-option">
            <c:if test="${loginMember ne null}">
                <c:choose>
                    <c:when test="${isManager eq 'Y'}">
                        <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/study/write'">
                            <img src="${pageContext.request.contextPath}/resources/static/img/button/pencil_icon.png">
                            글쓰기
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-primary" onclick="alert('스터디 그룹 매니저만 글 작성이 가능합니다.')">
                            <img src="${pageContext.request.contextPath}/resources/static/img/button/pencil_icon.png">
                            글쓰기
                        </button>
                    </c:otherwise>
                </c:choose>
            </c:if>
            
            <div class="paging-bar"></div>
        </div>

    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>