package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.user.UserDTO;

@Service
public class BoardServiceImpl implements BoardService{

   @Autowired
   BoardDAO dao;
   
   
   // ============================================================= [회원] =============================================================

    // 로그인
    @Override
    public Map login(Map<String, Object> map) {
       return dao.login(map);
    }
   	// 세션 새로고침
	@Override
	public UserDTO sessionId(UserDTO dto) throws Exception {
		return dao.sessionId(dto);
	}
	// 최근 로그인 기록
	@Override
	public int latelyLogin(UserDTO dto) throws Exception {
		return dao.latelyLogin(dto);
	}
	
	
    // 회원 가입
    @Override
    public int joinMember(UserDTO dto) throws Exception {
       return dao.joinMember(dto);
    }
    // 아이디 중복확인
	@Override
	public int checkId(UserDTO dto) throws Exception {
		return dao.checkId(dto);
	}
	// 닉네임 중복확인
	@Override
	public int checkEname(UserDTO dto) throws Exception {
		return dao.checkEname(dto);
	}
   
   
   // ID 찾기
	@Override
	public String findId(UserDTO dto) throws Exception {
		return dao.findId(dto);
	}	
	// Password 찾기
	@Override
	public String findPw(UserDTO dto) throws Exception {
		return dao.findPw(dto);
	}
	// Password 바꾸기
	@Override
	public int changePw(UserDTO dto) throws Exception {
		return dao.changePw(dto);
	}


	
	// ============================================================= [게시판] =============================================================
	
	
	//공지
    @Override
    public int getListCnt() throws Exception {
       return dao.getListCnt();
    }
    @Override
    public List<BoardDTO> list() throws Exception {
       return dao.list();
    }
    @Override
    public List<BoardDTO> list(paging paging) throws Exception {
       return dao.list(paging);
    }
   
   
    //인기
    @Override
    public int getPopCnt() throws Exception {
       return dao.getPopCnt();
    }
    @Override
    public List<BoardDTO> list_pop() throws Exception {
       return dao.list_pop();
    }
    @Override
    public List<BoardDTO> list_pop(paging paging) throws Exception {
       return dao.list_pop(paging);
    }
   
   
    //메인
    @Override
    public int getMainCnt() throws Exception {
       return dao.getMainCnt();
    }
    @Override
    public List<BoardDTO> list_main() throws Exception {
       return dao.list_main();
    }
    @Override
    public List<BoardDTO> list_main(paging paging) throws Exception {
       return dao.list_main(paging);
    }

   
    //자유
    @Override
    public int getFreeCnt() throws Exception {
       return dao.getFreeCnt();
    }
    @Override
    public List<BoardDTO> list_free() throws Exception {
       return dao.list_free();
    }
    @Override
    public List<BoardDTO> list_free(paging paging) throws Exception {
       return dao.list_free(paging);
    }

	
	
	
    // ============================================================= [레지스터, 디테일] =============================================================
	
    // 선택한 글 읽기
    @Override
    public BoardDTO detail(int num) throws Exception {
    	return dao.detail(num);
    }
    
	// 글 쓰기
    @Override
    public int register(BoardDTO boardDTO) throws Exception {
       return dao.register(boardDTO);
    }
    
    // 글 수정
    @Override
    public int update(BoardDTO boardDTO) throws Exception {
       return dao.update(boardDTO);
    }
    
    // 글 삭제
    @Override
    public int delete(int BD_NUM) throws Exception {
       return dao.delete(BD_NUM);
    }
    
    // 조회수 증가
    @Override
    public int updateReadCnt(int BD_NUM) throws Exception {
       return dao.updateReadCnt(BD_NUM);
    }
    
    
    
    // 추천인 조회
 	@Override
 	public int recommCheck(Recomm recomm) throws Exception {
 		return dao.recommCheck(recomm);
 	}
    // 추천시 테이블 인서트
 	@Override
 	public int insertRecomm(Recomm recomm) throws Exception {
 		return dao.insertRecomm(recomm);
 	}
 	// 추천 취소시 테이블 딜리트
 	@Override
 	public int deleteRecomm(Recomm Recomm) throws Exception {	
 		return dao.deleteRecomm(Recomm);
 	}

    // 추천수 증가
 	@Override
 	public int recommUp(int up) throws Exception {
 		return dao.recommUp(up);
 	}
 	// 추천수 감소
 	@Override
 	public int recommDown(int down) throws Exception {
 		return dao.recommDown(down);
 	}
 	// 개인 추천수 관리(증가)
 	@Override
 	public int userRecommUp(Recomm up) throws Exception {
 		return dao.userRecommUp(up);
 	}
    
 	
    
    
   // ============================================================= [ 댓글 ] =============================================================
    
 	
 	// 댓글 전체 목록
    @Override
    public List<BoardReply> detailList(int num) throws Exception {
       return dao.detailList(num);
    }
    // 해당 댓글 읽기(조회) ==============검토사항===================
    @Override
    public int reply(BoardReply boardReply) throws Exception {
       return dao.reply(boardReply);
    }
    // 댓글 쓰기
    @Override
    public BoardReply detailReply(int num) throws Exception {
       return dao.detailReply(num);
    }
    // 댓글 수정
    @Override
    public int replyUpdate(BoardReply boardReply) throws Exception {
       return dao.replyUpdate(boardReply);
    }
    // 댓글 삭제
    @Override
    public int replyDelete(BoardReply boardReply) throws Exception {
       return dao.replyDelete(boardReply);
    }

    
    // ============================================================= [ 포인트 샵 ] =============================================================   
    
    
	@Override
	public int usePoint(PointDTO PointDTO) throws Exception {
		return dao.usePoint(PointDTO);
	}
    
    
    
