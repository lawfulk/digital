package one.code_staff.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

/*@Repository*/
public class Code_StaffDAOImple implements Code_StaffDAO {

   private SqlSessionTemplate sqlMap;

   public Code_StaffDAOImple(SqlSessionTemplate sqlMap) {
      super();
      this.sqlMap = sqlMap;
   }
   
   // 키워드 버튼(첫 메인 리스트 페이지)
   public List<Code_StaffDTO> staff_findList(String name,String religion_code,String sex, String school_code, String skill_code,String cal,String cal2) {
   //   int startNum=(cp-1)*ls+1;
      //int endNum=cp*ls;
      
      //System.out.println("2"+name); // 순서확인
      
      Map<String,Object> map = new HashMap<String, Object>();
      map.put("name", name);
      map.put("religion_code", religion_code);
      map.put("sex", sex);
      map.put("school_code", school_code);
      map.put("skill_code", skill_code);
      map.put("cal", cal);
      map.put("cal2", cal2);

      
      try{
         for(int i=1;i<3;i++){
      
            if(school_code.length()==(i-1)*2+1){
               String one = i+"";
               System.out.println("학력 "+i+"개");
               map.put("school_indicator", one);

               for(int j=1;j<=i;j++){
               map.put("school_code_"+j+"", school_code.substring((j-1)*2,(j-1)*2+1));
               }
            }
         }
         
   
      }catch(Exception e){}
         
      
      try {
         
         for(int i=1;i<5/*스킬이 총5개*/;i++){
            if (skill_code.length()==(i-1)*2+1/*i가 1일때 1 i가 2일때 3 1,3,5,,,*/) {
               String one =i+"";
               System.out.println("기술"+i+"개");
               map.put("skill_indicator", one);
               for(int j=1;j<=i;j++){
               map.put("skill_code_"+j+"", skill_code.substring((j-1)*2,(j-1)*2+1));
               }
            }      
         }

      } catch (Exception e) {}
      
      
   //   map.put("startNum", startNum);
      //map.put("endNum", endNum);
      
      //System.out.println("start: "+startNum+"/ end: "+endNum);
      
   
      //map.put("school", school);
      //map.put("skill", skill);
      List<Code_StaffDTO> list = sqlMap.selectList("staff_all_find",map);// sql.xml <select id="staff_find" 값-> staff_find 
   
      // 그래서 왜 초기화 되는거? ->
      System.out.println("List 사이즈(여기서 초기화됨.) :"+list.size());
      //System.out.println("3"+name);// 순서확인
      return list;
   }
   
   //총게시물 수 반환:페이징
   public int getTotalCnt() {
      int count = sqlMap.selectOne("getTotalCnt");
      return count==0?1:count; //최소한의 1의 페이지 지정
   }
   
   // 전부검색 버튼
   public List<Code_StaffDTO> staff_all() {
      List<Code_StaffDTO> list = sqlMap.selectList("staff_all");
      System.out.println("List 사이즈(초기화안됫을때): "+list.size());
      return list;
   }
   // 검색 건수 토탈
   public int all_Find_Cnt(String name,String religion_code,String sex, String school_code, String skill_code) {
      Map<String,Object> map = new HashMap<String, Object>();
      map.put("name", name);
      map.put("religion_code", religion_code);
      map.put("sex", sex);
      map.put("school_code", school_code);
      map.put("skill_code", skill_code);
      
      
      System.out.println(school_code);
      
      try{
         if(school_code.length()==1){
            // 한개선택
            String one = "1";
            System.out.println("학력 1개");
            map.put("school_indicator", one);
            map.put("school_code", school_code);
            map.put("school_code_1", school_code);
         }
         
         if(school_code.length()==3){// 아마 school_code로 나오는게  "1,2"이렇게 나오니깐 1,2--> 3글자니깐 length()==3
            // 두개선택
            String two="2";
            System.out.println("학력 2개");
            map.put("school_indicator", two);
            map.put("school_code_1", school_code.substring(0, 1));//1뽑아내고
            map.put("school_code_2", school_code.substring(2, 3));//2뽑아내고예를들어 1,3선택하면 1하고 3뽑아내겟죵
         }
         
         if(school_code.length()==5){
            // 세개선택
            String three="3";
            System.out.println("학력 3개");
            map.put("school_indicator", three);
            map.put("school_code_1", school_code.substring(0, 1));
            map.put("school_code_2", school_code.substring(2, 3));
            map.put("school_code_3", school_code.substring(4, 5));
         }
         }catch(Exception e){}
      
         try {
         
         for(int i=1;i<5/*스킬이 총5개*/;i++){
            if (skill_code.length()==(i-1)*2+1/*i가 1일때 1 i가 2일때 3 1,3,5,,,*/) {
               String one =i+"";
               System.out.println("기술"+i+"개");
               map.put("skill_indicator", one);
               for(int j=1;j<=i;j++){
               map.put("skill_code_"+j+"", skill_code.substring((j-1)*2,(j-1)*2+1));
               }
            }      
         }

      } catch (Exception e) {}
      
      int all_find_cnt = sqlMap.selectOne("all_find_cnt",map);
      return all_find_cnt;

   }
   
