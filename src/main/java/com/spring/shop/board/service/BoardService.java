package com.spring.shop.board.service;


import java.util.List;

import com.spring.shop.common.service.SearchCriteria;


public interface BoardService {
	
		public void write(BoardVO boardVO) throws Exception;
		
		public List<BoardVO> list(SearchCriteria scri) throws Exception;
		
		public int listCount(SearchCriteria scri) throws Exception;
		
		public BoardVO read(int bno) throws Exception;
		
		public void update(BoardVO boardVO) throws Exception;
		
		public void delete(int bno) throws Exception;
		
		public List<ReplyVO> readReply(int bno) throws Exception;

		public void writeReply(ReplyVO vo) throws Exception;

		public void updateReply(ReplyVO vo) throws Exception;

		public void deleteReply(ReplyVO vo) throws Exception;

		public ReplyVO selectReply(int rno) throws Exception;

		public ReplyVO updateReplyForm(ReplyVO vo) throws Exception;


}