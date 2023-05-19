package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.user.UserDTO;

@Repository //세션호출하기 위함
public class BoardDAOImpl implements BoardDAO {
   @Autowired
   private SqlSession sqlsession;
   private static final String namespace = "kr.co.dong.boardMapper";
   
   
   // ============================================================= [회원] =============================================================

    // 로그인
    @Override
    public Map login(Map<String, Object> map) {
       return sqlsession.selectOne(namespace + ".login", map);
    }
   	// 세션 새로고침
	@Override
	public UserDTO sessionId(UserDTO dto) throws Exception {
		return sqlsession.selectOne(namespace+".sessionId",dto);
	}
	// 최근 로그인 기록
	@Override
	public int latelyLogin(UserDTO dto) throws Exception {
		return sqlsession.update(namespace+".latelyLogin",dto);
	}
	
	
    // 회원 가입
    @Override
    public int joinMember(UserDTO dto) throws Exception {
       return sqlsession.insert(namespace+".joinMember", dto);
    }
    // 아이디 중복확인
	@Override
	public int checkId(UserDTO dto) throws Exception {
		return sqlsession.selectOne(namespace+".checkId", dto);
	}
	// 닉네임 중복확인
	@Override
	public int checkEname(UserDTO dto) throws Exception {
		return sqlsession.selectOne(namespace+".checkEname", dto);
	}
   
   
   // ID 찾기
	@Override
	public String findId(UserDTO dto) throws Exception {
		return sqlsession.selectOne(namespace+".findId", dto);
	}	
	// Password 찾기
	@Override
	public String findPw(UserDTO dto) throws Exception {
		return sqlsession.selectOne(namespace+".findPw", dto);
	}
	// Password 바꾸기
	@Override
	public int changePw(UserDTO dto) throws Exception {
		return sqlsession.update(namespace+".changePw", dto);
	}


	
	// ============================================================= [게시판] =============================================================
	
	
	//공지
    @Override
    public int getListCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getListCnt");
    }
    @Override
    public List<BoardDTO> list() throws Exception {
       return sqlsession.selectList(namespace + ".list");
    }
    @Override
    public List<BoardDTO> list(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".list", paging);
    }
   
   
    //인기
    @Override
    public int getPopCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getPopCnt");
    }
    @Override
    public List<BoardDTO> list_pop() throws Exception {
       return sqlsession.selectList(namespace + ".list_pop");
    }
    @Override
    public List<BoardDTO> list_pop(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".list_pop",paging);
    }
   
   
    //메인
    @Override
    public int getMainCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getMainCnt");
    }
    @Override
    public List<BoardDTO> list_main() throws Exception {
       return sqlsession.selectList(namespace + ".list_main");
    }
    @Override
    public List<BoardDTO> list_main(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".list_main", paging);
    }

   
    //자유
    @Override
    public int getFreeCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getFreeCnt");
    }
    @Override
    public List<BoardDTO> list_free() throws Exception {
       return sqlsession.selectList(namespace + ".list_free");
    }
    @Override
    public List<BoardDTO> list_free(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".list_free", paging);
    }

	
	
	
    // ============================================================= [레지스터, 디테일] =============================================================
	
    // 선택한 글 읽기
    @Override
    public BoardDTO detail(int num) throws Exception {
    	return sqlsession.selectOne(namespace + ".detail", num);
    }
    
	// 글 쓰기
    @Override
    public int register(BoardDTO boardDTO) throws Exception {
       return sqlsession.insert(namespace+".register", boardDTO);
    }
    
    // 글 수정
    @Override
    public int update(BoardDTO boardDTO) throws Exception {
       return sqlsession.update(namespace+".update", boardDTO);
    }
    
    // 글 삭제
    @Override
    public int delete(int BD_NUM) throws Exception {
       return sqlsession.update(namespace+".delete", BD_NUM);
    }
    
    // 조회수 증가
    @Override
    public int updateReadCnt(int BD_NUM) throws Exception {
       return sqlsession.update(namespace+".updateReadCnt", BD_NUM);
    }
    
    
    
    // 추천인 조회
 	@Override
 	public int recommCheck(Recomm recomm) throws Exception {
 		return sqlsession.selectOne(namespace+".recommCheck",recomm);
 	}
    // 추천시 테이블 인서트
 	@Override
 	public int insertRecomm(Recomm recomm) throws Exception {
 		return sqlsession.insert(namespace+".insertRecomm",recomm);
 	}
 	// 추천 취소시 테이블 딜리트
 	@Override
 	public int deleteRecomm(Recomm Recomm) throws Exception {	
 		return sqlsession.delete(namespace+".deleteRecomm",Recomm);
 	}

    // 추천수 증가
 	@Override
 	public int recommUp(int up) throws Exception {
 		return sqlsession.update(namespace+".recommUp",up);
 	}
 	// 추천수 감소
 	@Override
 	public int recommDown(int down) throws Exception {
 		return sqlsession.update(namespace+".recommDown",down);
 	}
 	// 개인 추천수 관리(증가)
 	@Override
 	public int userRecommUp(Recomm up) throws Exception {
 		return sqlsession.update(namespace+".userRecommUp",up);
 	}
    
 	
    
    
   // ============================================================= [ 댓글 ] =============================================================
    
 	
 	// 댓글 전체 목록
    @Override
    public List<BoardReply> detailList(int num) throws Exception {
       return sqlsession.selectList(namespace + ".detailList", num);
    }

    // 해당 댓글 읽기(조회) ==============검토사항===================
    @Override
    public int reply(BoardReply boardReply) throws Exception {
       return sqlsession.insert(namespace+".reply", boardReply);
    }

    // 댓글 쓰기
    @Override
    public BoardReply detailReply(int num) throws Exception {
       return sqlsession.selectOne(namespace + ".detailReply", num);
    }
    // 댓글 수정
    @Override
    public int replyUpdate(BoardReply boardReply) throws Exception {
       return sqlsession.update(namespace+".replyUpdate", boardReply);
    }
    // 댓글 삭제
    @Override
    public int replyDelete(BoardReply boardReply) throws Exception {
       return sqlsession.delete(namespace+".replyDelete", boardReply);
    }

    
    // ============================================================= [ 포인트 샵 ] =============================================================
    
    
   	@Override
   	public int usePoint(PointDTO PointDTO) throws Exception {
   		return sqlsession.insert(namespace+".usePoint", PointDTO);
   	}
    
   // ============================================================= [ 마이페이지 - 유저 ] =============================================================    
    
	
	//개인 - 회원정보 변경
	@Override
	public UserDTO userDetail(String m_id) throws Exception {
		return sqlsession.selectOne(namespace+".userDetail",m_id);
	}
	// 개인 - 회원정보 수정
	@Override
	public int userUpdate(UserDTO dto) throws Exception {
		return sqlsession.update(namespace+".userUpdate",dto);
	}
	// 회원 탈퇴
	@Override
	public int userDelete(UserDTO dto) throws Exception {
		return sqlsession.update(namespace+".userDelete",dto);
	}
	
	
	// 출석체크 포인트 업데이트
	@Override
	public int dateCheck(UserDTO dto) throws Exception {
		return sqlsession.update(namespace + ".ptUpdate", dto);
	}	
 	// 출석체크 후 세션 다시 불러오기
	@Override
	public UserDTO mySelect(UserDTO dto) throws Exception {
		return sqlsession.selectOne(namespace + ".mySelect", dto);
	}   
	

    // 내 게시물
    @Override
    public List<BoardDTO> myPageListMy() throws Exception {
       return sqlsession.selectList(namespace + ".myPageListMy");
    }
    @Override
    public int getMyCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getMyCnt");
    }
    @Override
    public List<BoardDTO> myPageListMy(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".myPageListMy", paging);
    } 
    

    // 나의 문의
    @Override
    public List<BoardDTO> myPageQuestion() throws Exception {
       return sqlsession.selectList(namespace + ".myPageQuestion");
    }
    @Override
    public int getRequestMyCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getRequestMyCnt");
    }
    @Override
    public List<BoardDTO> myPageQuestion(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".myPageQuestion", paging);
    }  
 	
    
	// 포인트 사용 내역
	@Override
	public List<BoardDTO> myPageUsePoint() throws Exception {
		return sqlsession.selectList(namespace+".myPageUsePoint");
	}
	@Override
	public int getUseMyPointCnt() throws Exception {
		return sqlsession.selectOne(namespace+".getUseMyPointCnt");
	}
	@Override
	public List<BoardDTO> myPageUsePoint(paging paging) throws Exception {
		return sqlsession.selectList(namespace+".myPageUsePoint", paging);
	}
	
 	
 	
 	
 	
 	
