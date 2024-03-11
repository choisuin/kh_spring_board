package com.spring.admin.login.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdminLoginVO {
	private String adminId;
	private String adminPasswd;
	private String adminName;
	private String adminPhone;
	private String adminEmail;
	private String adminDate;
}
