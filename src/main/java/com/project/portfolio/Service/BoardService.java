package com.project.portfolio.Service;

import java.util.*;

import com.project.login.DTO.User;
import com.project.portfolio.DTO.Portfolio;
import com.project.portfolio.DTO.SearchCriteria;

public interface BoardService {
	//게시판용 포트폴리오 정보 가져오기
	public List<Portfolio> getPortfolios(SearchCriteria cri) throws Exception;

	public int countPortfolio(String searchType, String keyword) throws Exception ;
	public List<Portfolio> getLikePort() throws Exception;
	public int linkDupCheck(String link) throws Exception;
	public Integer checkLike(int port_id, int user_id) throws Exception;
	public int likeCnt(int portfolio_id) throws Exception;
	public void createLike(int portfolio_id,int user_id,Date update) throws Exception;
	public void updateLike(int portfolio_id,int user_id, int isLike,Date update) throws Exception;
	public List<String> getInterest(int port_id) throws Exception;
	public String getPortUser(int port_id) throws Exception;

	public User getPortUserInfo(Integer user_id) throws Exception;
	public Date portfolioUpdateTime(int port_id) throws Exception;
}
