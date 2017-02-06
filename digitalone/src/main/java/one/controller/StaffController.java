package one.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import one.code_staff.model.Code_StaffDAO;
import one.code_staff.model.Code_StaffDTO;

@Controller
public class StaffController {
   
   @Autowired
   private Code_StaffDAO code_staffDao;
   
   
 //  Code_StaffDAO code_staffDao = new Code_StaffDAOImple();
   
   
   // 키워드 버튼
   @RequestMapping(value="/staff_search_form.do",method=RequestMethod.GET)
   public ModelAndView staff_search_form(){

      ModelAndView mav = new ModelAndView();
      mav.setViewName("staff/staff_search_form");
      return mav;
   }

   @RequestMapping(value="/staff_search_form.do",method=RequestMethod.POST)
   public ModelAndView staff_search(@RequestParam(value="name",required=false)String name,
         @RequestParam(value="religion_code",required=false)String religion_code,
         @RequestParam(value="sex",required=false)String sex,
         @RequestParam(value="school_code", required=false)String school_code,
         @RequestParam(value="skill_code", required=false)String skill_code,
         @RequestParam(value="cp", required=false, defaultValue="1")int cp,
         @RequestParam(value="date1",required=false)String date1,
         @RequestParam(value="date2",required=false)String date2){

      // sex, school_code, skill_code
      System.out.println(name);
      System.out.println(date1);
      String[] myString = {sex,school_code,skill_code};
      String[] myStringName = {"sex" , "school_code" , "skill_code"};

      String[] array1= {"남자" , "여자"};
      String[] array2 = {"고졸" , "전문대졸" , "일반대졸"};
      String[] array3 = {"JAVA" , "JSP" , "ASP" , "PHP" , "Delphi"};
      String[][] arrays = new String[][] { array1, array2, array3 };
      
      @SuppressWarnings("unchecked") // @SuppressWarnings->컴파일시 컴파일 경고를 사용하지 않도록 설정할 수 있다. unchecked(미확인 오퍼레이션과 관련된 경고를 억제합니다.)
      ArrayList<String> arr_myString[] = new ArrayList[myString.length];
      for( int i = 0; i < myString.length; i++) {
         arr_myString[i] = new ArrayList<String>();
      }
      

   for(int i=0;i<myString.length;i++){
         try{
            if(myString[i].length()>1){
               //System.out.println(" : "+myString[i]);
               //System.out.println("사이즈 : "+myString[i].length());
               System.out.println("-----------");
               for(int u=0;u<myString.length;u++){
                  for(int j=1;j<myString[i].length();j++){
                     if(myString[i].equals(myString[u])){
                        System.out.println(myStringName[i]+"의result: "+arrays[i][Integer.parseInt(myString[i].substring((j-1)*2, (j-1)*2+1))-1]);
                        arr_myString[u].add(myString[i].substring((j-1)*2, (j-1)*2+1));
                     }
                     
                  }
               }
            }
            else{
               for(int u=0;u<3;u++){
                  if(myString[i].equals(myString[u])){
                  arr_myString[u].add(myString[i]);
                  System.out.println("----------");
                  System.out.println(myStringName[i]+"의result: "+arrays[i][Integer.parseInt(myString[i])-1]);
                  }
               }
               
            }
            }catch(Exception e){}
         }
      
      System.out.println("---------");
      for(int i=0;i<arr_myString[1].size();i++){
      //System.out.println(2+"번째결과:"+arr_myString[1].get(i));
      }
      
      /*String str_val = Integer.toString(year1);
      System.out.println(str_val);*/
      
      /*int int_val = Integer.parseInt(year1);
      System.out.println(int_val);*/

      
      ModelAndView mav = new ModelAndView();
      /*int totalCnt = code_staffDao.getTotalCnt();
      int listSize=5;
      int pageSize=5;*/
      //String pageStr = one.page.PageModule.makePage("staff_search_form.do", totalCnt, listSize, pageSize, cp);
      //String pageStr = one.page.PageModule.makePage("test.do", totalCnt, listSize, pageSize, cp);
      
      //System.out.println("1"+name); // 순서
      List<Code_StaffDTO> list = code_staffDao.staff_findList(name, religion_code,sex, school_code, skill_code,date1,date2);
      
      System.out.println("list.size: "+list.size());
      
      /*페이징 시작*/
      int totalPage/*그러면 totalPage가 전체페이ㅣㅈ*/ = list.size()/10; // 한페이지에 10개씩 보여준다고 하면
      if(list.size()%10!=0){
         totalPage++;// 만약에 게시물이 11개 있으면 페이지가 두개 필요한데 10으로 나누면 몫이 1이라 추가적으로 나머지가 있을경우 페이지+1해줌 
      }
      ArrayList<Code_StaffDTO> list_FORREAL = new ArrayList<Code_StaffDTO>(); // 그담에 list_FORREAL은 10개씩 저장하기 위한 임시 buffer
      try{// cp ==1 , 즉 1번째 페이지라고 했을때, 임시버퍼(list_FORREAL에는 원래 original list의 0번째부터 9번째 까지만 저장되어야함(10개의 게시물,그러므로))
      for(int i=(cp-1)*10;i<(cp-1)*10+10;i++/*i는 0부터 9까지*/){
      list_FORREAL.add(list.get(i)/*original의 0부터 9까지 list_FORREAL에 저장.*/);
      }
      }catch(Exception e){}
      mav.addObject("totalPage",totalPage);
      /*페이징 끝*///현재 18개 게시물이 있으니깐 몫은 1이고 나머지가 발생해서 totalPage++해서 totalPage는 2가되영 그리고 여기서 cp가 ==2라고 했을때, i는 10부터 ~ i는 20까지 
      // 돌아야되는데 지금 게시물수가 18개니깐 i는 17번째까지만 돌고 nullpointerexception 이 발생하니깐 try catch로 잡았어영.
      // 그러면 cp가 2일때 i는 10부터 17까지 original 의 게시물을 list_FORREAL이라는 임시버퍼에 저장하게 되어서 결론적으로 2를 눌렀을때 우리는 original 의 10번째부터 17번째까지 볼수
      // 있고 cp==1 즉 1번째 페이지를 눌ㄹ렀을땐 0번째부터 8번째 까지 볼수있음
      //System.out.println("4"+name); // 순서
      
      int all_find_cnt = code_staffDao.all_Find_Cnt(name, religion_code, sex, school_code, skill_code);
      
      for (int i = 0; i < list.size(); i++) {
          String sex1 = list.get(i).getJumin_no();
          String sex2 = sex1.substring(7, 8);
  
          if (sex2.equals("1")) {
             list.get(i).setJumin_no("남");
          } else {
             list.get(i).setJumin_no("여");
          }
      }
//      mav.addObject("pageStr", pageStr);
      mav.addObject("list",list_FORREAL);
      //mav.addObject("sex",sex);
      mav.addObject("sex",arr_myString[0]);
/*      mav.addObject("year1",year1);
      mav.addObject("month1",month1);
      mav.addObject("day1",day1);
      mav.addObject("year2",year2);
      mav.addObject("month2",month2);
      mav.addObject("day2",day2);*/
      mav.addObject("religion_code",religion_code);
      //mav.addObject("school_code", school_code);
      mav.addObject("school_code", arr_myString[1]);
      mav.addObject("skill_code", arr_myString[2]);
      mav.addObject("all_find_cnt", all_find_cnt);
      mav.addObject("name", name);
      mav.setViewName("staff/staff_search_form");
      return mav;
   }
  
