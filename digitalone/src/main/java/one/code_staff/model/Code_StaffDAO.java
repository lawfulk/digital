package one.code_staff.model;

import java.util.*;

public interface Code_StaffDAO {
	
	// 키워드 버튼
	public List<Code_StaffDTO> staff_findList(String name,String religion_code,String sex, String school_code, String skill_code,String cal,String cal2);
	
	// 전부검색 버튼 
	public List<Code_StaffDTO> staff_all();

	// 검색건수 토탈
	public int all_Find_Cnt(String name,String religion_code,String sex, String school_code, String skill_code);
	
	// 페이징
	public int getTotalCnt();
	
	// 사원등록
	public int staff_intput(Code_StaffDTO dto);
	
	// 사원정보 불러오기 = 게시글 본문보기
	public Code_StaffDTO staff_updel_info(int staff_no);
	
	// 사원 수정하기
	public int staff_updel_update(Code_StaffDTO dto);
	
	//삭제하기
	public int staff_del(int staff_no);
	
	
	// test
	public List<Code_StaffDTO> test(String staff_name);
	public int bWrite(Code_StaffDTO dto);
	public int cWrite(int staff_no,String skill_code);


}
