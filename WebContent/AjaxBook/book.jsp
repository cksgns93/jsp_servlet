<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
response.setHeader("Pragma","No-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); 
   response.setHeader("Cache-Control","no-cache");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK</title>
<!-- CDN 참조-------------------------------------- -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- --------------------------------------------- -->
<style type="text/css">
	#lst1{
		position:relative;
		left:0px;
		margin:0;
		background-color:#efefef;
		border:1px solid silver;
	}
	#lst2{
		margin:0;
		padding:8px;
		list-style:none;
	}
</style>
<script type="text/javascript">
   $(function(){
	   //출판사 목록 가져오기
	   getPublishs();
	   //모든 도서 정보 가져오기
	   
      getAllBook();
   })
   var getPublishs= function(){
	   $.ajax({
			type:'GET',
			url:'bookPublish.jsp',
			dataType:'html',
			cache:false,
			success:function(res){
				$("#sel").html(res);
			},error:function(err){
				alert('error: '+err.status);
			}
	   })
   }
   var bookInfoByPub=function(val){
	   //alert(val);
	   //자바스크립트에서 URI부분의 한글 인코드 처리해주는 함수 => encodeURIComponent()함수 사용
	   $.ajax({
		   type:'GET',
		   url:'bookTitle.jsp?publish='+encodeURIComponent(val),
		   dataType:'html',
		   cache:false,
		   success:function(res){
			   //alert(res);
			   $("#sel2").html(res);
		   },error:function(err){
			   alert('error: '+err.status);
		   }
	   })
   }
   var getBook=function(val){
	   //alert(val);
	   if(!val){
		   val=$('#books').val();//검색어를 val에 넣어주자.
	   }
	   if(!val){
		   alert('검색어를 입력하세요');
		   $('#books').focus();
		   return;
	   }
	   $.ajax({
		   type:'GET',
		   url:'bookAll.jsp?title='+encodeURIComponent(val),
	   	   dataType:'html',
	   	   cache:false,
	   	   success:function(res){
	   		   $('#book_data').html(res);
	   	   },error:function(err){
				alert('error: '+err.status);	   
	   	   }
	   })
   }
   var goDel=function(visbn){
      //alert(visbn);
      $.ajax({
         type:'GET',
         url:'bookDel.jsp?isbn='+visbn,
         dataType:'xml',
         cache:false,
         success:function(res){
            //alert(res);
            var str=$(res).find('result').text();
            //alert(str);
            if(parseInt(str)>0){
               getAllBook();
            }else{
               alert('삭제 실패');
            }
         },
         error:function(err){
            alert('error: '+err.status);
         }
      });
   }
   var goEdit=function(visbn){
      //alert(visbn);
      $.ajax({
      type:'POST',
      url:'bookInfo.jsp',
      data:"isbn="+visbn, //요청데이터, post방식일 경우 data속성 값으로 데이터를 넘긴다.
      dataType:'xml',
      success:function(res){
         //alert(res);
         //응답 데이터 추출하기(isbn,title,price,publish,pubDate,bimage)
         var visbn=$(res).find('isbn').text();
         var vtitle=$(res).find('title').text();
         var vprice=$(res).find('price').text();
         var vpublish=$(res).find('publish').text();
         var vpubDate=$(res).find('pubDate').text();
         var vbimage=$(res).find('bimage').text();
         $('#isbn').val(visbn);
         $('#title').val(vtitle);
         $('#price').val(vprice);
         $('#publish').val(vpublish);
         $('#published').val(vpubDate);
         var str="<img style='width:80%'; 'margin:auto' src='../images/"+vbimage+"' class='img img-thumbnail img-responsive'>";
         $('#bimage').html(str); 
      },
      error:function(err){
         alert('error: '+err.status);
      }
      })
   }//-----------------------
   
   var goEditEnd=function(){
      //alert('a');
      //폼객체 serialize() 함수를 이용하여 파라미터 데이터를 만든다.
      var paramData=$('#editF').serialize();
      //alert(paramData);
      $.ajax({
    	  type:'POST',
    	  url:"bookUpdate.jsp",
    	  data:paramData,
    	  dataType:'xml',
    	  cache: false,
    	  success:function(res){
    		  var str = $(res).find('result').text();
    		  if(parseInt(str)>0){			  
	    		  getAllBook();
	    		  alert("성공");
    		  }else{
    			  alset("실패");
    		  }
    	  },
    	  error:function(err){
    		  alert("err: "+err.status);
    	  }
      })
      
   }//------------------------
   
   var getAllBook= function(){
      $.ajax({
         type:'get',
         url:'bookAll.jsp',
         dataType:'html',//text, html, xml, json ...
         cache: false,
         success:function(res){
            $("#book_data").html(res);
         },
         error:function(err){
            alert('error: '+err.status);
         }
      })
   }
   var autoComp = function(val){
	   //console.log("val="+val);
	   $.ajax({
		   type:'POST',
 		   url:'autoComplete.jsp',
		   data:'findKeyword='+val,//요청 파라미터
		   dataType:'html',
		   success:function(res){
			   $('#lst2').html(res);
			   $('#lst1').show(100);
			   $('#lst2').show(100);
			   if(!$('#books').val()){
				   $('#lst1').hide(100);
				   $('#lst2').hide(100);
			   }
		   },error:function(err){
			   alert("error: "+err);
		   }
	   })
   }
   var setting=function(val){
	   $("#books").val(val);
	   $('#lst1').hide(100);
	   $('#lst2').hide(100);
   }
   //NaverOpenApi사용하기
   $(function(){
	   $('#openBtn').click(function(){
		   var keyword=$('#books').val();
		   if(!keyword){
			   alert('검색어를 입력하세요');
			   $('#book').focus();
			   return;
		   }
		   var url="naverOpenApiResult.jsp?query="+encodeURIComponent(keyword);
		   send(url,keyword);
	   })
   })
   
   var send=function(url,keyword){
	   $.ajax({
		   type:'get',
		   url:url,
		   dataType:'json',
		   cache:false,
		   success:function(res){
			   //alert(JSON.stringify(res));
			   //alert(res.total)
			   var total=parseInt(res.total);
			   showDataList(res.items, total);
			   var display=20;
			   showPageList(total,keyword,display);
		   },
		   error:function(err){
			   alert('error: '+err.status);
		   }
	   })
   }
   var showDataList=function(items, total){
	   var str="<h2>"+$('#books').val()+" 검색 결과 " +total+"개</h2>";
	   str+="<table class='table'>"
	   str+="<tr>";

	   $.each(items,function(i,book){
		   str+="<td width='25%'>";
		   str+="<a href='"+book.link+"' target='_blank'>";
		   str+="<img src='"+book.image+"' class='img-fluid'>";
		   str+="</a>";
		   str+="<h4>"+book.title+"</h4>";
		   str+="<p>저자: "+book.author+"<br></p>";
		   str+="출판사: "+book.publisher+"<br>";
		   str+="정가: "+book.price+"원<br>";
		   str+="출판일: "+book.pubdate+"원<br>";
		   if(book.discount){
		   	str+="<span class='text-danger'> 할인가: "+book.discount+"원</span><br>";
		   }
		   str+="</td>";
		   if(i%4==3){
			   str+="</tr><tr>"
		   }
	   })
	   
	   str+="</tr>";
	   str+="</table>";
	   $('#localBook').hide(500);
	   $('#openApiBook').html(str).show(500);
   }//showdatalist() end -----------------------------
   
   var showPageList=function(total, keyword, display){
	   if(total>200){
		   total=200;
	   }
	   //int pageCount = (total-1)/display+1; <=자바에서 페이지수 구하기
	   var pageCount=Math.floor((total-1)/display+1);
	   
	   var str="<ul class='pagination justify-content-center'>";
	   /*
	   	i	start	display
	   [1]	1		20
	   [2]	21		20
	   [3]	41		20
	   
	   start = (i-1)*display+1;
	   */
	   
	   for(var i=1;i<=pageCount;i++){
		   var start =(i-1)*display+1;
		   str+="<li class='page-item' id='a"+start+"'><a class='page-link' onclick='show("+start+",\""+keyword+"\")'>"+i;
		   str+="</a></li>";
	   }
	   str+="</ul>";
	   $('#openApiBook').append(str);
   }
   var show=function(start,query){
	   //alert(start+"/"+query);
	   $("li[id^='a']").removeClass('active');
	   $('#a'+start).addClass('active');
	   var url="naverOpenApiResult.jsp?query="+encodeURIComponent(query)+"&start="+start+"&display=20";
	   send(url,query);
   }
   
   