   // 전부검색 버튼
   @RequestMapping("/staff_search_all.do")
   public ModelAndView staff_name_search_form(@RequestParam(value="cp", required=false, defaultValue="1")int cp,
		   @RequestParam(value="pagenum",required=false,defaultValue="10")String pagenum_s){
	   if(pagenum_s.equals("") || pagenum_s==null){
		   pagenum_s = "10";
	   }
	   int pagenum = Integer.parseInt(pagenum_s);
      List<Code_StaffDTO> list = code_staffDao.staff_all();
      for (int i = 0; i < list.size(); i++) {
         String sex1 = list.get(i).getJumin_no();
         String sex2 = sex1.substring(7, 8);
 
         if (sex2.equals("1")) {
            list.get(i).setJumin_no("남");
         } else {
            list.get(i).setJumin_no("여");
         }
      }
      
      int all_find_cnt = code_staffDao.all_Find_Cnt("","","","","");
      ModelAndView mav = new ModelAndView();

      int totalPage/*그러면 totalPage가 전체페이ㅣㅈ*/ = list.size()/pagenum; // 한페이지에 10개씩 보여준다고 하면
      if(list.size()%10!=0){
         totalPage++;// 만약에 게시물이 11개 있으면 페이지가 두개 필요한데 10으로 나누면 몫이 1이라 추가적으로 나머지가 있을경우 페이지+1해줌 
      }
      ArrayList<Code_StaffDTO> list_FORREAL = new ArrayList<Code_StaffDTO>(); // 그담에 list_FORREAL은 10개씩 저장하기 위한 임시 buffer
      try{// cp ==1 , 즉 1번째 페이지라고 했을때, 임시버퍼(list_FORREAL에는 원래 original list의 0번째부터 9번째 까지만 저장되어야함(10개의 게시물,그러므로))
      for(int i=(cp-1)*pagenum;i<(cp-1)*pagenum+pagenum;i++/*i는 0부터 9까지*/){
      list_FORREAL.add(list.get(i)/*original의 0부터 9까지 list_FORREAL에 저장.*/);
      }
      }catch(Exception e){}
      mav.addObject("totalPage",totalPage);
      /*페이징 끝*///현재 18개 게시물이 있으니깐 몫은 1이고 나머지가 발생해서 totalPage++해서 totalPage는 2가되영 그리고 여기서 cp가 ==2라고 했을때, i는 10부터 ~ i는 20까지 
      // 돌아야되는데 지금 게시물수가 18개니깐 i는 17번째까지만 돌고 nullpointerexception 이 발생하니깐 try catch로 잡았어영.
      // 그러면 cp가 2일때 i는 10부터 17까지 original 의 게시물을 list_FORREAL이라는 임시버퍼에 저장하게 되어서 결론적으로 2를 눌렀을때 우리는 original 의 10번째부터 17번째까지 볼수
      // 있고 cp==1 즉 1번째 페이지를 눌ㄹ렀을땐 0번째부터 8번째 까지 볼수있음
   
      
      
     
      mav.setViewName("staff/staff_search_form");
      mav.addObject("all_find_cnt", all_find_cnt);
      mav.addObject("list",list_FORREAL);
      mav.addObject("pagenum",pagenum);
      return mav;
   }
   
   
   
