let buttonCheck = 0;
$(function(){
	$("#pwdChk").css("visibility", "hidden");
	
	let btnInt = function(){
		$("#message").removeClass("text-danger");
		$("#message").addClass("text-primary");
		$("#message").text("작성시 입력한 비밀번호를 입력해 주세요.");
	}
	

	$("#updateFormBtn").on("click", () => {
/*		$("#f_data").attr({
			"method":"get",
			"action":"/board/updateForm"
		});
		$("#f_data").submit();
*/
		$("#pwdChk").css("visibility", "visible");
		btnInt();
		buttonCheck = "updateButton";
	});
	
/*	$("#boardDeleteBtn").on("click", () => {
		$("#f_data").attr({
			"method":"post",
			"action":"/board/boardDelete"
		});
		$("#f_data").submit();

		$("#pwdChk").css("visibility", "visible");
		btnInt();
		buttonCheck = "deleteButton";
	});
*/	
	
	$("#boardDeleteBtn").on("click", () => {
		$.ajax({
			url : "/board/replyCount",
			type : "post",
			data : "boardNumber="+$("#boardNumber").val(),
			dataType : "text",
			error : function(){
				alert('시스템에 문제가 있어 잠시 후 다시 진행해주세요.');
			},
			success : function(resultData){
				if(resultData==="0"){
					$("#pwdChk").css("visibility", "visible");
					btnInt();
					buttonCheck = "deleteButton";
				}else{
					alert("댓글 존재시 게시글을 삭제할 수 없습니다.\n댓글이 전부 삭제되어야 삭제 가능합니다.");
					return;
				}
			}
		});
	});




	$("#boardPasswd").bind("keydown", function(event){
		if(event.keyCode === 13){
			event.preventDefault();
		}
	});
	
	$("#boardPasswd").on("keyup", () => {
		btnInt();
	});
	
	$("#passwdCancelBtn").on("click", function(){
		$("#boardPasswd").val("");
		$("#pwdChk").css("visibility", "hidden");
		buttonCheck = "";
	});
	
	$("#passwdBtn").on("click", function(){
		$.ajax({
			url : "/board/pwdConfirm",
			type : "post",
			data : $("#f_passwdCheck").serialize(),
			dataType : "text",
			error : function(){
				alert('시스템 오류입니다. 관리자에게 문의하세요');
			},
			beforeSend: function(){
				if(!dataCheck("#boardPasswd", "#message", "비밀번호를")) return false;
				
			},
			success : function(resultData){
				console.log(resultData);
				if(resultData =="불일치"){
					$("#message").addClass("text-danger");
					$("#message").text("작성시 입력한 비밀번호가 일치하지 않습니다.");
					$("#boardPasswd").select();
				}else if(resultData == "일치"){
					$("#message").text("");
					if(buttonCheck == "updateButton"){
						actionProcess("get", "/board/updateForm");
					}else if(buttonCheck =="deleteButton"){
						if(confirm("정말 삭제하시겠습니까?")){
							actionProcess("post", "/board/boardDelete");
						}
					}
				}
			}
		})
	});
	
	function actionProcess(method, goUrl){
		$("#f_data").attr({
			"method":method,
			"action":goUrl
		});
		$("#f_data").submit();
	}
	
	
	
	
	
	
	
	
	


});