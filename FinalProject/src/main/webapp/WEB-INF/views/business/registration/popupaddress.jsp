<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />

<% 

	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 

%>
</head>
<script>

function init(){
	var url = location.href;
	var confmKey = "devU01TX0FVVEgyMDI0MTAyMzExNTIzODExNTE4MDc=";//승인키
	var inputYn= "<%=inputYn%>"; //EL표현식
	if(inputYn != "Y"){ 
 	//Y:API 내부 로직에서 리턴되는 값, 샘플 소스를 통해 API를 정상적인 경로로 호출하고 있는지 판단
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.action="https://business.juso.go.kr/addrlink/addrLinkUrl.do?comfmKey="+encodeURIComponent(confmKey)+"&returnUrl="+encodeURIComponent(url); // 인터넷망
		document.form.submit();
		
	}else{
		console.log("<%=roadFullAddr%>");
		opener.jusoCallBack("<%=roadFullAddr%>");
		window.close();
	}

}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
	</form>
</body>
</html>