   // 사원 등록
   @RequestMapping(value="staff_input_form.do",method=RequestMethod.GET)
   public ModelAndView staff_input_form(){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("staff/staff_input_form");
      return mav;
   }
   
   @RequestMapping(value="staff_input_form.do",method=RequestMethod.POST)
   public ModelAndView stff_input(
         @RequestParam(value="jumin_no1",required=false)String ju1,
         @RequestParam(value="jumin_no2",required=false)String ju2,

         @RequestParam(value="graduate_year",required=false)String year,
         @RequestParam(value="graduate_month",required=false)String month,
         @RequestParam(value="graduate_day",required=false)String day,
         @RequestParam(value="skill_code_buffer", required=false)String skill_code_buffer,
         /* skill_code_buffer 이름을 왜 바꾸는 이유는 Code_StaffDTO dto 이거 없으면 skill_code 써도 되는데
         dto 가 있어서 dto 기본 변수 값이 skill_code 인데 이게 인트 타입으로 '1' '2' 이렇게 받아야되는데 여러개 선택하면 spring에서 자동적으로 
         controller에 받아올때 (3,4) (2,3,4) 이런식으로 받아와서 DTO에 넣을수가 없어서 에러 */
         
               Code_StaffDTO dto){

      dto.setJumin_no(ju1+"-"+ju2);
      dto.setGraduate_day(year+"-"+month+"-"+day);

      /*System.out.println("skill_code_buffer : "+ skill_code_buffer);*/
      
      ArrayList<String> arr_addString = new ArrayList<String>();
      
    
            try{
               if(skill_code_buffer.length()>1){
                  //System.out.println(" : "+myString[i]);
                  //System.out.println("사이즈 : "+myString[i].length());
                  System.out.println("-----------");
                  
                     for(int j=1;j<skill_code_buffer.length();j++){
                        
                           arr_addString.add(skill_code_buffer.substring((j-1)*2, (j-1)*2+1));
                        
                     }
                        
                   }
                  
              
               else{
               arr_addString.add(skill_code_buffer);
                dto.setSkill_code(Integer.parseInt(skill_code_buffer));
               }
               }
               catch(Exception e){}
            
         
         System.out.println("---------");
         for(int i=0;i<arr_addString.size();i++){
       /*  System.out.println("결과: "+arr_addString.get(i));*/
         }

     dto.setRawstr(skill_code_buffer);    
     dto.setCount(arr_addString.size());  
     
    /* System.out.println("buffer: "+dto.getRawstr()+"/ count : "+dto.getCount());*/
     
     int count = code_staffDao.staff_intput(dto);

      String msg=count>0?"사원등록 성공":"사원등록 실패";
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.addObject("url","staff_search_form.do");
      mav.setViewName("staff/msg");
      return mav;
      
   }
   
   
   // 사원 정보 보기(사원 정보를 staff_no로 불러옴) = 게시글 본문보기
   @RequestMapping(value="staff_updel_form.do",method=RequestMethod.GET)
   public ModelAndView satff_updel_form(@RequestParam(value="staff_no", defaultValue="0")int staff_no){
	  
	   System.out.println("사원번호:" + staff_no);
	   ModelAndView mav = new ModelAndView();
	   Code_StaffDTO dto = code_staffDao.staff_updel_info(staff_no);
	   // 결과값을 dto타입으로 넣는다.
/*	   String skill="";
	   for(int i = 0; i<skill_code.length;i++){
		  skill+= skill_code[i].substring(0, 1);
		  System.out.println("스킬: "+skill);
	   }*/
	   
	  System.out.println("staff:"+dto.toString()); //모든 객체 결과값
	  
	  String year1 = dto.getGraduate_day().substring(0, 4); //2004-03-01
	  String month1 = dto.getGraduate_day().substring(5, 7); 
	  String day1 = dto.getGraduate_day().substring(8, 10);
	  
	  String jumin1 = dto.getJumin_no().substring(0, 6);
	  String jumin2 = dto.getJumin_no().substring(7, 14);
	  
	  
	  /*System.out.println("-----------------:" + day1);*/
	  
	  
	   
	   mav.addObject("dto", dto);
	   mav.setViewName("staff/staff_updel_form");
	   mav.addObject("jumin1", jumin1);
	   mav.addObject("jumin2", jumin2 );
	   mav.addObject("year1", year1);
	   mav.addObject("month1", month1);
	   mav.addObject("day1", day1);
	
	   
	   return mav;
   }
 

