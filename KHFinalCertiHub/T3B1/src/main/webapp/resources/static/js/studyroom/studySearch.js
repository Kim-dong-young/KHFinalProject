function initStudySearch(contextPath){
    initSelectBox(contextPath)
    initStudyList(contextPath)
}

function initSelectBox(contextPath){
    const selectBoxList = document.querySelectorAll('.custom-select');

    const data1 = {
        name : 'recruit',
        default : '전체',
        imgUrl : `${contextPath}/resources/static/img/button/triangle_down.png`,
        items : [
            ['전체',1],
            ['모집중',2],
            ['모집마감',3],
        ]
    } 

    const data2 = {
        name : 'sort',
        default : '최신순',
        imgUrl : `${contextPath}/resources/static/img/button/triangle_down.png`,
        items : [
            ['최신순',1],
            ['인기순(인원수)',2],
        ]
    } 

    createSelectBox(selectBoxList[0], data1)
    createSelectBox(selectBoxList[1], data2)
}


function initStudyList(contextPath){
    // 현재 페이지의 URL 주소
    const url = new URL(window.location.href);
    // URL의 파라미터값을 가진 객체
    const urlParam = url.searchParams;
    const keyword = urlParam.get('keyword')
    const recruit = urlParam.get('recruit')
    const sort = urlParam.get('sort')

    // 스로틀링용 변수
    let timer;

    // 초기값 세팅
    const loadingBar = document.querySelector('.loading-section')
    
    // pageInfo = 객체 리터럴
    let pageInfo = {
        currentPage : 1,
        pageLimit : 10,
        keyword : keyword,
        recruit : recruit,
        sort : sort,
        isEnd : false,
        loadingBar : loadingBar,
        contextPath : contextPath,
    }

    // 콜백 함수
    const onStudyLoad = (data) => {
        if(data){
            createStudyCard(pageInfo.contextPath, data)
            pageInfo.currentPage++
        } else {
            pageInfo.isEnd = true;
        }
        loadingBar.style.display = "none";
    }

    // 매개변수로 초기값 전달
    // pageInfo는 객체이므로 매개변수로 참조값이 전달된다. ( 클로저 )
    const loadStudy = ajaxLoadStudy(pageInfo, onStudyLoad)
    loadStudy(); // 처음 한번 로딩
    // 이후 스크롤 할 때, 화면끝에 도달하면 다시 로딩
    document.onscroll = () => {
        // 우선 scroll 이벤트 함수에 걸린 setTimeout을 초기화 시킨다
        clearTimeout(timer)
        // window.scrollTop : 브라우저의 스크롤영역 맨 윗부분 ~ 스크롤바 사이의 거리, 스크롤바가 맨 위에 있을 경우 값은 0 => 스크롤을 내리면 증가
        // window.height : 브라우저에세 보여지는 부분의 크기 (= 브라우저 창 크기)
        // document.height : 전체 창의 크기( 보여지는 부분의 크기 + 안보이는 부분 )
        /*
            전체 화면(document.height)이 길게 있고, 그 중 우리는 window.height 부분만 본다.
            스크롤바의 크기 = 브라우저에세 보여지는 부분의 크기 = window.height
            즉, scrollTop + window.height가 document.height와 같다면 스크롤이 화면 끝에 도달했음을 의미
        */
        timer = setTimeout( () => {
            if($(window).scrollTop() + $(window).height() > ($(document).height() * 0.95) ){
                if(pageInfo.isEnd !== true) {
                    loadingBar.style.display = "flex";
                    loadStudy();
                } 
            }
        }, 200)
    };
}

function ajaxLoadStudy(pageInfo, callback){
    return function() {
        $.ajax({
            url:"studyList",
            data: {
                "currentPage" : pageInfo.currentPage,
                "pageLimit" :  pageInfo.pageLimit,
                "keyword" : pageInfo.keyword,
                "recruit" : pageInfo.recruit,
                "sort" : pageInfo.sort,
            },
            success: callback,
            error: () => {
                console.log("스터디 목록 불러오기 실패")
            }
        })
    }
}

function createStudyCard(contextPath, res){
    const studyList = document.querySelector('.mentor-list')

    res.forEach(data => {
        let studyCard = document.createElement('div')
        studyCard.className = "mentor-card"
        studyCard.onclick = () => {
            location.href='detail?no=' + data.studyNo
        }
    
        let profile = document.createElement('div')
        profile.className = "profile-img small"
    
        let img = document.createElement("img")
        img.src = contextPath + data.studyImg
        img.className = "rounded-circle"
        
        let studyName = document.createElement("div")
        studyName.className = "mentor-name font-size-subtitle"
        studyName.innerText = data.studyName

        let studyIntro = document.createElement("div")
        studyIntro.className = "member-intro font-size-content"
        studyIntro.innerText = data.managerName

        let studyPop = document.createElement('div')
        studyPop.className = "tag bgcolor3 font-size-content"
        
        let studyPopImg = document.createElement('img')
        studyPopImg.src = contextPath + "/resources/static/img/button/person_icon_light.png"

        studyPop.appendChild(studyPopImg)
        studyPop.innerHTML += converseDigit(data.memberCount)
    
        let tag = document.createElement("div")
        let tagImg = document.createElement("img")
    
        if( data.studyRecruit == "Y"){
            tag.className = "tag valid bgcolor3";
            tagImg.src = contextPath + "/resources/static/img/button/valid_icon.png";
            tag.appendChild(tagImg)
            tag.innerHTML += "모집중"
        } else {
            tag.className = "tag valid bgcolor4";
            tagImg.src = contextPath + "/resources/static/img/button/stop_icon.png";
            tag.appendChild(tagImg)
            tag.innerHTML += "모집마감"
        }
    
        profile.appendChild(img)
    
        studyCard.appendChild(profile)
        studyCard.appendChild(studyName)
        studyCard.appendChild(studyIntro)
        studyCard.appendChild(studyPop)
        studyCard.appendChild(tag)
    
        studyList.appendChild(studyCard)
    });
}