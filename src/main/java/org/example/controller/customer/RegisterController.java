package org.example.controller.customer;

import com.sun.tools.jconsole.JConsoleContext;
import org.example.controller.BaseController;
import org.example.dto.UserSearch;
import org.example.model.Role;
import org.example.model.Users;
import org.example.model.UsersRoles;
import org.example.services.PagerData;
import org.example.services.RoleService;
import org.example.services.UserService;
import org.example.services.UsersRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
public class RegisterController extends BaseController{
	@RequestMapping(value = {"/register"}, method = RequestMethod.GET)
	public String register(final Model model,
							final HttpServletResponse response,
							final HttpServletRequest request) 
	throws IOException{
		Role role = roleService.getById(17);
		model.addAttribute("guestRole", role);
		
		model.addAttribute("userModel", new Users());
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		return "customer/register";
	}
	
	@Autowired
	private RoleService roleService;
	
	@Autowired 
	private UserService userService;
	
	@Autowired
	private UsersRolesService urService;
	
	@RequestMapping(value = {"/register"}, method = RequestMethod.POST) 
	public String contact2(final Model model,
						  final HttpServletRequest request,
						  final HttpServletResponse response,
						  final @ModelAttribute("userModel") Users user
						  )
		throws IOException {


		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		int status = (int) Math.round(Math.random()*100);

		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cPassword = request.getParameter("cPassword");
		int page = 1;

		UserSearch us = new UserSearch();
		us.setCurrentPage(page);
		us.setKeyword(username);
		boolean isExist = userService.searchUser(us).getTotalItems() !=0 ;

		System.out.println(isExist);
		us.setKeyword(email);
		boolean isExist1 = userService.searchUser(us).getTotalItems() != 0;

        if (isExist) {
			model.addAttribute("usernameAttribute", true);
		}
		else if (isExist1) {
			model.addAttribute("emailAttribute", true);
		}
		else if (password.compareTo(cPassword)!=0) {
			model.addAttribute("passwordAttribute", false);
		}
		else if (status < 50) {
			System.out.println("Something went wrong, cannot sent email verification");
		}
		else {
			user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
			userService.saveOrUpdate(user);

			Integer defaultRole = 17;

			//set users_roles
			UsersRoles ur = new UsersRoles();
			ur.setRole_id(defaultRole);
			ur.setUser_id(user.getId());
			urService.saveOrUpdate(ur);

			return "customer/register";
		}

		return "customer/register";
	}
}