// ============================================================= [ 마이페이지 - 관리자 ] =============================================================     	
 	
 	
 	// 관리자 정보 수정 (삭제)
	   
   	// 관리자 - 회원정보 수정
   	// userUpdate(마이페이지에서 사용하는 것과 동일)
	// userDetail(마이페이지에서 사용하는 것과 동일)
	// userDelete(마이페이지에서 사용하는 것과 동일)
	
	
	 // 관리자 - 회원정보 삭제 다오 임플
    @Override
    public int adminuserdelete(String m_id) throws Exception {
       return sqlsession.update(namespace+".adminuserdelete",m_id);
    }


    // 회원 관리
    @Override
    public List<UserDTO> manage() throws Exception {
       return sqlsession.selectList(namespace + ".manage");
    }
    @Override
    public int getMemberCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getMemberCnt");
    }
    @Override
    public List<UserDTO> manage(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".manage", paging);
    }
	
	
    // 문의 처리 대기
    @Override
    public List<BoardDTO> adminPageQuestion() throws Exception {
       return sqlsession.selectList(namespace + ".adminPageQuestion");
    }
    @Override
    public int getRequestCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getRequestCnt");
    }
    @Override
    public List<BoardDTO> adminPageQuestion(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".adminPageQuestion", paging);
    }
    

    // 문의 처리 완료
    @Override
    public List<BoardDTO> adminPageQuestionSuccess() throws Exception {
       return sqlsession.selectList(namespace + ".adminPageQuestionSuccess");
    }
    @Override
    public int getRequesSuccesstCnt() throws Exception {
       return sqlsession.selectOne(namespace+".getRequesSuccesstCnt");
    }
    @Override
    public List<BoardDTO> adminPageQuestionSuccess(paging paging) throws Exception {
       return sqlsession.selectList(namespace + ".adminPageQuestionSuccess", paging);
    }
    
    // 문의 처리 완료를 위한 메서드
    @Override
    public int questionSuccess(int BD_NUM) throws Exception {
       return sqlsession.update(namespace+".questionSuccess", BD_NUM);
    }



    
    // 관리자 - 포인트 사용 대기
    @Override
    public List<BoardDTO> adminPageUsePoint() throws Exception {
    	return sqlsession.selectList(namespace + ".adminPageUsePoint");
    } 
    @Override
    public int getPointCnt() throws Exception {
    	return sqlsession.selectOne(namespace+".getPointCnt");
    }
    @Override
    public List<BoardDTO> adminPageUsePoint(paging paging) throws Exception {
    	return sqlsession.selectList(namespace + ".adminPageUsePoint", paging);
    }
    
    
    // 관리자 - 포인트 처리 완료
    @Override
    public List<BoardDTO> adminPageUsePointSuccess() throws Exception {
    	return sqlsession.selectList(namespace + ".adminPageUsePointSuccess");
    }  
    @Override
    public int getPointSuccessCnt() throws Exception {
    	return sqlsession.selectOne(namespace+".getPointSuccessCnt");
    } 
    @Override
    public List<BoardDTO> adminPageUsePointSuccess(paging paging) throws Exception {
    	return sqlsession.selectList(namespace + ".adminPageUsePointSuccess", paging);
    }
   
    

    
    
    // 포인트 디테일
    
    public PointDTO usePointDetail(int p_num) throws Exception {
        return sqlsession.selectOne(namespace + ".usePointDetail", p_num);
    }

    // 포인트 처리를 완료하는 메서드
     @Override
    public int usePointSuccess(int p_num) throws Exception {
        return sqlsession.update(namespace+".usePointSuccess", p_num);
    }




}