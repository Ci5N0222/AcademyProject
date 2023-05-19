package kr.co.dong.controller;


import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.board.BoardService;
import kr.co.dong.board.PointDTO;
import kr.co.dong.board.paging;
import kr.co.dong.user.UserDTO;


@Controller

public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		return "home";
	}
	
	
	
	// ============================================================= [회원] =================================================================
	
	// 로그인 폼으로 가는 매핑 board/login -> login(.jsp)
	@RequestMapping(value="board/login", method = RequestMethod.GET)
	public String login() {		
		return "login";
	}
	
	// 로그인 처리하기
	@RequestMapping(value="board/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String,Object> map, HttpServletRequest request, 
	                    HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("utf-8");
	     
	    // 서비스 호출
	    UserDTO dto = new UserDTO();
	    Map user = service.login(map); 
	    String m_id = (String)map.get("m_id");
	    session.setAttribute("m_id", m_id);
	    dto.setM_id(m_id);
	       
	    if(user == null) {  // 로그인 실패
	    	rttr.addFlashAttribute("msg", "아이디와 비밀번호를 확인하세요");
	    	return "redirect:login";
	    } else {   // 로그인 성공
	       // 세션 부여
	    	service.latelyLogin(dto);
	    	user = service.login(map);
	    	session.setAttribute("user", user);
	        return "redirect:/";
	    }      
	}
		
	//로그아웃
	@GetMapping(value="board/logOut")
	public String loginOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원 가입폼
	@RequestMapping(value="board/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	// 회원 가입 저장
	@RequestMapping(value="board/join", method = RequestMethod.POST)
	public String join(UserDTO UserDTO, HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.joinMember(UserDTO);
		return "redirect:/";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="board/checkId", method = RequestMethod.POST)
	public int checkId(UserDTO dto) throws Exception {
		int result = service.checkId(dto);	
		return result;
	}
	
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="board/checkEname", method = RequestMethod.POST)
	public int checkEname(UserDTO dto) throws Exception {
		int result = service.checkEname(dto);	
		return result;
	}
	
	// 아이디 찾기
	@RequestMapping(value="board/findId", method = RequestMethod.GET)
	public String findId(UserDTO dto) throws Exception {
		return "findId";
	}
	@RequestMapping(value="board/changeId", method =RequestMethod.GET)
	public String changID(UserDTO dto, @RequestParam(value="id", required=false) String changeId,  HttpServletRequest request, 
			   HttpServletResponse response, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		model.addAttribute("changeId",changeId);
		return "changeId";
	}
	@RequestMapping(value="board/changeId", method = RequestMethod.POST)
	public String changID(UserDTO dto,HttpServletRequest request, @RequestParam(value="m_name") String m_name, @RequestParam(value="m_tel") String m_tel,
						  HttpServletResponse response, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		dto.setM_name(m_name);
		dto.setM_tel(m_tel);
		request.setCharacterEncoding("utf-8");
		String id = service.findId(dto);
		if (id == null) {		
			rttr.addFlashAttribute("msg","입력값에 맞는 회원 정보가 없습니다.");
			return "redirect:findId";
		} else {
			return "redirect:changeId?id="+id;			
		}
	}

	
	@RequestMapping(value="board/findPw", method = RequestMethod.GET)
	public String findPw() throws Exception {
		return "findPw";
	}
	
	@RequestMapping(value="board/findPw", method = RequestMethod.POST)
	public String findPw(UserDTO dto,  HttpSession session, Model model) throws Exception {
		String id = service.findPw(dto);
		if(id != null) {
			session.setAttribute("changePwId", id);
		}
		System.out.println(id);
		return "redirect:changePw?m_id=" + id;
	}
	
	
	@PostMapping(value="board/changePw")
	public String changePw(HttpSession session) throws Exception {
		session.getAttribute("changePwId");
		System.out.println("0-1");
		
		return "changePw";
	}
	
	
	@PostMapping(value="board/changPw")
	public String changePw(UserDTO dto, HttpServletRequest request, HttpSession session, Model model) throws Exception {
		session.getAttribute("changePwId");
		System.out.println("0-0");
		service.changePw(dto);
		return "redirect:login";
	}

	
	// ============================================================= [여행지 추천] =================================================================
	

	// 선택 여행지
	@RequestMapping(value="board/T_List", method = RequestMethod.GET)
	public String T_List() {
		return "T_List";
	}
   
	@ResponseBody
	@PostMapping(value="board/tourList")
	public int T_List(@RequestParam("codeId") int codeId) throws Exception {
		return codeId;
	}
   
   
	// 전체 여행지
	@RequestMapping(value="board/T_ListAll", method = RequestMethod.GET)
	public String T_ListAll() {
		return "T_ListAll";
	}

	
	// ============================================================= [포인트 샵] =================================================================


	// 포인트 샵 폼
	@RequestMapping(value="board/point", method = RequestMethod.GET)
	public String point() {		
		return "point";
	}
	
	// 포인트 샵 상품1
	@RequestMapping(value="board/product1", method = RequestMethod.GET)
   public String product1() { 
      return "product1";
   } 
	
	// 포인트 저장
	@RequestMapping(value="board/product1", method = RequestMethod.POST)
	public String product1(PointDTO PointDTO, HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.usePoint(PointDTO);
		
	return "redirect:myPageUsePoint";
	}

	
   // 포인트 샵 상품2
   @RequestMapping(value="board/product2", method = RequestMethod.GET)
   public String product2() {    
      return "product2";
   }
   // 포인트 저장
	@RequestMapping(value="board/product2", method = RequestMethod.POST)
	public String product2(PointDTO PointDTO, HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.usePoint(PointDTO);
		return "redirect:myPageUsePoint";
	}
   
	
   // 포인트 샵 상품3
   @RequestMapping(value="board/product3", method = RequestMethod.GET)
   public String product3() {   
      return "product3";
   }
   
   // 포인트 저장
	@RequestMapping(value="board/product3", method = RequestMethod.POST)
	public String product3(PointDTO PointDTO, HttpSession session, HttpServletRequest request)throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = service.usePoint(PointDTO);
		return "redirect:myPageUsePoint";
	}
   
  
	
	
	
	
	// ============================================================= [마이 페이지] =================================================================
	

	// 마이페이지-개인
   @RequestMapping(value="board/myPage", method = RequestMethod.GET)
   public String mypage() {
	   
      return "myPage";
   }
   
   
   //마이페이지 출석 포인트
  	@RequestMapping(value="board/myPage", method = RequestMethod.POST)
  	public String mypage(UserDTO UserDTO, HttpSession session, HttpServletRequest request)throws Exception {
  		request.setCharacterEncoding("utf-8");
  		UserDTO = service.mySelect(UserDTO);	
  		int r = service.dateCheck(UserDTO);	
  		UserDTO user = service.sessionId(UserDTO);
  		session.setAttribute("user", user);

  		return "redirect:myPage";
  	}
  	
  	
  	
  	 // 마이페이지 회원 정보 확인
    @RequestMapping(value="board/myPageUserInfo", method = RequestMethod.GET)
    public String myPageUserInfo() {
       
       return "myPageUserInfo";
    }
  	
	// 마이페이지 회원 정보 수정 폼
	@RequestMapping(value="board/myPageUserUpdate", method = RequestMethod.GET)
	public String myPageUserUpdate(@RequestParam("m_id") String m_id, UserDTO UserDTO, Model model) throws Exception {
		
		UserDTO = service.userDetail(m_id);
		model.addAttribute("userInfo", UserDTO);
		return "myPageUserUpdate";
	}
	
	@PostMapping(value="board/myPageUserUpdate")
	public String myPageUserUpdate(UserDTO UserDTO, HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		service.userUpdate(UserDTO);
		return "redirect:myPageUserInfo?m_id="+UserDTO.getM_id();
	}
    
    

    // 마이페이지 포인트 사용 내역
    @RequestMapping(value="board/myPageUsePoint", method = RequestMethod.GET)
    public ModelAndView myPageUsePoint(@RequestParam(value="page", required=false, defaultValue="1")int page, 
    								   @RequestParam(value="range", required=false, defaultValue="1")int range, HttpSession session, String m_id) throws Exception {
       ModelAndView mav = new ModelAndView();
       
       paging paging = new paging();
       
       m_id = (String) session.getAttribute("m_id");
       paging.setM_id(m_id);
       
       int getmycnt = service.getUseMyPointCnt();
       paging.pageInfo(page, range, getmycnt);
       mav.addObject("pagination", paging);
       List<BoardDTO> list = service.myPageUsePoint(paging);
       mav.addObject("myPageUsePoint", list);
       mav.setViewName("myPageUsePoint");

       return mav;   
    }

	
	
	
	
	
	
    
    
    
    // 회원 탈퇴
    @GetMapping(value="board/myPageUserDelete")
    public String unregister() {
    	return "myPageUserDelete";
    }
    
    @PostMapping(value="board/myPageUserDelete")
    public String unregister(@RequestParam("m_id") String m_id,
    						 @RequestParam("m_pw") String m_pw, HttpSession session) throws Exception {
    	
    	UserDTO dto = new UserDTO();
    	dto.setM_id(m_id);
    	dto.setM_pw(m_pw);
    	service.userDelete(dto);
    	
    	session.invalidate();
    	
    	return "redirect:/";
    }
  
	
	
	
	
	
	
	
	
	// ============================================================= [관리자 페이지] =================================================================
	

    // 관리자 페이지
    @RequestMapping(value="board/adminPage", method = RequestMethod.GET)
    public String mngpage() {
       
       return "adminPage";
    }
    
	
	
	// 회원관리 
	@RequestMapping(value="board/adminPageMember", method = RequestMethod.GET)
	public ModelAndView Management(@RequestParam(value="page", required=false, defaultValue="1")int page1,
							       @RequestParam(value="range", required=false, defaultValue="1")int range1) throws Exception {
		ModelAndView mav1 = new ModelAndView();
		
		paging paging = new paging();
		
		int getmemberCnt = service.getMemberCnt();
		paging.pageInfo(page1, range1, getmemberCnt);
		
		mav1.addObject("pagination", paging);
		List<UserDTO> manage = service.manage(paging);
		mav1.addObject("Management", manage);
		mav1.setViewName("adminPageMember");
		
		return mav1;	
	}
	
	//회원 상세정보
	@RequestMapping(value="board/adminPageMemberDetail", method = RequestMethod.GET)
	public String manageOne(@RequestParam("m_id") String m_id, Model model) throws Exception {

		
		UserDTO UserDTO = service.userDetail(m_id);
		model.addAttribute("Management", UserDTO);
	
		return "adminPageMemberDetail";
	}
	
	
	
	
	//회원 정보 수정 폼
	@RequestMapping(value="board/adminPageMemberUpdate" ,method = RequestMethod.GET)
	public String adminPageMemberUpdate(@RequestParam("m_id")  String m_id, Model model) throws Exception {
		
		UserDTO UserDTO = service.userDetail(m_id);
		model.addAttribute("Management", UserDTO);
		return "adminPageMemberUpdate";
	}
	
	//회원 정보 수정 저장
	@RequestMapping(value="board/adminPageMemberUpdate", method = RequestMethod.POST)
	public String adminPageMemberUpdate(UserDTO UserDTO, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
	
		int r = service.userUpdate(UserDTO);
		if (r>0) {
			rttr.addFlashAttribute("msg","회원정보 수정에 성공했습니다");
			return "redirect:adminPageMember";
		}
	
			return "redirect:adminPageMemberUpdate?m_id="+ UserDTO.getM_id();
			
	}	

	
	 //관리자 회원정보 관리 삭제 BoardController 신규
    @RequestMapping(value="board/adminPageMemberDelete", method = RequestMethod.GET)
    public String userdelete(@RequestParam("m_id") String m_id) throws Exception {
       
       int r = service.adminuserdelete(m_id);
       if(r>0) {
          return "redirect:adminPage";
       }
       return "redirect:adminPageMemberDetail?m_id="+m_id;
    }   
	
	
	
}






