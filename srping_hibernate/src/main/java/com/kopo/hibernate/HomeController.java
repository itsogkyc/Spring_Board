package com.kopo.hibernate;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Before;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kopo.hibernate.service.BoardService;
import com.kopo.hibernate.vo.BoardVO;

import hibernate.HibernateImpl;
import hibernate.UserProvider;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	private int perPageRecord = 10;	//�� ������ �� ������ �Խñ� ��
	private int blockSize = 10;		//�عٴ� ����
	private int lastPage = 0;
	
	private UserProvider provider;
	
	//�Խ��� ���
	@RequestMapping(value = "/boardList.do")
	public String boardList(@RequestParam(value="nowPage",defaultValue="0") int nowPage, @ModelAttribute("boardVO") BoardVO boardVO,Model model) throws Exception {
		provider = new HibernateImpl();
		List<BoardVO> list = provider.selectBoardList(boardVO);
		model.addAttribute("list", list);
		return "boardList";
	}

	
	//�۵����
	@RequestMapping(value = "/boardRegisterForm.do")
	public String boardRegisterForm(@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception {
		return "boardRegisterForm";
	}

	
	//���
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsert(@ModelAttribute("boardVO") BoardVO boardVO, Model model) {
		boardService.insertBoard(boardVO);
		return "redirect:/boardList.do";
	}

	//����
	@RequestMapping(value = "/boardDelete.do")
	public String boardDelete(@ModelAttribute("boardVO") BoardVO boardVO, @RequestParam(value="nowPage",defaultValue="0") int nowPage) {
		boardService.deleteBoard(boardVO);
		return "redirect:/boardList.do?nowPage="+nowPage;
	}
	
	//��ȸ
	@RequestMapping(value = "/boardOneView.do")
	public String boardOneView(@ModelAttribute("boardVO") BoardVO boardVO, @RequestParam(value="nowPage",defaultValue="0") int nowPage, Model model) throws Exception {
		List<BoardVO> list1 = boardService.selectOneView(boardVO);
		boardService.readCountUpdate(list1.get(0).getNum());					//��ȸ�� ������Ʈ
		List<BoardVO> list2 = boardService.selectOneView(boardVO);
		list2.get(0).setContent(this.textConvert(list2.get(0).getContent()));	//DB�� ����� ���Ͱ��� �ٽ� <br>������ �ٲ��ش�
		model.addAttribute("list", list2);
		System.out.println("��ȸ�� : " + list2.get(0).getRead_Count());
		model.addAttribute("nowPage", nowPage);
		return "boardOneView";
	}
	
	
	//������
	@RequestMapping(value = "/boardUpdate.do")
	public String boardUpdate(BoardVO boardVO, @RequestParam(value="nowPage",defaultValue="0") int nowPage, Model model) throws Exception {
		List<BoardVO> list = boardService.updateBoard(boardVO.getNum());
		model.addAttribute("list", list);
		model.addAttribute("nowPage",nowPage);
		return "boardUpdate";
	}

	//����
	@RequestMapping(method= RequestMethod.POST, value = "/doUpdate.do")
	public String doUpdate(BoardVO boardVO, @RequestParam(value="nowPage",defaultValue="0") int nowPage, Model model) {
		boardService.doUpdate(boardVO);
		return "redirect:/boardList.do?nowPage="+nowPage;
	}
	
	static String textConvert(String text){	
		text = text.replaceAll("<","��");
		text = text.replaceAll(">","��");
		text = text.replaceAll("&","&amp");
		text = text.replaceAll("\"","&quot");
		text = text.replaceAll("\'","&#39");
		text = text.replaceAll("\n", "<br>");
		text = text.replaceAll(" ", "&nbsp");
		return text;
	}
	
}
