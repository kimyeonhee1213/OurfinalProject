package com.example.finalproject.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.finalproject.model.member.dto.MemberDTO;
import com.example.finalproject.service.admin.AdminService;
import com.example.finalproject.service.shop.ProductService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
		@Inject
		AdminService adminService;
		
		@Inject
		ProductService productService;
		
		@RequestMapping("login.do")
		public String login() {
			return "admin/login";
		}
		
		@RequestMapping("login_check.do")
		public ModelAndView login_check(MemberDTO dto, HttpSession session, 
				ModelAndView mav) {
			String name=adminService.loginCheck(dto);//로그인 체크
			if(name != null) {//로그인 성공
				//관리자용 세션변수
				session.setAttribute("admin_userid", dto.getUserid());
				session.setAttribute("admin_name", name);
				//일반사용자용 세션변수
				session.setAttribute("userid", dto.getUserid());
				session.setAttribute("name", name);
				mav.setViewName("admin/admin_menu");//admin_menu.jsp로 이동
			}else {//로그인 실패
				mav.setViewName("admin/login");
				mav.addObject("message", "error");
			}
			return mav;
		}
		
		@RequestMapping("logout.do")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/member/login.do";
		}
}