</script>
</head>
<!--onload시 출판사 목록 가져오기  -->
<body onload="getPublishs()">
   <div class="container">
   <h2 id="msg">서적 정보 페이지</h2>
<form name="findF" id="findF" role="form"
 action="" method="POST">
<div class="form-group">
<label for="sel" class="control-label col-sm-2">출판사</label>
<span id="sel"></span><span id="sel2"></span>
</div>
<p>
<div class='form-group'>
   <label for="books" class="control-label col-sm-2" id="msg1">도서검색</label>
   <div class="col-sm-6">
   <input type="text" name="books" id="books"
    onkeyup="autoComp(this.value)"
    class="form-control" >
    <!-- ---------------------------- -->
    <div id="lst1" class="listbox"
     style="display:none">
       <div id="lst2" class="blist"
        style="display:none">
       </div>
    </div>
    <!-- ---------------------------- -->
   </div>
</div>
</form>
<div>
 
 <button type="button"
  onclick="getBook()"
  class="btn btn-primary">검색</button>
 
 <button type="button" onclick="getAllBook()" class="btn btn-success">모두보기</button>
 <button type="button" id="openBtn"
  class="btn btn-info">Naver OPEN API에서 검색</button><br><br>
</div>
<div id="localBook">

<table class="table table-bordered" border="1">
   <tr class="info">
      <td style="width:20%;">서명</td>
      <td style="width:20%;">출판사</td>
      <td style="width:20%;">가격</td>
      <td style="width:20%;">출판일</td>
      <td style="width:20%;">편집</td>
   </tr>
