package hibernate;

import java.util.List;

import com.kopo.hibernate.PageMaker;
import com.kopo.hibernate.vo.BoardVO;
import com.kopo.hibernate.vo.CommentVO;

public interface UserProvider {

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
