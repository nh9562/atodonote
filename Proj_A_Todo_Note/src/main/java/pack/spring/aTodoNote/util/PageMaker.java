package pack.spring.aTodoNote.util;

public class PageMaker {
    
    private Criteria cri;
    private int totalCount;			// 총 게시글 수
    private int startPage;			// 화면에 보여질 첫번쨰 페이지 번호, 시작 페이지 번호
    private int endPage;			// 화면에 보여질 마지막 페이지 번호, 끝페이지 번호
    private boolean prev;		 	// 이전 버튼 생성 여부
    private boolean next;			// 다음 버튼 생성 여부
    private int displayPageNum = 3;		// 한 화면에 보여질 블럭의 수 : 3
    
    public Criteria getCri() {
        return cri;
    }
    
    public void setCri(Criteria cri) {
        this.cri = cri;
    }
    
    public int getTotalCount() {
        return totalCount;
    }
    
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();		// 총 게시글의 수를 세팅
    }
    
    private void calcData() {		// 페이징 버튼을 생성하는 공식 (끝페이지번호, 시작페이지번호, 이전, 다음버튼)
    										// cri.getPage() : 현재 페이지 번호
    										// cri.getPerPageNum() : 한 페이지당 보여줄 게시글 수
        
    	//끝페이지 번호 구하기
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        
        //시작 페이지번호 구하기 = (끝 페이지번호 - 화면에 보여질 페이지번호의 갯수) + 1
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;
        
        //마지막 페이지번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의 수
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
 
        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPerPageNum() < totalCount ? true : false;
        
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
    
    public int getDisplayPageNum() {
        return displayPageNum;
    }
    
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
 
}