</table>
<!-- ----------------------- -->
<div id="book_data"></div>
<!-- ----------------------- -->
<form id="editF" name="editF">
<table id="book_info" class="table table-hover" border="2">
   <tr>
      <td width="20%">ISBN코드</td>
      <td>
      <input type="text" name="isbn" id="isbn"
      class="form-control" readonly>
      </td>
      <td rowspan="6" width="30%" id="bimage" class="text-center"></td>
   </tr>
   <tr>
      <td>서명</td>
      <td>
      <input type="text" name="title" id="title"
      class="form-control">
      </td>
      
   </tr>
   <tr>
      
      <td>출판사</td>
      <td>
      <input type="text" name="publish" id="publish"
      class="form-control">
      </td>
      
   
   </tr>
   <tr>
   
      <td>가격</td>
      <td>
      <input type="text" name="price" id="price"
      class="form-control">
      </td>
      
   </tr>
   <tr>
   
      <td>출판일</td>
      <td>
      <input type="text" name="published"
       id="published"  disabled
      class="form-control">
      </td>
      
   </tr>
   <tr>
      <td colspan="2">
      <button type="button"
      onclick="goEditEnd()" class="btn btn-danger">수정</button></td>
   </tr>
</table>
</form>
   </div>
</div><!-- #localBook end -->

<!-- ------------------------------- -->
<div id="openApiBook" class="container">

</div>
   
</body>
</html>

<!-- https://apis.daum.net/search/book -->
<!-- 53c73f32f6c4150ca5aa184ba6250d8e -->

<!-- https://apis.daum.net/search/book?apikey=53c73f32f6c4150ca5aa184ba6250d8e&q=다음카카오&output=json -->



