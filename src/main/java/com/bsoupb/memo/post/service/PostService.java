package com.bsoupb.memo.post.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsoupb.memo.post.domain.Post;
import com.bsoupb.memo.post.repository.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;
	
	public Post addPost(int userId, String title, String contents){
		
		Post post = Post.builder()
					.userId(userId)
					.title(title)
					.contents(contents)
					.build();
		
		return postRepository.save(post);
	
	
	}
	
	// 특정 사용자의 메모 목록을 돌려준다
	public List<Post> getPostList(int userId){
		
		return postRepository.findByUserIdOrderByIdDesc(userId);
	}
	
	public Post getPost(int id) {
		
		// 한 행만 지칭
		// return 될 값이 null 일 가능성이 있을 경우
		Optional<Post> optionalPost = postRepository.findById(id);
		
		Post post = optionalPost.orElse(null);
		return post;
	}
	
}
