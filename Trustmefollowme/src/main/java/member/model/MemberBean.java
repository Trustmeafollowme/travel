package member.model;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

public class MemberBean {
	private int num;
	private int myjNum;
	
	@NotBlank(message = "이메일을 입력하세요.")
	private String email;
	
	private String password;
	
	@NotBlank(message = "이름을 입력하세요.")
	private String name;
	
	@NotBlank(message = "생일을 입력하세요.")
	private String birth;
	
	@NotBlank(message = "주소를 입력하세요.")
	private String address1;
	
	private String address2;
	
	@NotBlank(message = "전화번호를 입력하세요.")
	@Pattern(regexp = "\\d{3}-\\d{4}-\\d{4}", message = "전화번호를 다음 예시대로 입력하세요. 예시)010-1234-5678")
	private String mtel;
	public int getMyjNum() {
		return myjNum;
	}
	public void setMyjNum(int myjNum) {
		this.myjNum = myjNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	
	
	
}