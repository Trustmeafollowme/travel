package spot.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class SpotBean {
	private String snum;
	private String name;
	private String xpos;
	private String ypos;
	private String address;
	@NotEmpty(message = "내용을 적으시오")
	private String content;
	private String image;
	private String image2;
	private String image3;

	private MultipartFile upload; 
	private MultipartFile upload2; 
	private MultipartFile upload3; 

	
	public MultipartFile getUpload() {
		return upload;
	}

	public MultipartFile getUpload2() {
		return upload2;
	}

	public MultipartFile getUpload3() {
		return upload3;
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
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getXpos() {
		return xpos;
	}
	public void setXpos(String xpos) {
		this.xpos = xpos;
	}
	public String getYpos() {
		return ypos;
	}
	public void setYpos(String ypos) {
		this.ypos = ypos;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
}
