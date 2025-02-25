function initMentorDetail(contextPath, isLogin){
    initLikeButton(contextPath, isLogin)
    initApplyButton(isLogin)
}

function initLikeButton(contextPath, isLogin){
    // 현재 페이지의 URL 주소
    const url = new URL(window.location.href);
    // URL의 파라미터값을 가진 객체
    const urlParam = url.searchParams;
    const mentorNo = urlParam.get('no')

    const likeTag = document.querySelector('#likeTag')

    // 쓰로틀링용 변수
    let timer = 0;

    // 초기값 설정
    let likeInfo = {
        mentorNo : mentorNo,
        likeTag : likeTag,
        contextPath : contextPath
    }

    const onLikeMentor = (res) => {
        likeTag.innerHTML = ""
        let likeTagImg = document.createElement("img")

        // res.type = 좋아요를 눌렀는지 여부
        if(res.type == 'Y'){
            likeTag.className = "tag bgcolor4"
            likeTagImg.src = contextPath + "/resources/static/img/profile/full_heart.png"
        } else {
            likeTag.className = "tag bgcolor3"
            likeTagImg.src = contextPath + "/resources/static/img/profile/heart.png"
        }

        likeTag.appendChild(likeTagImg)
        likeTag.innerHTML += res.likeCount
    }

    // 페이지 첫 로딩 시 좋아요 정보 불러오기
    ajaxInitLike(likeInfo, onLikeMentor);

    // 좋아요 버튼 클릭 시 좋아요 처리
    let likeMentor = ajaxLikeMentor(likeInfo, onLikeMentor)

    if(isLogin == 'Y'){
        likeTag.onclick = () => {
            if(timer){ // 아직 수행되지 않았다면 return
                return;
            }
    
            likeMentor() // ajax 수행후 이벤트 제거
            likeMentor = null;
    
            timer = setTimeout(()=>{ // 1초뒤 이벤트 다시 부여
                likeMentor = ajaxLikeMentor(likeInfo, onLikeMentor)
                timer = 0
            },1000)
        }
    }
}

function initApplyButton(isLogin){
    // 현재 페이지의 URL 주소
    const url = new URL(window.location.href);
    // URL의 파라미터값을 가진 객체
    const urlParam = url.searchParams;
    const mentorNo = urlParam.get('no')

    // 모달 요소를 가져오기
    const modal = new bootstrap.Modal(document.getElementById('apply-modal'));
    const applyButton = document.querySelector('#applyButton')

    const onApplyMentee = (res) => {
        if(res.success == 'Y'){
            modal.show();
            applyButton.className += ' applied'
            applyButton.disabled = true
            applyButton.innerText = '신청완료'
        } else if(res.success == 'E') {
            alert('이미 신청하셨습니다.');
        } else {
            alert('멘티 신청에 실패하였습니다...')
        }
    }

    if(isLogin == 'Y'){
        applyButton.onclick = () => {
            ajaxApplyMentee(mentorNo, onApplyMentee)
        }
    } else if(isLogin == 'E'){
        applyButton.onclick = () => {
            alert('본인에게 신청할 수 없습니다.')
        }
    } else {
        applyButton.onclick = () => {
            alert('로그인한 유저만 신청할 수 있습니다.')
        }
    }
}

function ajaxLikeMentor(likeInfo, callback){
    return () => {
        $.ajax({
            type:'post',
            url:'likeMentor',
            data:{
                mentorNo : likeInfo.mentorNo
            },
            success: callback,
            error: () => {
                console.log('멘토 좋아요 실패')
            }
        })
    }
}

function ajaxInitLike(likeInfo, callback){
    $.ajax({
        url:'checkLike',
        data:{
            mentorNo : likeInfo.mentorNo
        },
        success: callback,
        error: () => {
            console.log('좋아요 초기화 실패')
        }
    })
}

function ajaxApplyMentee(mentorNo, callback){
    $.ajax({
        type:'post',
        url:'applyMentee',
        data:{
            mentorNo: mentorNo,
        },
        success: callback,
        error: () => {
            console.log('멘티 신청 요청 실패')
        }
    })
}