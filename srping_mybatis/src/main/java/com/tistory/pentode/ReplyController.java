package com.tistory.pentode;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.vo.CommentVO;

@RestController
@RequestMapping("/comment")
public class ReplyController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
//    @RequestMapping(value = "/list", method=RequestMethod.GET) //��� ����Ʈ
//    public ResponseEntity<List<CommentVO>> mCommentServiceList() throws Exception{
//    	ResponseEntity<List<CommentVO>> entity =null;
//		entity = new ResponseEntity<>(boardService.commentList(),HttpStatus.OK);
//    	return entity;
//    }
    
	@RequestMapping("/list")
    public List<CommentVO> listJson(@RequestParam("bno") int bno) throws Exception {
        System.out.println(bno);
		List<CommentVO> list = boardService.commentList(bno);
        return list; 
    }
	
	
	//��� ���
	@RequestMapping("/insert")
	public int commentInsert(@RequestParam("bno") int bno, @RequestParam("content") String content) throws Exception {
		CommentVO comment = new CommentVO();
		comment.setBno(bno);
		comment.setContent(content);
		return boardService.commentInsert(comment);
	}
	
	
	//��� ����
    @RequestMapping("/delete/{cno}")   
    private int commentDelete(@PathVariable int cno) throws Exception{
        System.out.println("��ȣ������");
        
    	return boardService.commentDelete(cno);
    }
    
    //��� ����
    @RequestMapping("/update")   
    private int commentUpdate(@RequestParam int cno, @RequestParam String content) throws Exception{
        CommentVO comment = new CommentVO();
        comment.setCno(cno);
        comment.setContent(content);
        return boardService.commentUpdate(comment);
    }
    
    
}
