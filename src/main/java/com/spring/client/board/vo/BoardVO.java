package com.spring.client.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BoardVO extends CommonVO{
	private int 	boardNumber		= 0;
	private String 	boardName		= "";
	private String 	boardTitle		= "";
	private String 	boardContent	= "";
	private String 	boardDate;
	private String 	boardPasswd		= "";
	private int 	readcnt			= 0;
	private int 	replyCnt 		= 0;
	private MultipartFile file;				//파일 업로드를 위한 필드
	private String boardFile		="";	//실제 서버에 저장할 파일명
	
	private CommonVO cvo;
}
