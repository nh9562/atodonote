package pack.spring.aTodoNote.util;

public class Criteria {
    
    private int page;						//현재 페이지 번호
    private int perPageNum;			//한 페이지당 보여줄 개시글의 수
    
    public int getPageStart() {		//특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {					//최초로 게시판 진입시 기본값 세팅
        this.page = 1;
        this.perPageNum = 4;
    }
    
    public int getPage() {
        return page;
    }
    
    public void setPage(int page) {	//페이지가 음수가 되면 1이 되도록 설정
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    
    public int getPerPageNum() {
        return perPageNum;
    }
    
    public void setPerPageNum(int pageCount) {	//페이지당 보여줄 게시글수 고정
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }
    
}
