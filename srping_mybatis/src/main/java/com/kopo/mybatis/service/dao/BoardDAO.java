package com.kopo.mybatis.service.dao;

import java.util.List;

import com.kopo.mybatis.PageMaker;
import com.kopo.mybatis.vo.BoardVO;
import com.kopo.mybatis.vo.CommentVO;

public interface BoardDAO {
	List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;
	List<BoardVO> selectOneView(BoardVO boardVO) throws Exception;
	List<BoardVO> updateBoard(int num);
	PageMaker totalPageNum();
	int getTotalRecord();
	void insertBoard(BoardVO boardVO);
	void deleteBoard(BoardVO boardVO);
	void doUpdate(BoardVO boardVO);
	void readCountUpdate(int num);
	
    // ´ñ±Û °³¼ö
    int commentCount() throws Exception;
    // ´ñ±Û ¸ñ·Ï
    List<CommentVO> commentList(int bno) throws Exception;
    // ´ñ±Û ÀÛ¼º
    int commentInsert(CommentVO comment) throws Exception;
    // ´ñ±Û ¼öÁ¤
    int commentUpdate(CommentVO comment) throws Exception;
    // ´ñ±Û »èÁ¦
    int commentDelete(int cno) throws Exception;
	
	
}
