package kr.co.dong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;

import kr.co.dong.board.BoardDTO;
import kr.co.dong.board.BoardReply;
import kr.co.dong.board.BoardService;
import kr.co.dong.board.PointDTO;
import kr.co.dong.board.Recomm;
import kr.co.dong.board.paging;
import kr.co.dong.user.UserDTO;

@Controller
public class ListController {
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired
   BoardService service;
   
   
   // 공지사항 게시판
   @RequestMapping(value="board/list", method = RequestMethod.GET)
   public ModelAndView list(@RequestParam(value="page", required=false, defaultValue="1")int page,
                      		@RequestParam(value="range", required=false, defaultValue="1")int range, HttpSession session) throws Exception {
      ModelAndView mav = new ModelAndView();
      
      paging paging = new paging();
      
      int getListCnt = service.getListCnt();
      paging.pageInfo(page, range, getListCnt);
      
      mav.addObject("pagination", paging);
      List<BoardDTO> list = service.list(paging);
      mav.addObject("list", list);
      mav.setViewName("list");
      
      mav.addObject("user", session.getAttribute("user"));
      
      return mav;   
   }
   
   // 인기 사항 게시판
   @RequestMapping(value="board/list_pop", method = RequestMethod.GET)
   public ModelAndView list_pop(@RequestParam(value="page", required=false, defaultValue="1")int page,
                                @RequestParam(value="range", required=false, defaultValue="1")int range, HttpSession session) throws Exception {
      ModelAndView mav = new ModelAndView();
      
      paging paging = new paging();
      
      int getPopCnt = service.getPopCnt();
      paging.pageInfo(page, range, getPopCnt);
      
      mav.addObject("pagination", paging);
      List<BoardDTO> list = service.list_pop(paging);
      mav.addObject("list_pop", list);
      mav.setViewName("list_pop");
      mav.addObject("user", session.getAttribute("user"));
      
      return mav;   
   }
   
   // 메인게시판
   @RequestMapping(value="board/list_main", method = RequestMethod.GET)
   public ModelAndView list_main(@RequestParam(value="page", required=false, defaultValue="1")int page,
                      			 @RequestParam(value="range", required=false, defaultValue="1")int range, HttpSession session) throws Exception {
      ModelAndView mav = new ModelAndView();
      
      paging paging = new paging();
      
      int getMainCnt = service.getMainCnt();
      paging.pageInfo(page, range, getMainCnt);
      
      mav.addObject("pagination", paging);
      List<BoardDTO> list = service.list_main(paging);
      mav.addObject("list_main", list);
      mav.setViewName("list_main");
      mav.addObject("user", session.getAttribute("user"));
      
      return mav;   
   }
   // 자유게시판
      @RequestMapping(value="board/list_free", method = RequestMethod.GET)
      public ModelAndView list_free(@RequestParam(value="page", required=false, defaultValue="1")int page,
    		  						@RequestParam(value="range", required=false, defaultValue="1")int range) throws Exception {
         ModelAndView mav = new ModelAndView();
         
         paging paging = new paging();
         
         int getFreeCnt = service.getFreeCnt();
         paging.pageInfo(page, range, getFreeCnt);
         
         mav.addObject("pagination", paging);
         List<BoardDTO> list = service.list_free(paging);
         mav.addObject("list_free", list);
         mav.setViewName("list_free");
         
         return mav;   
      }
 
      /*
      // 문의 처리 내역
        @RequestMapping(value="board/questionupdate",method = RequestMethod.GET)
        public String questionupdate(@RequestParam("bd_num") int bd_num, RedirectAttributes rttr) throws Exception {
           
        	BoardDTO dto = new BoardDTO();
           int r = service.questionupdate(bd_num);
           
           if(r > 0) {
              rttr.addFlashAttribute("msg","문의처리에 성공하였습니다.");
              if(dto.getBd_group() == 2) { 
                  return "redirect:list_main";
              } else if(dto.getBd_group() == 3){
                  return "redirect:list_free";
              } else if(dto.getBd_group() == 4) {
                  return "redirect:myPageQuestion";
              } 
           }
           return "redirect:detail?bd_num=" + bd_num;
        }
      */

      
      // 레지스터 ***********************************************************************************************************************
      
      // 글 쓰기 폼
      @RequestMapping(value="board/register", method = RequestMethod.GET)
      public String register() {
         
         return "register";
      }
      
