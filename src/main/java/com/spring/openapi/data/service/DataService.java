package com.spring.openapi.data.service;

import java.util.List;
import java.util.Map;

import com.spring.openapi.data.vo.AnimalDaejeonDTO;

public interface DataService {
	public StringBuffer chungnamList() throws Exception;
	public StringBuffer chungnamDetail(String mng_no) throws Exception;
	public StringBuffer animalDaejeonList(AnimalDaejeonDTO adto) throws Exception;
	public StringBuffer animalDaejeonItem(AnimalDaejeonDTO adto) throws Exception;
	public StringBuffer daejeonTourList() throws Exception;
	public StringBuffer gyeongnammuseumList() throws Exception;
	public List<Map<String, String>> geochanggunPopulationList() throws Exception;
}
