package org.example.controller.customer;

import org.example.controller.BaseController;
import org.example.services.BaseService;
import org.example.services.PagerData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class HomeController extends BaseController{
	
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET) 
	public String home(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response)
			throws IOException{
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		//Lấy dữ liệu
				String keyword = request.getParameter("keyword");
				Integer categoryId = 0;
				try {
					categoryId = Integer.parseInt(request.getParameter("categoryId"));
				} catch (Exception e) {
				}
				Integer currentPage = BaseService.NO_PAGING;
				try {
					currentPage = Integer.parseInt(request.getParameter("page"));
				} catch (Exception e) {
				}

		return "customer/home";
	}
	
}
