package pack.spring.aTodoNote.calendar;

import java.sql.Timestamp;

public class CalendarDTO {
	private int mNum;
	private String uId;
	private String subject;
	private String content;
	private String eventDate;
	private String link;
	private String fileName;
	private String originalFileName;
	private String fileSize;
	private Timestamp regTM;
	private String labelName;
	
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public Timestamp getRegTM() {
		return regTM;
	}
	public void setRegTM(Timestamp regTM) {
		this.regTM = regTM;
	}
	
	@Override
	public String toString() {
		return "CalendarDTO [mNum=" + mNum + ", uId=" + uId + ", subject=" + subject + ", content=" + content
				+ ", eventDate=" + eventDate + ", link=" + link + ", fileName=" + fileName + ", originalFileName="
				+ originalFileName + ", fileSize=" + fileSize + ", regTM=" + regTM + ", labelName=" + labelName + "]";
	}
	
}
