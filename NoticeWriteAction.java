package notice.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ctrl.AbstractController;
import member.mdl.*;
import notice.mdl.*;

public class NoticeWriteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
		// == 관리자(admin)로 로그인 했을 때만 제품등록이 가능하도록 한다. == //
		//HttpSession session = request.getSession();
				
		//MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				
				//if( loginuser != null && "admin".equals(loginuser.getUserid()) ) {// 관리자(admin)로 로그인 했을 경우
					  
					 // HttpSession sesssion = request.getSession();
					  
					  // !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
					  String title = request.getParameter("title");
					  title = title.replaceAll("<", "&lt;");
					  title = title.replaceAll(">", "&gt;");
					  
					  // !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
					  String contents = request.getParameter("contents");
					  contents = contents.replaceAll("<", "&lt;");
					  contents = contents.replaceAll(">", "&gt;");
					  contents = contents.replaceAll("\n", "<br>");
					  
					  // 입력한 내용에서 엔터는 <br>로 변환시키기
					  contents = contents.replaceAll("\r\n", "<br>");
					  
					  InterNoticeDAO ndao = new NoticeDAO();
					  
					  NoticeVO nvo = new NoticeVO();
					  nvo.setTitle(title);
					  nvo.setContents(contents);
					
					  // tbl_product 테이블에 제품정보 insert 하기 
					  int n = ndao.NoticeInsert(nvo);
					  
						String message;
						String loc;
					
					  if(n==1) {
						  message = "공지사항이 등록되었습니다.";
						  loc = request.getContextPath()+"/notice/view.neige?";
					  }
					  else {
						  message = "공지사항 등록이 실패하였습니다.";
						  loc = request.getContextPath()+"/notice/notice.neige";
					  }
					  
					  request.setAttribute("message", message);
					  request.setAttribute("loc", loc);
					  
					  super.setViewPage("/WEB-INF/notice/write.neige");
					  
					
						/*
						 * } else { // 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 String message = "관리자만 접근이 가능합니다.";
						 * String loc = "javascript:history.back()";
						 * 
						 * request.setAttribute("message", message); request.setAttribute("loc", loc);
						 * 
						 * // super.setRedirect(false); super.setViewPage("/WEB-INF/notice/notice.jsp");
						 * }
						 */
					
			}
		
}
