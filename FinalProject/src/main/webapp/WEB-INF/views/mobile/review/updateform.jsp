<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>리뷰 작성하기</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=photo_library" />
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Pretendard';
    font-weight: bold;
}
    body {
        margin: 0;
        padding:0;
        background-color: #121212;
        color: #fff;
        font-family: 'Pretendard', sans-serif;
    }
   .header {
   height: 50px;
    display: flex;
    align-items: center;
    padding: 50px 23px;
    background-color: #000;
    color: #fff;
}

.back-button {
    font-size: 24px; /* 작은 화면에서도 잘 보이도록 크기 조정 */
    cursor: pointer;
}

.header-title {
    margin: 0;
    font-size: 24px; /* 기본 폰트 크기 */
    text-align: center; /* 제목 정렬 */
}
    .content {
        margin-top: 0;
        padding: 20px;
    }
    
     .container {
          padding-bottom: 100px; /* 네비게이션 바의 높이만큼 여백 추가 */
        }
        
    .section-content2 {
        padding: 20px;
        line-height: 1.5;
        background-color: #fff;
        border-radius: 10px;
        color: #333; 
    }
    textarea {
        width: 100%;
        height: 80px;
        border: none;
        outline: none;
        resize: none;
        font-size: 16px;
        padding: 10px;
        background-color: inherit;
        color: inherit;
    }
    #imageinsertbox {
        width: 100%;
        height: 80px; 
        text-align: center;
        position: relative;
    }
    .star {
        display: inline-block;
        width: 20px;
        height: 20px;
        margin-right: 5px;
        background: url('/images/icon/star.png') no-repeat center center;
        background-size: contain;
        cursor: pointer;
    }
    .star.selected {
        background: url('/images/icon/star-filled.png') no-repeat center center;
        background-size: contain;
    }
    #preview-container {
        display: flex;
        flex-wrap: wrap;
        width: 100%;
        gap: 10px;
    }
    #preview-container img {
        width: 84px;
        height: 80px;
        object-fit: cover;
        border:1px solid #fff;
        border-radius: 5px;
    }
    .image-wrapper {
    position: relative; /* 부모 요소를 기준으로 자식 요소 위치를 지정 */
}
    
    .remove-btn {
        position: absolute;
        top: 5px;
        right: 5px;
        background-color: rgba(255, 0, 0, 0.8);
        color: white;
        border: none;
        border-radius: 50%;
        width: 20px;
        height: 20px;
        font-size: 16px;
        line-height: 20px;
        cursor: pointer;
    }
    
    #imageinsertbutton {
        position: absolute;
        top: 40%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 20px;
        color: #fff;
        cursor: pointer;
        border: 2px solid #fff;
        border-radius:10px;
        width: 100%;
        height: 40px;
        line-height: 40px;
        background-color: transparent;
    }
    .submit-btn {
        background-color: #00FF84;
        border: none;
        color: #000;
        padding: 12px 25px;
        font-size: 16px;
        border-radius: 10px;
        cursor: pointer;
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    p{
        font-size: 16px;
        margin-bottom:5px;
        }
        
        
          /* 팝업 오버레이 스타일 */
.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.8);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

/* 팝업 이미지 스타일 */
.popup-image {
  max-width: 100%;
  max-height: 100%;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
  cursor: pointer;
  
}

    @media (min-width: 768px) {
        .header {
            padding: 50px 23px;
            font-size: 20px;
        }
      .header-title {
        font-size: 35px; /* 큰 화면에서의 폰트 크기 */
      }
    
        .section-content2 {
            padding: 60px;
        }
        textarea {
            height: 300px;
        }
        #preview-container img {
            width: 200px;
            height: 200px;
        }
        #imageinsertbutton {
            height: 100px;
            line-height: 100px;
        }
        .submit-btn {
            width: 180px;
            height: 100px;
            font-size: 35px;
        }
        
    
    }
</style>
</head>
<body>

