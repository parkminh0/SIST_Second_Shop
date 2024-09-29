package util;

public class Paging {
	int nowPage = 1; // 현재 페이지
	int begin; // 현재 페이지 중 첫 게시글의 번호
	int end; // 현재 페이지 중 마지막 게시글의 번호
	int startPage; // 현재 블럭의 시작 페이지
	int endPage; // 현재 블럭의 끝 페이지
	
	int numPerPage = 10; // 한 페이지 당 보여질 게시글 수
	int pagePerBlock = 5; // 한 블럭 당 페이지 수

	int totalRecord; // 전체 게시글 수
	int totalPage; // 총 페이지 수
	
	public Paging() {}
	
	public Paging(int numPerPage, int pagePerBlock) {
		this.numPerPage = numPerPage;
		this.pagePerBlock = pagePerBlock;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		// 현재 페이지가 total 안넘게
		if (nowPage > totalPage)
			nowPage = totalPage;
		
		if (nowPage < 1)
			nowPage = 1;

		this.nowPage = nowPage;
		
		// 현재 페이지 게시글의 시작,끝 번호
		begin = (nowPage - 1) * numPerPage + 1;
		end = nowPage * numPerPage;
		
		// 	int numPerPage = 3; // 한 페이지 당 보여질 게시글 수
		// int pagePerBlock = 5; // 한 블럭 당 페이지 수
		
		// 현재 블록 페이지의 시작,끝 번호
		
		startPage = nowPage - (int)(pagePerBlock/2);
		if (startPage < 1)
			startPage = 1;

		endPage = startPage + pagePerBlock - 1;
		if (endPage >= totalPage) {
			endPage = totalPage;
			startPage = endPage - pagePerBlock + 1;
			if (startPage < 1)
				startPage = 1;
		}
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
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

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		this.totalPage = (int)(Math.ceil((double)totalRecord / numPerPage));
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}