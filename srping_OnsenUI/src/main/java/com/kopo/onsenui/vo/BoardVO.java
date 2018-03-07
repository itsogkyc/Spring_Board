package com.kopo.onsenui.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {
	private Integer num;
	private String title;
	private String content;
	private Integer readCount;
	private String writeDate;
	private Integer nowPage;
	private Integer reply;
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getReadCount() {
		return readCount;
	}
	public void setReadCount(Integer readCount) {
		this.readCount = readCount;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String today = sdf.format(writeDate); 
		System.out.println(today);
		this.writeDate = today;
	}
	
	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", " + ", title=" + title + ", content=" + content + ", readCount="
				+ readCount + ", writeDate=" + writeDate + "]";
	}
	
	public Integer getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(Integer nowPage) {
		this.nowPage = nowPage;
	}
	public Integer getReply() {
		return reply;
	}
	public void setReply(Integer reply) {
		this.reply = reply;
	}

}
