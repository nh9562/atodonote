package pack.spring.aTodoNote.calendar;

import java.util.List;
import java.util.Map;

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
	

}
