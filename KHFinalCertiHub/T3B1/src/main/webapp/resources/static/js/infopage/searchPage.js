// function initInfoPage(contextPath){
//     initSearchPageBar(contextPath);
// }

// function initSearchPageBar(contextPath) {
//     const pagingBar = document.querySelector('.paging-bar');

//     const data = {
//         startPage : 1,
//         endPage : 5,
//         currentPage : 1,
//         pageUrl : 'search?',
//         imgUrl : [
//             contextPath + '/resources/static/img/button/arrow_left.png',
//             contextPath + '/resources/static/img/button/arrow_right.png'
//         ]
//     }
//     createPageBar(pagingBar, data)
// }

// 탭 게시물
$(document).ready(function () {
    $('ul.tabs li').click(function () {
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#" + tab_id).addClass('current');

        // 선택한 카테고리를 hidden input에 설정
        var categoryText = $("#" + tab_id + " li:first-child").text(); // 예시로 첫 번째 항목 가져오기 // css에 child 요소 많이쓰면 유지보수가 힘들어요 - 김동영
        $('#category').val(categoryText);
    });
});

