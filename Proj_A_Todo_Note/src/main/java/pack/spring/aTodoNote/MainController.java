package pack.spring.aTodoNote;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.spring.aTodoNote.calendar.CalendarDTO;
import pack.spring.aTodoNote.calendar.CalendarService;
import pack.spring.aTodoNote.member.MemberDTO;

// a1에서 추가한 주석

@Controller
public class MainController {
	
	@Autowired
	CalendarService calendarService;
	
	//시작 화면
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView index(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		memDto = (MemberDTO)session.getAttribute("memDto");
		if(memDto!=null) {
			String session_uId = memDto.getuId();
			if(session_uId!=null && session_uId!="") {
				mav.setViewName("/main");
			}	
		}else {	
			mav.setViewName("/index");
		}
		return mav;
	}
	
	//메인 화면	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView main(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = new MemberDTO();
		
		//세션에서 Dto 가져와 uId를 map에 넣기
		memDto = (MemberDTO)session.getAttribute("memDto");
		String session_uId = memDto.getuId();
		map.put("session_uId", session_uId);
		
		//메인 날짜 선택으로 main 들어온 경우
		if(map.get("selectDate")!=null) {
			String selectDate = map.get("selectDate").toString();
			mav.addObject("selectDate", selectDate);
		}
		
		//메인 상부 버튼으로 main 들어온 경우		
		if(map.get("side")!=null) {
			String side = map.get("side").toString();
			String color = "none";
			
			//사이드 종류별 체크
			if(side.equals("label")) {
				if(map.get("color")!=null) color = map.get("color").toString();
				//컬러가 있는 경우 컬러값을 받아와 라벨 리스트를 셀렉트, 리스트를 날려줌
				List<CalendarDTO> labelList = this.calendarService.labelPrint(map);			
				mav.addObject("labelList", labelList);
			}else if(side.equals("link")) {
				List<CalendarDTO> linkList = this.calendarService.linkPrint(map);
				mav.addObject("linkList", linkList);
			}else if(side.equals("file")) {
				List<CalendarDTO> fileList = this.calendarService.filePrint(map);
				mav.addObject("fileList", fileList);
			}else if(side.equals("memo")) {
				List<CalendarDTO> memoList = this.calendarService.memoPrint(map);
				mav.addObject("memoList", memoList);
			}
			
			//뷰 조건 처리용 파라미터 날리기
			mav.addObject("side", side);
			mav.addObject("color", color);
			
			//이동
			mav.setViewName("/main/side");
			return mav;
		}else {
			//메인 왼쪽 리스트 셀렉트, 리스트 날려줌
			List<CalendarDTO> todoList = this.calendarService.todoPrint(map);
			mav.addObject("todoList", todoList);
		}
		
		mav.setViewName("/main");
		return mav;
	}

}
