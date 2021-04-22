package com.spring.shop.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shop.common.service.SearchCriteria;
import com.spring.shop.notice.service.NoticeReplyVO;
import com.spring.shop.notice.service.NoticeService;
import com.spring.shop.notice.service.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO dao;

	@Override
	public void write(NoticeVO noticeVO) throws Exception {
		dao.write(noticeVO);
	}

	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeVO read(int nno) throws Exception {
		dao.noticeHit(nno);
		return dao.read(nno);
	}

	@Override
	public void delete(int nno) throws Exception {
		dao.delete(nno);
	}

	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		dao.update(noticeVO);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

	@Override
	public List<NoticeReplyVO> readNoticeReply(int nno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readNoticeReply(nno);
	}

	@Override
	public void writeReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.writeNoticeReply(vo);
	}

	@Override
	public NoticeReplyVO updateReplyForm(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateReplyForm(vo);
	}
	
	@Override
	public void updateReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateNoticeReply(vo);
	}

	@Override
	public void deleteReply(NoticeReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteNoticeReply(vo);
	}

	@Override
	public NoticeReplyVO selectNoticeReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectNoticeReply(rno);
	}
}
