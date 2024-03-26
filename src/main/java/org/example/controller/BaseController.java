package org.example.controller;

import org.example.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class BaseController {
	
	/*
	 * trả về user đang login
	 * User logined có thể truy cập thông qua class SecurityContextHolder
	 * @return
	 * */
	@ModelAttribute("userLogined")
	public Users getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (userLogined != null && userLogined instanceof UserDetails) {
			return (Users) userLogined;
		}
		return new Users();
	}
	
	
}
