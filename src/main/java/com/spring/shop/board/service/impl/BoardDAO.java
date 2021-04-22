package com.spring.shop.board.service.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.board.service.BoardVO;
import com.spring.shop.board.service.ReplyVO;
import com.spring.shop.common.service.SearchCriteria;


@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	
	public void write(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.insert", boardVO);
	}

	
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.read", bno);
	}
	
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("boardMapper.delete", bno);
	}
	
	public void update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.update", boardVO);
	}
	
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.listPage",scri);
	}
	
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.listCount",scri);
	}
	
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.boardHit",bno);
	}
	
	public List<ReplyVO> readReply(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.readReply", bno);
	}

	public void writeReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("boardMapper.writeReply", vo);
	}
	public void updateReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.updateReply", vo);
	}

	public ReplyVO updateReplyForm(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.updateReplyForm", vo);
	}
	
	public void deleteReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.deleteReply", vo);
	}
	
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectReply", rno);
	}

	

}