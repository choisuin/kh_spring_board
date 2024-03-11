<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" type="text/css"
	href="/resources/include/css/chungnam.css">
</head>
<body>
	<div class="container">
		<div class="text-center">
			<h3 class="mb-2">대전 유기동물 공고 현황</h3>
		</div>

		<div id="detailData">

			<div id="media-template" class="container py-4">
				<div class="p-5 mb-4 bg-body-tertiary rounded-3">
					<div class="container-fluid py-5">
						<img class="image rounded" height="600" />
					</div>
				</div>

				<div class="row align-items-md-stretch">
					<div class="col-md-6">
						<div class="h-100 p-5 text-bg-dark rounded-3">
							<h2 class="species"></h2>
							<p class="age"></p>
							<p class="hairColor"></p>
							<p class="weight"></p>
							<p></p>
						</div>
					</div>
					<div class="col-md-6">
						<div class="h-100 p-5 bg-body-tertiary border rounded-3">
							<h2 class="adoptionStatusCd"></h2>
							<p class="rescueDate"></p>
							<p class="foundPlace"></p>
							<p class="memo"></p>
						</div>
					</div>
				</div>
			</div>
			
		</div>



<!-- 		<div id="detailData">
			<div id="media-template">

				<table class="table">
					<tbody class="detail-content">
						<tr class="item">
							<td class="detail-title col-md-2">입양상태</td>
							<td id="adoptionStatusCd"
								class="adoptionStatusCd item-type col-md-10"></td>
						</tr>
						<tr>
							<td>나이</td>
							<td id="age" class="age"></td>
						</tr>
						<tr>
							<td>유기동물구분</td>
							<td id="classification" class="classification"></td>
						</tr>
						<tr>
							<td>발견장소</td>
							<td id="foundPlace" class="foundPlace"></td>
						</tr>
						<tr>
							<td>성별 구분</td>
							<td id="gender" class="gender"></td>
						</tr>
						<tr>
							<td>털색</td>
							<td id="hairColor" class="hairColor"></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
 -->

		<div class="text-end mt-2">
			<button type="button" class="btn btn-primary" id="listBtn">목록</button>
		</div>

	</div>

	<script>
		function template(adoptionStatusCd, age, animalSeq, classification, fileNm, filePath, gender, species, weight, foundPlace, hairColor, memo, rescueDate, weight){
			
			let $div = $('#detailData');
			
			let $element = $('#media-template').clone().removeAttr('id');
			
			let img;
			if(filePath != ""){
				img = "http://www.daejeon.go.kr/"+filePath;
				$element.find('.media').attr({
					"href":img,
					"title":species,
				});
				$element.find('.image').attr("src", img);
			}else{
				img = "/resources/images/common/noanimal/" + classification + ".png";
				$element.find('.media-object').attr("src", img);
			}

			

 			$element.find('.image').attr("src", img);
			
						
 			$element.find('.adoptionStatusCd').html(adoptionStatusCd);
 			$element.find('.age').html(age);
 			$element.find('.classification').html(classification);
		    $element.find('.foundPlace').html(foundPlace);
		    $element.find('.gender').html(gender);
		    $element.find('.hairColor').html(hairColor);
		    $element.find('.species').html(species);
		    $element.find('.rescueDate').html(rescueDate);
		    $element.find('.weight').html(weight);
		    $element.find('.memo').html(memo);
	
		    $div.append($element); 
		};
		
		
		$(function(){
			const adoptionStatusCdArray = ["", "공고중", "입양가능", "입양예정", "입양예정", "입양완료", "자연사", "안락사", "주인반환", "임시보호", "입양불가", "방사", "주민참여", "입원중"];
			
			let animalSeq = ${param.animalSeq};
			$.ajax({ 
				url: "/data/animalDaejeonItem?animalSeq="+animalSeq,  
				type: "get",
				dataType: "xml",
				success: function(data) {
					let animalSeq = $(data).find("animalSeq").text();
					let age = $(data).find("age").text();
					let adoptionStatusCd = adoptionStatusCdArray[$(data).find("adoptionStatusCd").text()];
					let classification = $(data).find("classification").text();
					let fileNm = $(data).find("fileNm").text();
					let filePath = $(data).find("filePath").text();
					let gender = $(data).find("gender").text();
					let species = $(data).find("species").text();
					let weight = $(data).find("weight").text();
					let foundPlace = $(data).find("foundPlace").text();
					let hairColor = $(data).find("hairColor").text();
					let memo = $(data).find("memo").text();
					let rescueDate = $(data).find("rescueDate").text();
					
					template(adoptionStatusCd, age, animalSeq, classification, fileNm, filePath, gender, species, weight, foundPlace, hairColor, memo, rescueDate, weight);
				},
				error: (xhr, textStatus, errorThrown) => {
					alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
				}
			});
			
			$("#listBtn").click(function(){
				location.href = "/data/animalDaejeonView";
			});

		});

	
	
	</script>

</body>
</html>