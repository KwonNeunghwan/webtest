<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>설문 작성</title>
<script>
	let i = 1;
	let num = 0;
	function addItem() {

		if (i > 9)
			return;
		i++;
		let sp = document.createElement('span');
		sp.className = "input-group-text";
		sp.innerText = i;
		let ele = document.createElement('input');
		ele.type = 'text';
		ele.className = "form-control";
		ele.name = "items";
		ele.id = `item${i}`;
		let items = document.getElementById('items-div');
		let dive = document.createElement('div');
		dive.className = "input-group";
		dive.appendChild(sp);
		dive.appendChild(ele);
		items.appendChild(dive);

	}

	function checkp(f) {
		if (f.question.value.length == 0) {
			alert('설문을 입력하세요');
			f.question.focus();
			return false;
		}
		if (f.sdate.value.length == 0) {
			alert('시작날짜를 선택하세요');
			f.sdate.focus();
			return false;
		}
		if (f.edate.value.length == 0) {
			alert('종료날짜를 선택하세요');
			f.edate.focus();
			return false;
		}

		if (document.querySelector('#item1').value.length == 0) {
			alert('첫번째 항목을 입력하세요');
			document.querySelector('#item1').focus();
			return false;
		}

		if (document.querySelector('#items-div').childElementCount < 1) {
			alert('항목을 1개이상 입력하세요');
			return false;
		}

	}
</script>

</head>
<body>

	
		<h2>설문작성</h2>
		<form action="./createProc.jsp" method="post"
			onsubmit='return checkp(this)'>
			<div class="mb-3 mt-3">
				<label for="question">설문:</label> <input type="text"
					class="form-control" id="question" placeholder="Enter"
					name="question">
			</div>
			<div class="mb-3">
				<span class="">항목들 :</span>
				<div class="input-group mb-3">
					<span class="input-group-text">1</span> <input type="text"
						class="form-control" name="items" id="items">
					<button type="button" class="btn btn-light" onclick="addItem()">add</button>
				</div>
				<div id="items-div"></div>
			</div>

			<!-- 시작일, 종료일, 복수 투표 -->
			<div class="input-group mb-3">
				<span class="input-group-text">시작일 :</span> <input type="date"
					class="form-control" name="sdate" id="sdate">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">종료일 :</span> <input type="date"
					class="form-control" name="edate" id="edate">
			</div>

			<div class="input-group mb-3">
				<span class="input-group-text">복수투표 :</span>
				<div class="form-check">
					<input type="radio" class="form-check-input m-2 mb-1" id="radio1"
						name="type" value="1" checked> <label
						class="form-check-label" for="radio1">yes</label>
				</div>
				<div class="form-check">
					<input type="radio" class="form-check-input m-2 mb-1" id="radio2"
						name="type" value="0"> <label class="form-check-label"
						for="radio2">no</label>
				</div>
			</div>

			<div class="m-3">
				<button class="btn btn-primary">submit</button>
				<a class="btn btn-outline-dark" href="#scvtion1">설문 목록</a>
			</div>

		</form>

</body>
</html>
