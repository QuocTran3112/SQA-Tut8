package org.example.controller.customer;

import org.example.controller.BaseController;
import org.example.model.Role;
import org.example.model.Users;
import org.example.model.UsersRoles;
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
						  final @ModelAttribute("userModel") Users user)
		throws IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		Integer defaultRole = 17;
		
		user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
		userService.saveOrUpdate(user);
		
		//set users_roles
		UsersRoles ur = new UsersRoles();
		ur.setRole_id(defaultRole);
		ur.setUser_id(user.getId());
		urService.saveOrUpdate(ur);
		
		return "redirect:/login";
	}
}
