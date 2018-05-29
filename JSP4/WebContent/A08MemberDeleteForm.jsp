<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{
	font-family:Nanum Gothic;
}
	table {
		width: 500px;
		margin: 0 auto;
	}
		table, tr, th, td {
		border: 1px solid black;
		border-collapse:collapse;
	}
	.mainName {
		padding: 10px;
	}
	
	.subName {
		width: 150px;
		padding: 5px;
		text-align: center;
	}
	
	.end {
		padding: 5px;
		text-align: center;
	}
</style>
</head>
<body>
			<form action="A09MemberDeleteProc.jsp" method="post">
				<table>
					<thead>
						<tr>
							<th colspan="2" class="mainName">회원정보 삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="subName">아이디</th>
							<td><%=request.getParameter("id") %></td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" name="pass1" id="" /></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" class="end">
								<input type="hidden" name="id" value="<%=request.getParameter("id") %>" />
								<input type="submit" value="회원삭제" />
								<button type="button" onclick="location.href='A04MemberList.jsp'">회원전체보기</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
</body>
</html>