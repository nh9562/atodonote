package pack.spring.aTodoNote.member;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//아이디 중복검사
	public String idCheck(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.idCheck" ,map);
	}

	//아이디 중복검사
	public String telCheck(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.telCheck" ,map);
	}

	//회원가입
	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("member.insert", map);
	}
	
	//회원가입 - 권한매칭
	public int insertMatch(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("member.insertMatch", map);
	}

	//로그인 처리
	public MemberDTO login(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.login", map);
	}

	//아이디 찾기
	public String findId(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.findId", map);
	}
	
	//비밀번호 찾기 - 1 : 유저넘버 찾아오기
	public String findPw(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("member.findPw", map);
	}
	
	//비밀번호 찾기 - 2 : 유저넘버에 해당하는 비밀번호 변경
	public int findPwEdit(Map<String, Object> map) {
		return this.sqlSessionTemplate.update("member.findPwEdit", map);
	}

	//회원정보 변경
	public int memEdit(Map<String, Object> map) {
		return this.sqlSessionTemplate.update("member.memEdit", map);
	}
	
	//비밀번호 변경
	public int uPwEdit(Map<String, Object> map) {
		return this.sqlSessionTemplate.update("member.uPwEdit", map);
	}

	//회원탈퇴
	public int memOut(Map<String, Object> map) {
		return this.sqlSessionTemplate.delete("member.memOut", map);
	}


	

	
}