      // 글 쓰기 
      @RequestMapping(value="board/register", method = RequestMethod.POST)
      public String register(BoardDTO boardDTO, HttpServletRequest request)throws Exception {
         request.setCharacterEncoding("utf-8");
         
         service.register(boardDTO);
         if(boardDTO.getBd_group() == 2 ) {
       	  return "redirect:list_main";
         } else if(boardDTO.getBd_group() == 3 ) {
       	  return "redirect:list_free";     
         } else if(boardDTO.getBd_group() == 4 ) { 
       	  return "redirect:redirect:myPageQuestion";
         } else {
       	  return "redirect:list";
         }
      }
      
      // 글 조회
	  @RequestMapping(value="board/detail", method = RequestMethod.GET)
	  public String detail(@RequestParam("bd_num") int bd_num, Recomm recomm, Model model) throws Exception {
		  BoardDTO board = service.detail(bd_num);
		  model.addAttribute("board", board);
		  
		  //댓글목록
		  service.updateReadCnt(bd_num);
		  List<BoardReply> list = service.detailList(bd_num);
		  model.addAttribute("list", list);
		  
		  
		  return "detail";
	  }
	  	
	  
	  //글 목록 
	  @GetMapping(value="board/pageList")
	  public String pageList(@RequestParam("bd_group") int group) throws Exception {
		  
		  if(group == 1) {
			  return "redirect:list";
		  } else if(group == 2) {
			  return "redirect:list_main";
		  } else if(group == 3 ) {
			  return "redirect:list_free";
		  } else if(group == 4 ) {
			  return "redirect:'redirect:myPageQuestion";
		  } else {
			  return "redirect:List";  
		  }
		   
	  }
	  
	  
	  // 추천수 업  
	  @ResponseBody
	  @RequestMapping(value="board/recomm", method = RequestMethod.POST)
	  public int recomm(@RequestParam("bd_recomm") int bd_recomm,
			  			@RequestParam("bd_num") int bd_num,
			  			@RequestParam("m_id") String m_id, Recomm recomm ) throws Exception {
		  
		  recomm.setM_id(m_id);
		  recomm.setBd_num(bd_num);
		  int rCheck = service.recommCheck(recomm);
		  if(rCheck == 0) {
			  service.insertRecomm(recomm);
			  service.userRecommUp(recomm);
			  service.recommUp(bd_num);  
		  } else if (rCheck == 1) {
			  service.recommDown(bd_num);
			  service.deleteRecomm(recomm);
				  
		  } 
			
		  return rCheck;
	  }
	  
	  
	  
	   //글 수정 폼(기존데이터 전송- 글읽기)
	   @RequestMapping(value="board/update", method = RequestMethod.GET)
	   public String update(@RequestParam("bd_num") int bd_num, Model model) throws Exception {
	      BoardDTO board = service.detail(bd_num);
	      model.addAttribute("board", board);      
	      return "update";
	   }   
	   
	   //글 수정 저장
	   @RequestMapping(value = "board/update", method = RequestMethod.POST)
	   public String update(BoardDTO boardDTO, RedirectAttributes rttr,HttpServletRequest request) throws Exception {
	      request.setCharacterEncoding("utf-8");
	      service.update(boardDTO);
	      return "redirect:detail?bd_num=" + boardDTO.getBd_num();
	   }
	
	   
	   // 글 삭제
	   @RequestMapping(value="board/delete",method = RequestMethod.GET)
	   public String delete(@RequestParam("bd_num") int bd_num, RedirectAttributes rttr) throws Exception {
	      BoardDTO dto = new BoardDTO();
	      int r = service.delete(bd_num);
	      
	      if(r > 0) {
	         rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
	         if(dto.getBd_group() == 2) { 
	             return "redirect:list_main";
	          } else if(dto.getBd_group() == 3){
	             return "redirect:list_free";
	          } else {
	             return "redirect:list";
	          }
	      }
	      return "redirect:detail?bd_num=" + bd_num;
	   }
	   
	   

	   

	   // 댓글 **************************************************************************************************************
	   @GetMapping(value="board/reply")
	   public String reply() {
	      return "reply";
	   }
	   
	   @PostMapping(value="board/reply")
	   public String reply(BoardReply boardReply) throws Exception {
	      int r = service.reply(boardReply);
	      if(r>0) {
	         return "redirect:detail?bd_num=" + boardReply.getBd_num();
	      }
	      return "reply";
	   }
	
	   @GetMapping(value="board/replyupdate")
	   public String replyUpdate(@RequestParam("comm_num")int comm_num, Model model) throws Exception {
	      BoardReply boardReply = service.detailReply(comm_num);
	      model.addAttribute("boardReply", boardReply);
	      return "replyupdate";
	   }
	   
