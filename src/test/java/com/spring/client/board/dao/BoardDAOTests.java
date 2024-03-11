//package com.spring.client.board.dao;
//
//import java.util.List;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import com.spring.client.board.vo.BoardVO;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@SpringBootTest
//public class BoardDAOTests {
//	@Autowired
//	private BoardDAO boardDAO;
//
//
//
//
////	@Test
////	public void testBoardList() {
////		BoardVO boardVO = null;
////		List<BoardVO> list = boardDAO.boardList(boardVO);
////		for(BoardVO vo : list) {
////			log.info(vo.toString());;
////		}
////	}
//	
////	@Test
////	public void testBoardInsert() {
////		BoardVO boardVO = new BoardVO();
////		boardVO.setBoardName("123");
////		boardVO.setBoardTitle("123");
////		boardVO.setBoardContent("123");
////		boardVO.setBoardPasswd("123");
////
////		int count = boardDAO.boardInsert(boardVO);
////		log.info("입력된 행의 수: " + count);
////	}
//
////	@Test
////	public void testBoardDetail() {
////		BoardVO bvo = new BoardVO();
////		bvo.setBoardNumber(1);
////		BoardVO board = boardDAO.boardDetail(bvo);
////
////		log.info("test : " + board.toString());
////
////	}
//	
////	@Test
////	public void testReadCntUpdate() {
////		BoardVO bvo = new BoardVO();
////		bvo.setBoardNumber(1);
////		
////		int count = boardDAO.readCntUpdate(bvo);
////		log.info("수정된 행의 수: " + count);
////	}
//
////	@Test
////	public void testBoardUpdate() {
////		BoardVO board = new BoardVO();
////		board.setBoardTitle("update");
////		board.setBoardContent("upupdate");
////		board.setBoardContent("4321");
////		board.setBoardNumber(11);
////		
////		int count = boardDAO.boardUpdate(board);
////		log.info("수정된 행의 수 :" + count);
////	}
//	
////	@Test
////	public void testBoardDelete() {
////		BoardVO bvo = new BoardVO();
////		bvo.setBoardNumber(12);
////		
////		int count = boardDAO.boardDelete(bvo);
////		log.info("수정된 행의 수 : " + count);
////	}
//	
////	@Test
////	public void testPasswdConfirm() {
////		BoardVO bvo = new BoardVO();
////		bvo.setBoardNumber(3);
////		bvo.setBoardPasswd("123");
////		
////		int count = boardDAO.pwdConfirm(bvo);
////		log.info("test : " + count);
////	}
//
//
////	@Test
////	public void testBoardList() {
////		BoardVO bvo = new BoardVO();
////		
////		bvo.setSearch("b_title");
////		bvo.setKeyword("title");
////		
////		List<BoardVO> list = boardDAO.boardList(bvo);
////		for(BoardVO vo : list) {
////			log.info(vo.toString());
////		}
////		log.info("총레코드수: " + boardDAO.boardListCnt(bvo));
////	}
//
////	@Test
////	public void testBoardList() {
////		BoardVO bvo = new BoardVO();
////		bvo.setPageNum(1);
////		bvo.setAmount(10);
////		
////		bvo.setSearch("b_title");
////		bvo.setKeyword("123");
////		
////		List<BoardVO> list =boardDAO.boardList(bvo);
////		for(BoardVO vo : list) {
////			log.info(vo.toString());
////		}
////		log.info("총 레코드 수 : " + boardDAO.boardListCnt(bvo));
////	}
//	
//	
//	
//	
//	
//	
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
