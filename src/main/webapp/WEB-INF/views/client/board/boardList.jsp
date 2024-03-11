<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<body>
	<div class="container">
		<div class="text-center"><h3>게시판</h3></div>
		
		<form id="detailForm">
			<input type="hidden" id="boardNumber" name="boardNumber"/>
		</form>
		
		<div id="boardSearch" class="text-right">
			<form id="f_search" name="f_search">
				<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"/>
				<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}"/>
				<div class="row g-2 align-items-center">
					<div class="col-auto">
						<label for="search">검색조건</label>
					</div>
					<div class="col-auto">
						<select id="search" name="search" class="form-select form-select-sm">
							<option value="all">전체목록조회</option>
							<option value="b_title">글제목</option>
							<option value="b_content">글내용</option>
							<option value="b_name">작성자</option>
						</select>
					</div>
					<div class="col-auto">
						<input type="text"  name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control form-control-sm"/>
					</div>
					<div class="col-auto">
						<button type="button" id="searchData" class="btn btn-success btn-sm">검색</button>
					</div>
				</div>
			</form>
		</div>
		
		<div id="boardList">
			<table summary="게시판 리스트" class="table table-striped">
				<thead>
					<tr class="text-center">
						<th class="col-md-1">글번호</th>
						<th class="col-md-4">글제목</th>
						<th class="col-md-2">작성자</th>
						<th class="col-md-1">작성일</th>
						<th class="col-md-1">조회수</th>
						<th class="col-md-1">이미지</th>
					</tr>
				</thead>
				<tbody id="list">
					<c:choose>
						<c:when test="${not empty boardList}">
							<c:forEach var="board" items="${boardList}" varStatus="status">
								<tr class="text-center" data-num="${board.boardNumber}">
									<td>${board.boardNumber}</td>
									<td class="goDetail text-start">
										${board.boardTitle}
										<c:if test="${board.replyCnt > 0}">
											<span class="reply_count">[${board.replyCnt}]</span>
										</c:if>
									</td>	
									<td class="name">${board.boardName}</td>
									<td class="text-start">${board.boardDate}</td>
									<td class="text-center">${board.readcnt}</td>
									<td>
										<c:if test="${not empty board.boardFile}">
											<img src="/uploadStorage/board/${board.boardFile}" class="rounded w-50 h-50"/>
										</c:if>
										<c:if test="${empty board.boardFile}">
											<img src="/resources/images/common/no-image-icon.png" class="rounded w-50 h-50"/>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		
		<div class="text-end">
			<button type="button" id="insertFormBtn" class="btn btn-success btn-sm">글쓰기</button>
		</div>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.startPage - 1}">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>

	</div>
	
	<script src="/resources/include/js/boardList.js"></script>
	<script>
		$(function(){
			let word="<c:out value='${boardVO.keyword}'/>"
			let value="";
			if(word!=""){
				$("#keyword").val("<c:out value='${boardVO.keyword}' />");
				$("#search").val("<c:out value='${boardVO.search}' />");
				
				if($("#search").val()!='b_content'){
					if($("#search").val()=='b_title') value= "#list tr td.goDetail";
					else if($("#search").val() == 'b_name') value="#list tr td.name";
					console.log($(value+":contains('"+word+"')").html());
					$(value+":contains('"+word+"')").each(function(){
						let regex = new RegExp(word, 'gi');
						$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
					});
				}
			}
		});
	</script>
</body>
















