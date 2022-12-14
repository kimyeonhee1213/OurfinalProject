<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function product_write(){
	//태그를 name으로 조회할 경우(계층구조로 접근)
	//var product_name=document.form1.product_name.value;
	//태그를 id로 조회할 경우
	var product_kind=$("#product_kind").val();
	var product_name=$("#product_name").val();
	var price=$("#price").val();
	var product_desc=$("#product_desc").val();
	if(product_kind==""){//빈값이면
		alert("상품 분류를 입력하세요.");
	$("#product_kind").focus();//입력 포커스 이동
	return;
	}
	if(product_name==""){//빈값이면
		//문자열 비교 : java는 a.equals(b), javascript는 a==b
		alert("상품이름을 입력하세요");
		$("#product_name").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
	if(price==""){
		alert("가격을 입력하세요");
		$("#price").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
 	if(product_desc==""){
		alert("상품설명을 입력하세요");
		$("#product_desc").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	} 
	document.form1.action="${path}/shop/product/insert.do";
	document.form1.submit();
}
</script>
<style type="text/css">
.table {
margin-left: auto;
margin-right: auto;
margin-top: auto;
}
.reg {
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 1px;
  border-radius: 2px;
  outline:1px solid;
  outline-color: #000000;
  background-color: transparent;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<br>
<div class="text-center">
<h2>Product registration</h2><br>
<form name="form1" method="post" enctype="multipart/form-data">
<table style="width: 100%"; class="table">
 <tr>
  <td>상품분류</td>
  <td><input name="product_kind" id="product_kind" class="reg" placeholder="생활 or 의류 or 위생 or 장난감 or 목욕"> </td>
 </tr>
 <tr>
  <td>상품명</td>
  <td><input name="product_name" id="product_name" class="reg"> </td>
 </tr>
 <tr>
  <td>가격</td>
  <td><input name="price" id="price" class="reg"> </td>
 </tr>
 <tr>
  <td>상품설명</td>
  <td>
   <textarea rows="5" cols="60" name="product_desc" id="product_desc" class="reg"></textarea>
   <script>
   CKEDITOR.replace("product_desc", {
	   filebrowserUploadUrl : "${path}/imageUpload.do"
   });
   </script>  
  </td>
 </tr>
 <tr>
  <td>상품이미지</td>
  <td>
   <input type="file" name="file1" id="file1" class="reg">
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" class="btn btn-outline-warning btn-sm" value="등록" onclick="product_write()">
   <input type="button" class="btn btn-outline-warning btn-sm" value="목록" onclick="location.href='${path}/admin/list.do'">
  </td>
 </tr>
</table>
</form>
</div>
</body>
</html>