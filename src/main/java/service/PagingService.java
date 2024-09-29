package service;

import util.Paging;

public class PagingService {
private static Paging page;

	static {
		try {
			page = new Paging();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void setPage(int numPerPage, int pagePerBlock) {
		page.setNumPerPage(numPerPage);
		page.setPagePerBlock(pagePerBlock);
	}

	public static Paging getPage() {
		return page;
	}
}