	   @PostMapping(value="board/replyupdate")
	   public String replyUpdate(BoardReply boardReply) throws Exception {
	      int r = service.replyUpdate(boardReply);
	      if(r>0) {
	         return "redirect:detail?bd_num="+boardReply.getBd_num();
	      }
	      return "replyupdate";
	   }
	   
	   @RequestMapping(value="board/replyDelete", method = {RequestMethod.GET, RequestMethod.POST})
	   public String replyDelete(BoardReply boardReply) throws Exception {
	      int r = service.replyDelete(boardReply);
	      if(r>0) {
	         return "redirect:detail?bd_num="+boardReply.getBd_num();
	      }
	      return "replyupdate";
	   }

   // ajax 매핑과 메소드를 구현
   // json처리를 위한 라이브러리가 필요함 => jackson-databind, jackson-core
   // result type도 json 타입이므로, map으로 보내줘야함. String 안됨
   @ResponseBody //ajax는 꼭 작성해줘야함
   @RequestMapping(value="board/test", method = RequestMethod.POST)
   public Map<String,Object> test(@RequestParam("msg") String msg) {
      logger.info("msg : "+msg);
      Map<String,Object> result = new HashMap<String, Object>();
      result.put("status","OK");
      return result;
   }

   //ajax 댓글에 대한 매핑과 메소드를 구현(모델에 싣지 않고 그대로 return)
   @ResponseBody
   @RequestMapping(value="board/replylist", method = RequestMethod.POST)
   public List<BoardReply> replylist(@RequestParam("bd_num")int bd_num) throws Exception {	  
      return service.detailList(bd_num);
   }
   
   //ajax 댓글 쓰기
   @ResponseBody
   @RequestMapping(value="board/reply2", method = RequestMethod.POST)
   public int reply2(BoardReply boardReply) throws Exception {
      return service.reply(boardReply);
   }
   
   //ajax 댓글 수정
   @ResponseBody
   @RequestMapping(value="board/replyupdate2", method = RequestMethod.POST)
   public int replyupdate2(BoardReply boardReply) throws Exception {
      return service.replyUpdate(boardReply);
   }
   
   //ajax 댓글 삭제
   @ResponseBody
   @RequestMapping(value="board/replydelete2", method = RequestMethod.POST)
   public int replydelete2(BoardReply boardReply) throws Exception {
      return service.replyDelete(boardReply);
   }
   
   
   

   
   
   /*
   // 매니저 글 조회
     @RequestMapping(value="board/mngdetail", method = RequestMethod.GET)
     public String mngdetail(@RequestParam("bd_num") int bd_num, Model model) throws Exception {
        BoardDTO board = service.mngdetail(bd_num);
        model.addAttribute("board", board);
        //댓글목록
        List<BoardReply> list = service.detailList(bd_num);
        model.addAttribute("list", list);
        
        return "mngdetail";
     }
     */
     
     
     
     // 포인트 조회
     @RequestMapping(value="board/adminPageUsePointDetail", method = RequestMethod.GET)
     public String adminPageUsePointDetail(@RequestParam("p_num") int p_num, Model model) throws Exception {
        PointDTO board = service.usePointDetail(p_num);
        model.addAttribute("board", board);
        
        return "adminPageUsePointDetail";
     }
     
     
     
     
     
      // 상품 처리 수정
      @RequestMapping(value="board/usePointSuccess",method = RequestMethod.GET)
      public String usePointSuccess(@RequestParam("p_num") int p_num, RedirectAttributes rttr) throws Exception {
         PointDTO dto = new PointDTO();
         int r = service.usePointSuccess(p_num);
         return "redirect:adminPageUsePoint";
      }
      
      

      // 문의 처리 내역
      @RequestMapping(value="board/questionSuccess",method = RequestMethod.GET)
      public String questionSuccess(@RequestParam("bd_num") int bd_num, RedirectAttributes rttr) throws Exception {
         BoardDTO dto = new BoardDTO();
         int r = service.questionSuccess(bd_num);
         
         return "redirect:adminPageQuestion";
      }
      
      
      
