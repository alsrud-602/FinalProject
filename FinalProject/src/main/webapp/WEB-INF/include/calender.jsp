<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.no-drag {
    -ms-user-select: none;
    -moz-user-select: -moz-none; 
    -webkit-user-select: none; 
    -khtml-user-select: none; 
    user-select:none;
}

#calendar {
    width: 300px;
    text-align: center;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

#calendar thead {
    font-size: 16px;
    font-weight: 700;
    text-align: center;
}

#calendar td {
    text-align: center;
}

#calendar tbody td {
    width: 40px; /* 셀 너비 조정 */
    height: 40px; /* 셀 높이 조정 */
    padding: 5px;
    font-size: 14px; /* 글자 크기 조정 */
    font-weight: 400;
    color: #333; /* 기본 글자 색상 */
    transition: background-color 0.3s; /* 배경색 변화 시 애니메이션 */
}

#calendar tbody td:hover {
    background-color: #f1f1f1; /* 마우스 오버 시 배경색 변화 */
}

#dateHead {
    font-size: 12px;
    font-weight: 700;
    text-align: center;
}


.color1 { background-color: #ffeb3b; }
.color2 { background-color: #ffccbc; }
.color3 { background-color: #c5e1a5; }
.color4 { background-color: #90caf9; }
.color5 { background-color: #ffe57f; }
.color6 { background-color: #f8bbd0; }


</style>

<div class="no-drag">
    <table id="calendar">
        <thead>
            <tr height="35px">
                <td><label onclick="prev()" style="color: #ccc;"><</label></td>
                <td colspan="5" id="monthTable"></td>
                <td><label onclick="next()" style="color: #ccc;">></label></td>
            </tr>
            <tr id="dateHead">
                <td>일</td>
                <td>월</td>
                <td>화</td>
                <td>수</td>
                <td>목</td>
                <td>금</td>
                <td>토</td>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

<script>

// 달력

 let periodCount = 0; // 기간 수 초기화
let today = new Date();
let final = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

// 윤년 계산
if (today.getFullYear() % 4 === 0 && (today.getFullYear() % 100 !== 0 || today.getFullYear() % 400 === 0)) {
    final = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
}

let selectedStartDate = null;
let selectedEndDate = null;

function prev() {
    today = new Date(today.getFullYear(), today.getMonth() - 1, 1);
    makeArray();
}

function next() {
    today = new Date(today.getFullYear(), today.getMonth() + 1, 1);
    makeArray();
}

function makeArray() {
    let first = new Date(today.getFullYear(), today.getMonth(), 1); // 해당 월의 첫 번째 날
    let startDay = new Date(first);
    startDay.setDate(first.getDate() - first.getDay()); // 해당 월의 첫 번째 날이 포함된 주의 일요일

    let cal = new Array(6).fill(null).map(() => new Array(7).fill("")); // 6주, 7일 초기화
    let day = 1;

    // 날짜 배열 채우기
    for (let week = 0; week < 6; week++) {
        for (let dayOfWeek = 0; dayOfWeek < 7; dayOfWeek++) {
            if (startDay.getMonth() === today.getMonth()) {
                // 현재 월의 날짜
                if (day <= final[today.getMonth()]) {
                    cal[week][dayOfWeek] = { day: day, isCurrentMonth: true }; // 현재 월의 날짜
                    day++;
                } else {
                    cal[week][dayOfWeek] = { day: "", isCurrentMonth: false }; // 빈 칸
                }
            } else if (startDay.getMonth() === today.getMonth() - 1) {
                // 이전 달의 날짜
                cal[week][dayOfWeek] = { day: startDay.getDate(), isCurrentMonth: false }; // 이전 달의 날짜
            } else {
                // 다음 달의 날짜
                cal[week][dayOfWeek] = { day: startDay.getDate(), isCurrentMonth: false }; // 다음 달의 날짜
            }
            startDay.setDate(startDay.getDate() + 1); // 다음 날로 이동
        }
    }

    arrayToTable(cal);
}

function arrayToTable(arr) {
    document.getElementById("monthTable").innerHTML =
        "<span>" + today.getFullYear() + "</span> " +
        "<span style='font-weight:800;'>" + (today.getMonth() < 9 ? "0" + (today.getMonth() + 1) : today.getMonth() + 1) + "</span>";

    let calendar = document.getElementById("calendar").getElementsByTagName("tbody")[0];

    // 기존의 달력 내용 삭제
    while (calendar.rows.length > 0) {
        calendar.deleteRow(0);
    }

    // 새로운 주 추가
    for (let week = 0; week < 6; week++) {
        let row = calendar.insertRow();
        for (let dayOfWeek = 0; dayOfWeek < 7; dayOfWeek++) {
            let cell = row.insertCell();
            const cellData = arr[week][dayOfWeek];

            if (cellData.day !== "") {
                cell.innerHTML = cellData.day;
                // 현재 월의 날짜 강조
                if (cellData.isCurrentMonth) {
                    cell.style.fontWeight = "bold"; // 현재 월의 날짜는 굵게
                } else {
                    cell.style.color = "gray"; // 이전 달과 다음 달의 날짜는 회색으로 표시
                }
            } else {
                cell.innerHTML = ""; // 빈 칸 처리
            }
        }
    }

    // 강조할 날짜 범위 설정
    if (selectedStartDate && selectedEndDate) {
        highlightDates();
    }
}


function updateCalendarHighlight() {
    const startDateInput = document.getElementById(`dateStart`);
    const endDateInput = document.getElementById(`dateEnd`);

    const startDate = new Date(startDateInput.value);
    const endDate = new Date(endDateInput.value);

    // 유효한 날짜인지 체크
    if (isNaN(startDate) || isNaN(endDate) || startDate > endDate) {
        console.log("유효하지 않은 날짜 범위입니다.");
        return;
    }

    selectedStartDate = startDate;
    selectedEndDate = endDate;

    // 날짜 강조
    highlightDates();
}

// 강조할 날짜 범위 설정
function highlightDates() {
    const calendarCells = document.querySelectorAll("#calendar tbody td");

    // 모든 셀의 배경색 초기화
    calendarCells.forEach(cell => {
        cell.style.backgroundColor = ""; // 초기화
    });

    const startDay = selectedStartDate.getDate();
    const endDay = selectedEndDate.getDate();
    const startMonth = selectedStartDate.getMonth();
    const endMonth = selectedEndDate.getMonth();
    const currentYear = today.getFullYear();

    // 같은 월인 경우
    if (startMonth === endMonth) {
        calendarCells.forEach(cell => {
            const day = parseInt(cell.innerHTML, 10);
            const cellDate = new Date(currentYear, startMonth, day);

            // 강조할 날짜가 현재 월에 속하는지 확인
            if (day >= startDay && day <= endDay && cell.style.color !== "gray" 
                && selectedStartDate.getMonth() === today.getMonth()) {
                cell.style.backgroundColor = "#ffeb3b"; // 강조 색상
            }
        });
    } else {
        // 서로 다른 월인 경우
        calendarCells.forEach(cell => {
            const day = parseInt(cell.innerHTML, 10);
            const cellDate = new Date(currentYear, today.getMonth(), day);

            // 시작일 강조
            if ((cell.style.color === "gray" && day === startDay && selectedStartDate.getMonth() === today.getMonth() - 1) || 
                (cell.style.color !== "gray" && day === startDay && selectedStartDate.getMonth() === today.getMonth())) {
                cell.style.backgroundColor = "#ffeb3b"; // 시작일 강조 색상
            }
            // 종료일 강조
            if (cell.style.color !== "gray" && day === endDay 
                && selectedEndDate.getMonth() === today.getMonth() + 1) {
                cell.style.backgroundColor = "#ffeb3b"; // 종료일 강조 색상
            }

            // 선택한 기간에 포함된 날짜 강조 (이전 달의 회색 날짜)
            if (cell.style.color === "gray" && cellDate >= selectedStartDate && cellDate <= selectedEndDate && selectedStartDate.getMonth() === today.getMonth() - 1) {
                cell.style.backgroundColor = "#ffeb3b"; // 이전 달의 회색 날짜 강조
            }

            // 선택한 기간에 포함된 날짜 강조 (다음 달의 회색 날짜)
            if (cell.style.color === "gray" && cellDate >= selectedStartDate && cellDate <= selectedEndDate && selectedEndDate.getMonth() === today.getMonth() + 1) {
                cell.style.backgroundColor = "#ffeb3b"; // 다음 달의 회색 날짜 강조
            }

            // 선택한 기간에 포함된 날짜 강조 (회색도 포함)
            if (cell.style.color !== "gray" && cellDate >= selectedStartDate && cellDate <= selectedEndDate) {
                cell.style.backgroundColor = "#ffeb3b"; // 강조 색상
            }
        });
    }
}

 //날짜 범위를 강조하는 함수
function updateCalendarHighlights(${uniqueId}) {
    const calendarCells = document.querySelectorAll("#calendar tbody td");

    // 모든 셀의 배경색 초기화
    calendarCells.forEach(cell => {
        cell.style.backgroundColor = ""; // 초기화
    });

    // periodCount를 사용하여 각 기간을 처리
    for (let i = 0; i < periodCount; i++) {
        const startDateInput = document.getElementById(`dateStart-${i}`);
        const endDateInput = document.getElementById(`dateEnd-${i}`);

        const startDate = new Date(startDateInput.value);
        const endDate = new Date(endDateInput.value);

        // 유효한 날짜인지 체크
        if (isNaN(startDate) || isNaN(endDate) || startDate > endDate) {
            console.log("유효하지 않은 날짜 범위입니다.");
            continue; // 잘못된 날짜 범위는 건너뜀
        }

        // 캘린더에서 날짜 강조
        calendarCells.forEach(cell => {
            const day = parseInt(cell.innerHTML, 10);
            const cellDate = new Date(today.getFullYear(), today.getMonth(), day);

            // 강조할 날짜 범위 확인
            if (cellDate >= startDate && cellDate <= endDate && cell.style.color !== "gray") {
                cell.style.backgroundColor = colors[i % colors.length]; // 색상 배열에서 순환
            }
        });
    }
} 

// 페이지 로드 시 달력 초기화
window.onload = function() {
    makeArray();
}


</script>
