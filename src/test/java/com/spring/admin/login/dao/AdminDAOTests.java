package com.spring.admin.login.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.admin.login.vo.AdminLoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class AdminDAOTests {
	
	@Autowired
	private AdminLoginDAO adminLoginDAO;
	
	@Test
	public void testLoginProcess() {
		AdminLoginVO admin = new AdminLoginVO();
		admin.setAdminId("javaadmin");
		admin.setAdminPasswd("java1234");
		
		AdminLoginVO result = adminLoginDAO.loginProcess(admin);
		log.info(result.toString());
	}
	
}
