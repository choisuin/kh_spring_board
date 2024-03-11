<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<body>

	<div class="container">
		<div class="">
			<form id="replyForm" name="">
				<div class="row mb-3">
					<label for="replyName" class="col-sm-1 col-form-label">작성자</label>
					<div class="col-sm-3">
						<input type="text" name="replyName" id="replyName" maxlength="5" class="form-control" />
					</div>
					<label for="replyPasswd" class="col-sm-1 col-form-label">비밀 번호</label>
					<div class="col-sm-3">
						<input type="password" name="replyPasswd" id="replyPasswd" maxlength="18" class="form-control" />
					</div>
					<button type="button" id="replyInsertBtn" class="btn btn-primary col-sm-1 sendBtn mx-2">저장</button>
				</div>
				<div class="row mb-3">
					<label for="replyContent" class="col-sm-1 col-form-label">댓글내용</label>
					<div class="col-sm-11">
						<textarea name="replyContent" id="replyContent" class="form-control" rows="3"></textarea>
					</div>
				</div>
			</form>
		</div>		
		
		
		<div class="reply" id="reviewList">
			<div class="card mb-2" id="item-template">
				<div class="card-header">
					<span class="name"></span>
					<span class="date"></span>
					<button type="button" data-btn="upBtn" class="btn btn-primary btn-sm">수정하기</button>
					<button type="button" data-btn="delBtn" class="btn btn-primary btn-sm">삭제하기</button>
				</div>
				<div class="card-body">
					<p class="card-text"></p>
				</div>
			</div>
		</div>



	</div>



	<script>
		let message = "작성시 입력한 비밀번호를 입력해 주세요.", btnKind = "", replyTotal = 0;

		$(function() {	
/* 			$(".reply").detach();
 */
			let boardNumber = ${detail.boardNumber};
			listAll(boardNumber);
			
			$(document).on("click", "#replyInsertBtn", function(){
				let insertUrl = "/replies/replyInsert";
				
				let value = JSON.stringify({
					boardNumber:boardNumber,
					replyName:$("#replyName").val(),
					replyPasswd:$("#replyPasswd").val(),
					replyContent:$("#replyContent").val()
				});
				
				$.ajax({
					url : insertUrl,
					type : "post",
					headers : {
						"Content-Type":"application/json"
					},
					dataType:"text", 
					data : value,
					error: function(xhr, textStatus, errorThrown){
						alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
					},
					beforeSend: function(){
						if(!checkForm("#replyName", "작성자를")) 			return false;
						else if(!checkForm("#replyPasswd", "비밀번호를")) 	return false;
						else if(!checkForm("#replyContent", "댓글내용을")) 	return false;
					},
					success : function(result){
						if(result=="SUCCESS"){
							alert("댓글 등록이 완료되었습니다.");
							dataReset();
							listAll(boardNumber);
						}
					}
				})
				
			})
						
			
		})

		function listAll(boardNumber) {
			let url = "/replies/all/" + boardNumber;
			$.getJSON(
				url,
				function(data) {
					$(data).each(
						function(index) {
							let replyNumber = this.replyNumber;
							let replyName = this.replyName;
							let replyContent = this.replyContent;
							let replyDate = this.replyDate;
							replyContent = replyContent.replace(/(\r\n|\r\|\n)/g, "<br/>");

							template(replyNumber, replyName, replyContent, replyDate);
							
						});
				}).fail(function() {
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				});

		}
		
		function template(replyNumber, replyName, replyContent, replyDate){
			let $div = $('#reviewList');

			let $element = $('#item-template').clone().removeAttr('id');

			$element.attr("data-num", replyNumber);
			$element.find('.name').html(replyName);
			$element.find('.date').html(" / " + replyDate);
			$element.find('.card-text').html(replyContent);

			$div.append($element);			
		}
		
		function dataReset(){
			$("#replyForm").each(function(){
				this.reset();
			});
			
			$("#replyName").prop("readonly", false);
			$("#replyForm button[type='button']").removeAttr("data-rnum");
			$("#replyForm button[type='button']").attr("id", "replyInsertBtn");
			$("#replyForm button[type='button'].sendBtn").html("저장");
			$("#replyForm button[type='button'].resetBtn").detach();
			
		}
		
		$(document).on("click", "button[data-btn='delBtn']", function(){
			let replyNumber = $(this).parents("div.card").attr("data-num");
			console.log(replyNumber);
			deleteBtn(boardNumber, replyNumber);
		})

		$(document).on("click", "button[data-btn='upBtn']", function(){
			let card = $(this).parents("div.card");
			let replyNumber = card.attr("data-num");
			console.log("rnum: " + replyNumber);
			updateForm(replyNumber, card);
		})
		
		
		
		
		function deleteBtn(boardNumber, replyNumber){
			if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
				$.ajax({
					url : '/replies/' + replyNumber,
					type : 'delete', 
					headers : {
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					error : function(xhr, textStatus, errorThrown){
						alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
					},
					success : function(result){
						console.log("result: " + result);
						if(result == 'SUCCESS'){
							alert("댓글 삭제가 완료되었습니다.");
							listAll(boardNumber);
						}
					}
				});
			}
		}
		
		function updateForm(replyNumber, card){
			$("#replyForm .resetBtn").detach();

			$("#replyName").val(card.find(".card-header .name").html());
			$("#replyName").prop("readonly", true);

			let content = card.find(".card-text").html();
			content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			$("#replyContent").val(content);
			
			$("#replyForm button[type='button']").attr("id", "replyUpdateBtn");
			$("#replyForm button[type='button']").attr("data-rnum", replyNumber);
			$("#replyForm button[type='button']").html("수정");			
			
			let resetButton = $("<button type='button' class='btn btn-primary col-sm-1 resetBtn'>");
			resetButton.html("취소");
			$("#replyForm .sendBtn").after(resetButton);
		}

		
		
		
		$(document).on("click", "button[data-btn='update']", function(){
			let card = $(this).parents("div.card")
			let replyNumber = card.attr("data-num");
			updateForm(replyNumber, card);
		});
			
		$(document).on("click", ".resetBtn", function(){
			dataReset();
		});
		
		$(document).on("click", "#replyUpdateBtn", function(){
			
			let replyNumber = $(this).attr("data-rnum");
			$.ajax({
				url: '/replies/'+replyNumber,
				type:'put',
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT"
				},
				data:JSON.stringify({
					replyContent:$("#replyContent").val(),
					replyPasswd: $("#replypasswd").val()
				}),
				beforeSend: function(){
					if(!checkForm("#replyContent","댓글내용을"))	return false;
				},
				success:function(result){
					console.log("result: " + result);
					if(result == "SUCCESS"){
						alert("댓글 수정이 완료되었습니다.");
						dataReset();
						listAll(boardNumber);
					}
				}
			})
		});
		
		
		
		
		
	</script>

</body>
</html>