<form action="/Mobile/Users/Updateform" method="post" enctype="multipart/form-data">
<div class="container">
    <main>
        <div class="header">
            <span onclick="backPage()">←</span> &nbsp;&nbsp;
            <h3 style="margin: 0;">메시x스텐리 1943 콜라보 팝업스토어</h3>
        </div>
        <div class="content">
            <p style="color: #00FF84; font-size: 20px; margin-bottom: 10px;">리뷰쓰기</p>
            <p >평점</p>
            <input type="hidden" id="rating" name="rating" value="">
            <div id="star-container" style="margin-bottom: 5px; margin-left:20px; ">
                <span class="star" data-index="1"></span>
                <span class="star" data-index="2"></span>
                <span class="star" data-index="3"></span>
                <span class="star" data-index="4"></span>
                <span class="star" data-index="5"></span>
            </div>
            <p>내용</p>
            <div class="section-content2">
                <textarea id="reviewContent" name="reviewContent" placeholder="내용을 입력하세요..."></textarea>
            </div>
            
            <div class="section-img" id="imageinsertbox" >
                <div class="InserButton" id="imageinsertbutton">
                    <p>
                        <span class="material-symbols-outlined" style="font-size: 20px;">photo_library</span>
                        사진 첨부하기
                    </p>
                </div>
                <input type="file" id="file-input"  name="reviewImages" accept="image/*" style="display: none;" multiple>
            </div>
            <div id="preview-container" style="display: flex; flex-wrap: wrap; gap:5px; "></div>
            <button type="submit" class="submit-btn" style="margin-top: 10px;">수정하기</button>
        </div>
    </main>
</div>
</form>

<%@include file="/WEB-INF/include/app-navbar.jsp" %>

<script>
function backPage() {
    window.history.back();    
}

//별점 값 설정
const stars = document.querySelectorAll('.star');
const ratingInput = document.getElementById('rating');

stars.forEach(star => {
    star.addEventListener('click', function () {
        const index = parseInt(this.getAttribute('data-index'));
        stars.forEach(s => s.classList.remove('selected'));
        stars.forEach(s => {
            if (parseInt(s.getAttribute('data-index')) <= index) {
                s.classList.add('selected');
            }
        });
        ratingInput.value = index; 
    });
});

//사진 넣기 + 미리보기
const fileInput = document.getElementById('file-input');
const imageInsertButton = document.getElementById('imageinsertbutton');
const previewContainer = document.getElementById('preview-container');

imageInsertButton.addEventListener('click', () => {
    fileInput.click();
});

fileInput.addEventListener('change', function () {
    const files = Array.from(this.files);
    files.forEach(file => {
        const reader = new FileReader();
        reader.onload = function (e) {
            const img = document.createElement('img');
            img.src = e.target.result;
            const imageWrapper = document.createElement('div');
            imageWrapper.classList.add('image-wrapper');
            const removeButton = document.createElement('button');
            removeButton.classList.add('remove-btn');
            removeButton.textContent = 'x';
            removeButton.addEventListener('click', () => {
                previewContainer.removeChild(imageWrapper);
            });
            img.addEventListener('click', () => {
                openImagePopup(e.target.result);
            });
            imageWrapper.appendChild(img);
            imageWrapper.appendChild(removeButton);
            previewContainer.appendChild(imageWrapper);
        };
        reader.readAsDataURL(file);
    });
    fileInput.value = '';
});

//사진 미리보기(팝업) 기능
function openImagePopup(imageSrc) {
    const popupOverlay = document.createElement('div');
    popupOverlay.classList.add('popup-overlay');
    const popupImage = document.createElement('img');
    popupImage.src = imageSrc;
    popupImage.classList.add('popup-image');
    popupOverlay.addEventListener('click', () => {
        document.body.removeChild(popupOverlay);
    });
    popupOverlay.appendChild(popupImage);
    document.body.appendChild(popupOverlay);
}
</script>

</body>
</html>
