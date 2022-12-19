package pack.spring.aTodoNote.calendar;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CalendarServiceImp implements CalendarService {

	@Autowired
	CalendarDAO calendarDao;
	
	// main left - todoWrite	
	@Override
	@Transactional
	public boolean todoWrite(Map<String, Object> map) {
		int cnt = this.calendarDao.todoWrite(map);
		int mNum = this.calendarDao.todoWriteGetMNum(map);
		map.put("mNum", mNum);
		cnt = this.calendarDao.todoWriteMatch(map);
		
		boolean todoWriteRes = false;
		if(cnt==1) todoWriteRes = true;
		
		return todoWriteRes;
	}

	// main left - todoPrint
	@Override
	public List<CalendarDTO> todoPrint(Map<String, Object> map) {
		List<CalendarDTO> todoList = null;
		todoList = this.calendarDao.todoPrint(map);
		return todoList;
	}

	// main left - todoDel
	@Override
	public boolean todoDel(Map<String, Object> map) {
		int cnt = this.calendarDao.todoDel(map);
		
		boolean todoDelRes = false;
		if(cnt==1) todoDelRes = true;
		
		return todoDelRes;
	}

	// side - labelPrint - color
	@Override
	public List<CalendarDTO> labelPrint(Map<String, Object> map) {
		List<CalendarDTO> labelList = null;
		labelList = this.calendarDao.labelList(map);
		return labelList;
	}

	// side - linkPrint
	@Override
	public List<CalendarDTO> linkPrint(Map<String, Object> map) {
		List<CalendarDTO> linkList = null;
		linkList = this.calendarDao.linkList(map);
		return linkList;
	}

	// side - filePrint
	@Override
	public List<CalendarDTO> filePrint(Map<String, Object> map) {
		List<CalendarDTO> fileList = null;
		fileList = this.calendarDao.fileList(map);	
		return fileList;
	}

	// side - memoPrint
	@Override
	public List<CalendarDTO> memoPrint(Map<String, Object> map) {
		List<CalendarDTO> memoList = null;
		memoList = this.calendarDao.memoList(map);	
		return memoList;
	}

	// side - memoWrite
	@Override
	public boolean memoWrite(Map<String, Object> map) {
		int cnt = this.calendarDao.memoWrite(map);
		boolean memoWriteRes = false;
		if(cnt==1) memoWriteRes = true;
		return memoWriteRes;
	}
	

}
