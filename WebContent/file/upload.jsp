<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<div class="text-left p-5">
	<h1 class="text-danger text-center m-3">파일 업로드 1</h1>
	<form name="fileF" id="fileF" method="post" action="upload2.jsp" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-10 offset-md-1">
			<table class="table table-bordered">
				<tr>
					<td>올린이</td>
					<td>
						<input type="text" name="name" id="name" placeholder="글쓴이" class="form-control">
					</td>
				</tr>
				<tr>
					<td>첨부파일1</td>
					<td>
						<input type="file" name="filename" id="filename" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-success ml-3" id="btnUp">업로드</button>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</form>
</div>
<jsp:include page="/foot.jsp"/>