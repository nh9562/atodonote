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

	
	
}
