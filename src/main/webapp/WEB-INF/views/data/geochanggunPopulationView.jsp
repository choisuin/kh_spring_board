<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
	<link rel="stylesheet" type="text/css" href="/resources/include/css/chungnam.css">
</head>

<body>

	<div class="container">
		<div class="text-center"><h3 class="mb-2">경상남도 거창군_65세 이상 노인인구 현황</h3></div>
			
		<div class="table table-sm table-hover">
			<table class="table-sm table-hover">
				<tbody id="item">
					<tr id="item-template" class="text-center">
						<td class="col col-sm-1 eubmyeon"></td>
						<td class="col col-sm-1 gagusu"></td>
						<td class="col col-sm-1 ingusu"></td>
						<td class="col col-sm-1 allmen"></td>
						<td class="col col-sm-1 allwomen"></td>
						<td class="col col-sm-1 ingusu65"></td>
						<td class="col col-sm-1 men65"></td>
						<td class="col col-sm-1 women65"></td>
						<td class="col col-sm-1 ratio"></td>
						<td class="col col-sm-1 basedate"></td>
					</tr>
				</tbody>
			</table>
			
			
		</div>
	</div>
	
	<script>
		const template = (result) =>{
			let $tbody = $('#item');
			
			let $element = $('#item-template').clone().removeAttr('id');
			$element.find('.eubmyeon').html(result.eubmyeon);
			$element.find('.gagusu').html(result.gagusu);
			$element.find('.ingusu').html(result.ingusu);
			$element.find('.allmen').html(result.allmen);
			$element.find('.allwomen').html(result.allwomen);
			$element.find('.ingusu65').html(result.ingusu65);
			$element.find('.men65').html(result.men65);
			$element.find('.women65').html(result.women65);
			$element.find('.ratio').html(result.ratio);
			$element.find('.basedate').html(result.basedate);
			
			$tbody.append($element);
		};
		
		$(function(){
			const url = "/data/geochanggunPopulationList";
			$.getJSON(url, function(data){
				for(let value of data){
					template(value);
				}
			}).fail(function(){
				alert("잠시후에 다시 시도해 주세요.");
			})
		})
	
	
	</script>
		
</body>
</html>