package com.bsoupb.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	// 상수 
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\qotn0\\OneDrive\\바탕 화면\\BAE\\springProject\\memo\\upload";
	
	public static String saveFile(int userId, MultipartFile file) {
		
		// 같은 이름의 파일 처리
		// 폴더(디렉토리) 만들어서 파일 저장
		// 로그인 사용자의 userId를 폴더 이름
		// 현재 시간 정보를 폴더 이름에 포함
		// UNIX TIME : 1970년 1월 1일 부터 흐른 시간을 milli second (1/1000) 로 표현한 시간
		// ex ) 2_32908531908
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis();
		
		// 폴더 생성
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			// 디렉토리 생성 실패
			return null;
		}
		
		// 파일 저장
		String filePath = directoryPath + "/" + file.getOriginalFilename();
	
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			// 파일 저장 실패
			e.printStackTrace();
			return null;
		}

		
		// 클라이언트에서 접근 가능한 경로 - 데이터베이스에 저장
		// 클라이어느에서 접근 가능한 경로 리턴
		
		// 파일 경로 : C:\\Users\\qotn0\\OneDrive\\바탕 화면\\BAE\\springProject\\memo\\upload/2_32908531908/test.png
		// url 경로 규칙 : /images/2_32908531908/test.png
		
		return "/images" + directoryName + "/" + file.getOriginalFilename();
		
	}
	
}