package com.tistory.pentode.service;

import java.util.List;

import com.tistory.pentode.PageMaker;
import com.tistory.pentode.vo.BoardVO;
import com.tistory.pentode.vo.CommentVO;

public interface BoardService {
	List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;
	List<BoardVO> selectOneView(BoardVO boardVO) throws Exception;
	List<BoardVO> updateBoard(int num);
	PageMaker totalPageNum();
	int getTotalRecord();
	void insertBoard(BoardVO boardVO);
	void deleteBoard(BoardVO boardVO);
	void doUpdate(BoardVO boardVO);
	void readCountUpdate(int num);
	
    // ��� ����
    int commentCount() throws Exception;
    // ��� ���
    List<CommentVO> commentList(int bno) throws Exception;
    // ��� �ۼ�
    int commentInsert(CommentVO comment) throws Exception;
    // ��� ����
    int commentUpdate(CommentVO comment) throws Exception;
    // ��� ����
    int commentDelete(int cno) throws Exception;
    
    
}
