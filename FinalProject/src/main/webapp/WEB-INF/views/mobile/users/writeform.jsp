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
  max-width: 90%;
  max-height: 90%;
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

<form action="/Mobile/Users/Write" method="post" enctype="multipart/form-data">
              <input type="hidden" name="user_idx" value="${user.userIdx}">
              <input type="hidden" name="store_idx" value="${storedetail.store_idx}">
    <div class="container">
     <main>
            <div class="header">
               <span onclick="backPage()">←</span> &nbsp;&nbsp;
               <h3 style="margin: 0;">${storedetail.title}</h3>
            </div>
            <div class="content">
                <p style="color: #00FF84; font-size: 20px; margin-bottom: 10px;">리뷰쓰기</p>
                <p >평점</p>
                  <input type="hidden" id="score" name="score" value="">
                  <div id="star-container" style="margin-bottom: 5px; margin-left:20px; ">
                     <span class="star" data-index="1"></span>
                     <span class="star" data-index="2"></span>
                     <span class="star" data-index="3"></span>
                     <span class="star" data-index="4"></span>
                     <span class="star" data-index="5"></span>
                 </div>
                <p>내용</p>
                  <div class="section-content2">
                   <textarea id="content" name="content" placeholder="내용을 입력하세요..."></textarea>
                  </div>
            
                 <div class="section-img" id="imageinsertbox" >
                    <div class="InserButton" id="imageinsertbutton">
                       <p>
                        <span class="material-symbols-outlined" style="font-size: 20px;">photo_library</span>
                        사진 첨부하기
                        </p>
                     </div>
                   <input id="file-input" name="upfile" type="file" accept=".jpg, .jpeg, .png" style="display: none;" multiple />
                </div>
            
           <div id="file-name-container" style="display: none;"></div>
            
            <div id="preview-container" style="display: flex; flex-wrap: wrap; gap:5px; "></div>
            <button type="submit" class="submit-btn" style="margin-top: 10px;">완료</button>
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
const ratingInput = document.getElementById('score');

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
const fileNameContainer = document.getElementById('file-name-container');
imageInsertButton.addEventListener('click', () => {
    fileInput.click();
});


let fileList = []; 

//파일 선택 및 미리보기, 이름 표시, 삭제 등을 하나의 함수로 합침
fileInput.addEventListener('change', function() {
    const newFiles = Array.from(this.files);
    fileList = fileList.concat(newFiles);
    displayFiles();  // 파일 목록과 미리보기를 한번에 표시
    updateFileInput();  // 폼 데이터 업데이트
});

function displayFiles() {
    // 파일 이름 표시
    fileNameContainer.innerHTML = '';
    previewContainer.innerHTML = '';  // 미리보기 초기화

    fileList.forEach((file, index) => {
        // 파일 이름 표시
        const fileItem = document.createElement('div');
        fileItem.className = 'file-item';
        const fileNameSpan = document.createElement('span');
        fileNameSpan.textContent = file.name;
        const deleteButton = document.createElement('span');
        deleteButton.textContent = 'x';
        deleteButton.className = 'delete-button';

        deleteButton.addEventListener('click', function() {
            fileList.splice(index, 1);  // 배열에서 파일 삭제
            displayFiles();  // 화면 업데이트
            updateFileInput();  // 파일 입력 업데이트
        });

        fileItem.appendChild(fileNameSpan);
        fileItem.appendChild(deleteButton);
        fileNameContainer.appendChild(fileItem);

        const reader = new FileReader();
        reader.onload = function (e) {
            // 이미지와 x 버튼을 감싸는 div 생성
            const imageWrapper = document.createElement('div');
            imageWrapper.className = 'image-wrapper';

            // 이미지 미리보기 추가
            const img = document.createElement('img');
            img.src = e.target.result;
            img.classList.add('preview-img');
            img.addEventListener('click', function() {
                openImagePopup(e.target.result);  // 클릭 시 팝업
            });

            // x 버튼 추가
            const removeButton = document.createElement('button');
            removeButton.className = 'remove-btn';  // x 버튼 스타일
            removeButton.textContent = 'x';

            // 삭제 버튼 클릭 시 해당 이미지 삭제
            removeButton.addEventListener('click', function() {
                fileList.splice(index, 1);  // 배열에서 파일 삭제
                displayFiles();  // 화면 업데이트
                updateFileInput();  // 파일 입력 업데이트
            });

            // 이미지와 x 버튼을 감싸는 div에 이미지와 삭제 버튼 추가
            imageWrapper.appendChild(img);
            imageWrapper.appendChild(removeButton);
            previewContainer.appendChild(imageWrapper);
        };
        reader.readAsDataURL(file);
    });
}



function openImagePopup(imageSrc) {
    // 팝업 오버레이 생성
    const popupOverlay = document.createElement('div');
    popupOverlay.classList.add('popup-overlay');
    
    // 팝업 이미지 생성
    const popupImage = document.createElement('img');
    popupImage.src = imageSrc;
    popupImage.classList.add('popup-image');
    
    // 팝업 오버레이 클릭 시 팝업 닫기
    popupOverlay.addEventListener('click', () => {
        document.body.removeChild(popupOverlay);
    });

    // 팝업 오버레이에 이미지 추가
    popupOverlay.appendChild(popupImage);
    
    // 페이지에 팝업 추가
    document.body.appendChild(popupOverlay);
}





function updateFileInput() {
    const dataTransfer = new DataTransfer();
    fileList.forEach(file => dataTransfer.items.add(file));
    fileInput.files = dataTransfer.files;
}
</script>
</body>
</html>
