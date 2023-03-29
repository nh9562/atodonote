package pack.spring.aTodoNote.member;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("memDto")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	//회원가입 화면
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/signUp");
		return mav;
	}

	//아이디 중복검사
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public ModelAndView idCheck(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean idUse = this.memberService.idCheck(map);
		String uId = map.get("uId").toString();
		mav.addObject("uId",uId);
		mav.addObject("idUse",idUse);
		mav.setViewName("/member/idCheck");
		return mav;
	}
	
	//연락처 중복검사
	@RequestMapping(value="/telCheck", method=RequestMethod.GET)
	public ModelAndView telCheck(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean telUse = this.memberService.telCheck(map);
		String uTel = map.get("uTel").toString();
		mav.addObject("uTel",uTel);
		mav.addObject("telUse",telUse);
		mav.setViewName("/member/telCheck");
		return mav;
	}
	
	//우편번호 화면
	@RequestMapping(value="/zipCheck", method=RequestMethod.GET)
	public ModelAndView zipCheck(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/zipCheck");
		return mav;
	}
	
	//회원가입 실행
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public ModelAndView signUpPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean signUpRes = this.memberService.signUp(map);
		if(signUpRes) {
			mav.addObject("msg", "회원가입이 완료되었습니다.");
			mav.addObject("url", "/");
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "회원가입 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/signUp");
			mav.setViewName("/util/alert");
		}		
		return mav;
	}
	
	//로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		MemberDTO memDto = this.memberService.login(map);
		
		if(memDto!=null) {
			String uName = memDto.getuName();
			if(uName!=null && uName!="") {
				Date today = new Date();
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
				mav.addObject("memDto", memDto);
				mav.addObject("msg", uName+"님 접속을 환영합니다.");
				mav.addObject("url", "/main?selectDate="+date.format(today));
				mav.setViewName("/util/alert");
			}
		}else {
			mav.addObject("msg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			mav.addObject("url", "/");
			mav.setViewName("/util/alert");
		}
		return mav;
	}
	
	//아이디 찾기 화면
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/findId");
		return mav;
	}
	
	//아이디 찾기 기능
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public ModelAndView findIdPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		String findIdRes = this.memberService.findId(map);
		mav.addObject("findIdRes", findIdRes);
		mav.setViewName("/member/findIdRes");
		return mav;
	}	
	
	//비밀번호 찾기 화면
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public ModelAndView findPw() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/findPw");
		return mav;
	}
	
	//비밀번호 찾기 - 1 : 유저넘버 찾아오기
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public ModelAndView findPwPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		String findPwRes = "";
		findPwRes = this.memberService.findPw(map);	//검색해서 유저넘버를 받아옴		
		mav.addObject("findPwRes", findPwRes);				//유저번호를 뷰로 넘겨주자
		mav.setViewName("/member/findPwRes");
		return mav;
	}
	
	//비밀번호 찾기 - 2 : 유저넘버에 해당하는 비밀번호 변경
	@RequestMapping(value="/findPwEdit", method=RequestMethod.POST)
	public ModelAndView findPwEdit(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean findPwEditRes = this.memberService.findPwEdit(map);
		if(findPwEditRes) {
			mav.addObject("msg", "비밀번호 변경이 완료되었습니다.");
			mav.addObject("url", "/");
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "비밀번호 변경 중 문제가 발생했습니다. 다시 시도해주세요.");
			mav.addObject("url", "/findPw");
			mav.setViewName("/util/alert");
		}	
		return mav;
	}
	
	//로그아웃 기능
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public ModelAndView logout(SessionStatus sessionStatus) {
		ModelAndView mav = new ModelAndView();
		sessionStatus.setComplete();		
		mav.setViewName("redirect:/");
		return mav;
	}	
	
	//회원정보 수정
	@RequestMapping(value="/memEdit", method=RequestMethod.POST)
	public ModelAndView memEdit(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean memEditRes = this.memberService.memEdit(map);
		MemberDTO memDto = this.memberService.login(map);
		if(memEditRes) {	
			mav.addObject("memDto", memDto);		
			mav.addObject("msg", "회원정보 변경이 완료되었습니다.");
			mav.addObject("url", "/");
			mav.setViewName("/util/alert");
			
		}else {
			mav.addObject("msg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
			mav.addObject("go", "-1");
			mav.setViewName("/util/go");
		}		
		return mav;
	}	
	
	//비밀번호 수정
	@RequestMapping(value="/uPwEdit", method=RequestMethod.POST)
	public ModelAndView uPwEdit(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean memEditRes = this.memberService.uPwEdit(map);
		if(memEditRes) {	
			mav.addObject("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");
			mav.addObject("url", "/logout");
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "현재 비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
			mav.addObject("go", "-1");
			mav.setViewName("/util/go");
		}		
		return mav;
	}
	
	//회원탈퇴
	@RequestMapping(value="/memOut", method=RequestMethod.POST)
	public ModelAndView memOut(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boolean memOutRes = this.memberService.memOut(map);
		if(memOutRes) {	
			mav.addObject("msg", "회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			mav.addObject("url", "/logout");
			mav.setViewName("/util/alert");
		}else {
			mav.addObject("msg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
			mav.addObject("go", "-1");
			mav.setViewName("/util/go");
		}		
		return mav;
	}
	
}
