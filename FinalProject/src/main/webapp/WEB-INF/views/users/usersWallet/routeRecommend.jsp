<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?govClientId=&submodules=geocoder"></script>
    <title>팝콘</title>
    
     <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Pretendard", sans-serif;
        }

        li {
            list-style: none;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        body {
            padding-top: 144px;
            background-color: #121212;
            color: #fff;
        }

        .container {
            width: 100%;
            max-width: 600px;
            margin: auto;
            text-align: left;
        }
        
		.content-text{       
			text-align:left;
		}
	

        /* 필터 버튼 */
        .filter-select {
            width: 120px;
            height: 50px;
            border: 2px solid #00FF84;
            border-radius: 5px;
            color: white;
            background-color: #121212;
            text-align: center;
            margin-right: 10px; 
        }

        /* 검색하기 버튼 */
        .search-btn {
            background-color: #00FF84;
            border: none;
            color: #000;
            width: 200px;
            height: 50px;
            font-weight: 700;
            font-family: 'Pretendard', sans-serif;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #33ff33;
        }

        .store-name {
            display: flex;
   			justify-content: space-between;
            padding: 10px;
            margin: 10px 0; 
            border: 2px solid #00FF84;
            border-radius: 5px;
            background-color: #121212;
            color: white;
            position: relative; 
        }

        .remove-btn {
            cursor: pointer;
            color: red;
            margin-right:5px;
            font-size: 16px;
        }

        /* 네모칸과 버튼을 수평으로 정렬하기 위한 스타일 */
        .flex-container {
            display: flex;
            align-items: center;
            margin-top: 20px; /
        }

        .store-list {
            flex-grow: 1; 
        }
        
        /* 기본 네모칸(이해 못할까봐)*/
         .default-store-name {
            display: block;
            padding: 10px;
            margin: 10px 0; 
            border: 2px dashed #00FF84; /* 기본 테두리 스타일 */
            border-radius: 5px;
            background-color: #121212;
            color: white;
            text-align: center; /* 중앙 정렬 */
        }
        
    

    </style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<div class="container">
    <h2 class="content-text">원하는 팝업 매장 선택하기</h2>

    <div class="button-group">
        <select class="filter-select" id="region-select">
            <option value="" disabled selected>지역</option>
            <option value="seoul">서울</option>
            <option value="busan">부산</option>
            <option value="incheon">인천</option>
            <option value="daegu">대구</option>
        </select>

        <select class="filter-select" id="popup-select">
            <option value="" disabled selected>팝업</option>
            <option value="서울 성동구 성수이로 18길 6-1" name="메시 x 스탠리 성수 팝업">메시 x 스탠리 성수 팝업</option>
            <option value="서울 성동구 연무장길 95" name="티르티르 성수 팝업">티르티르 성수 팝업</option>
            <option value="서울 성동구 성수이로 7길 18" name="모푸샌드 팝업스토어">모푸샌드 팝업스토어</option>
        </select>
        
    </div>


	<!-- 숨긴상태로 위도경도 가져오는 form -->
	<form action="/GetCoordinates" method="post" id="address-form">
    <div id="hidden-fields"></div> <!-- 숨겨진 필드 컨테이너 추가 -->
    <button type="submit" style="display:none;">검색</button>
	</form>


	
    <div class="store-list" class="store-name" id="store-list"></div>                 <!-- 여기에 선택한거 들어옵니다! 7개까지 가능하게 해야함 -->  
	<div class="default-store-name" id="default-store">+</div>
	
    <div class="flex-container">
        <div class="store-list" ></div>
        <button type="button" class="search-btn" id="search-btn">검색하기</button>
    </div>

</div>

<%-- <%@include file="/WEB-INF/include/footer.jsp" %> --%>

<script>
let selectedAddresses = []; // 선택된 주소 목록
let selectedNames = []; // 선택된 이름 목록

document.getElementById("popup-select").addEventListener("change", function () {
    const selectedOption = this.options[this.selectedIndex]; // 선택된 option 요소
    const selectedName = selectedOption.getAttribute('name'); // 'name' 속성 값 가져오기
    const selectedValue = this.value;
    const storeList = document.getElementById("store-list");

    // 선택된 값이 있고, 네모칸이 7개 미만인 경우만 실행
    if (selectedValue && storeList.children.length < 7 && !selectedAddresses.includes(selectedValue)) {
        selectedAddresses.push(selectedValue);
        selectedNames.push(selectedName); // 이름을 배열에 추가

        // 네모칸 생성
        const storeNameBox = document.createElement("div");
        storeNameBox.classList.add("store-name");
        storeNameBox.textContent = selectedName; // 선택한 팝업 이름 표시

        // X 버튼 생성 및 삭제 기능
        const removeBtn = document.createElement("span");
        removeBtn.textContent = "x";
        removeBtn.classList.add("remove-btn");

        removeBtn.onclick = function () {
            // 네모칸 삭제
            storeList.removeChild(storeNameBox);

            // 배열에서 선택된 주소 및 이름 삭제
            selectedAddresses = selectedAddresses.filter(address => address !== selectedValue);
            selectedNames = selectedNames.filter(name => name !== selectedName); // 이름도 삭제

            // 선택된 팝업을 다시 활성화
            const optionToEnable = Array.from(document.getElementById("popup-select").options)
                .find(option => option.value === selectedValue);
            if (optionToEnable) {
                optionToEnable.disabled = false;
            }
        };

        // X 버튼 추가
        storeNameBox.appendChild(removeBtn);
        storeList.appendChild(storeNameBox);

        // 숨겨진 필드 추가
        const hiddenFields = document.getElementById("hidden-fields");
        const hiddenInput = document.createElement("input");
        hiddenInput.type = "hidden";
        hiddenInput.name = "address"; // 서버에서 List<String>으로 받을 수 있도록
        hiddenInput.value = selectedValue;
        hiddenFields.appendChild(hiddenInput);

        // 선택된 팝업 비활성화
        const optionToDisable = Array.from(this.options).find(option => option.value === selectedValue);
        if (optionToDisable) {
            optionToDisable.disabled = true;
        }
    } else if (storeList.children.length >= 7) {
        alert("최대 7개까지 선택할 수 있습니다.");
    }
});


// 검색 버튼 클릭 시, 선택된 주소들과 이름들을 숨겨진 필드에 추가 후 폼 제출
document.getElementById('search-btn').addEventListener('click', function () {
    if (selectedAddresses.length > 0) {
        const hiddenFields = document.getElementById('hidden-fields');
        hiddenFields.innerHTML = ""; // 이전 값을 초기화

        // 선택된 주소를 숨겨진 필드로 다시 추가
        selectedAddresses.forEach(address => {
            const hiddenInput = document.createElement("input");
            hiddenInput.type = "hidden";
            hiddenInput.name = "address"; // 서버에서 List<String>으로 받을 수 있도록
            hiddenInput.value = address;
            hiddenFields.appendChild(hiddenInput);
        });

        // 선택된 이름들을 숨겨진 필드로 다시 추가
        selectedNames.forEach(name => {
            const hiddenInput = document.createElement("input");
            hiddenInput.type = "hidden";
            hiddenInput.name = "name"; // 서버에서 List<String>으로 받을 수 있도록
            hiddenInput.value = name;
            hiddenFields.appendChild(hiddenInput);
        });

        // 폼 제출
        document.getElementById('address-form').submit();
    } else {
        alert('주소를 선택해주세요.');
    }
});

    
	</script>

</body>
</html>




