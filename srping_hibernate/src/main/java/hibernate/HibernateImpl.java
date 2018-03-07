package hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.kopo.hibernate.PageMaker;
import com.kopo.hibernate.vo.BoardVO;
import com.kopo.hibernate.vo.CommentVO;


public class HibernateImpl implements UserProvider {

	@Override
	public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		List<BoardVO> boardList = session.createQuery("from BoardVO where rownum < 9").list();
		tx.commit();
		session.close();
		return boardList;
	}

	@Override
	public List<BoardVO> selectOneView(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardVO> updateBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageMaker totalPageNum() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalRecord() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void readCountUpdate(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int commentCount() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CommentVO> commentList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int commentInsert(CommentVO comment) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int commentUpdate(CommentVO comment) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int commentDelete(int cno) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
