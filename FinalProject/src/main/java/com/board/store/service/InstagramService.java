/*
 * package com.board.store.service;
 * 
 * import org.springframework.stereotype.Service; import
 * org.springframework.web.client.RestTemplate; import
 * org.springframework.web.util.UriComponentsBuilder;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import java.util.ArrayList; import java.util.List; import java.util.Map;
 * 
 * @Service public class InstagramService {
 * 
 * @Autowired private InstagramApiClient instagramApiClient;
 * 
 * public List<Map<String, Object>> getMediaData() { Map<String, Object>
 * response = instagramApiClient.fetchUserMedia();
 * 
 * // 데이터 가공 List<Map<String, Object>> mediaList = (List<Map<String, Object>>)
 * response.get("data"); List<Map<String, Object>> detailedMediaList = new
 * ArrayList<>();
 * 
 * for (Map<String, Object> media : mediaList) { String mediaId = (String)
 * media.get("id"); Map<String, Object> mediaDetails =
 * instagramApiClient.fetchMediaDetails(mediaId);
 * detailedMediaList.add(mediaDetails); }
 * 
 * return detailedMediaList; } }
 */