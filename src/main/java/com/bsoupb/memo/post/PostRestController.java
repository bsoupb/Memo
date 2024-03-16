package com.bsoupb.memo.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bsoupb.memo.post.domain.Post;
import com.bsoupb.memo.post.service.PostService;

import jakarta.servlet.http.HttpSession;

@RestController
public class PostRestController {

	@Autowired
	private PostService postService;
	
	// 메모 입력 API
	@PostMapping("/post/create")
	public Map<String, String> createMemo(
			@RequestParam("title") String title
			, @RequestParam("contents") String contents
			, HttpSession session){
		
		// 로그인한 사용자의 PK 를 얻어 온다.
		// 세션의 "userId" 키로 저장되어 있다 (로그인 할 때 저장)
		int userId = (Integer)session.getAttribute("userId");
		
		Post post = postService.addPost(userId, title, contents);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(post != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
}