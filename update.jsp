<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.mdl.NoticeVO" %>
<%@ page import="notice.mdl.NoticeDAO" %>

<%
	String ctxPath = request.getContextPath();
	//			/TeamMVC
%>

<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration:none;
	}
	div.updateArea {
		width: 80%;
		margin: 100px 0 50px 0 ;
	}
	
</style>


<jsp:include page="../header.jsp" />
<script type="text/javascript">

	$(document).ready(function(){
		
		
	});

</script>

	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int noticeno = 0;
		if (request.getParameter("noticeno") != null) {
			noticeno = Integer.parseInt(request.getParameter("noticeno"));
		}
		if (noticeno == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'notice.jsp'");
		script.println("</script>");
		}
		NoticeVO notice = new NoticeDAO().getNotice(noticeno);
		
	%>
	
	<div class="updateArea">
		<div class="row">
			<form method="post" action="updateAction.jsp?noticeno=<%= noticeno %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" value="<%= notice.getTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="contents" maxlength="2048" style="height: 350px;"><%= notice.getContents() %></textarea></td>
						</tr>
					</tbody>
				</table>
					<input type="submit" class="btn btn-primary pull-right" value="글 수정">
			</form>
		</div>
	</div>
	
<jsp:include page="../footer.jsp" />