package com.spring.client.reply.service;

import java.util.List;

import com.spring.client.reply.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> replyList(ReplyVO rvo);

	public int replyInsert(ReplyVO rvo);
	public int replyDelete(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
}
