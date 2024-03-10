package com.bsoupb.memo.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// view page : response에 html를 채움
// jsp 경로를 리턴 -> ResponsBody 붙지 않음

@Controller
public class UserController {
	
	@GetMapping("/user/join-view")
	public String inputJoin() {
		return "user/join";
	}
	
	@GetMapping("/user/login-view")
	public String inputLogin() {
		return "user/login";
	}
	
}
