package pack.spring.aTodoNote.calendar;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface CalendarService {

	// main left - todoWrite	
	boolean todoWrite(Map<String, Object> map);

	// main left - todoPrint
	List<CalendarDTO> todoPrint(Map<String, Object> map);

	// main left- todoDel
	boolean todoDel(Map<String, Object> map);

	// side - labelPrint - color
	List<CalendarDTO> labelPrint(Map<String, Object> map);

	// side - linkPrint
	List<CalendarDTO> linkPrint(Map<String, Object> map);

	// side - filePrint
	List<CalendarDTO> filePrint(Map<String, Object> map);

	// side - memoPrint
	List<CalendarDTO> memoPrint(Map<String, Object> map);

	// side - memoWrite
	boolean memoWrite(Map<String, Object> map);

	// mainWrite
	boolean mainWrite(Map<String, Object> map, MultipartFile file) throws IllegalStateException, IOException;

	// detailEdit
	boolean detailEdit(Map<String, Object> map, MultipartFile file) throws IllegalStateException, IOException;

	// searchList
	List<CalendarDTO> searchList(Map<String, Object> map);
	
	//searchListCnt
	public int searchListCnt(Map<String, Object> map);
	
}
