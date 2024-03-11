$(function(){
	
	$("#insertFormBtn").on("click", () => {
		location.href = "/board/writeForm"
	})
	
	$(".goDetail").on("click", function(){
/*		let boardNumber = $(this).parents("tr").attr("data-num");
		console.log("글번호 : " + boardNumber);

		location.href = "boardDetail?boardNumber="+boardNumber;
*/
		let boardNumber = $(this).parents("tr").attr("data-num");
		$("#boardNumber").val(boardNumber);

		$("#detailForm").attr({
			"method":"get",
			"action":"/board/boardDetail"
		});

		$("#detailForm").submit();
	});
	
	$("#search").on("change", function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 목록을 조회합니다.");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	$("#searchData").on("click", function(){
		if($("#search").val()!="all"){
			if(!chkData("#keyword", "검색어를")) return;
		}
		goPage();

	});
	
	$("#searchData").on("click",function(){
		if($("#search").val()!="all"){
			if(!chkData("#keyword","검색어를"))return;
		}
		$("#pageNum").val(1);
		goPage();
	});
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		goPage();
	});
	
	
});



function goPage(){
	if($("#search").val()=="all"){
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action":"/board/boardList"
	});
	$("#f_search").submit();
};


