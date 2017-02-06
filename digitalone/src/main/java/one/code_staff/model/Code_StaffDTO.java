package one.code_staff.model;

public class Code_StaffDTO {
	
	//code_skill
	private int skill_code;
	private String skill_name;
	
	//code_religion
	private int religion_code;
	private String religion_name;
	
	//code_school
	private int school_code;
	private String school_name;
	
	//staff
	private int staff_no;
	private String staff_name;
	private String jumin_no;
	/*private int school_code;
	private int religion_code;*/
	private String graduate_day;
	
	//staff_skill
	private int staff_skill_no;
	/*private int staff_no;
	private int skill_code;*/
	private String contents;
	
	
	/*****************/
	private String rawstr; //
	private int count; //
	
	

	

	public String getRawstr() {
		return rawstr;
	}


	public void setRawstr(String rawstr) {
		this.rawstr = rawstr;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Code_StaffDTO() {
		super();
	}


	public Code_StaffDTO(int skill_code, String skill_name, int religion_code, String religion_name, int school_code,
			String school_name, int staff_no, String staff_name, String jumin_no, String graduate_day,
			int staff_skill_no, String contents) {
		super();
		this.skill_code = skill_code;
		this.skill_name = skill_name;
		this.religion_code = religion_code;
		this.religion_name = religion_name;
		this.school_code = school_code;
		this.school_name = school_name;
		this.staff_no = staff_no;
		this.staff_name = staff_name;
		this.jumin_no = jumin_no;
		this.graduate_day = graduate_day;
		this.staff_skill_no = staff_skill_no;
		this.contents = contents;
	}


	public int getSkill_code() {
		return skill_code;
	}


	public void setSkill_code(int skill_code) {
		this.skill_code = skill_code;
	}


	public String getSkill_name() {
		return skill_name;
	}


	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}


	public int getReligion_code() {
		return religion_code;
	}


	public void setReligion_code(int religion_code) {
		this.religion_code = religion_code;
	}


	public String getReligion_name() {
		return religion_name;
	}


	public void setReligion_name(String religion_name) {
		this.religion_name = religion_name;
	}


	public int getSchool_code() {
		return school_code;
	}


	public void setSchool_code(int school_code) {
		this.school_code = school_code;
	}


	public String getSchool_name() {
		return school_name;
	}


	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}


	public int getStaff_no() {
		return staff_no;
	}


	public void setStaff_no(int staff_no) {
		this.staff_no = staff_no;
	}


	public String getStaff_name() {
		return staff_name;
	}


	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}


	public String getJumin_no() {
		return jumin_no;
	}


	public void setJumin_no(String jumin_no) {
		this.jumin_no = jumin_no;
	}


	public String getGraduate_day() {
		return graduate_day;
	}


	public void setGraduate_day(String graduate_day) {
		this.graduate_day = graduate_day;
	}


	public int getStaff_skill_no() {
		return staff_skill_no;
	}


	public void setStaff_skill_no(int staff_skill_no) {
		this.staff_skill_no = staff_skill_no;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	@Override
	public String toString() {
		return "Code_StaffDTO [skill_code=" + skill_code + ", skill_name=" + skill_name + ", religion_code="
				+ religion_code + ", religion_name=" + religion_name + ", school_code=" + school_code + ", school_name="
				+ school_name + ", staff_no=" + staff_no + ", staff_name=" + staff_name + ", jumin_no=" + jumin_no
				+ ", graduate_day=" + graduate_day + ", staff_skill_no=" + staff_skill_no + ", contents=" + contents
				+ ", rawstr=" + rawstr + ", count=" + count + "]";
	}
	

}
