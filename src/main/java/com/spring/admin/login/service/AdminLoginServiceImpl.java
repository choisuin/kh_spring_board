package com.spring.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.login.dao.AdminLoginDAO;
import com.spring.admin.login.vo.AdminLoginVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	private AdminLoginDAO adminLoginDAO;
	
	@Override
	public AdminLoginVO loginProcess(AdminLoginVO login) {
		AdminLoginVO adminLogin = adminLoginDAO.loginProcess(login);
		return adminLogin;
	}

}
