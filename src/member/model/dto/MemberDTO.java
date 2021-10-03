package member.model.dto;

import java.sql.Date;

public class MemberDTO {

	//필드
	private int no;
	private String id;
	private String passwd;
	private String name;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	private String juso1;
	private String juso2;
	private String juso3;
	private String juso4;
	private Date regi_date;//import java.sql.Date;
	
	private String passwdChk;//테이블 필드에는 없음
	private String phone;

	//생성자
	
	//메소드
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	//메소드
	
	//Getter & Setter	
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPasswd() {
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone1() {
		return phone1;
	}
	
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	
	public String getPhone2() {
		return phone2;
	}
	
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	
	public String getPhone3() {
		return phone3;
	}
	
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getJuso1() {
		return juso1;
	}
	
	public void setJuso1(String juso1) {
		this.juso1 = juso1;
	}
	
	public String getJuso2() {
		return juso2;
	}
	
	public void setJuso2(String juso2) {
		this.juso2 = juso2;
	}
	
	public String getJuso3() {
		return juso3;
	}
	
	public void setJuso3(String juso3) {
		this.juso3 = juso3;
	}
	
	public String getJuso4() {
		return juso4;
	}
	
	public void setJuso4(String juso4) {
		this.juso4 = juso4;
	}
	
	public Date getRegi_date() {
		return regi_date;
	}
	
	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	
	public String getPasswdChk() {
		return passwdChk;
	}
	
	public void setPasswdChk(String passwdChk) {
		this.passwdChk = passwdChk;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	
	
	
	
	

	
}
