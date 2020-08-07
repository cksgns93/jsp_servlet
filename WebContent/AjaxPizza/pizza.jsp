<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<style type="text/css">
	/* body,h2{
		font-family:돋움,돋움체,verdana;
		color:navy;
	} */
</style>

<script type="text/javascript">
	var req=false;
	function init(){
		try{
			req=new XMLHttpRequest();//Ajax요청을 보내기 위해서 반드시 필요한 자바스크립트 객체
		}catch(e){
			//XMLHttpRequest객체를 지원하지 않는 브라우저인 경우
			try{
				req=new ActiveXObject("Msxml2.XMLHTTP");//IE인 경우
			}catch(e2){
				req=false;
			}
		}
		if(!req){
			alert('Ajax요청 불가 - req객체 생성 실패');
		}
	}
	function getUserInfo(){
		//사용자가 입력한 연락처 값을 받자.
		var phone = $("#phone").val();
		//alert(phone);
		//서버쪽에 연락처 정보를 가지고 요청을 보내자
		req.open("GET","pizzaResult.jsp?phone="+phone,true);
		//open(method방식, 서버페이지, 비동기여부)
		req.onreadystatechange=updatePage;
		//준비상태가 변화될 때마다 updatePage함수를 호출함
		/*요청을 send하기 전에 반드시 위 속성에 콜백함수를 지정해야 한다.*/
		
		req.send(null);//요청을 전송
		//get방식의 요철일 경우는 null을 넣어주고
		//post방식의 요청일 경우는 파라미터 데이터를 매개변수로 전달한다.
	}//getUserInfo()
	
	function updatePage(){
		//alert("req.readyState= "+req.readyState+", req.status="+req.status);
		if(req.readyState==4&&req.status==200){
			//성공적인 응답이 왔다면
			//서버로부터 받은 응답 데이터를 추출
			var res=req.responseText;
			//텍스트 형태의 데이터일 경우 => responseText로 응답 데이터를 추출
			//XML형태의 데이터일 경우 => responseXML로 응답데이터를 추출
			//alert(res);
			var data=res.split("|");
			//구분자('|')를 기준으로 쪼개어 배열에 할당
			var midx=data[0];//string
			var mname=data[1];
			var maddr=data[2];
			if(parseInt(midx)!=0){
				var str="<ul class='list-group text-left'>";
				str+="<li class='list-group-item'>회원번호: "+midx+"</li>";
				str+="<li class='list-group-item'>회원이름: "+mname+"</li>";
				str+="<li class='list-group-item'>회원주소: "+maddr+"</li>";
				str+="</ul>"
				$('#userInfo').html(str);
				$('#userInfo').fadeIn(10);
				$('#nonUser').fadeOut(10);
			}else{
				$('#userInfo').html(str);
				$('#userInfo').fadeOut(10);
				$('#nonUser').fadeIn(10);
				$('#addr').focus();
			}
		}
	}
	window.onload=init;
</script>

</head>
<body>
<div class="section">
<div class="container">
	<h1>Pizza Order Page</h1>
	<form role="form" class="form-horizontal" 
	name="orderF" id="orderF"
	 action="order.jsp" method="POST">
		<div class="form-group">
			<p class="text-info">
			<b>귀하의 전화번호를 입력하세요:</b>
			<input type="text" size="20"
			 name="phone" id="phone" 
			 onchange="getUserInfo()"
			  class="form-control"/>
			</p>
			<p class="text-danger">
			<b>
				귀하가 주문하신 피자는 아래 주소로 배달됩니다.
			</b>	
			</p>
			<div id="userInfo"></div>
			<div id="address"></div>
			<!-- 비회원 입력 폼 : 비회원일 경우 주소입력 폼을 보여주자.-->
			<div id="nonUser" style="display:none;">
				주소: <input type="text" name="addr" id="addr"
						size="60" style="border:2px solid maroon;" class="form-control"/>
			</div>
			<!-- ------------------------------------------- -->
			<p class="text-info">
			<b>주문 내역을 아래에 기입하세요</b></p>
			<p>
				<textarea name="orderList"
				 id="orderList" rows="6" cols="50" class="form-control"></textarea>
			</p>
			<p>
				<input type="submit" value="Order Pizza" class="btn btn-primary"/>
			</p>
		</div>
	</form>
</div>
</div>

<jsp:include page="/foot.jsp"/>
</body>
</html>