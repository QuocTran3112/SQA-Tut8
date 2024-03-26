package org.example.controller.customer;

import org.example.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//1. Báo cho spring-mvc biết đay là 1 controller
//2. Tạo ra một Bean và dc quản lý bởi spring-container
@Controller
public class TestUController extends BaseController{
	
	@RequestMapping(value = { "/test" }, method = RequestMethod.GET)
	public String test(final Model model,
					 final HttpServletRequest request,
					 final HttpServletResponse response)
			throws IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		return "customer/test";
	}
	
	
}
