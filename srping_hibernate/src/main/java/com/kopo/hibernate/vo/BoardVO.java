package com.kopo.hibernate.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {

	private Integer num;
	private String title;
	private String content;
	private Integer read_Count;		//하이버네이트용
	private Date write_Date;
	private Integer readCount;		//mybatis용
	private String writeDate;
	
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
	public Date getWrite_Date() {
		return write_Date;
	}
	public void setWrite_Date(Date write_Date) {
		this.write_Date = write_Date;
	}
	public Integer getRead_Count() {
		return read_Count;
	}
	public void setRead_Count(Integer read_Count) {
		this.read_Count = read_Count;
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
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}


}
