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
    width: 350px;
    height:80px;
    text-align:center;
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
    width: 40px;
    height: 40px;
    padding: 5px;
    font-size: 14px;
    font-weight: 400;
    color: #333;
    transition: background-color 0.3s;
}

#calendar tbody td:hover {
    background-color: #f1f1f1;
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

.start-date {
    border-top-left-radius: 50%;
    border-bottom-left-radius: 50%;
}

.end-date {
    border-top-right-radius: 50%;
    border-bottom-right-radius: 50%;
}
</style>

<div class="content" id="periodContainer" style="display: flex; align-items: flex-start;">
    <div class="calendar-container" style="flex: 1;  margin-top: 10px;">
        <div class="no-drag">
            <table id="calendar">
                <thead>
                    <tr height="70px">
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
    </div>

    <div class="sub_content" style="flex: 1; margin-right:10%">
        <div class="sub_day" id="plansContainer">
            <div id="periods">
                <!-- 기간 설정 입력 폼이 여기에 추가됩니다. -->
            </div>
        </div>
    </div>
</div>

<script>
let coloredDays = []; // 색칠된 날짜를 저장할 배열
let today = new Date();
let periods = []; // 선택된 기간을 저장할 배열
let selectedStartDate = null;
let selectedEndDate = null;
let periodCount = 0;

function prev() {
    today = new Date(today.getFullYear(), today.getMonth() - 1, 1);
    makeArray();
}

function next() {
    today = new Date(today.getFullYear(), today.getMonth() + 1, 1);
    makeArray();
}

function makeArray() {
    let firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    let lastDayOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
    let startDay = new Date(firstDayOfMonth);
    startDay.setDate(firstDayOfMonth.getDate() - firstDayOfMonth.getDay());

    let cal = [];
    let week = [];

    while (startDay <= lastDayOfMonth || week.length > 0) {
        week.push({
            day: startDay.getDate(),
            isCurrentMonth: startDay.getMonth() === today.getMonth(),
        });

        if (week.length === 7) {
            cal.push(week);
            week = [];
        }

        startDay.setDate(startDay.getDate() + 1);
    }

    arrayToTable(cal);
}

function arrayToTable(arr) {
    document.getElementById("monthTable").innerHTML =
        "<span>" + today.getFullYear() + "</span> " +
        "<span style='font-weight:800;'>" + (today.getMonth() < 9 ? "0" + (today.getMonth() + 1) : today.getMonth() + 1) + "</span>";

    let calendar = document.getElementById("calendar").getElementsByTagName("tbody")[0];
    while (calendar.rows.length > 0) {
        calendar.deleteRow(0);
    }

    for (let week = 0; week < 5; week++) {
        let row = calendar.insertRow();
        for (let dayOfWeek = 0; dayOfWeek < 7; dayOfWeek++) {
            let cell = row.insertCell();
            const cellData = arr[week][dayOfWeek];

            if (cellData.day !== "" && cellData.isCurrentMonth) {
                cell.innerHTML = cellData.day;
                cell.classList.add("clickable");

                // 오늘 이전 날짜는 클릭 불가
                   let currentDate = new Date(today.getFullYear(), today.getMonth(), cellData.day);
                if (currentDate < new Date(new Date().setHours(0, 0, 0, 0))) {
                    cell.classList.remove("clickable");
                    cell.style.color = "gray"; // 비활성화 스타일
                } else {
                    // 유효한 날짜에만 클릭 이벤트 추가
                    cell.addEventListener("click", function () {
                        handleDateClick(cellData.day, cellData.isCurrentMonth, cell);
                    });
                }
            } else {
                cell.innerHTML = "";
            }
        }
    }

    highlightDates(); // 색상 강조 호출
}


function handleDateClick(day, isCurrentMonth, cell) {
    let clickedDate;

    if (isCurrentMonth) {
        clickedDate = new Date(today.getFullYear(), today.getMonth(), day);
    } else if (day < 15) {
        clickedDate = new Date(today.getFullYear(), today.getMonth() + 1, day);
    } else {
        clickedDate = new Date(today.getFullYear(), today.getMonth() - 1, day);
    }

    

 
    // 시작일과 종료일을 설정
    if (!selectedStartDate || (selectedEndDate && clickedDate < selectedStartDate)) {
        selectedStartDate = clickedDate;
        selectedEndDate = null; // 종료일 초기화
    } else if (!selectedEndDate && clickedDate >= selectedStartDate) {
        selectedEndDate = clickedDate;
    } else {
        selectedStartDate = clickedDate;
        selectedEndDate = null; // 종료일 초기화
    }

    // 선택하려는 범위의 셀을 조회
    const cells = document.querySelectorAll("#calendar tbody td");
    let isConflict = false;

    if (selectedStartDate && selectedEndDate) {
        let currentDate = new Date(selectedStartDate);
        while (currentDate <= selectedEndDate) {
            const cell = Array.from(cells).find(c => {
                return parseInt(c.innerHTML) === currentDate.getDate() &&
                       today.getMonth() === currentDate.getMonth() &&
                       today.getFullYear() === currentDate.getFullYear();
            });
            if (cell && cell.style.backgroundColor) {
                isConflict = true; // 충돌 발생
                break;
            }
            currentDate.setDate(currentDate.getDate() + 1);
        }

        if (isConflict) {
            alert("선택한 날짜 범위에 이미 선택된 날짜가 포함되어 있습니다.");
            selectedStartDate = null;
            selectedEndDate = null;
            return;
        }

        periods.push({ start: selectedStartDate, end: selectedEndDate });
        periodCount++;
        addNewPeriodForm();
    }

    highlightDates();
}

