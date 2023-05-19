package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.dong.user.UserDTO;


public interface BoardService {


   // ============================================================= [회원] =============================================================

   // 로그인
   public Map login(Map<String, Object> map);
   // 세션 새로고침
   public UserDTO sessionId(UserDTO dto) throws Exception;
   // 최근 로그인 기록
   public int latelyLogin(UserDTO dto) throws Exception;
   
   
   // 회원가입
   public int joinMember(UserDTO dto) throws Exception;
   // 아이디 중복확인
   public int checkId(UserDTO dto) throws Exception;
   // 닉네임 중복확인
   public int checkEname(UserDTO dto) throws Exception;
   
   
   // ID 찾기
   public String findId(UserDTO dto) throws Exception;
   // Password 찾기
   public String findPw(UserDTO dto) throws Exception;
   // Password 바꾸기
   public int changePw(UserDTO dto) throws Exception;   
   
   
   // ============================================================= [게시판] =============================================================

   // 공지 게시물 처리를 위한 메소드
   public List<BoardDTO> list() throws Exception;
   // 공지 게시판 페이지 처리를 위한 카운트
   public int getListCnt() throws Exception;
   // 공지 게시물 페이징
   public List<BoardDTO> list(paging paging) throws Exception;
   
   
   // 인기 게시물 처리를 위한 메소드
   public List<BoardDTO> list_pop() throws Exception;
   // 인기 게시판 페이지처리를 위한 카운트
   public int getPopCnt() throws Exception;
   // 인기 게시물 페이징
   public List<BoardDTO> list_pop(paging paging) throws Exception;
   
   
   // 메인 게시물 처리를 위한 메소드
   public List<BoardDTO> list_main() throws Exception;
   // 메인 게시판 페이지처리를 위한 카운트
   public int getMainCnt() throws Exception;
   // 메인 게시물 페이징
   public List<BoardDTO> list_main(paging paging) throws Exception;
   
   
   // 자유 게시물 처리를 위한 메소드
   public List<BoardDTO> list_free() throws Exception;
   // 자유 게시판 페이지처리를 위한 카운트
   public int getFreeCnt() throws Exception;
   // 자유 게시물 페이징
   public List<BoardDTO> list_free(paging paging) throws Exception;
    

     
   // ============================================================= [레지스터, 디테일] =============================================================
   
   // 선택한 글 읽기
   public BoardDTO detail(int num) throws Exception;
   // 글 쓰기
   public int register(BoardDTO dto) throws Exception;
   // 글 수정
   public int update(BoardDTO dto) throws Exception;
   // 글 삭제
   public int delete(int num) throws Exception;
   
   
   // 조회수 증가
   public int updateReadCnt(int num) throws Exception;
   
   
   // 추천인 조회
   public int recommCheck(Recomm recomm) throws Exception;
   // 추천시 테이블 인서트
   public int insertRecomm(Recomm recomm) throws Exception;
   // 추천 취소시 테이블 딜리트
   public int deleteRecomm(Recomm Recomm) throws Exception;   
   // 추천수 증가
   public int recommUp(int up) throws Exception;
   // 추천수 감소
   public int recommDown(int down) throws Exception;
   // 개인 추천 관리(증가)
   public int userRecommUp(Recomm up) throws Exception;
   
   
   // ============================================================= [댓글] =============================================================
   // 댓글 전체 목록
   public List<BoardReply> detailList(int num) throws Exception;  
   // 해당 댓글 읽기(조회)
   public BoardReply detailReply(int num) throws Exception; 
   // 댓글 쓰기
   public int reply(BoardReply boardReply) throws Exception; 
   // 댓글 수정
   public int replyUpdate(BoardReply boardReply) throws Exception;
   // 댓글 삭제
   public int replyDelete(BoardReply boardReply) throws Exception;
   
   
   // ============================================================= [포인트] =============================================================
   
   
   //포인트
   public int usePoint(PointDTO PointDTO) throws Exception;

   
   
   
   
   // ============================================================= [마이페이지 - 유저(내역 회원 아이디를 통해서 보기)] =============================================================
   
   // 회원 정보 디테일
   public UserDTO userDetail(String m_id) throws Exception;
   
   // 회원 정보 수정
   public int userUpdate(UserDTO dto) throws Exception;

   // 회원탈퇴
   public int userDelete(UserDTO dto) throws Exception;

   // 출석체크
   public int dateCheck(UserDTO dto) throws Exception;
   // 출석체크 후 세션 다시 불러오기
   public UserDTO mySelect(UserDTO dto) throws Exception;
   
   
   // 내게시물 처리를 위한 메소드
   public List<BoardDTO> myPageListMy() throws Exception;
   public int getMyCnt() throws Exception;
   public List<BoardDTO> myPageListMy(paging paging) throws Exception;

   
   // 나의 문의 게시물 처리를 위한 메소드
   public List<BoardDTO> myPageQuestion() throws Exception;
   public int getRequestMyCnt() throws Exception;
   public List<BoardDTO> myPageQuestion(paging paging) throws Exception;
   
   
   // 포인트 사용 내역
   public List<BoardDTO> myPageUsePoint() throws Exception;
   public int getUseMyPointCnt() throws Exception;
   public List<BoardDTO> myPageUsePoint(paging paging) throws Exception;
   
   
   
   
   // ============================================================= [마이페이지 - 관리자(내역 전체 보기)] =============================================================
   
   // 관리자 정보 수정 (삭제)
   
   
   //회원관리 페이지처리
   public int getMemberCnt() throws Exception;
   //회원관리 처리를 위한 메소드
   public List<UserDTO> manage() throws Exception;
   //회원관리 페이징
   public List<UserDTO> manage(paging paging) throws Exception;
   
   
   // 회원 관리 정보 삭제 다오
   public int adminuserdelete(String m_id) throws Exception;
   
   
   // 회원정보 상세조회
   // 관리자 - 회원 정보 수정 
   // 관리자 - 회원정보 삭제   

   
  // 나의 문의 대기
  public List<BoardDTO> adminPageQuestion() throws Exception;
  public int getRequestCnt() throws Exception;
  public List<BoardDTO> adminPageQuestion(paging paging) throws Exception;
  
  // 나의 문의 대기 처리 완료
  public List<BoardDTO> adminPageQuestionSuccess() throws Exception;
  public int getRequesSuccesstCnt() throws Exception;
  public List<BoardDTO> adminPageQuestionSuccess(paging paging) throws Exception;
  
  
  // 포인트 처리 대기
  public List<BoardDTO> adminPageUsePoint() throws Exception;
  public int getPointCnt() throws Exception;
  public List<BoardDTO> adminPageUsePoint(paging paging) throws Exception;
  
  // 포인트 처리 완료
  public List<BoardDTO> adminPageUsePointSuccess() throws Exception;
  public int getPointSuccessCnt() throws Exception;
  public List<BoardDTO> adminPageUsePointSuccess(paging paging) throws Exception;
  

  
  // 문의처리 완료 를 위한 메소드
  public int questionSuccess(int BD_NUM) throws Exception;
  
  // 포인트 사용 내역 디테일
  public PointDTO usePointDetail(int p_num) throws Exception;

  // 포인트 처리 완료 디테일
  public int usePointSuccess(int p_num) throws Exception;
  

   

}