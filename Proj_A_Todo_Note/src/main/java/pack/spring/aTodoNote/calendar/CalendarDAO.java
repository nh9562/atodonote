package pack.spring.aTodoNote.calendar;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// main left - todoWrite	
	public int todoWrite(Map<String, Object> map) {
		return sqlSessionTemplate.insert("calendar.todoWrite", map);
	}

	// main left - todoWrite - 작성넘버
	public int todoWriteGetMNum(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("todoWriteGetMNum", map);
	}
	
	// main left - todoWrite - 라벨매칭
	public int todoWriteMatch(Map<String, Object> map) {
		return sqlSessionTemplate.insert("calendar.todoWriteMatch", map);
	}
	
	// main left - todoPrint
	public List<CalendarDTO> todoPrint(Map<String, Object> map) {		
		return sqlSessionTemplate.selectList("calendar.todoPrint", map);
	}

	// main left - todoDel
	public int todoDel(Map<String, Object> map) {
		return sqlSessionTemplate.delete("calendar.todoDel", map);
	}

	// main left - todoDel 이용할 데이터
	public CalendarDTO getCalDto(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("calendar.getCalDto", map);
	}	
	
	
	// side - labelPrint - color
	public List<CalendarDTO> labelList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("calendar.labelList", map);
	}

	// side - linkPrint
	public List<CalendarDTO> linkList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("calendar.linkList", map);
	}

	// side - filePrint
	public List<CalendarDTO> fileList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("calendar.fileList", map);
	}
	
	// side - memoPrint
	public List<CalendarDTO> memoList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("calendar.memoList", map);
	}
	
	// side - memoWrite
	public int memoWrite(Map<String, Object> map) {
		return sqlSessionTemplate.insert("calendar.memoWrite", map);
	}

	// mainWrite
	public int mainWrite(Map<String, Object> map) {
		return sqlSessionTemplate.insert("calendar.mainWrite", map);
	}

	// mainWriteMatch
	public int mainWriteMatch(Map<String, Object> map) {
		return sqlSessionTemplate.insert("calendar.mainWriteMatch", map);
	}

	// detailEditNFile
	public int detailEditNFile(Map<String, Object> map) {
		return sqlSessionTemplate.update("calendar.detailEditNFile", map);
	}
	
	// detailEditFile
	public int detailEditFile(Map<String, Object> map) {
		return sqlSessionTemplate.update("calendar.detailEditFile", map);
	}

	// detailEditLabelMatchTF - 매칭여부확인
	public int detailEditLabelMatchTF(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("calendar.detailEditLabelMatchTF", map);
	}
	
	// detailEditMatch - 매칭여부 확인해서 되어있으면 업데이트
	public int detailEditMatch(Map<String, Object> map) {
		return sqlSessionTemplate.update("calendar.detailEditMatch", map);
	}

	// detailInsertMatch - 매칭여부 확인해서 없으면 새로 인서트
	public int detailInsertMatch(Map<String, Object> map) {
		return sqlSessionTemplate.insert("calendar.detailInsertMatch", map);
	}


	// main left - todoDel 이용할 데이터
	public CalendarDTO getCalDtoDetail(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("calendar.getCalDtoDetail", map);
	}
	
	// searchList	
	public List<CalendarDTO> searchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("calendar.searchList", map);
	}	
	
	//searchListCnt
	public int searchListCnt(Map<String, Object> map){
	    return sqlSessionTemplate.selectOne("calendar.searchListCnt", map);
	}

	
	
}
