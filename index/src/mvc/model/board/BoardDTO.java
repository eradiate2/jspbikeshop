package mvc.model.board;

//게시판관리
public class BoardDTO {
	
	//멤버변수
	private int num;
	private String id;
	private String name;
	private String subject;
	private String content;
	private String regdate;
	private int hit;
	private String ip;
	
	//기본생성자
	//생성자 기능 : 멤버변수 값 초기화
	public BoardDTO() {
		super(); //상위클래스의 기본생성자실행
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
