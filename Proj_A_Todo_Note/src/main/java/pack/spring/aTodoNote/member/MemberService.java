package pack.spring.aTodoNote.member;

import java.util.Map;

public interface MemberService {

	//아이디 중복검사
	boolean idCheck(Map<String, Object> map);

	//연락처 중복검사
	boolean telCheck(Map<String, Object> map);

	//회원가입
	boolean signUp(Map<String, Object> map);

	//로그인
	MemberDTO login(Map<String, Object> map);

	//아이디 찾기
	String findId(Map<String, Object> map);

	//비밀번호 찾기 - 1 : 유저넘버 찾아오기
	String findPw(Map<String, Object> map);
	
	//비밀번호 찾기 - 2 : 유저넘버에 해당하는 비밀번호 변경
	boolean findPwEdit(Map<String, Object> map);

	//회원정보 변경
	boolean memEdit(Map<String, Object> map);
	
	//비밀번호 변경
	boolean uPwEdit(Map<String, Object> map);

	//회원탈퇴
	boolean memOut(Map<String, Object> map);
}
