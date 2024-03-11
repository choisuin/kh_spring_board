<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link rel="stylesheet" type="text/css" href="/resources/include/css/chungnam.css"/> 
	<link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css" /> 
	<script src="/resources/include/js/lightbox.min.js"></script>
	
</head>
<body>
	<div class="container">
		<div class="text-center"><h3 class="mb-2">충남관광 - 관광명소</h3></div>	

		<div class="row row-cols-1 row-cols-md-3 g-3" id="list">
		  <div class="col item" id="item-template">
		  	<div class="card h-100" >
		      <a href="#" data-lightbox="roadtrip" class="item-light"><img class="card-img-top"></a>
		      <div class="card-body">
		        <h5 class="card-title item-title"></h5>
		        <p class="card-text item-sub"></p>
		        <a href="#" class="btn btn-primary detailBtn">상세정보</a>
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>
	<script>
		function template(mng_no, local_nm, type, nm, nm_sub, desc, list_img){
			let $div = $('#list');
			 
			let $element = $('#item-template').clone().removeAttr('id');
			$element.attr("data-mngno", mng_no);
			
			$element.find('a.item-light').attr({"href":list_img, "title":nm_sub}); 
			$element.find('a.item-light > img').attr("src", list_img);
			
		    $element.find('.item-title').html(nm);
		    $element.find('.item-sub').html(nm_sub);

		    $div.append($element); 
		};
	
		$(function(){
			$.ajax({ 
				//오픈api: "http://tour.chungnam.go.kr/_prog/openapi/?func=tour&start=1&end=5",
				url: "/data/chungnamList",  
				type: "get",
				dataType: "xml",
				success: data => {
					$(data).find('item').each(function(){
						let mng_no = $(this).find("mng_no").text();
						let local_nm = $(this).find("local_nm").text();
						let type = $(this).find("type").text();
						let nm = $(this).find("nm").text();
						let nm_sub = $(this).find("nm_sub").text();
						let desc = $(this).find("desc").text();
						let list_img = $(this).find("list_img").text();
						
						template(mng_no, local_nm, type, nm, nm_sub, desc, list_img);
					});
				},
				error: (xhr, textStatus, errorThrown) => {
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				}
			});
			
			$(document).on("click", ".detailBtn", function(){
				event.preventDefault();
				let mng_no = $(this).parents("div.item").attr("data-mngno");
				//console.log("mng_no = " + mng_no);
				location.href = "/data/chungnamDetailView?mng_no="+mng_no;
			});
		});
	</script>
	
</body>
</html>