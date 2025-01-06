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

    .leftResult {
    text-align:left;
    white-space: nowrap; /* 텍스트가 한 줄로 표시되도록 */
    overflow: hidden;    /* 넘치는 텍스트는 숨기기 */
    text-overflow: ellipsis; /* 넘치는 텍스트는 "..."으로 표시 */
}

#recent-searches {
	width:600px;
	margin: auto;
    background-color: #121212;
    border-radius: 8px;
}

#recent-searches h3 {
    font-size: 20px;
    margin-bottom: 10px;
}

#search-records-container {
    margin-top: 10px;
}


.store-address-text {
    font-size: 13px;      
    color: gray;      
    display: block;       
    margin-top: 5px;      
    margin-left: 7px;      
    font-weight: normal;  
}

.details-btn{
color : #00FF84;
cursor : pointer;
fontWeight : 700;
fontSize : 16px;
 margin-right:5px;
}


    </style>
</head>
<body>
<%@include file="/WEB-INF/include/header.jsp" %>
<div class="container">
    <h2 class="content-text">원하는 팝업 매장 선택하기</h2>
    <h2 class="content-text">${address.address}</h2>

    <div class="button-group">
        <select class="filter-select" id="region-select">
            <option value=""  >지역</option>
            <option value="서울">서울</option>
            <option value="부산">부산</option>
            <option value="인천">인천</option>
            <option value="대구">대구</option>
        </select>
     
        <select class="filter-select" id="district-select">
        <option value="">군/구</option>
       </select>


        <select class="filter-select" id="popup-select">
    <option value="" >팝업</option>
    
    <!-- 매장 정보 목록을 순회하며 각 매장과 주소를 옵션으로 출력 -->
    <c:forEach var="entry" items="${storeInfoMap}">
        <c:forEach var="address" items="${entry.value.addresses}">
            <option class="leftResult" value="${address.address}" data-region="${address.address}" name="${entry.value.storeTitle}" 
             data-storeIdx="${address.store_idx}"> ${entry.value.storeTitle} </option>
        </c:forEach>
    </c:forEach>
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
        <button type="button" class="search-btn" id="search-btn">경로 검색</button>
    </div>

</div>

 

 <div id="recent-searches">
    <h2 class="content-text">마지막 검색내역</h2>
    <div id="search-records-container">
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
        
        // 이름을 표시할 span
        const nameElement = document.createElement("span");
        nameElement.classList.add("store-name-text");
        nameElement.textContent = selectedName;
        storeNameBox.appendChild(nameElement);

        
        // 주소를 표시할 span
        const addressElement = document.createElement("span");
        addressElement.classList.add("store-address-text");

         // 주소를 분리해서 텍스트로 표시
        const addressParts = selectedValue.split(' ');
        const truncatedAddress = addressParts.slice(0, 2).join(' ');
        addressElement.appendChild(document.createTextNode(truncatedAddress));

        addressElement.textContent = truncatedAddress;
        storeNameBox.appendChild(addressElement);
        
        storeNameBox.style.display = "flex"; 
        storeNameBox.style.justifyContent = "space-between"; 
        
        // 상세보기 버튼 생성
        const detailsBtn = document.createElement("a");
        detailsBtn.textContent = "상세보기";
        detailsBtn.classList.add("details-btn");
        detailsBtn.style.marginLeft = "auto";
        detailsBtn.onclick = function() {
            const selectedOption = document.getElementById("popup-select").options[document.getElementById("popup-select").selectedIndex];
            const storeIdx = selectedOption.getAttribute('data-storeIdx');
            const userId = '${sessionScope.user_id}';  
            const detailsUrl = "/Users/Info?store_idx=" + storeIdx + "&user_id=" + userId;
            
            // 새 창을 열어서 해당 URL로 이동
            window.open(detailsUrl, '_blank');  // 새 창을 열고 크기와 위치 설정
        };
        storeNameBox.appendChild(detailsBtn);
        
        // X 버튼 생성 및 삭제 기능
        const removeBtn = document.createElement("span");
        removeBtn.textContent = "x";
        removeBtn.classList.add("remove-btn");
        removeBtn.style.marginLeft = "10px"; 
        
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
                  optionToEnable.selected = false; 
                
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



