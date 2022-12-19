package pack.spring.aTodoNote.calendar;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.spring.aTodoNote.member.MemberDTO;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService CalendarService;

	// main left - todoWrite
	@RequestMapping(value="/todoWrite", method=RequestMethod.POST)
	public ModelAndView todoWrite(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();		
		String currentPageDate = (String)map.get("currentPageDate");		
		boolean todoWriteRes = this.CalendarService.todoWrite(map);
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
		
		boolean todoDelRes = this.CalendarService.todoDel(map);
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
		
		boolean todoDelRes = this.CalendarService.todoDel(map);
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
		
		boolean memoWriteRes = this.CalendarService.memoWrite(map);
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
	
}