      // 내 게시글
      @RequestMapping(value="board/myPageListMy", method = RequestMethod.GET)
      public ModelAndView myPageListMy(@RequestParam(value="page", required=false, defaultValue="1")int page, 
    		  						   @RequestParam(value="range", required=false, defaultValue="1")int range, HttpSession session, String m_id) throws Exception {
         ModelAndView mav = new ModelAndView();
         
         paging paging = new paging();
         
         m_id = (String) session.getAttribute("m_id");
         paging.setM_id(m_id);
         
         int getmycnt = service.getMyCnt();
         paging.pageInfo(page, range, getmycnt);
         
         mav.addObject("pagination", paging);
 
         List<BoardDTO> list = service.myPageListMy(paging);
         
         mav.addObject("myPageListMy", list);
         mav.setViewName("myPageListMy");

         return mav;   
      }
      
 
      
      // 포인트 처리 대기
      @RequestMapping(value="board/adminPageUsePoint", method = RequestMethod.GET)
      public ModelAndView adminPageUsePoint(@RequestParam(value="page", required=false, defaultValue="1")int page,
    		  								@RequestParam(value="range", required=false, defaultValue="1")int range) throws Exception {
         ModelAndView mav = new ModelAndView();
         
         paging paging = new paging();
         
         int getPointCnt = service.getPointCnt();
         paging.pageInfo(page, range, getPointCnt);
         
         mav.addObject("pagination", paging);
         List<BoardDTO> list = service.adminPageUsePoint(paging);
         mav.addObject("adminPageUsePoint", list);
         mav.setViewName("adminPageUsePoint");
         
         return mav;   
      }
      
      
      
      
      // 포인트 처리 완료
      @RequestMapping(value="board/adminPageUsePointSuccess", method = RequestMethod.GET)
      public ModelAndView adminPageUsePointSuccess(@RequestParam(value="page", required=false, defaultValue="1")int page,
                             @RequestParam(value="range", required=false, defaultValue="1")int range) throws Exception {
         ModelAndView mav = new ModelAndView();
         
         paging paging = new paging();
         
         int getPointCnt = service.getPointSuccessCnt();
         paging.pageInfo(page, range, getPointCnt);
         
         mav.addObject("pagination", paging);
         List<BoardDTO> list = service.adminPageUsePointSuccess(paging);
         mav.addObject("adminPageUsePointSuccess", list);
         mav.setViewName("adminPageUsePointSuccess");
         
         return mav;   
      }
      
      
      // 나의 문의
      @RequestMapping(value="board/myPageQuestion", method = RequestMethod.GET)
      public ModelAndView myPageQuestion(@RequestParam(value="page", required=false, defaultValue="1")int page,
    		  							@RequestParam(value="range", required=false, defaultValue="1")int range, HttpSession session, String m_id) throws Exception {
         ModelAndView mav = new ModelAndView();         
         paging paging = new paging();  
         
         m_id = (String) session.getAttribute("m_id");
         paging.setM_id(m_id);
         
         int getRequestMyCnt = service.getRequestMyCnt();
         paging.pageInfo(page, range, getRequestMyCnt);        
         mav.addObject("pagination", paging);
         List<BoardDTO> list = service.myPageQuestion(paging);
         mav.addObject("myPageQuestion", list);
         mav.setViewName("myPageQuestion");
         
         return mav;   
      }

      
     
   
      // 대기 문의
      @RequestMapping(value="board/adminPageQuestion", method = RequestMethod.GET)
      public ModelAndView adminPageQuestion(@RequestParam(value="page", required=false, defaultValue="1")int page,
    		  								@RequestParam(value="range", required=false, defaultValue="1")int range) throws Exception {
         ModelAndView mav = new ModelAndView();         
         paging paging = new paging();        
         int getRequestCnt = service.getRequestCnt();
         paging.pageInfo(page, range, getRequestCnt);        
         mav.addObject("pagination", paging);
         List<BoardDTO> list = service.adminPageQuestion(paging);
         mav.addObject("adminPageQuestion", list);
         mav.setViewName("adminPageQuestion");
         
         return mav;   
      }
  
      // 문의 처리 내역
      @RequestMapping(value="board/adminPageQuestionSuccess", method = RequestMethod.GET)
      public ModelAndView adminPageQuestionSuccess(@RequestParam(value="page", required=false, defaultValue="1")int page,
    		  									   @RequestParam(value="range", required=false, defaultValue="1")int range) throws Exception {
         ModelAndView mav = new ModelAndView();  
         paging paging = new paging();       
         int getRequestCnt = service.getRequesSuccesstCnt();
         paging.pageInfo(page, range, getRequestCnt);        
         mav.addObject("pagination", paging);
         List<BoardDTO> list = service.adminPageQuestionSuccess(paging);
         mav.addObject("adminPageQuestionSuccess", list);
         mav.setViewName("adminPageQuestionSuccess");
         
         return mav;   
      }
   
   
}




