package com.project.portfolio.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.project.portfolio.Service.MyPageService;
import com.project.login.DTO.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/") // 주소 패턴
public class MyPageController{

	@Autowired
	private MyPageService mypageService;

	@RequestMapping(value= "/userInformation") // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
	@ResponseBody
	public User getUserInfo(HttpSession session) throws Exception {
		
		String email = "21700000@handong.edu";
		if(session.getAttribute("email")!=null) {
			email = (String)session.getAttribute("email");
		}
			
		return mypageService.getUserInfo(email);
	}
	
	@RequestMapping(value = "/info/modify" ,method = RequestMethod.POST)
	  public void modifyInfo(HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		
		User user=new User();
		user.setUser_id(request.getParameter("id"));
		user.setName(request.getParameter("name"));
		session.setAttribute("Name", request.getParameter("name"));
		user.setPhone_number(request.getParameter("phone_number"));
		session.setAttribute("phone", request.getParameter("phone_number"));
		user.setEmail_address(request.getParameter("email_address"));
		user.setCity(request.getParameter("city"));
		
		mypageService.modifyUserInfo(user);
		
	}
}
