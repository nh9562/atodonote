package pack.spring.aTodoNote.calendar;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pack.spring.aTodoNote.member.MemberDTO;
import pack.spring.aTodoNote.util.Criteria;
import pack.spring.aTodoNote.util.PageMaker;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarService;

	// main left - todoWrite
	@RequestMapping(value="/todoWrite", method=RequestMethod.POST)
	public ModelAndView todoWrite(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();		
		String currentPageDate = (String)map.get("currentPageDate");		
		boolean todoWriteRes = this.calendarService.todoWrite(map);
		if(todoWriteRes) {
			mav.addObject("msg", "작성이 완료되었습니다.");
			mav.addObject("url", "/main?selectDate="+currentPageDate);
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "작성중 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/main?selectDate="+currentPageDate);
			mav.setViewName("/util/alert");
		}		
		return mav;
	}
	
	// main left - todoDel
	@RequestMapping(value="/todoDel", method=RequestMethod.GET)
	public ModelAndView todoDel(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//돌아갈 페이지 파라미터
		String returnPageDate = (String)map.get("returnPageDate");
		
		boolean todoDelRes = this.calendarService.todoDel(map);
		if(todoDelRes) {
			mav.addObject("msg", "삭제가 완료되었습니다.");
			mav.addObject("url", "/main?selectDate="+returnPageDate);
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "삭제중 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/main?selectDate="+returnPageDate);
			mav.setViewName("/util/alert");
		}	
		return mav;
	}
	
	// main left - labelDel
	@RequestMapping(value="/labelDel", method=RequestMethod.GET)
	public ModelAndView labelDel(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//돌아갈 페이지 파라미터
		String returnPageDate = (String)map.get("returnPageDate");
		String side = (String)map.get("side");
		String color = (String)map.get("color");
		
		boolean todoDelRes = this.calendarService.todoDel(map);
		if(todoDelRes) {
			mav.addObject("msg", "삭제가 완료되었습니다.");
			mav.addObject("url", "/main?selectDate="+returnPageDate+"&side="+side+"&color="+color);
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "삭제중 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/main?selectDate="+returnPageDate+"&side="+side+"&color="+color);
			mav.setViewName("/util/alert");
		}	
		return mav;
	}	
	
	// side - memoWrite
	@RequestMapping(value="/memoWrite", method=RequestMethod.POST)
	public ModelAndView memoWrite(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//돌아갈 페이지 파라미터
		
		boolean memoWriteRes = this.calendarService.memoWrite(map);
		if(memoWriteRes) {
			mav.addObject("msg", "작성이 완료되었습니다.");
			mav.addObject("url", "/main?side=memo");
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "작성중 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/main?side=memo");
			mav.setViewName("/util/alert");
		}		
		return mav;
	}
	
	// mainWrite
	@RequestMapping(value="/mainWrite", method=RequestMethod.POST)
	public ModelAndView mainWrite(
			@RequestParam Map<String, Object> map,
			@RequestParam(value="mainWriteFile", required=false) MultipartFile file,
			HttpSession session) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//작성한 일자 가져오기
		String returnDate = map.get("mainWriteEventDate").toString();
		
		boolean mainWriteRes = this.calendarService.mainWrite(map, file);	
		if(mainWriteRes) {
			mav.addObject("msg", "작성이 완료되었습니다.");
			mav.addObject("url", "/main?selectDate="+returnDate);
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "작성중 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/main?selectDate="+returnDate);
			mav.setViewName("/util/alert");
		}		
		return mav;
	}
	
	// detailEdit - 파일 수정에서 업로드 결과가 db에 저장되는지 확인 해야함 (파일 업로드는 되는것같음)
	@RequestMapping(value="/detailEdit", method=RequestMethod.POST)
	public ModelAndView detailEdit(
			@RequestParam Map<String, Object> map,
			@RequestParam(value="detailModal_FileName", required=false) MultipartFile file,
			HttpSession session) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//수정한 일자 가져오기
		String returnDate = map.get("detailModal_eventDate").toString();
		//검색한 키워드 가져오기
		String keyWord = (String)map.get("detailModal_keyWord");
		//돌아갈 페이지 세팅
		String crtPage = (String)map.get("detailModal_crtPage");
		
		boolean detailEditRes = this.calendarService.detailEdit(map, file);
		
		if(keyWord==null || keyWord.isEmpty() || keyWord.equals("")) {
			if(detailEditRes) {
				mav.addObject("msg", "수정이 완료되었습니다.");
				mav.addObject("url", "/main?selectDate="+returnDate);
				mav.setViewName("/util/alert");
			}else {
				mav.addObject("msg", "작성중 중 문제가 발생했습니다. 다시 시도해주세요.");
				mav.addObject("url", "/main?selectDate="+returnDate);
				mav.setViewName("/util/alert");
			}		
		}else {
			if(detailEditRes) {
				mav.addObject("msg", "수정이 완료되었습니다.");
				mav.addObject("url", "/search?keyWord="+keyWord+"&page="+crtPage);
				mav.setViewName("/util/alert");
			}else {
				mav.addObject("msg", "작성중 중 문제가 발생했습니다. 다시 시도해주세요.");
				mav.addObject("url", "/search?keyWord="+keyWord+"&page="+crtPage);
				mav.setViewName("/util/alert");
			}		
		}
		
		return mav;
	}
	
	
	
	// search - 검색화면 시작 검색어를 입력하여 넘어옴
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView search(@RequestParam Map<String, Object> map, HttpSession session, Criteria cri) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//페이징 작업용
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(this.calendarService.searchListCnt(map));
	    map.put("pageStart", cri.getPageStart());
	    map.put("perPageNum",   cri.getPerPageNum());
		
		//검색어를 통해 리스트 얻어오기
		List<CalendarDTO> searchList = this.calendarService.searchList(map);

		//돌아갈 키워드 세팅
		String keyWord = (String)map.get("keyWord");
		//돌아갈 페이지 세팅
		String crtPage = (String)map.get("page");
		
		mav.addObject("crtPage", crtPage);
		mav.addObject("keyWord", keyWord);
		mav.addObject("searchList",searchList);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("/main/search");		
		return mav;
	}
	
	
	
	//searchDel 만들어야함
	@RequestMapping(value="/searchDel", method=RequestMethod.GET)
	public ModelAndView searchDel(@RequestParam Map<String, Object> map, HttpSession session) {	
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//돌아갈 페이지 파라미터
		String returnKeyWord = (String)map.get("returnKeyWord");
		
		boolean todoDelRes = this.calendarService.todoDel(map);
		if(todoDelRes) {
			mav.addObject("msg", "삭제가 완료되었습니다.");
			mav.addObject("url", "/search?keyWord="+returnKeyWord);
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "삭제중 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/search?keyWord="+returnKeyWord);
			mav.setViewName("/util/alert");
		}	
		return mav;
	}
}
