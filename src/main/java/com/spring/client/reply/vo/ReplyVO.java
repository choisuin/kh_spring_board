package com.spring.client.reply.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int 	replyNumber 	= 0;
	private int 	boardNumber 	= 0;
	private String 	replyName 		= "";
	private String 	replyContent	= "";
	private String 	replyPasswd 	= "";
	private String 	replyDate;
}
