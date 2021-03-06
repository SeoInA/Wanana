package com.project.portfolio.DAO;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.login.DTO.User;
import com.project.portfolio.DTO.Portfolio;
import com.project.portfolio.DTO.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;

	private static String namespace ="com.project.mappers.portfolio_mapper";

	@Override
	public List<Portfolio> getPortfolios(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".portfolioBoard",cri);
	}
	
	@Override
	public int countPortfolio(String searchType, String keyword) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectOne("countPortfolio", map);
	}
	
	@Override
	public List<Portfolio> getLikePort() throws Exception {
		return sqlSession.selectList(namespace + ".likePort");
	}

	@Override
	public int linkDupCheck(String link) throws Exception{
		return sqlSession.selectOne(namespace +".linkDupCheck", link);
	}
	
	@Override
	public Integer checkLike(int port_id, int user_id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("portfolio_id", port_id);
		map.put("user_id", user_id);
		return sqlSession.selectOne("checkLike", map);
	}
	
	@Override
	public int likeCnt(int portfolio_id) throws Exception{
		return sqlSession.selectOne(namespace +".likeCnt", portfolio_id);
	}
	
	@Override
	public void updateLike(int portfolio_id,int user_id, int isLike, Date update) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("portfolio_id", portfolio_id);
		map.put("user_id", user_id);
		map.put("isLike", isLike);
		map.put("update", update);
		sqlSession.update(namespace +".updateLike", map);
	}
	@Override
	public void createLike(int portfolio_id,int user_id, Date update) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("portfolio_id", portfolio_id);
		map.put("user_id", user_id);
		map.put("update", update);
		sqlSession.insert(namespace +".createLike", map);
	}
	
	@Override
	public List<String> getInterest(int port_id) throws Exception{
		return sqlSession.selectList(namespace+".getInterest",port_id);
	}
	
	@Override
	public String getPortUser(int port_id) throws Exception{
		return sqlSession.selectOne(namespace+".getPortUser",port_id);
	}

	@Override
	public User getPortUserInfo(Integer user_id) throws Exception {
		
		return sqlSession.selectOne(namespace+".getPortUserInfo",user_id);
	}
	
	@Override
	public Date portfolioUpdateTime(int port_id) throws Exception{
		return sqlSession.selectOne(namespace+".portfolioUpdateTime",port_id);
	}
}
