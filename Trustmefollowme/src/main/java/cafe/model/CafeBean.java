package cafe.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class CafeBean {
	private int cnum; 			// ī�� ��ȣ
	
	@NotBlank(message = "ī�� �̸��� �Է��ϼ���.")
	private String name;		// ī�� �̸�
	
	@NotBlank(message = "ī�� ��ġ ������ �Է��ϼ���.")
	private String xpos;		// ī�� ��ġ ����
	
	@NotBlank(message = "ī�� ��ġ �浵�� �Է��ϼ���.")
	private String ypos;		// ī�� ��ġ �浵
	
	@NotBlank(message = "ī�� �ּҸ� �Է��ϼ���.")
	private String address;	// ī�� �ּ�
	
	@NotBlank(message = "ī�� ��ȭ ���۹�ȣ�� �Է��ϼ���.")
	private String ctel1;		// ī�� ��ȭ ���� ��ȣ
	
	@NotBlank(message = "ī�� ��ȭ �߰� ��ȣ�� �Է��ϼ���.")
	private String ctel2;		// ī�� ��ȭ �߰� ��ȣ
	
	@NotBlank(message = "ī�� ��ȭ �� ��ȣ�� �Է��ϼ���.")
	private String ctel3;		// ī�� ��ȭ �� ��ȣ
	
	@NotEmpty(message = "ī�� ���� ���ڸ� �Է��ϼ���.")
	private String c_date;		// ī�� ���� ����
	
	@NotEmpty(message = "ī�� ���� ���� �ð��� �Է��ϼ���.")
	private String ctime1;		// ī�� ���� ���� �ð�
	
	@NotEmpty(message = "ī�� ���� ���� �ð��� �Է��ϼ���.")
	private String ctime2;		// ī�� ���� ���� �ð�
	
	@NotEmpty(message = "ī�� ���� ������ �Է��ϼ���.")
	private String image;		// ī�� ����(���� ����)
	
	@NotEmpty(message = "ī�� ����2�� �Է��ϼ���.")
	private String image2;		// ī�� ����2
	
	@NotEmpty(message = "ī�� ����3�� �Է��ϼ���.")
	private String image3;		// ī�� ����3
	
	@NotEmpty(message = "ī�� ����4�� �Է��ϼ���.")
	private String image4;		// ī�� ����4
	
	@NotEmpty(message = "ī�� ����5�� �Է��ϼ���.")
	private String image5;		// ī�� ����5
	
	private MultipartFile upload; // ī�� ���� ���� ���ε�
	private MultipartFile upload2; // ī�� ����2 ���ε�
	private MultipartFile upload3; // ī�� ����3 ���ε�
	private MultipartFile upload4; // ī�� ����4 ���ε�
	private MultipartFile upload5; // ī�� ����5 ���ε�
	
	private String d_image; // ���� �� ���� ī�� ���� ����
	private String d_image2; // ���� �� ���� ī�� ����2
	private String d_image3; // ���� �� ���� ī�� ����3
	private String d_image4; // ���� �� ���� ī�� ����4
	private String d_image5; // ���� �� ���� ī�� ����5
	
	public MultipartFile getUpload() {
		return upload;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public MultipartFile getUpload3() {
		return upload3;
	}
	public MultipartFile getUpload4() {
		return upload4;
	}
	public MultipartFile getUpload5() {
		return upload5;
	}
	public String getD_image() {
		return d_image;
	}
	public String getD_image2() {
		return d_image2;
	}
	public String getD_image3() {
		return d_image3;
	}
	public String getD_image4() {
		return d_image4;
	}
	public String getD_image5() {
		return d_image5;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		if(this.upload != null) {
			image = upload.getOriginalFilename();
		}
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		if(this.upload2 != null) {
			image2 = upload2.getOriginalFilename();
		}
	}
	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
		if(this.upload3 != null) {
			image3 = upload3.getOriginalFilename();
		}
	}
	public void setUpload4(MultipartFile upload4) {
		this.upload4 = upload4;
		if(this.upload4 != null) {
			image4 = upload4.getOriginalFilename();
		}
	}
	public void setUpload5(MultipartFile upload5) {
		this.upload5 = upload5;
		if(this.upload5 != null) {
			image5 = upload5.getOriginalFilename();
		}
	}
	public void setD_image(String d_image) {
		this.d_image = d_image;
	}
	public void setD_image2(String d_image2) {
		this.d_image2 = d_image2;
	}
	public void setD_image3(String d_image3) {
		this.d_image3 = d_image3;
	}
	public void setD_image4(String d_image4) {
		this.d_image4 = d_image4;
	}
	public void setD_image5(String d_image5) {
		this.d_image5 = d_image5;
	}
	public int getCnum() {
		return cnum;
	}
	public String getName() {
		return name;
	}
	public String getXpos() {
		return xpos;
	}
	public String getYpos() {
		return ypos;
	}
	public String getAddress() {
		return address;
	}
	public String getCtel1() {
		return ctel1;
	}
	public String getCtel2() {
		return ctel2;
	}
	public String getCtel3() {
		return ctel3;
	}
	public String getC_date() {
		return c_date;
	}
	public String getCtime1() {
		return ctime1;
	}
	public String getCtime2() {
		return ctime2;
	}
	public String getImage() {
		return image;
	}
	public String getImage2() {
		return image2;
	}
	public String getImage3() {
		return image3;
	}
	public String getImage4() {
		return image4;
	}
	public String getImage5() {
		return image5;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setXpos(String xpos) {
		this.xpos = xpos;
	}
	public void setYpos(String ypos) {
		this.ypos = ypos;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setCtel1(String ctel1) {
		this.ctel1 = ctel1;
	}
	public void setCtel2(String ctel2) {
		this.ctel2 = ctel2;
	}
	public void setCtel3(String ctel3) {
		this.ctel3 = ctel3;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public void setCtime1(String ctime1) {
		this.ctime1 = ctime1;
	}
	public void setCtime2(String ctime2) {
		this.ctime2 = ctime2;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	
}
