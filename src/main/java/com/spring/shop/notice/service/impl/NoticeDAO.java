package com.spring.shop.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.notice.service.NoticeReplyVO;
import com.spring.shop.notice.service.NoticeVO;


@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	public void write(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.insert", noticeVO);
	}

	public NoticeVO read(int nno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.read", nno);
	}

	public void delete(int nno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("noticeMapper.delete", nno);
	}

	public void update(NoticeVO noticeVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("noticeMapper.update", noticeVO);
	}

	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeMapper.listPage", scri);
	}

	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.listCount", scri);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.insertFile", map);
	}

	public void noticeHit(int nno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.noticeHit", nno);
	}

	public List<NoticeReplyVO> readNoticeReply(int nno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("noticeMapper.readNoticeReply", nno);
	}

	public void writeNoticeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.writeNoticeReply", vo);
	}

	public NoticeReplyVO updateReplyForm(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.updateReplyForm", vo);
	}
	
	public void updateNoticeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("noticeMapper.updateNoticeReply", vo);
	}

	public void deleteNoticeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("noticeMapper.deleteNoticeReply", vo);
	}

	public NoticeReplyVO selectNoticeReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNoticeReply", rno);
	}

}
