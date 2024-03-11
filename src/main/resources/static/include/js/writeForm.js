$(function(){
	$("#boardInsertBtn").on("click", () => {
		if(!chkData("#boardName","작성자를")) return;
		else if(!chkData("#boardTitle","글제목을")) return;
		else if(!chkData("#boardContent","글내용을")) return;
		else if(!chkData("#boardPasswd","비밀번호를")) return;
		else{
			if($("#file").val()!=""){
				if(!chkFile($("#file"))) return;
			}
			
			$("#f_writeForm").attr({
				"method":"post",
				"enctype":"multipart/form-data",//파일을 서버로 보낼때만 쓰는 구문
				"action":"/board/boardInsert"
			});
			
			$("#f_writeForm").submit();
		}
		
		
/*		if($("#boardName").val().replace(/\s/g,"")==""){
			alert("작성자를 입력해 주세요.");
			$("#boardName").val("");
			$("#boardName").focus();
			return;
		}
		else if($("#boardTitle").val().replace(/\s/g,"")==""){
			alert("글제목을 입력해 주세요.");
			$("#boardTitle").val("");
			$("#boardTitle").focus();
			return;
		}
		else if($("#boardContent").val().replace(/\s/g,"")==""){
			alert("글내용을 입력해 주세요.");
			$("#boardContent").val("");
			$("#boardContent").focus();
			return;
		}
		else if($("#boardPasswd").val().replace(/\s/g,"")==""){
			alert("비밀번호를 입력해 주세요.");
			$("#boardPasswd").val("");
			$("#boardPasswd").focus();
			return;
		}
*/	
	})

	$("#boardCancelBtn").on("click", () => {
		$("#f_writeForm").each(function(){
			this.reset();
		})
	})

	$("#boardListBtn").on("click", () => {
		location.href = "/board/boardList";
	})

})