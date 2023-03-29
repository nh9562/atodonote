package pack.spring.aTodoNote.calendar;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CalendarServiceImp implements CalendarService {
	
	private static final String SAVEFOLER =
			//"D:/openAPI/silsp/p04_STS3_Spring_Legacy/Proj_A_Todo_Note/src/main/webapp/resources/fileUpload"; //실습실
			"C:/Users/Junwoo/Desktop/OpenAPI/silsp/p04_STS3_Spring_Legacy/Proj_A_Todo_Note/src/main/webapp/resources/fileUpload"; //집
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
	@Transactional
	public boolean todoDel(Map<String, Object> map) {		
		//mNum로 게시물 데이터 가져오기
		CalendarDTO CalDto = this.calendarDao.getCalDto(map); 
		
		//가져온 데이터에 해당하는 첨부파일 삭제
		if(CalDto.getFileName()!=null && !CalDto.getFileName().isEmpty()) {
			if(CalDto.getFileName()!="") {
				try {
				String delFileName = CalDto.getFileName();
				Path delFilePath = Paths.get(SAVEFOLER + "/" + delFileName);			
					Files.delete(delFilePath);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		//db데이터 삭제
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

	// mainWrite
	@Override
	@Transactional
	public boolean mainWrite(Map<String, Object> map, MultipartFile file) throws IllegalStateException, IOException {
		//1. 파일이 있는경우 파일업로드 후 파일명, 변경된파일명, 파일크기를 받아 맵에 저장
		MultipartFile uploadFile = file;
		String fileName=null, originalfileName=null;
		long fileSize=0;
		Long nowDate = System.currentTimeMillis();
		Timestamp timeStamp = new Timestamp(nowDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyDDmmHHmmss.ss");

		if(uploadFile.getOriginalFilename()!=null || uploadFile.getOriginalFilename().isEmpty()) {
			if(uploadFile.getOriginalFilename()!="") {
			//원래 파일명 가져오기
			originalfileName = uploadFile.getOriginalFilename();
			map.put("originalfileName", originalfileName);
			//파일 사이즈 가져오기
			fileSize = uploadFile.getSize();
			map.put("fileSize", fileSize);
			//바뀐 파일명 만들기
			fileName = sdf.format(timeStamp)+"_"+originalfileName;
			map.put("fileName", fileName);
			//경로
			uploadFile.transferTo(new File(SAVEFOLER + "/" + fileName));
			}
		}		
		
		//2. 메인 쓰기 실행
		int cnt = this.calendarDao.mainWrite(map);

		//3. 작성된 일정 넘버 가져오기
		String todoWriteUId = map.get("session_uId").toString();
		String todayCntAddInsert = map.get("mainWriteSubject").toString();
		String currentPageDate = map.get("mainWriteEventDate").toString();
		map.put("todoWriteUId", todoWriteUId);
		map.put("todayCntAddInsert", todayCntAddInsert);
		map.put("currentPageDate", currentPageDate);
		
		int mNum = this.calendarDao.todoWriteGetMNum(map);
		map.put("mNum", mNum);
		
		//4. 라벨 매칭 실행
		cnt = this.calendarDao.mainWriteMatch(map);
		
		boolean mainWriteRes = false;
		if(cnt==1) mainWriteRes = true;
		return mainWriteRes;
	}

	// detailEdit
	@Override
	@Transactional
	public boolean detailEdit(Map<String, Object> map, MultipartFile file) throws IllegalStateException, IOException {
		//1. 첨부된 파일이 있는경우 파일업로드 후 파일명, 변경된파일명, 파일크기를 받아 맵에 저장
		MultipartFile uploadFile = file;
		String fileName=null, originalfileName=null;
		long fileSize=0;
		Long nowDate = System.currentTimeMillis();
		Timestamp timeStamp = new Timestamp(nowDate);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyDDmmHHmmss.ss");

		//첨부된 파일이 있다면 업로드
		if(uploadFile.getOriginalFilename()!=null || uploadFile.getOriginalFilename().isEmpty()) {
			if(uploadFile.getOriginalFilename()!="") {
				//원래 파일명 가져오기
				originalfileName = uploadFile.getOriginalFilename();
				map.put("originalfileName", originalfileName);
				//파일 사이즈 가져오기
				fileSize = uploadFile.getSize();
				map.put("fileSize", fileSize);
				//바뀐 파일명 만들기
				fileName = sdf.format(timeStamp)+"_"+originalfileName;
				map.put("fileName", fileName);
				//경로
				uploadFile.transferTo(new File(SAVEFOLER + "/" + fileName));
			}
		}

		int cnt =0;
		//첨부된 파일이 없다면 조건
		if(originalfileName==null || originalfileName.isEmpty() || originalfileName.equals("") ) {
			//첨부된 파일이 없을때 업데이트문
			cnt = this.calendarDao.detailEditNFile(map);
		}else {
			//이전 첨부 파일 지우기
			//mNum로 게시물 데이터 가져오기
			CalendarDTO CalDto = this.calendarDao.getCalDtoDetail(map); 
			
			//가져온 데이터에 해당하는 첨부파일 삭제
			if(CalDto.getFileName()!=null && !CalDto.getFileName().isEmpty()) {
				if(CalDto.getFileName()!="") {
					try {
					String delFileName = CalDto.getFileName();
					Path delFilePath = Paths.get(SAVEFOLER + "/" + delFileName);			
						Files.delete(delFilePath);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}			
			
			//첨부된 파일이 있을때 업데이트문
			cnt = this.calendarDao.detailEditFile(map);
		}		
		
		cnt = this.calendarDao.detailEditMatch(map);
		
		boolean detailEditRes = false;
		if(cnt==1) detailEditRes = true;
		return detailEditRes;		
		
	}

	// searchList	
	@Override
	public List<CalendarDTO> searchList(Map<String, Object> map) {
		List<CalendarDTO> searchList = null;		
		searchList = this.calendarDao.searchList(map);
		return searchList;
	}
	
	//searchListCnt
	public int searchListCnt(Map<String, Object> map){
		int searchListCnt = this.calendarDao.searchListCnt(map);
	    return searchListCnt;
	}

}
