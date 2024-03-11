<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<body>
	<div class="container">
		<div class="text-center"><h3>게시판 입력화면</h3></div>
		<form id="f_writeForm" class="">
			<div class="mb-3 row">
				<label for="boardName" class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm-10">
					<input type="text" id="boardName" name="boardName" class="form-control" placeholder="작성자"/>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="boardTitle" class="col-sm-2 col-form-label">글제목</label>
				<div class="col-sm-10">
					<input type="text" id="boardTitle" name="boardTitle" class="form-control" placeholder="글제목"/>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="boardContent" class="col-sm-2 col-form-label">글내용</label>
				<div class="col-sm-10">
					<textarea id="boardContent" name="boardContent" class="form-control" rows="8"></textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="boardPasswd" class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" id="boardPasswd" name="boardPasswd" class="form-control" maxlength="16"/>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="file" class="col-sm-2 col-form-label">첨부파일</label>
				<div class="col-sm-10">
					<input type="file" id="file" name="file" class="form-control"/>
				</div>
			</div>
		</form>
		<div class="text-end">
			<button type="button" id="boardInsertBtn" class="btn btn-success">저장</button>
			<button type="button" id="boardCancelBtn" class="btn btn-success">취소</button>
			<button type="button" id="boardListBtn" class="btn btn-success">목록</button>
		</div>
	</div>
	
	<script src="/resources/include/js/writeForm.js"></script>
	<script>
		$(function(){
			let errorMsg = "${errorMsg}";
			if(errorMsg != ""){
				alert(errorMsg);
			}	
		});
	</script>
</body>
