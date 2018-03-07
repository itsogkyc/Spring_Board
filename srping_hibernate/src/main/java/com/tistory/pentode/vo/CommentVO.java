package com.tistory.pentode.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVO {
	
	private int cno;
    private int bno;
    private String content;
    private String regdate;
	
    public int getCno() {
    	return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		System.out.println(bno);
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
		String today = sdf.format(regdate); 
		this.regdate = today;
	}


    
}
