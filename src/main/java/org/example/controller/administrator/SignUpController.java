package org.example.controller.administrator;

import org.example.controller.BaseController;
import org.example.model.Users;
import org.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class SignUpController extends BaseController{
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = {"/administrator/signUp"}, method = RequestMethod.GET)
	private String adminProfile(final Model model,
							  final HttpServletResponse response,
							  final HttpServletRequest request) 
		throws IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		model.addAttribute("staffModel", new Users());
		
		return "administrator/signUp";
	}
	
	@RequestMapping(value = {"/administrator/signUp"}, method = RequestMethod.POST)
	private String adminProfile(final Model model,
								final HttpServletRequest request,
								final HttpServletResponse response,
								final @ModelAttribute("staffModel") Users users) {
		
		System.out.println(users.getEmail());
		
//		staffService.saveOrUpdate(staff);
		
		return "administrator/signUp";
	}
	
}
