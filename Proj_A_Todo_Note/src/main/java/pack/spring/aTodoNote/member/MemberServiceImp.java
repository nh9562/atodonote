package pack.spring.aTodoNote.member;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImp implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	//아이디 중복검사
	@Override
	public boolean idCheck(Map<String, Object> map) {		
		String idCheckRes = this.memberDao.idCheck(map); 
		boolean idUse = true;
		if(idCheckRes.equals("1")) idUse = false; 
		return idUse;
	}
	
	//연락처 중복검사
	@Override
	public boolean telCheck(Map<String, Object> map) {
		String telCheckRes = this.memberDao.telCheck(map); 
		boolean telUse = true;
		if(telCheckRes.equals("1")) telUse = false; 
		return telUse;
	}

	//회원가입
	@Override
	@Transactional
	public boolean signUp(Map<String, Object> map) {
		int cnt = this.memberDao.insert(map);
		cnt = this.memberDao.insertMatch(map);
		
		boolean signUpRes = false;		
		if(cnt==1) signUpRes = true;
		
		return signUpRes;
	}

	//로그인
	@Override
	public MemberDTO login(Map<String, Object> map) {
		MemberDTO memDto = this.memberDao.login(map);		
		return memDto;
	}

	//아이디 찾기
	@Override
	public String findId(Map<String, Object> map) {
		String findIdRes = this.memberDao.findId(map);
		return findIdRes;
	}

	//비밀번호찾기 - 1 : 유저넘버 찾아오기
	@Override
	public String findPw(Map<String, Object> map) {
		String findPwRes = this.memberDao.findPw(map);
		return findPwRes;
	}

	//비밀번호 찾기 - 2 : 유저넘버에 해당하는 비밀번호 변경
	@Override
	public boolean findPwEdit(Map<String, Object> map) {
		int cnt = this.memberDao.findPwEdit(map);
		boolean findPwEditRes = false;
		if(cnt==1) findPwEditRes = true;
		return findPwEditRes;
	}

	//회원정보 변경
	@Override
	public boolean memEdit(Map<String, Object> map) {
		int cnt = this.memberDao.memEdit(map);
		boolean memEditRes = false;
		if(cnt==1) memEditRes = true;
		return memEditRes;
	}
	
	//비밀번호 변경
	@Override
	public boolean uPwEdit(Map<String, Object> map) {
		int cnt = this.memberDao.uPwEdit(map);
		boolean uPwEditRes = false;
		if(cnt==1) uPwEditRes = true;
		return uPwEditRes;
	}

	//회원탈퇴
	@Override
	public boolean memOut(Map<String, Object> map) {
		int cnt = this.memberDao.memOut(map);
		boolean memOutRes = false;
		if(cnt==1) memOutRes = true;
		return memOutRes;
	}
	
	

}