document.getElementById('search-btn').addEventListener('click', function () {
    if (selectedAddresses.length > 0) {
        if (selectedAddresses.length === 1) {
            // 하나만 선택되었을 때는 경고 메시지를 띄우고, 검색을 하지 않음
            alert('두 개 이상의 매장을 선택해주세요.');
            return;
        }

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
	
	<script>
	document.getElementById("region-select").addEventListener("change", function() {
	    const region = this.value; // 선택된 지역
	    const popupSelect = document.getElementById("popup-select"); // 팝업 선택

	    // 모든 옵션을 가져옴
	    const options = popupSelect.getElementsByTagName("option");

	    let noResults = true; // 결과가 없을 경우를 체크하는 변수

	    // "지역"을 선택했을 때만 팝업 옵션을 보이도록 설정
	    const popupOption = popupSelect.querySelector("option[value='']");  // "팝업" option을 찾기
	    if (region === "") { // 지역이 "지역"일 때만 팝업 옵션을 보이게
	        if (popupOption) {
	            popupOption.style.display = "block"; // "팝업" option은 보이도록
	        }
	    } else {
	        if (popupOption) {
	            popupOption.style.display = "none"; // 다른 지역을 선택하면 "팝업" 옵션을 숨김
	        }
	    }

	    // 모든 옵션을 순회하면서 선택된 지역을 포함하는 주소만 보이도록 설정
	    for (let option of options) {
	        const address = option.getAttribute("data-region");  // 옵션의 data-region 값을 가져옴

	        // "팝업" 옵션은 건너뛰기
	        if (option === popupOption) continue;

	        // address가 유효한지 먼저 체크
	        if (address) {
	            // 첫 번째 띄어쓰기 전까지의 부분만 추출
	            const addressPrefix = address.split(' ')[0]; // 첫 공백 전까지의 값을 가져옴

	            // 선택된 지역이 addressPrefix에 포함되는지 확인
	            if (region === "" || addressPrefix.includes(region)) {
	                option.style.display = "block";  // 선택된 지역을 포함하는 옵션을 보이도록
	                noResults = false;  // 결과가 있으면 noResults를 false로 설정
	            } else {
	                option.style.display = "none";   // 선택된 지역을 포함하지 않으면 숨기기
	            }
	        }
	    }

	    // 결과가 없으면 "옵션이 없습니다" 메시지를 보이도록 설정
	    const noResultsOption = document.getElementById("no-results-option");
	    if (noResults) {
	        if (!noResultsOption) {
	            const newOption = document.createElement("option");
	            newOption.id = "no-results-option";
	            newOption.disabled = true;
	            newOption.textContent = "등록 스토어가 없습니다";
	            popupSelect.appendChild(newOption);
	        }
	    } else {
	        if (noResultsOption) {
	            popupSelect.removeChild(noResultsOption);
	        }
	    }
	});

	</script>

<script>
document.getElementById("region-select").addEventListener("change", function() {
    const region = this.value; // 선택된 지역
    const districtSelect = document.getElementById("district-select"); // 군/구 선택

    // 군/구 목록을 초기화
    districtSelect.innerHTML = '<option value="">군/구</option>'; // 기본 "군/구" 옵션 추가

    // 각 지역별 군/구 목록을 정의
    const districts = {
        "서울": [
            "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", 
            "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", 
            "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"
        ],
        "부산": [
            "강서구", "금정구", "기장군", "남구", "동래구", "동구", "부산진구", "북구", "사상구", 
            "사하구", "수영구", "연제구", "영도구", "중구", "진구", "하단구"
        ],
        "인천": [
            "강화군", "계양구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "옹진군"
        ],
        "대구": [
            "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"
        ]  
    };

    // 선택된 지역에 맞는 군/구 목록을 가져와서 동적으로 추가
    if (districts[region]) {
        districts[region].forEach(function(district) {
            const option = document.createElement("option");
            option.value = district;
            option.textContent = district;
            districtSelect.appendChild(option); // 군/구를 <select>에 추가
        });
    }
});
</script>


<script>
window.onload = function() {
    var selectedLocations = JSON.parse(localStorage.getItem("selectedLocations"));
    if (selectedLocations && selectedLocations.length > 0) {
        var recordContainer = document.getElementById("search-records-container");

        // 위치 목록을 화면에 표시
        recordContainer.style.display = "flex";
        recordContainer.style.flexWrap = "wrap";  // 여러 항목이 한 줄에 다 들어가지 않으면 줄 바꿈 처리

        selectedLocations.forEach(function(location) {
            var recordItem = document.createElement("div");
            recordItem.classList.add("store-name");
            recordItem.style.display = "flex";
            recordItem.style.alignItems = "center";
            recordItem.style.marginBottom = "10px";
            recordItem.style.marginRight = "10px";  // 항목들 간의 간격을 줌

            var locationText = document.createElement("span");
            locationText.textContent = location;
            locationText.style.marginRight = "10px";

            recordItem.appendChild(locationText);
            recordContainer.appendChild(recordItem);
        });
    } else {
        console.log("선택된 위치 기록이 없습니다.");
    }
};
</script>




</body>
</html>




