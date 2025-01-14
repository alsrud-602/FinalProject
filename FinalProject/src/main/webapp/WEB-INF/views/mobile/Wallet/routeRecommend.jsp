<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?govClientId=&submodules=geocoder"></script>
   
    <title>팝콘</title>
    
     <style>
     
         #map {
            width: 100%;
            height: 500px;
        }
     
     
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
             padding-bottom: 100px; /* 네비게이션 바의 높이만큼 여백 추가 */
    		overflow-y: auto; 
        }
        
		.content-text{       
			text-align:center;
			margin-bottom: 20px;
		}
		
		.contentTitle-text{       
			text-align:center;
			margin-bottom: 40px;
			color: #00FF84;
		}
	
	.button-group{
	text-align: center;
	
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
            font-family:'Pretendard';
            font-weight: 700;        
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
   			justify-content:flex-start;
            padding: 10px;
            margin: 10px 0; 
            border: 2px solid #00FF84;
            border-radius: 5px;
            background-color: #121212;
            color: white;
            position: relative; 
            font-family: 'Pretendard';
            font-weight: 700;
        }

        .remove-btn {
             position: absolute;
              right: 10px;
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
            display:block;
            width: 30px;
            padding: 5px;
            margin: 10px 45%; 
            border-radius: 50%;
            border: 2px solid white;
            background-color: #121212;
            color: white;
            text-align: center; /* 중앙 정렬 */
            font-size: 16px;
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

 /* 반응형 처리 */
    @media (max-width: 768px) {
        .filter-select {
            width: 100px;
        }

        .search-btn {
            width: 100%;
            margin: 10px 0;
        }

        .store-name {
            flex-direction: column;
            align-items: flex-start;
        }

        .store-address-text {
            font-size: 12px;
        }

        .store-list {
            max-width: 100%;
            flex-direction: column;
        }

        /* 버튼 및 요소 크기 조정 */
        .flex-container {
            padding: 0 20px;
            width: 100%;
            max-width: 100%;
        }
    }
    </style>
</head>
<body>

<div class="container">
    <h2 class="contentTitle-text">코스정하기</h2>
    <h2 class="content-text">원하는 팝업 매장 선택하기</h2>

    <div class="button-group">
    <select class="filter-select" id="region-select">
    		<option value="">지역</option>
        <c:forEach var="region" items="${allRegionList}">
            <option value="${region.region_name}">${region.region_name}</option>
        </c:forEach>
    </select>
    
     
        <select class="filter-select" id="popup-select" >
    <option value="" >팝업</option>
    <c:forEach var="entry" items="${storeInfoMap}">
        <c:forEach var="address" items="${entry.value.addresses}">
            <option  value="${address.address}" data-region="${address.address}" name="${entry.value.storeTitle}" 
             data-storeIdx="${address.store_idx}" > ${entry.value.storeTitle} </option>
        </c:forEach>
    </c:forEach>
</select>
    </div>
   
    <div class="flex-container">
        <div class="store-list" ></div>
        <button type="button" class="search-btn" id="search-btn">경로 검색</button>
    </div>


	<!-- 숨긴상태로 위도경도 가져오는 form -->
	<form action="/M.GetCoordinates" method="post" id="address-form">
    <div id="hidden-fields"></div> <!-- 숨겨진 필드 컨테이너 추가 -->
    <button type="submit" style="display:none;">검색</button>
	</form>


    <div class="store-list" class="store-name" id="store-list"></div>                 <!-- 여기에 선택한거 들어옵니다! 7개까지 가능하게 해야함 -->  
	<div class="default-store-name" id="default-store">+</div>
	

</div>

 




<%@include file="/WEB-INF/include/app-navbar.jsp" %>



<script>

let selectedAddresses = []; // 선택된 주소 목록
let selectedNames = []; // 선택된 이름 목록
let isFirstPopupSelected = false; // 첫 번째 팝업이 선택되었는지 여부

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
            
            // 선택된 팝업이 모두 제거되었을 경우 옵션 초기화
            if (storeList.children.length === 0) {
                const popupOptions = document.getElementById("popup-select").options;
                for (let option of popupOptions) {
                    option.style.display = "block";
                }

                // 모든 팝업이 제거되면 지역 칸을 기본값으로 돌려놓기
                const regionSelect = document.getElementById("region-select");
                regionSelect.disabled = false; // 지역 칸을 활성화
                regionSelect.value = ""; // 지역 칸을 기본값으로 돌려놓기
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

        // ** 필터링 로직 추가: 첫 번째 선택된 팝업의 시/군/구로 필터링 ** 
        if (selectedAddresses.length === 1) {
            isFirstPopupSelected = true; // 첫 번째 팝업이 선택됨

            // 지역 필터링을 비활성화
            const regionSelect = document.getElementById("region-select");
            regionSelect.disabled = true;

            const selectedAddressParts = selectedValue.split(' '); // 선택된 주소를 공백으로 분리
            const selectedCity = selectedAddressParts[0]; // 지역
            const selectedDistrict = selectedAddressParts[1]; // 군/구

            // 모든 팝업 옵션 가져오기
            const popupOptions = document.getElementById("popup-select").options;

            for (let option of popupOptions) {
                if (option.value === "" || option.textContent === "지역" || option.textContent === "팝업") continue;

                const addressParts = option.value.split(' '); // 주소를 공백으로 분리
                const city = addressParts[0]; // 지역
                const district = addressParts[1]; // 시/군/구

                const cityPrefix = city.substring(0, 2);
                const selectedCityPrefix = selectedCity.substring(0, 2);

                if (cityPrefix !== selectedCityPrefix || district !== selectedDistrict) {
                    option.style.display = "none";
                } else {
                    option.style.display = "block";
                }
            }
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

    // 팝업 필터 초기화
    const options = popupSelect.getElementsByTagName("option");
    for (let option of options) {
        option.style.display = "block"; // 모든 팝업 옵션을 다시 보이도록 설정
    }

    // "지역"을 선택하면 필터링을 하지 않고 종료
    if (region === "") {
        // 지역이 비어있는 경우 "등록된 스토어가 없습니다" 메시지 제거
        const noResultsOption = document.getElementById("no-results-option");
        if (noResultsOption) {
            popupSelect.removeChild(noResultsOption);
        }
        return; // "지역"을 선택했을 때 필터링을 초기화하고 종료
    }

    // 팝업을 필터링하려면 선택된 지역에 맞는 데이터를 확인해야 함
    const popupOptions = popupSelect.getElementsByTagName("option");

    let noResults = true; // 결과가 없을 경우를 체크하는 변수

    // 모든 옵션을 순회하면서 선택된 지역을 포함하는 주소만 보이도록 설정
    for (let option of popupOptions) {
        const address = option.getAttribute("data-region");  // 옵션의 data-region 값을 가져옴

        // "지역", "팝업" 옵션은 건너뛰기
        if (option.value === "" || option.textContent === "지역" || option.textContent === "팝업") continue;

        // address가 유효한지 먼저 체크
        if (address) {
            // 첫 번째 띄어쓰기 전까지의 부분을 지역으로 사용
            const addressPrefix = address.split(' ')[0];  // 첫 공백 전까지의 값을 가져옴

            // 선택된 지역이 addressPrefix에 포함되는지 확인
            if (region !== "" && addressPrefix.includes(region)) {
                option.style.display = "block";  // 선택된 지역이 포함되면 옵션을 보이도록
                noResults = false;  // 결과가 있으면 noResults를 false로 설정
            } else {
                option.style.display = "none";   // 선택된 지역이 포함되지 않으면 숨기기
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

document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function() {
        document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
        this.classList.add('active');
    });
});

</script>


</body>
</html>