   // 사원 등록
   public int staff_intput(Code_StaffDTO dto) {

      System.out.println("================================");
      
      //System.out.println("STAFF_NO(x):  "+dto.getStaff_no());
      System.out.println("STAFF_NAME: "+dto.getStaff_name());
      System.out.println("JUMIN_NO(x): "+dto.getJumin_no());
      System.out.println("SCHOOL_CODE: "+dto.getSchool_code());
      System.out.println("RELIGION_CODE: "+dto.getReligion_code());
      System.out.println("GRADUATE_DAY(x): "+dto.getGraduate_day());
      System.out.println("STAFF_SKILL_NO(x): "+dto.getStaff_skill_no());
      //System.out.println("STAFF_NO(SKILL_STAFF): "+dto.getStaff_no());
     /* System.out.println("SKILL_CODE: "+dto.getSkill_code());*/
   
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("name", dto.getStaff_name());
      int count=0;
      try{
      count = sqlMap.insert("staff_input", dto);
      count =1;
      }catch(Exception e){count=-1;}
      
      return count;
   }
   
   // 사원정보 불러오기 = 게시글 본문보기
public Code_StaffDTO staff_updel_info(int staff_no) {
	
	Code_StaffDTO dto = null;
	dto= sqlMap.selectOne("staff_updel", staff_no);
	return dto;
	}
   

	// 수정하기
public int staff_updel_update(Code_StaffDTO dto) {
	int count = sqlMap.update("staff_update", dto);
		return count;
	}
	

	// 삭제하기
   public int staff_del(int staff_no) {
		int count = sqlMap.delete("schooldel",staff_no);
					sqlMap.delete("staffdel",staff_no);
					/*되는데 무결성 뭐 어찌고 있어서 이게 아마 잘은 모르는데 staff테이블이 메인일꺼야
					그래서 staff테이블에 있는 staff_no로 지워도되는데
					나머지애들은 staff_no로 못지워 메인테이블에 값이 남아있는데 어디 쩌리들이 지우겠다고 <-- 이런말과 같아서*/
					
		
		// 여기 뭐리문 두개 썻자나
		//하나는 다 지우는 조인문쓴 쿼리문(staff테이블만 삭제안됨)
		//그래서 따로 staff테이블 삭제하는 쿼리문 만들어서 넣어줌
		//그래서 두개
		return count;
	}
   
//   public int all_Find_Cnt() {
//      int all_find_cnt = sqlMap.selectOne("all_find_cnt");
//      return all_find_cnt;
//   }
   
   
   
   
   public List<Code_StaffDTO> test(String staff_name) {
      System.out.println(staff_name);
      Map<String,Object> map = new HashMap<String, Object>();
      map.put("staff_name", staff_name);


      List<Code_StaffDTO> list = sqlMap.selectList("a",map);
      return list;
   }
   
   public int bWrite(Code_StaffDTO dto) {
      int count = sqlMap.insert("b",dto);
      return count;
   }
   
   public int cWrite(int staff_no,String skill_code) {
      Map<String,Object> map = new HashMap<String, Object>();
      map.put("staff_no", staff_no);
      map.put("skill_code", skill_code);
      int count = sqlMap.insert("c",map);
      return count;
   }

}