function highlightDates() {
    const calendarCells = document.querySelectorAll("#calendar tbody td");
    calendarCells.forEach(cell => {
        cell.style.backgroundColor = "";
        cell.classList.remove("start-date", "end-date"); // 기존 클래스를 제거
    });

    periods.forEach((period, index) => {
        let startDate = period.start;
        let endDate = period.end;

        let currentDate = new Date(startDate);
        while (currentDate <= endDate) {
            const cell = Array.from(calendarCells).find(cell => {
                return parseInt(cell.innerHTML) === currentDate.getDate() &&
                       today.getMonth() === currentDate.getMonth() &&
                       today.getFullYear() === currentDate.getFullYear();
            });
            if (cell) {
                cell.style.backgroundColor = getColorForPeriod(index);

                // 시작점과 도착점에 스타일 추가
                if (currentDate.getTime() === startDate.getTime()) {
                    cell.classList.add("start-date");
                }
                if (currentDate.getTime() === endDate.getTime()) {
                    cell.classList.add("end-date");
                }

                cell.classList.remove("clickable");
            }
            currentDate.setDate(currentDate.getDate() + 1);
        }
    });

    updateColorCircles(); 
}

function getColorForPeriod(periodCount) {
	const colors = [
	    "#90caf9", // 연한 파랑
	    "#ffeb3b", // 밝은 노랑
	    "#ffccbc", // 연한 주황
	    "#c5e1a5", // 연한 초록
	    "#ffe082", // 연한 금색
	    "#81d4fa", // 하늘색
	    "#ffab91", // 연한 복숭아색
	    "#a5d6a7"  // 연한 민트색
	];
    return colors[periodCount % colors.length];
}

function addNewPeriodForm() {
    const periodContainer = document.getElementById('periods');
    const newPeriod = document.createElement('div');
    newPeriod.classList.add('period');
    
    // 현재 기간의 시작일과 종료일에 1일 추가 이유 : 지금 현재 선택한 날짜가 UTC 형식이라 값이  하루씩 적어진다고 함 
    const adjustedStartDate = new Date(selectedStartDate);
    adjustedStartDate.setDate(adjustedStartDate.getDate() + 1);

    const adjustedEndDate = new Date(selectedEndDate);
    adjustedEndDate.setDate(adjustedEndDate.getDate() + 1);
    
    
    // 현재 기간의 시작일과 종료일
    const startDateStr = adjustedStartDate.toISOString().split('T')[0];
    const endDateStr = adjustedEndDate.toISOString().split('T')[0];

    // 현재 기간에 대응하는 색상
    const color = getColorForPeriod(periodCount - 1);

    // 색상 동그라미
    const colorCircle = document.createElement('div');
    colorCircle.style.width = '20px';
    colorCircle.style.height = '20px';
    colorCircle.style.borderRadius = '50%';
    colorCircle.style.backgroundColor = color;
    colorCircle.style.marginRight = '10px';

    // 시작 날짜 입력
    const startDateInput = document.createElement('input');
    startDateInput.type = 'date';
    startDateInput.classList.add('time_start');
    startDateInput.value = startDateStr;
    startDateInput.style.marginRight = '10px';
    startDateInput.style.pointerEvents = 'none'; // 클릭 불가
    
    // 종료 날짜 입력
    const endDateInput = document.createElement('input');
    endDateInput.type = 'date';
    endDateInput.classList.add('time_end');
    endDateInput.value = endDateStr;
    endDateInput.style.marginRight = '10px';
    endDateInput.style.pointerEvents = 'none'; // 클릭 불가
    
    // 플랜 선택
    const planSelect = document.createElement('select');
    planSelect.classList.add('sub_select');
    planSelect.style.marginRight = '10px';
    const option = document.createElement('option');
    option.textContent = '플랜';
    planSelect.appendChild(option);

    // 삭제 버튼
    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'X';
    deleteButton.classList.add('delete-btn');
    deleteButton.style.color = 'red';
    deleteButton.style.border = '1px solid red';
    deleteButton.style.borderRadius = '50%'
    deleteButton.style.background = 'white';
    deleteButton.style.padding = '5px 10px';
    deleteButton.style.cursor = 'pointer';
    deleteButton.onclick = function () {
        removePeriod(deleteButton);
    };

    // 레이아웃 설정
    const subDayContainer = document.createElement('div');
    subDayContainer.classList.add('sub_day');
    subDayContainer.style.display = 'flex';
    subDayContainer.style.alignItems = 'center';
    subDayContainer.style.marginBottom = '10px';

    // 자식 요소 추가
    subDayContainer.appendChild(colorCircle);
    subDayContainer.appendChild(startDateInput);
    subDayContainer.appendChild(endDateInput);
    subDayContainer.appendChild(planSelect);
    subDayContainer.appendChild(deleteButton);

    newPeriod.appendChild(subDayContainer);
    periodContainer.appendChild(newPeriod);
}


function updateColorCircles() {
    const periodElements = document.querySelectorAll('#periods .period');
    periodElements.forEach((periodElement, index) => {
        // 동그라미를 나타내는 요소를 정확히 선택
        const colorCircle = periodElement.querySelector('.sub_day > div:first-child'); // 첫 번째 동그라미
        const color = getColorForPeriod(index); // 새롭게 계산된 색상
        if (colorCircle) {
            colorCircle.style.backgroundColor = color; // 동그라미의 색상만 변경
        }
    });
}

function removePeriod(button) {
    const periodElement = button.closest('.period');
    const periodIndex = Array.from(periodElement.parentElement.children).indexOf(periodElement);
    periods.splice(periodIndex, 1); // 배열에서 해당 기간을 제거
    periodCount--;
    periodElement.remove(); // DOM에서 해당 기간을 제거

    highlightDates(); // 색상 업데이트
}

makeArray();




</script>
