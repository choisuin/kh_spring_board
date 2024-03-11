<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<body>
	<div class="container">
		<div class="text-center">
			<h3>게시판 수정 화면</h3>
		</div>

		<form name="f_data" id="f_data">
			<input type="hidden" name="boardNumber" value="${updateData.boardNumber}" />
			<input type="hidden" id="boardFile" name="boardFile" value="${updateData.boardFile}"/>
			<div class="text-center">
				<table class="table table-boardered">
					<thead>
						<tr>
							<td class="col-3">글번호</td>
							<td>${updateData.boardNumber}(조회수:${updateData.readcnt})</td>
							<td>작성일</td>
							<td>${updateData.boardDate}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">
								<table class="table mb-0">
									<tr>
										<td class="col-3">작성자</td>
										<td class="tesx-start">${updateData.boardName}</td>
									</tr>
									<tr>
										<td>글제목</td>
										<td class="tesx-start">
											<input id="boardTitle" name="boardTitle" class="form-control" type="text" value="${updateData.boardTitle}" />
										</td>
									</tr>
									<tr>
										<td>글내용</td>
										<td class="tesx-start">
											<textarea id="boardContent" name="boardContent" class="form-control" rows="8">${updateData.boardContent}</textarea>
										</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td class="tesx-start">
											<input type="password" id="boardPasswd" name="boardPasswd" class="form-control" placeholder="수정할 비밀번호를 입력해 주세요" />
										</td>
									</tr>
									<tr>
										<td>이미지</td>
										<td class="tesx-start"><input type="file"
											id="file" name="file" class="form-control"/>
										</td>
									</tr>
								</table>
							</td>
					</tbody>
				</table>
			</div>
		</form>

		<div class="text-end">
			<button type="button" id="boardUpdateBtn"
				class="btn btn-success btn-sm">수정</button>
			<button type="button" id="updateCancelBtn"
				class="btn btn-success btn-sm">취소</button>
			<button type="button" id="boardListBtn"
				class="btn btn-success btn-sm">목록</button>
		</div>

	</div>

	<script src="/resources/include/js/updateForm.js"></script>
	<script src="/resources/include/js/writeForm.js"></script>

</body>

