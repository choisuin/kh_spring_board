$(function(){
	$("#loginBtn").on("click", () => {
		if(!chkData("#adminId","아이디를")) return;
		else if(!chkData("#adminPasswd","비밀번호를")) return;
		else{
			$("#loginForm").attr({
				"method":"post",
				"action":"/admin/login"
			});
			$("#loginForm").submit();
		}
	});
	
	$("#logoutBtn").on("click", function(){
		location.href = "/admin/logout"
	});
})