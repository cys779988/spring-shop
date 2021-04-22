package com.spring.shop.notice.service;

import java.util.List;

import com.spring.shop.common.service.SearchCriteria;


public interface NoticeService {
	public void write(NoticeVO noticeVO) throws Exception;
	
	public List<NoticeVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public NoticeVO read(int nno) throws Exception;
	
	public void update(NoticeVO NoticeVO) throws Exception;
	
	public void delete(int nno) throws Exception;
	
	public List<NoticeReplyVO> readNoticeReply(int nno) throws Exception;

	public void writeReply(NoticeReplyVO vo) throws Exception;

	public NoticeReplyVO updateReplyForm(NoticeReplyVO vo) throws Exception;

	public void updateReply(NoticeReplyVO vo) throws Exception;

	public void deleteReply(NoticeReplyVO vo) throws Exception;

	public NoticeReplyVO selectNoticeReply(int rno) throws Exception;

}
