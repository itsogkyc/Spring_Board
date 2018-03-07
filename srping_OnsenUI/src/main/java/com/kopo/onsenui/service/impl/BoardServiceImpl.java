package com.kopo.onsenui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kopo.onsenui.PageMaker;
import com.kopo.onsenui.service.BoardService;
import com.kopo.onsenui.service.dao.BoardDAO;
import com.kopo.onsenui.vo.BoardVO;
import com.kopo.onsenui.vo.CommentVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardMapper;
	private BoardServiceImpl text;

	@Override
	@Transactional
	public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
		return boardMapper.selectBoardList(boardVO);
	}

	@Override
	public List<BoardVO> selectOneView(BoardVO boardVO) throws Exception {
		return boardMapper.selectOneView(boardVO);
	}
	
	@Override
	public void insertBoard(BoardVO boardVO) {
		boardMapper.insertBoard(boardVO);
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardMapper.deleteBoard(boardVO);
	}

	@Override
	public List<BoardVO> updateBoard(int num) {
		return boardMapper.updateBoard(num);
	}

	@Override
	public void doUpdate(BoardVO boardVO) {
		boardMapper.doUpdate(boardVO);
	}

	@Override
	public PageMaker totalPageNum() {
		return boardMapper.totalPageNum();
	}

	@Override
	public int getTotalRecord() {
		return boardMapper.getTotalRecord();
	}

	@Override
	public void readCountUpdate(int num) {
		boardMapper.readCountUpdate(num);
	}

	
	
	//´ñ±Û °ü·Ã ÇÔ¼ö ¾Æ·¡ START !!!!
	
	//´ñ±Û°¹¼ö
	@Override
	public int commentCount() throws Exception {
		return boardMapper.commentCount();
	}

	//´ñ±Û¸ñ·Ï
	@Override
	public List<CommentVO> commentList(int bno) throws Exception {
		return boardMapper.commentList(bno);
	}

	//´ñ±ÛÀÔ·Â
	@Override
	public int commentInsert(CommentVO comment) throws Exception {
		return boardMapper.commentInsert(comment);
	}

	//´ñ±Û¼öÁ¤
	@Override
	public int commentUpdate(CommentVO comment) throws Exception {
		return boardMapper.commentUpdate(comment);
	}

	//´ñ±Û»èÁ¦
	@Override
	public int commentDelete(int cno) throws Exception {
		return boardMapper.commentDelete(cno);
	}

	
	
	
	
}
