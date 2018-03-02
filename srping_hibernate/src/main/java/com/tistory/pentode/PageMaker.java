package com.tistory.pentode;

import org.springframework.ui.Model;

public class PageMaker {

	private int totalRecord;
	private int totalPage;
	private int lastPage;
	private int firstPage;
	private int startPage;
	private int endPage;
	private int pageGroup;
	private int nowPageGroup;
	private int nextPage;
	private int prevPage;
	private int nowPage;
	

	public void PageMaker() {
		
	}
	
	public void calPage(PageMaker pm, int tr, Model model, int currPage, int cnt, int blockSize) {
		nowPage = currPage;
		totalRecord = tr;
		totalPage = totalRecord / cnt + (totalRecord % cnt > 0 ? 1:0);
		
		pageGroup = totalPage / blockSize + ( totalPage % blockSize > 0 ? 1:0 );	 	//페이지 그룹 갯수
		nowPageGroup = nowPage / blockSize + ( nowPage % blockSize > 0 ? 1:0 );	//현재 페이지가 속하는 페이지 그룹 계산
		
		endPage = nowPageGroup * blockSize;   													//페이지그룹의 마지막페이지
		startPage = endPage - (blockSize-1);     													//페이지그룹의 시작페이지
		if(endPage>totalPage){   
			endPage = totalPage;  					//마지막페이지가 총페이지보다 많을 경우 총페이지까지만
		}		
		
		nextPage = startPage + blockSize;
		if(nextPage > totalPage){
			nextPage = totalPage;						//마지막 그룹에서 다시 다음페이지 요청시 끝페이지 표시
		}
		
		prevPage = startPage - blockSize;
		if(prevPage < 1){
			prevPage = 1;									//1페이지 이전으로 가려고 할때 1페이지만 표시
		}
		
		firstPage = 1;						//첫번째 페이지
		lastPage = totalPage;			//마지막 페이지
		
		model.addAttribute("pageMaker",pm);
		
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}

	public int getNowPageGroup() {
		return nowPageGroup;
	}

	public void setNowPageGroup(int nowPageGroup) {
		this.nowPageGroup = nowPageGroup;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	public int getPrevPage() {
		return prevPage;
	}


	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	
	
}
	
	
				