   // ============================================================= [ 마이페이지 - 유저 ] =============================================================    
    
	
	//개인 - 회원정보 변경
	@Override
	public UserDTO userDetail(String m_id) throws Exception {
		return dao.userDetail(m_id);
	}
	// 개인 - 회원정보 수정
	@Override
	public int userUpdate(UserDTO dto) throws Exception {
		return dao.userUpdate(dto);
	}
	
	
	// 회원 탈퇴
	@Override
	public int userDelete(UserDTO dto) throws Exception {
		return dao.userDelete(dto);
	}
	
	
	// 출석체크 포인트 업데이트
	@Override
	public int dateCheck(UserDTO dto) throws Exception {
		return dao.dateCheck(dto);
	}	
 	// 출석체크 후 세션 다시 불러오기
	@Override
	
	public UserDTO mySelect(UserDTO dto) throws Exception {
		return dao.mySelect(dto);
	}   
	

    // 내 게시물
    @Override
    public List<BoardDTO> myPageListMy() throws Exception {
       return dao.myPageListMy();
    }
    @Override
    public int getMyCnt() throws Exception {
       return dao.getMyCnt();
    }
    @Override
    public List<BoardDTO> myPageListMy(paging paging) throws Exception {
       return dao.myPageListMy(paging);
    } 
    

    // 나의 문의
    @Override
    public List<BoardDTO> myPageQuestion() throws Exception {
       return dao.myPageQuestion();
    }
    @Override
    public int getRequestMyCnt() throws Exception {
       return dao.getRequestMyCnt();
    }
    @Override
    public List<BoardDTO> myPageQuestion(paging paging) throws Exception {
       return dao.myPageQuestion(paging);
    }  
 	
    
	// 포인트 리스트
	@Override
	public List<BoardDTO> myPageUsePoint() throws Exception {
		return dao.myPageUsePoint();
	}
	@Override
	public int getUseMyPointCnt() throws Exception {
		return dao.getUseMyPointCnt();
	}
	@Override
	public List<BoardDTO> myPageUsePoint(paging paging) throws Exception {
		return dao.myPageUsePoint(paging);
	}
	
 	
 	
 	
 	
 	
// ============================================================= [ 마이페이지 - 관리자 ] =============================================================     	
 	
 	
 	// 관리자 정보 수정 (삭제)
 	
 	
 	
   
   // 회원 관리
   @Override
   public List<UserDTO> manage() throws Exception {
      return dao.manage();
   }
   @Override
   public int getMemberCnt() throws Exception {
      return dao.getMemberCnt();
   }
   @Override
   public List<UserDTO> manage(paging paging) throws Exception {
      return dao.manage(paging);
   }
   
   

   // 관리자 - 회원정보 삭제 BoardService임플
    @Override
    public int adminuserdelete(String m_id) throws Exception{
       return dao.adminuserdelete(m_id);
    }

	
	
    

    // 대기 문의
    @Override
    public int getRequestCnt() throws Exception {
       return dao.getRequestCnt();
    }
    @Override
    public List<BoardDTO> adminPageQuestion() throws Exception {
       return dao.adminPageQuestion();
    }
    @Override
    public List<BoardDTO> adminPageQuestion(paging paging) throws Exception {
       return dao.adminPageQuestion(paging);
    }
    
    // 문의 처리 완료
    @Override
    public int getRequesSuccesstCnt() throws Exception {
       return dao.getRequestCnt();
    }
    @Override
    public List<BoardDTO> adminPageQuestionSuccess() throws Exception {
       return dao.adminPageQuestionSuccess();
    }
    @Override
    public List<BoardDTO> adminPageQuestionSuccess(paging paging) throws Exception {
       return dao.adminPageQuestionSuccess(paging);
    }
    // 문의 처리 완료를 위한 메서드
    @Override
    public int questionSuccess(int BD_NUM) throws Exception {
       return dao.questionSuccess(BD_NUM);
    }
    
    
    
    
	
	// 관리자 - 포인트 처리 대기
    @Override
    public List<BoardDTO> adminPageUsePoint() throws Exception {
       return dao.adminPageUsePoint();
    }    
    @Override
    public int getPointCnt() throws Exception {
       return dao.getPointCnt();
    }
    @Override
    public List<BoardDTO> adminPageUsePoint(paging paging) throws Exception {
       return dao.adminPageUsePoint(paging);
    }
	
	// 관리자 - 포인트 처리 완료
    @Override
    public List<BoardDTO> adminPageUsePointSuccess() throws Exception {
       return dao.adminPageUsePointSuccess();
    }    
    @Override
    public int getPointSuccessCnt() throws Exception {
       return dao.getPointCnt();
    }
    @Override
    public List<BoardDTO> adminPageUsePointSuccess(paging paging) throws Exception {
       return dao.adminPageUsePointSuccess(paging);
    }
    
    
    
   
    // 포인트 디테일
    
    public PointDTO usePointDetail(int p_num) throws Exception {
        return dao.usePointDetail(p_num);
    }
   
    
    // 상품 처리
    @Override
   public int usePointSuccess(int p_num) throws Exception {
       return dao.usePointSuccess(p_num);
   }




}