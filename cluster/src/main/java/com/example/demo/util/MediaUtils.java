package com.example.demo.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<String, MediaType>();
		
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	// 강제 대문자 변환 - 이름이 소문자, 대문자 섞여서 올 수 있으므로 변환작업 실행
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
