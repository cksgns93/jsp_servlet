<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<script type="text/javascript">
	$(function(){
		$('#bt1').click(function(){
			$.ajax({
				type:'get',
				url:'jsonData.jsp',
				dataType:'json',
				cache:false,
				success:function(res){
					//alert(JSON.stringify(res));
					showData(res);
				},error:function(err){
					alert("error: "+err.status);
				}
			})
		});
		
		$('#bt2').click(function(){
			$.ajax({
				type:'get',
				url:'jsonData2.jsp',
				dataType:'json',
				cache:false,
				success:function(res){
					//alert(JSON.stringify(res));
					showList(res);
				},error:function(err){
					alert("error: "+err.status);
				}
			})
		});
		
		$('#bt3').click(function(){
			$.ajax({
				type:'get',
				url:'jsonData3.jsp',
				dataType:'json',
				cache:false,
				success:function(res){
					//alert(JSON.stringify(res));
					showList2(res);
				},error:function(err){
					alert("error: "+err.status);
				}
			})
		})
		$('#bt4').click(function(){
			$.ajax({
				type:'get',
				url:'jsonData4.jsp',
				dataType:'json',
				cache:false,
				success:function(res){
					//alert(JSON.stringify(res));
					showList(res);
				},error:function(err){
					alert("error: "+err.status);
				}
			})
		})
		$('#bt5').click(function(){
			$.ajax({
				type:'get',
				url:'jsonData5.jsp',
				dataType:'json',
				cache:false,
				success:function(res){
					//alert(JSON.stringify(res));
					showList(res);
				},error:function(err){
					alert("error: "+err.status);
				}
			})
		})
		$('#bt6').click(function(){
			$.ajax({
				type:'get',
				url:'jsonData6.jsp',
				dataType:'json',
				cache:false,
				success:function(res){
					//alert(JSON.stringify(res));
					showList(res);
				},error:function(err){
					alert("error: "+err.status);
				}
			})
		})
		$('#bt7').click(function(){
			var url ="naverBookApi.jsp?query="+encodeURIComponent("사랑과 평과");
			$.ajax({
				type:'get',
				url:url,
				dataType:'json',
				cache:false,
				success:function(res){
					//alert(JSON.stringify(res));
					//showList(res);
					var str="<h2>검색 결과</h2>";
					$.each(res.items, function(i,book){
						str+=book.title+"<br>";
					})
					$("#msg").html(str);
				},error:function(err){
					alert("error: "+err.status);
				}
			})
		})
	})
	//단일 객체로 받아올 경우
	var showData=function(data){
		var str ="<table class='table table-bordered'>";
			str+="<tr>";
			str+="<th>도서명</th><th>출판사</th><th>가격</th><th>출판일</th>"
			str+="</tr>";
			str+="<tr>";
			str+="<td>"+data.title;
			str+="<br><img src='../images/"+data.bimage+"' class='img img-thumbnail'";
			str+="</td>";
			str+="<td>"+data.publish+"</td>";
			str+="<td>"+data.price+"</td>";
			str+="<td>"+data.published+"</td>";
			str+="</tr>";
			str+="</table>"
			$('#msg').html(str);
	}
	var showList=function(data){
		var str ="<table class='table table-bordered'>";
		str+="<tr>";
		str+="<th>도서명</th><th>출판사</th><th>가격</th><th>출판일</th>"
		str+="</tr>";
		str+="<tr>";
		//2) 배열로 받아올 경우 => 반복문 돌린다.
		//$.each(배열,function(index, item){})
		
		/* for(var i=0;i<data.length;i++){			
			str+="<td>"+data[i].title;
			str+="<br><img src='../images/"+data[i].bimage+"' class='img img-thumbnail'";
			str+="</td>";
			str+="<td>"+data[i].publish+"</td>";
			str+="<td>"+data[i].price+"</td>";
			str+="<td>"+data[i].published+"</td>";
			str+="</tr>";
		} */
		$.each(data,function(i,book){
			str+="<td>"+book.title+i;
			str+="<br><img src='../images/"+book.bimage+"' class='img img-thumbnail img-fluid' style='70%'>";
			str+="</td>";
			str+="<td>"+book.publish+"</td>";
			str+="<td>"+book.price+"</td>";
			str+="<td>"+book.published.year+"</td>";
			str+="</tr>";
		});
		str+="</table>"
		$('#msg').html(str);
	}
	var showList2=function(data){
		var str ="<table class='table table-bordered'>";
		str+="<tr>";
		str+="<th>도서명</th><th>출판사</th><th>가격</th><th>출판일</th>"
		str+="</tr>";
		str+="<tr>";
		$.each(data.book_all,function(i,book){
			str+="<td>"+book.title+i;
			str+="<br><img src='../images/"+book.bimage+"' class='img img-thumbnail'";
			str+="</td>";
			str+="<td>"+book.publish+"</td>";
			str+="<td>"+book.price+"</td>";
			str+="<td>"+book.published+"</td>";
			str+="</tr>";
		});
		str+="</table>"
		$('#msg').html(str);
	}
</script>
<div class="text-left p-5">
	<h1>JSON형태로 데이터를 받아봅시다</h1>
	<button id="bt1">JSON형태로 받기1</button>
	<button id="bt2">JSON형태로 받기2</button>
	<button id="bt3">JSON형태로 받기3</button>
	<button id="bt4">JSON형태로 받기4-DB에서 가져오기</button>
	<button id="bt5">JSON형태로 받기5-라이브러리 사용하기</button>
	<button id="bt6">JSON형태로 받기6-라이브러리 사용하기</button>
	<button id="bt7">Naver OpenApi에서 도서정보 받아오기</button>
	<hr>
	<div id="msg" style="margin-top: 20px">
	
	</div>
</div>
<jsp:include page="/foot.jsp"/>