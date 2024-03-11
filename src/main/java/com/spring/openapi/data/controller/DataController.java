package com.spring.openapi.data.controller;


import org.springframework.http.MediaType;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.openapi.data.service.DataService;
import com.spring.openapi.data.vo.AnimalDaejeonDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/data/*")
@Slf4j
public class DataController {
	
	@Autowired
	private DataService dataService;

	@GetMapping(value="/chungnamView")
	public String chungnamView() {
//		log.info("충남 관광 명소 화면");
		return "data/chungnamView";
	}
	
	@ResponseBody
	@GetMapping(value="/chungnamList", produces = "application/xml; charset=UTF-8")
	public String chungnamList() throws Exception{
//		log.info("충남 관광 명소 리스트");
		StringBuffer sb = dataService.chungnamList();
		return sb.toString();
	}
	
	@GetMapping("chungnamDetailView")
	public String chungnamDetailView() {
		return "data/chungnamDetailView";
	}
	
	
    /***************************************************************************************
	* 참고 : REST(Representational State Transfer)의 약어로 
	*      하나의 URI는 하나의 고유한 리소스를 대표하도록 설계된다는 개념이다. 
	*      즉 REST방식은 특정 URL는 반드시 그에 상응하는 데이터 자체라는 것을 의미하는 방식이다. 
	*      /member/join => GET(회원가입화면) /member/join => POST(회원가입처리)
	*      
	*      예를 들어 'board/125'은 게시물 중에서 125번이라는 고유한 의미를 가지도록 설계하고, 
	*      이에 대한 처리는 GET, POST 방식과 같이 추가적인 정보를 통해서 결정한다.
	*      http://localhost:8080/board/boardDetail?b_num=4
	*      http://localhost:8080/board/4	=>	GET
	*      
	*      http://localhost:8080/board/boardUpdate?b_num=4 
	*      http://localhost:8080/board/4	=>	PUT/PATCH
	*      
	*      http://localhost:8080/board/boardDelete?b_num=4 
	*      http://localhost:8080/board/4	=>	DELETE
	*      
	*      주고받는 자원(Resource)에 이름을 규정하고 URI에 명시해 HTTP 메서드(GET, POST, PUT, DELETE)를 
	*      통해 해당 자원의 상태를 주고 받는 것을 의미.
	***************************************************************************************/
	
	@ResponseBody
	@GetMapping(value="/chungnamDetail/", produces="application/xml; charset=UTF-8")
	public String chungnamDetail(String mng_no) throws Exception{
		log.info("충남 관광 명소 상세 페이지 정보");
		StringBuffer sb = dataService.chungnamDetail(mng_no);
		return sb.toString();
	}

	@ResponseBody
	@GetMapping(value="/chungnamDetail/{mng_no}", produces=MediaType.APPLICATION_XML_VALUE)
	public String chungnamDetail1(@PathVariable("mng_no") String mng_no) throws Exception{
		log.info("충남 관광 명소 상세 페이지 정보");
		StringBuffer sb = dataService.chungnamDetail(mng_no);
		return sb.toString();
	}
	
	@GetMapping("animalDaejeonView")
	public String animalDaejeonView() throws Exception {
		log.info("대전 유기동물공고 리스트 화면");		
		return "data/animalDaejeonView";
	}
	
	@ResponseBody
	@GetMapping(value="/animalDaejeonList", produces = "application/xml; charset=UTF-8")
	public String animalDaejeonList(AnimalDaejeonDTO animalDaejeonDTO) throws Exception{
		log.info("대전 유기동물공고 리스트");
		StringBuffer sb = dataService.animalDaejeonList(animalDaejeonDTO);
		return sb.toString();
	}
	
	
	@GetMapping("animalDaejeonItemView")
	public String animalDaejeonItemView() {
		log.info("유기동물공고현황 상세조회 화면");
		return "data/animalDaejeonItemView";
	}
	
	@ResponseBody
	@GetMapping(value="/animalDaejeonItem", produces = "application/xml; charset=UTF-8")
	public String animalDaejeonItem(AnimalDaejeonDTO adto) throws Exception{
		log.info("유기동물공고현황 상세조회");
		StringBuffer sb = dataService.animalDaejeonItem(adto);
		return sb.toString();
	}
	
	@GetMapping("daejeonTourView")
	public String daejeonTourView() {
		log.info("대전문화관광 리스트 화면 조회");
		return "data/daejeonTourView";	
	}
	
	
	@ResponseBody
	@GetMapping(value="/daejeonTourList", produces = "application/json; charset=UTF-8")
	public String daejeonTourItem() throws Exception{
		log.info("대전문화관광 리스트");
		StringBuffer sb = dataService.daejeonTourList();
		return sb.toString();
	}
	
	@GetMapping("gyeongnammuseumView")
	public String gyeongnammuseumView() throws Exception{
		log.info("경남 박물관 리스트 조회");
		return "data/gyeongnammuseumView";
	}
	
	
	@ResponseBody
	@GetMapping(value="/gyeongnammuseumList", produces = "application/json; charset=UTF-8")
	public String gyeongnammuseumList() throws Exception{
		log.info("경남 박물관 리스트");
		StringBuffer sb = dataService.gyeongnammuseumList();
		return sb.toString();
	}
	
	@GetMapping("geochanggunPopulationView")
	public String geochanggunPopulationView() throws Exception{
		log.info("거창군 인구");
		return "data/geochanggunPopulationView";
	}
	
	
	@ResponseBody
	@GetMapping(value = "/geochanggunPopulationList" , produces = "application/json; charset=UTF-8" )
	public List<Map<String, String>> geochanggunPopulationList() throws Exception{
		log.info("거창군 인구 리스트");
		List<Map<String, String>> result = dataService.geochanggunPopulationList();
		return result;
	}
	
	
}






