   // 수정하기
   	@RequestMapping(value="/staff_updel_form.do", method=RequestMethod.POST)
	public ModelAndView staff_update(Code_StaffDTO dto){
   		
   		
   		int result = code_staffDao.staff_updel_update(dto);
   		String msg = result>0?"수정성공":"수정실패";
   		
   		ModelAndView mav = new ModelAndView();
   		mav.addObject("msg", msg);
   		mav.setViewName("staff/staff_search_form");
   		return mav;
   	}

   	//삭제하기
   	@RequestMapping("/delete.do")
   	public ModelAndView del(@RequestParam("staff_no")int staff_no){
   		int count = code_staffDao.staff_del(staff_no); 
   		String msg = count>0?"사원이 삭제 되었습니다.":"사원 삭제를 실패하였습니다.";
  		ModelAndView mav = new ModelAndView();
  		mav.addObject("msg",msg);
  		mav.addObject("url","staff_updel_form.do");
  		mav.setViewName("staff/msg");
   		return mav;
   	}
   

   
   
   
   
////////////////////////////////////////////////////////////////
   @RequestMapping("/test.do")
   public ModelAndView stf_input(){
      Code_StaffDTO dto = new Code_StaffDTO();
      dto.setStaff_name("김길동");
      System.out.println("김길동 나가신다!");
      int count = code_staffDao.staff_intput(dto);
      String msg=count>0?"사원등록 성공":"사원등록 실패";
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.addObject("url","staff_search_form.do");
      mav.setViewName("staff/msg");
      return mav;
     
   }
   
 

   
   /** test **/
   @RequestMapping(value="/a.do",method=RequestMethod.GET)
   public ModelAndView a(){

      
      ModelAndView mav = new ModelAndView();

      mav.setViewName("staff/NewFile");
      return mav;
   }
   
   @RequestMapping(value="/a.do",method=RequestMethod.POST)
   public ModelAndView ab(@RequestParam(value="staff_name",required=false,defaultValue="")String staff_name){
      System.out.println(staff_name);
      List<Code_StaffDTO> list = code_staffDao.test(staff_name);
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("list",list);
      mav.setViewName("staff/NewFile");
      return mav;
   }
   
   @RequestMapping(value="/b.do",method=RequestMethod.GET)
   public String b(){
      return "staff/test1";
   }
   
   @RequestMapping(value="/b.do",method=RequestMethod.POST)
   public ModelAndView abc(Code_StaffDTO dto,@RequestParam(value="skill_code_t")String skill_code){
     int count = code_staffDao.bWrite(dto);
     int staff_no = dto.getStaff_no();
     int count1 = code_staffDao.cWrite(staff_no,skill_code);
      ModelAndView mav = new ModelAndView();

      mav.setViewName("staff/test1");
      return mav;
   }

}