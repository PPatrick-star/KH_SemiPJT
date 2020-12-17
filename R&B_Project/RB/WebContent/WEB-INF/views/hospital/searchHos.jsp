<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 검색</title>
</head>
<body>
	 <div id="top">
            <div class="top" id="search">
                <div id="search_form">
                    <form class="form-inline" action="/search" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" id="searchName" name="hpName" placeholder="Search Name">
                        </div>
                        <button type="submit" class="btn btn-default">검색</button>
                    </form>
                </div>
                <div id="search_table">
                    <table class="table table-hover">
						<thead>
							<th class="sel1">No.</th><th>이름</th><th>주민번호</th><th>전화번호</th>
						</thead>
						<tbody>
							<c:forEach items="${hlist}" var="hOne" varStatus="status">
                            <tr>
                                <td>${status.count }</td>
                                <td><a href="/select?hpNumber=${hOne.hpNumber}">${hOne.hpName}</a></td>
                                <td>${hOne.hpNumber}</td>
                                <td>${hOne.hpPhone }</td>
                            </tr>
				            </c:forEach>
                        </tbody>
					</table>
                </div>
            </div>
            <div class="top" id="select">
                <div id="select_table">
                    <table class="table table-striped">
						<thead>
							<th class="sel1">No.</th><th>날짜</th><th>진료내용</th><th>검사내용</th><th>약처방</th>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list" varStatus="stat">
							<tr>
								<td>${list.hpNo }</td>
								<td>${list.hpDate}</td>
								<td>${list.hpDis}</td>
								<td>${list.hpCheck }</td>
								<td>${list.hpMedi }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
                </div>
            </div>
        </div>
</body>
</html>