$(function(){
	$("#boardUpdateBtn").on("click", () => {
		if(!chkData("#boardTitle","글제목을")) return;
		else if(!chkData("#boardContent","글내용을")) return;
		else{
			if($("#file").val() != ""){
				if(!chkFile($("#file"))) return;
			}
			$("#f_data").attr({
				"method":"post",
				"enctype":"multipart/form-data",//파일을 서버로 보낼때만 쓰는 구문
				"action":"/board/boardUpdate"
			});
			$("#f_data").submit();
		}
	})

	$("#updateCancelBtn").on("click", () => {
		history.back();
	})	
})
