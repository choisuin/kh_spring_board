/*함수명 : chData(유효성 체크 대상, 메세지 내용)
출력 영역: alert으로.
예시 : if(!chkData("#keyword","검색어를")) return;
 */

 function chkData(item, msg) {
	 if($(item).val().replace(/\s/g,"")==""){
		 alert(msg + " 입력해 주세요.");
		 $(item).val("");
		 $(item).focus();
		 return false;
	 } else{
		 return true;
	 }
 }
 
 function dataCheck(item, out, msg){
	 if($(item).val().replace(/\s/g,"")==""){
		 $(out).html(msg+" 입력해주세요");
		 $(item).val("");
		 return false;
	 }
	 else{
		 return true;
	 }
 }
 
 function checkForm(item, msg){
	 let message = "";
	 if($(item).val().replace(/\s/g,"")==""){
		 message = msg + "입력해 주세요";
		 $(item).attr("placeholder", message);
		 return false;
	 } else{
		 return true;
	 }
 }
 
function chkFile(item){
	/*	참고사항
		jQuery.inArray(찾을 값, 검색 대상의 배열) : 배열 내의 값을 찾아서 인덱스를 반환(요소가 없을 경우 -1 반환)
		pop() : 배열의 마지막 요소를 제거한 후, 제거한 요소를 반환
	*/
	let ext = item.val().split('.').pop().toLowerCase();
	if(jQuery.inArray(ext, ['gif', 'png', 'jpg']) == -1){
		alert('gif, png, jpg 파일만 업로드 할 수 있습니다.');
		item.val("");
		return false;
	}else{
		return true;
	}
}
 
 
 
 
 
 
 
 
 