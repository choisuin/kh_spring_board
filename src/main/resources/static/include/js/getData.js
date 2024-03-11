$(function(){
	$("#btn").on("click",function(){
		//console.log("확인");
		if($("#name").val().replace(/\s/g,"")==""){
			alert("이름을 입력해 주세요.");
			$("#name").val("");
			$("#name").focus();
			return;
		}
		if($("#address").val().replace(/\s/g,"")==""){
			alert("주소를 입력해 주세요.");
			$("#address").val("");
			$("#address").focus();
			return;
		}
		
		/* 폼에 속성을 추가하는 작업 -1
		$("#dataForm").attr("method","post").attr("action","/servletExample/getData");
		$("#dataForm").submit();
		 */
		
		//형식 : $("선택자").attr({"속성":"값","속성":"값"});
		$("#dataForm").attr({
			"method":"post",
			"action":"/servletExample/getData"
		});
		$("#dataForm").submit();
	});
})