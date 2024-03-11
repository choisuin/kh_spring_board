//package com.spring.client.reply.dao;
//
//import java.util.List;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.spring.client.reply.vo.ReplyVO;
//
//import lombok.extern.slf4j.Slf4j;
//
//@SpringBootTest
//@Slf4j
//public class ReplyDaoTests {
//	
//	@Autowired
//	private ReplyDao replyDao;
//	
////	@Test
////	public void testReplyList() {
////		ReplyVO rvo = new ReplyVO();
////		rvo.setBoardNumber(1);
////		List<ReplyVO> list = replyDao.replyList(rvo);
////		for(ReplyVO vo : list) {
////			log.info(vo.toString());
////		}
////	}
//
////	@Test
////	public void testReplyInsert() {
////		ReplyVO rvo = new ReplyVO();
////		rvo.setBoardNumber(1);
////		rvo.setReplyName("홍길동");
////		rvo.setReplyContent("남을 위해 어쩌고, 나를 위해 저쩌고");
////		rvo.setReplyPasswd("1234");
////		int result = replyDao.replyInsert(rvo);
////		
////		log.info("입력결과 : " + result);
////	}
//
////	@Test
////	public void testReplyDelete() {
////		ReplyVO rvo = new ReplyVO();
////		rvo.setReplyNumber(24);
////		int result = replyDao.replyDelete(rvo);
////		
////		log.info("삭제결과 : " + result);
////	}
//	
////	@Test
////	public void testReplyUpdate() {
////		ReplyVO rvo = new ReplyVO();
////		rvo.setReplyContent("집에 진짜 가고 싶다");
////		rvo.setReplyPasswd("4321");
////		rvo.setReplyNumber(12);
////		
////		int result = replyDao.replyUpdate(rvo);
////		
////		log.info("수정결과 : " + result);
////	}
//	
////	@Test
////	public void testReplyCount() {
////		ReplyVO rvo = new ReplyVO();
////		
////	}
//	
//	
//	
//}
