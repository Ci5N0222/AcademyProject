package kr.co.dong.board;

public class paging {

	   private int listSize = 10;
	   private int rangeSize = 10;
	   private int page;
	   private int range;
	   private int listCnt;
	   private int pageCnt;
	   private int startPage;
	   private int startList;
	   private int endPage;
	   private boolean prev;
	   private boolean next;
	   private String m_id;
	   
	   
	   public int getListSize() {
	      return listSize;
	   }
	   public void setListSize(int listSize) {
	      this.listSize = listSize;
	   }
	   public int getRangeSize() {
	      return rangeSize;
	   }
	   public void setRangeSize(int rangeSize) {
	      this.rangeSize = rangeSize;
	   }
	   public int getPage() {
	      return page;
	   }
	   public void setPage(int page) {
	      this.page = page;
	   }
	   public int getRange() {
	      return range;
	   }
	   public void setRange(int range) {
	      this.range = range;
	   }
	   public int getListCnt() {
	      return listCnt;
	   }
	   public void setListCnt(int listCnt) {
	      this.listCnt = listCnt;
	   }
	   public int getPageCnt() {
	      return pageCnt;
	   }
	   public void setPageCnt(int pageCnt) {
	      this.pageCnt = pageCnt;
	   }
	   public int getStartPage() {
	      return startPage;
	   }
	   public void setStartPage(int startPage) {
	      this.startPage = startPage;
	   }
	   public int getStartList() {
	      return startList;
	   }
	   public void setStartList(int startList) {
	      this.startList = startList;
	   }
	   public int getEndPage() {
	      return endPage;
	   }
	   public void setEndPage(int endPage) {
	      this.endPage = endPage;
	   }
	   public boolean isPrev() {
	      return prev;
	   }
	   public void setPrev(boolean prev) {
	      this.prev = prev;
	   }
	   public boolean isNext() {
	      return next;
	   }
	   public void setNext(boolean next) {
	      this.next = next;
	   }
	   
	  
		public String getM_id() {
			return m_id;
		}
		public void setM_id(String m_id) {
			this.m_id = m_id;
		}

	   @Override
		public String toString() {
			return "paging [listSize=" + listSize + ", rangeSize=" + rangeSize + ", page=" + page + ", range=" + range
					+ ", listCnt=" + listCnt + ", pageCnt=" + pageCnt + ", startPage=" + startPage + ", startList="
					+ startList + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", m_id=" + m_id + "]";
		}
	   
	//컨트롤러에서 사용하는건 페이지인포
	   public void pageInfo(int page, int range, int listCnt) {   
	      System.out.println(page+"!!"+range+"!!"+listCnt+"!!");
	      this.page = page;                                 //클릭한 페이지 번호   
	      this.range = range;      
	      this.listCnt = listCnt;                              //전체 조회 건수                  
	            
	      this.pageCnt = (int) Math.ceil((double)listCnt/listSize);   //전체 페이지수    
	         
	      System.out.println("!!nnn!"+pageCnt);                  
	      this.startPage = (range - 1) * rangeSize + 1 ;            //시작 페이지      
	      this.endPage = range * rangeSize;                     //끝 페이지               
	      this.startList = (page - 1) * listSize;                  //게시판 시작번호            
	      this.prev = range == 1 ? false : true;                  //이전 버튼 상태         
	      this.next = endPage > pageCnt ? false : true;            //다음 버튼 상태      
	      if (this.endPage > this.pageCnt) {         
	         this.endPage = this.pageCnt;         
	         this.next = false;      
	      }   
	   }

}
