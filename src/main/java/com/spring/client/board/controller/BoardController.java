package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.vo.PageDTO;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
//	//@RequestMapping("value="/boardList", RequestMethod.GET", method=RequestMethod.GET) => @GetMapping
//	@GetMapping("boardList")
//	public String boardList(@ModelAttribute BoardVO bvo, Model model) {
////		log.info("boardList 호출");
//		List<BoardVO> boardList = boardService.boardList(bvo);
//		model.addAttribute("boardList", boardList);
//		
//		return "client/board/boardList";
//	}

	//@RequestMapping("value="/boardList", RequestMethod.GET", method=RequestMethod.GET) => @GetMapping
	@GetMapping("boardList")
	public String boardList(@ModelAttribute BoardVO bvo, Model model) {
//		log.info("boardList 호출");
		List<BoardVO> boardList = boardService.boardList(bvo);
		model.addAttribute("boardList", boardList);
		
		int total = boardService.boardListCnt(bvo);
		model.addAttribute("pageMaker", new PageDTO(bvo, total));
		
		return "client/board/boardList";
	}

	
	
	@GetMapping(value="writeForm")
	public String writeForm() {
//		log.info("writeForm 호출 성공");
		return "client/board/writeForm";
	}
	
//	@PostMapping("/boardInsert")
//	public String boardInsert(BoardVO bvo, RedirectAttributes ras) {
//		log.info("boardInsert 호출 성공");
//		
//		int result = 0;
//		String url = "";
//		
//		result = boardService.boardInsert(bvo);
//		if(result == 1) {
//			url = "/board/boardList";
//		}else {
//			ras.addFlashAttribute("errorMsg", "입력에 문제가 있어 다시 진행해주세요");
//			url = "board/writeForm";
//		}
//
//		return "redirect:"+url;
//	}
	
	@PostMapping("boardInsert")
	public String boardInsert(BoardVO bvo) throws Exception{
//		log.info("boardInsert 호출 성공");
		boardService.boardInsert(bvo);
		return "redirect:/board/boardList";
	}
	
	@GetMapping("boardDetail")
	public String boardDetail(BoardVO bvo, Model model) {
//		log.info("boardDetail 호출 성공");
		
		BoardVO detail = boardService.boardDetail(bvo);
		model.addAttribute("detail", detail);
		return "client/board/boardDetail";
	}
	
	@GetMapping("updateForm")
	public String updateForm(BoardVO bvo, Model model) {
//		log.info("updateForm 호출 성공");
//		log.info("boardNumber = " + bvo.getBoardNumber());
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updateData", updateData);
		return "client/board/updateForm";
	}
	
	@PostMapping("boardUpdate")
	public String boardUpdate(BoardVO bvo) throws Exception {
		int result = 0;
		String url ="";
		result = boardService.boardUpdate(bvo);
				
		if(result == 1) {
			url = "/board/boardDetail?boardNumber="+bvo.getBoardNumber();
		}else {
			url = "/board/updateForm?boardNumber="+bvo.getBoardNumber();
		}
		return "redirect:"+url;
		
	}
	
	@PostMapping("boardDelete")
	public String boardDelete(BoardVO bvo) throws Exception {
		boardService.boardDelete(bvo);
		return "redirect:/board/boardList";
	}
	
	@ResponseBody
	@PostMapping(value="pwdConfirm", produces="text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
//		log.info("pwdConfirm 호출 성공");
		log.info("bnum: " + bvo.getBoardNumber());
		log.info("bpwd : " + bvo.getBoardPasswd());
		int result = boardService.pwdConfirm(bvo);
		String value = "";
		log.info("test : " + result);
		if(result==1) {
			value="일치";
		}else if(result==0) {
			value="불일치";
		}
//		log.info("result = " + result);
		
		return value;
	}
	
	@ResponseBody
	@PostMapping(value="/replyCount", produces=MediaType.TEXT_PLAIN_VALUE)
	public String replyCount(@RequestParam("boardNumber") int boardNumber) {
		log.info("replyCOunt 호출 성공");
		
		int result = 0;
		result = boardService.replyCount(boardNumber);
		
		return String.valueOf(result);
	}
	
	
	
	

}
