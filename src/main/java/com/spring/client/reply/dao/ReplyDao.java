package com.spring.client.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.client.reply.vo.ReplyVO;


@Mapper
public interface ReplyDao {
	public List<ReplyVO> replyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);
	public int replyDelete(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyCount(int boardNumber);
	public int replyChoiceDelete(int boardNumber);
}
