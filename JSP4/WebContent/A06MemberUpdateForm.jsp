<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="Model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		font-family: "돋움";
	}
	
	table {
		width: 500px;
		margin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
	}
	
	.mainName {
		padding: 10px;
	}
	
	.subName {
		width: 150px;
		padding: 5px;
		text-align: right;
	}
	
	.control {
		width: 350px;
	}
	
	#selectcontrol {
		width: 150px;
	}
	
	.end {
		padding: 5px;
		text-align: center;
	}
</style>
</head>
<body>
	<!-- 1.테이블에서 사용자가 수정할 한명의 회원정보를 가져옴 -->
	<%
		String id = request.getParameter("id");
		MemberDAO mdao = new MemberDAO();
		MemberBean mbean = mdao.selectMember(id);
	%>
	<!-- 2.table 태그를 이용하여 화면에 사용자가 수정할 한명의 회원정보를 출력
				이때 아이디는 고정된 값으로 출력해야함:아이디는 수정 불가 -->
				<form  action="A07MemberupdateProc.jsp" method="post">
					<table>
						<thead>
							<tr>
								<th class="mainName" colspan="2">회원접보수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="subName">아이디</th>
								<td><%=mbean.getId() %></td>
							</tr>
							<tr >
								<th class="subName">비밀번호</th>
								<td><input type="password" name="pass1" class="control"></td>
							</tr>
							<tr>
								<th class="subName">이메일</th>
								<td><input type="email" name="email" placeholder="abc@abc.com" class="control" value="<%=mbean.getEmail() %>" /></td>
							</tr>
							<tr>
								<th class="subName">전화번호</th>
								<td><input type="text" name="tel" class="control" value="<%=mbean.getTel() %>" /></td>
							</tr>
		<%
				String hob = mbean.getHobby();
				String[] hob_arr = hob.split(" ");
				
				String[] hob_N = {"N","N","N","N"};//
				
				for(int i=0;i<hob_arr.length;i++){
					if(hob_arr[i].equals("낚시")){
						hob_N[0]="Y";
					}else if(hob_arr[i].equals("등산")){
						hob_N[1]="Y";
					}else if(hob_arr[i].equals("영화")){
						hob_N[2]="Y";
					}else if(hob_arr[i].equals("음악")){
						hob_N[3]="Y";
					}
					
				}
		%>
							<tr>
								<th class="subName">취미</th>
								<td>
									<input type="checkbox" name="hobby"  value="낚시" id="chk1"  <%=hob_N[0].equals("Y")?"checked":"" %>>
									 <label for="chk1">낚시</label>&nbsp;
									 <input type="checkbox" name="hobby"  value="등산" id="chk2"  <%=hob_N[1].equals("Y")?"checked":"" %> >
									 <label for="chk2">등산</label>&nbsp;
									 <input type="checkbox" name="hobby"  value="영화" id="chk3" <%=hob_N[2].equals("Y")?"checked":"" %> >
									 <label for="chk3">영화</label>&nbsp;
									 <input type="checkbox" name="hobby"  value="음악" id="chk4" <%=hob_N[3].equals("Y")?"checked":"" %> >
									 <label for="chk4">음악</label>&nbsp;
								</td>
							</tr>
							<tr>
								<th class="subName">직업</th>
								<td>
								 	<select name="job" id="selectedcontrol">
										<option value="프로그래머" selected=" <%=mbean.getJob().equals("프로그래머")?"selected":"" %>">프로그래머</option>
										<option value="디자이너"  selected=" <%=mbean.getJob().equals("디자이너")?"selected":"" %>">디자이너</option>
										<option value="모델러"  selected=" <%=mbean.getJob().equals("모델러")?"selected":"" %>">모델러</option>
										<option value="관리자"  selected=" <%=mbean.getJob().equals("관리자")?"selected":"" %>">관리자</option>
									</select>
									</td>
							</tr>
							<tr>
								<th class="subName">
									<td>
										<input type="radio" name="" id="rad1"  <%=mbean.getAge().equals("10")?"checked":"" %>/><label for=rad1>10대</label>
										<input type="radio" name="" id="rad2"  <%=mbean.getAge().equals("20")?"checked":"" %>/><label for=rad2>20대</label>
										<input type="radio" name="" id="rad3"  <%=mbean.getAge().equals("30")?"checked":"" %>/><label for=rad3>30대</label>
										<input type="radio" name="" id="rad4"  <%=mbean.getAge().equals("40")?"checked":"" %>/><label for=rad4>40대</label>
									</td>
								</th>
							</tr>
							<tr>
								<th class="subName"></th>
									<td><textarea name="info" id="" cols="40" rows="10" class="control"><%=mbean.getInfo() %></textarea>
									</td>
								
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2" class="end">
									<input type="hidden" name="id" value="<%=mbean.getId() %>"/>
									<input type="submit" value="회원정보수정" />
									<button type="button" onclick="location.href='A04MemberList.jsp'">회원전체보기</button>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
</body>
</html>