<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/chungnam.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/lightbox.css" />
<script src="/resources/include/js/lightbox.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="text-center">
			<h3 class="mb-2">대전 유기동물 공고 현황</h3>
		</div>
	
		<div class="mb-2">
			<form id="f_search">
				<div class="row g-2 align-items-center">
					<div class="col-auto">
						<label for="searchCondition">유기동물구분</label>
					</div>
					<div class="col-auto">
						<select name="searchCondition" id="searchCondition" class="form-select form-select-sm" aria-label="Small select example">
							<option value="1">개</option>
							<option value="2">고양이</option>
							<option value="3">기타</option>
						</select>
					</div>
					<div class="col-auto">
						<label for="searchCondition3">입양상태</label>
					</div>
					<div class="col-auto">
						<select name="searchCondition3" id="searchCondition3" class="form-select form-select-sm" aria-label="Small select example">
							<option value="1">공고중</option>
							<option value="2">입양가능</option>
							<option value="3">입양예정</option>
							<option value="4">입양완료</option>
							<option value="7">주인반환</option>
						</select>
					</div>
				</div>
			</form>
		</div>
		
		<div class="row mb-2" id="list">
			<div class="col-md-6 item" id="media-template">
				<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block mb-2 text-primary-emphasis item-place"></strong>
						<h3 class="mb-0 item-heading"></h3>
						<div class="mb-1 text-body-secondary item-color"></div>
						<p class="card-text mb-auto item-memo"></p>
						<a href="#" class="icon-link gap-1 icon-link-hover"></a>
		        		<a href="#" class="btn btn-primary detailBtn">상세정보</a>
					</div>
					<div class="col-auto d-none d-lg-block">
						<a class="media">
							<img class="media-object rounded" width="200" height="250"/>
						</a>
	 				</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 	<div class="container">
		<div class="text-center">
			<h3 class="mb-2">대전 유기동물 공고 현황</h3>
		</div>

		<div class="row row-cols-1 row-cols-md-3 g-3" id="list">
			<div class="col items" id="items-template">
				<div class="card h-100">
					<a href="#" data-lightbox="roadtrip" class="items-light"><img class="card-img-top"></a>
					<div class="card-body">
						<h5 class="card-title items-title"></h5>
						<p class="card-text items-sub"></p>
						<a href="#" class="btn btn-primary detailBtn">상세정보</a>
					</div>
				</div>
			</div>
		</div>

	</div>
 -->
	<script>
		function template(adoptionStatusCd, age, animalSeq, classification, fileNm, filePath, gender, species, weight, foundPlace, hairColor, memo){
			let $div = $('#list');
			
			let $element = $('#media-template').clone().removeAttr('id');
			$element.attr("data-animalSeq", animalSeq);
			$element.addClass("animal-list");
			
			let img="";
			if(filePath != ""){
				img = "http://www.daejeon.go.kr/"+filePath;
				$element.find('.media').attr({
					"href":img,
					"title":species,
					"data-lightbox":"roadtrip"
				});
				$element.find('.media > .media-object').attr("src", img);
			}else{
				img = "/resources/images/common/noanimal/" + classification + ".png";
				$element.find('.media-object').attr("src", img);
			}
						
		    $element.find('.item-place').html(foundPlace);
		    $element.find('.item-heading').html(species + " - " + age);
		    $element.find('.item-color').html(hairColor);
		    $element.find('.item-memo').html(memo);

		    $div.append($element); 
		};
	
/* 		$(function(){
			$.ajax({ 
				url: "/data/animalDaejeonList",  
				type: "get",
				dataType: "xml",
				success: data => {
					$(data).find('items').each(function(){
						let animalSeq = $(this).find("animalSeq").text();
						let age = $(this).find("age").text();
						let adoptionStatusCd = $(this).find("adoptionStatusCd").text();
						let classification = $(this).find("classification").text();
						let fileNm = $(this).find("fileNm").text();
						let filePath = $(this).find("filePath").text();
						let gender = $(this).find("gender").text();
						let species = $(this).find("species").text();
						let weight = $(this).find("weight").text();
						let foundPlace = $(this).find("foundPlace").text();
						let hairColor = $(this).find("hairColor").text();
						let memo = $(this).find("memo").text();
						
						template(adoptionStatusCd, age, animalSeq, classification, fileNm, filePath, gender, species, weight, foundPlace, hairColor, memo);
					});
				},
				error: (xhr, textStatus, errorThrown) => {
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				}
			});
			
			$(document).on("click", ".detailBtn", function(){
				event.preventDefault();
				let animalSeq = $(this).parents("div.items").attr("data-animalSeq");
				//console.log("animalSeq = " + animalSeq);
				location.href = "/data/chungnamDetailView?animalSeq="+animalSeq;
			});
		}); */
		
		$(function(){
			data();
			
			$("#searchCondition, #searchCondition3").on("change", function(){
				data();
			});
			
			$(document).on("click", ".detailBtn", function(){
				event.preventDefault();
				let animalSeq = $(this).parents("div.item").attr("data-animalSeq");
				location.href = "/data/animalDaejeonItemView?animalSeq="+animalSeq;
			});

			
		});
		
		function data(){
			$(".animal-list").detach();
			$.ajax({ 
				url: "/data/animalDaejeonList",  
				type: "get",
				data: $("#f_search").serialize(),
				dataType: "xml",
				success: function(data) {
					$(data).find('items').each(function(){
						let animalSeq = $(this).find("animalSeq").text();
						let age = $(this).find("age").text();
						let adoptionStatusCd = $(this).find("adoptionStatusCd").text();
						let classification = $(this).find("classification").text();
						let fileNm = $(this).find("fileNm").text();
						let filePath = $(this).find("filePath").text();
						let gender = $(this).find("gender").text();
						let species = $(this).find("species").text();
						let weight = $(this).find("weight").text();
						let foundPlace = $(this).find("foundPlace").text();
						let hairColor = $(this).find("hairColor").text();
						let memo = $(this).find("memo").text();
						
						template(adoptionStatusCd, age, animalSeq, classification, fileNm, filePath, gender, species, weight, foundPlace, hairColor, memo);
					});
				},
				error: (xhr, textStatus, errorThrown) => {
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				}
			});
		}
		
		
		
		
		
		
		
	</script>

</body>
</html>