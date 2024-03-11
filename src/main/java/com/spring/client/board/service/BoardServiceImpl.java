package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.reply.dao.ReplyDao;
import com.spring.common.file.FileUploadUtil;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		List<BoardVO> list = null;
		list = boardDAO.boardList(bvo);
		return list;
	}

//	@Override
//	public int boardInsert(BoardVO bvo) throws Exception {
//		int result = 0;
////		bvo.setBoardNumber(0);
////		if(bvo.getBoardNumber() == 0) {
////			return result;
////		}
//		
//		result = boardDAO.boardInsert(bvo);
//		return result;
//	}
	@Override
	public int boardInsert(BoardVO bvo) throws Exception {
		int result = 0;
		if(bvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "board");
			bvo.setBoardFile(fileName);
		}
		result = boardDAO.boardInsert(bvo);
		return result;
	}

	
	
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		boardDAO.readCntUpdate(bvo);
		BoardVO detail = boardDAO.boardDetail(bvo);
		if(detail != null) {
			detail.setBoardContent(detail.getBoardContent().replaceAll("\n", "<br />"));
		}
		
		return detail;
	}

	@Override
	public BoardVO updateForm(BoardVO bvo){
		BoardVO updateData = null;
		updateData = boardDAO.boardDetail(bvo);
		return updateData;
	}

//	@Override
//	public int boardUpdate(BoardVO bvo) throws Exception {
//		int result = 0;
//		result = boardDAO.boardUpdate(bvo);
//		return result;
//	}
	
	@Override
	public int boardUpdate(BoardVO bvo) throws Exception {
		int result = 0;
		if(!bvo.getFile().isEmpty()) {
			if(!bvo.getBoardFile().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getBoardFile());
			}
			
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "board");
			bvo.setBoardFile(fileName);
		}
		result = boardDAO.boardUpdate(bvo);
		return result;
	}

	

	@Override
	public int boardDelete(BoardVO bvo) throws Exception {
		int result = 0;
		if(!bvo.getBoardFile().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getBoardFile());
		}
		result = boardDAO.boardDelete(bvo);
		return result;
	}

	@Override
	public int pwdConfirm(BoardVO bvo) {
		int result = boardDAO.pwdConfirm(bvo);
		return result;
	}

	@Override
	public int replyCount(int boardNumber) {
		int result = 0;
		result = replyDao.replyCount(boardNumber);
		return result;
	}

	@Override
	public int boardListCnt(BoardVO bvo) {
		int result = 0;
		result = boardDAO.boardListCnt(bvo);
		return result;
	}

}






















