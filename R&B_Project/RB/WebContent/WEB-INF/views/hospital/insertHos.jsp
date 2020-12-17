<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 정보 입력</title>
</head>
<body>
	 <div id="bottom">
            <div id="insert">
                    <form class="form-horizontal" action="/insert" method="post">
                        <div id="bottom_left">
                          <div class="form-group">
                            <label class="col-sm-3 control-label" style="text-align: left;">1. 이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="name" name="hpName"value="${list[0].hpName }">
                            </div>
                          </div>
                            <div class="form-group">
                            <label class="col-sm-3 control-label" style="text-align: left;">2. 주민등록번호</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="number" name="hpNumber" value="${list[0].hpNumber }">
                            </div>
                          </div>
                             <div class="form-group">
                            <label class="col-sm-3 control-label" style="text-align: left;">3. 전&nbsp;&nbsp;화&nbsp;&nbsp;번&nbsp;&nbsp;호</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="phone" name="hpPhone" value="${list[0].hpPhone }">
                            </div>
                          </div>
                            <div class="form-group">
                            <label class="col-sm-3 control-label" style="text-align: left;">4. 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="addr" name="hpAddr" value="${list[0].hpAddr }">
                            </div>
                          </div>
                        </div>
                        
                        <div id="bottom_right">
                            <div class="form-group">
                            <label class="col-sm-3 control-label">진&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;&nbsp;용</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="dis" name="hpDis" >
                            </div>
                          </div>
                            <div class="form-group">
                            <label class="col-sm-3 control-label">검&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;&nbsp;용</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="check"name="hpCheck" >
                            </div>
                          </div>
                             <div class="form-group">
                            <label class="col-sm-3 control-label">약&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="medi" name="hpMedi" >
                            </div>
                            </div>
                        <button type="submit" class="btn btn-default" style="float:right; margin-right : 10%;">저장</button>
                    </div>
				</form>
            </div>
        </div>
</body>
</html>