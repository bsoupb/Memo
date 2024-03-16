package com.bsoupb.memo.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bsoupb.memo.post.domain.Post;
import com.bsoupb.memo.post.service.PostService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {

	@Autowired
	private PostService postService;
	
	@GetMapping("/post/list-view")
	public String postList(
			HttpSession session
			, Model model) {
		
		// 로그인한 사용자의 메모 목록 조회
		int userId = (Integer)session.getAttribute("userId");
		List<Post> postList = postService.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "/post/list";
	}
	
	@GetMapping("/post/create-view")
	public String postInput() {
		return "/post/input";
	}
	
	@GetMapping("/post/detail-view")
	public String postDetail(@RequestParam("id") int id, Model model) {
		
		// 하나의 메모 정보 조회
		Post post = postService.getPost(id);
		
		model.addAttribute("post", post);
		
		return "/post/detail";
	}
}
