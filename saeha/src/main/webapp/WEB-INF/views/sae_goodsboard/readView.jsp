<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판 readView</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Golos+Text&family=Hahmlet:wght@300&display=swap')
	;
</style>
<style>
* {
	font-size: 17px;
	font-family: 'Hahmlet', serif;
}
</style>
<!-- CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<!-- JavaScript -->
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						//수정
						$(".update_btn").on(
								"click",
								function() {
									formObj.attr("action",
											"/sae_goodsboard/updateView");
									formObj.attr("method", "get");
									formObj.submit();
								})
						//삭제
						$(".delete_btn").on(
								"click",
								function() {
									var deleteYN = confirm("삭제하시겠습니까?");
									if (deleteYN == true) {

										formObj.attr("action",
												"/sae_goodsboard/delete");
										formObj.attr("method", "post");
										formObj.submit();

									}
								})

						//목록
						$(".list_btn")
								.on(
										"click",
										function() {
											location.href = "/sae_goodsboard/list?pno=${read.gwPno}&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&score=${scri.score}&keyword=${scri.keyword}";
										})

						$(".replyWriteBtn").on(
								"click",
								function() {

									var formObj = $("form[name='replyForm']");
									formObj.attr("action",
											"/sae_goodsboard/replyWrite");
									formObj.submit();
								});

						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											var modify = $(this).attr(
													"data-rno");
											$("#" + modify + "-modify2").attr(
													"style", "display:none");

											$("#" + modify + "-Update").attr(
													"style", "display:none");

											$("#" + modify + "-Delete").attr(
													"style", "display:none");
											$("#" + modify + "-modify").attr(
													"style", "display:block");
											$("#" + modify + "-modify")
													.val(
															$(
																	"#"
																			+ modify
																			+ "-modify2")
																	.text());
											$("#" + modify + "-UpdateComplete")
													.attr("style",
															"display:inline-block");
											$("#" + modify + "-Cancel").attr(
													"style",
													"display:inline-block");
											/* location.href = "/sae_goodsboard/replyUpdateView?gwBno=${read.gwBno}"+"&page=${scri.page}"+
											      "&perPageNum=${scri.perPageNum}" + "&score=${scri.score}"+
											      "&keyword=${scri.keyword}"+"&geRno="+$(this).attr("data-rno"); */
										});

						//댓글 수정-취소 View
						$(".replyCancelBtn").on(
								"click",
								function() {
									var modify = $(this).attr("data-rno");
									$("#" + modify + "-modify2").attr("style",
											"display:block");

									$("#" + modify + "-Update").attr("style",
											"display:inline-block");

									$("#" + modify + "-Delete").attr("style",
											"display:inline-block");
									$("#" + modify + "-modify").attr("style",
											"display:none");
									$("#" + modify + "-UpdateComplete").attr(
											"style", "display:none");
									$("#" + modify + "-Cancel").attr("style",
											"display:none");

								});

						//댓글 수정-수정하기 View
						$(".replyUpdateCompleteBtn").on("click", function() {
							var modify = $(this).attr("data-rno");
							var content = $("#" + modify + "-modify").val();
							$("#UpdateFormRno").val(modify);
							$("#UpdateFormContent").val(content);
							var formObj = $("form[name='updateForm']");
							formObj.submit();

						});

						//댓글 삭제 View
						$(".replyDeleteBtn").on("click", function() {
							if (confirm("삭제하시겠습니까?")) {
								//삭제 했을 때 이벤트
								var modify = $(this).attr("data-rno");
								$("#DeleteFormRno").val(modify);
								var formObj = $("form[name='deleteForm']");
								formObj.submit();
							}
						});
					})
</script>
<body style="margin-left: 400px">
	<div class="page-content">
		<div style="width: 90%;">
			<div style="padding: 60px 0; height: 100%;">
				<div class="section-heading"
					style="font-family: 'Hahmlet', serif; font-size: 40px">Review</div>
				<section id="container" style="padding-top: 0px; margin-top: 0px">
					<form name="readForm" role="form" method="post">
						<input type="hidden" id="bno" name="gwBno" value="${read.gwBno}" />
						<input type="hidden" id="pno" name="gwPno" value="${read.gwPno}" />
						<input type="hidden" id="page" name="page" value="${scri.page}" />
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}" /> <input type="hidden" id="keyword"
							name="keyword" value="${scri.keyword}" />
					</form>
					<div style="height: 50px">
						<input
							style="border: 0px solid #ffffff; background-color: #ffffff; font-size: 17px; font-family: 'Hahmlet', serif;"
							type="text" id="title" name="gwTitle" class="form-control"
							value="제목 : ${read.gwTitle}" readonly="readonly" />
					</div>
					<%-- <div style="display: flex; overflow: scroll">
						<c:forEach items="${imglist }" var="imglist">
							<div class="form-grop">

								<img style="width: 300px; height: 400px"
									src="/resources/reviewimg/${imglist.rg_ipath }" />
							</div>

							<br>
						</c:forEach>
					</div> --%>

					<div class="carousel" data-flickity>
						<c:forEach items="${imglist }" var="imglist">
							<div class="form-grop carousel-cell" style="width: 100%">
								<img style="width:100%; height:550px"
									src="/resources/reviewimg/${imglist.rg_ipath }" /> <br>
							</div>
						</c:forEach>
					</div>


					<div style="height: 30px;">
						<div align="right">
							<input
								style="width: 8%; border: 0px solid #ffffff; background-color: #ffffff; font-size: 17px; font-family: 'Hahmlet', serif;"
								type="text" id="writer" name="gwWriter" class="form-control"
								value="${read.gwWriter}님" readonly="readonly" />
						</div>
						<div>
							&nbsp;&nbsp;&nbsp;점수&nbsp;
							<c:forEach var="score" begin="1" end="${read.gwScore}">★
						</c:forEach>
						</div>
					</div>

					<div
						style="height: 30px; text-align: right; font-size: 17px; font-family: 'Hahmlet', serif;">
						<c:out value="${read.gwDate}" />
					</div>
					<div
						style="text-align: left; font-size: 17px; font-family: 'Hahmlet', serif; height: 200px">
						<textarea
							style="border: 0px solid #ffffff; background-color: #ffffff"
							id="content" name="gwContent" class="form-control"
							readonly="readonly"><c:out value="${read.gwContent}" /></textarea>
						<br> <br>
					</div>

					<div>
						<c:if
							test="${member.userId eq read.gwWriter || member.userId eq 'admin' }">
							<!-- <button type="button" class="update_btn btn btn-warning">수정</button> -->
							<button type="button" class="delete_btn btn btn-danger">삭제</button> &nbsp;&nbsp;
</c:if>
						<button type="button" class="list_btn btn btn-primary">목록</button>
					</div>

					<!-- 댓글 -->
					<div id="reply"
						style="border: 0px solid #ffffff; background-color: #ffffff">
						<ol class="replyList">
							<c:forEach items="${replyList}" var="replyList">
								<li>
									<p>
										작성자 : ${replyList.geWriter}님<br /> 작성 날짜 :
										<c:out value="${replyList.geDate}" />
									</p>
									<p id="${replyList.geRno}-modify2">${replyList.geContent}</p> <input
									type="text" id="${replyList.geRno}-modify" name="geContent"
									class="form-control" style="display: none" />
									<div>
										<c:if
											test="${member.userName eq replyList.geWriter || member.userId eq 'admin' }">
											<button type="button" id="${replyList.geRno}-Update"
												class="replyUpdateBtn btn btn-warning"
												data-rno="${replyList.geRno}">수정</button>
											<button type="button" id="${replyList.geRno}-Delete"
												class="replyDeleteBtn btn btn-danger"
												data-rno="${replyList.geRno}">삭제</button>
										</c:if>
										<button type="button" id="${replyList.geRno}-UpdateComplete"
											class="replyUpdateCompleteBtn btn btn-warning"
											data-rno="${replyList.geRno}" style="display: none">수정하기</button>
										<button type="button" id="${replyList.geRno}-Cancel"
											class="replyCancelBtn btn btn-danger"
											data-rno="${replyList.geRno}" style="display: none">취소</button>
									</div>
								</li>
							</c:forEach>
						</ol>
					</div>

					<form name="replyForm" method="post" class="form-horizontal">
						<input type="hidden" id="bno" name="geBno" value="${read.gwBno}" />
						<input type="hidden" id="page" name="page" value="${scri.page}" />
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}" /> <input type="hidden"
							id="searchType" name="searchType" value="${scri.searchType}" />
						<input type="hidden" id="keyword" name="keyword"
							value="${scri.keyword}" />

						<div class="form-group">
							<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
							<div class="col-sm-10">
								<input type="text" id="writer" name="geWriter"
									class="form-control" value="${member.userName }" readonly />
							</div>
						</div>

						<div class="form-group">
							<label for="content" class="col-sm-2 control-label">댓글 내용</label>
							<div class="col-sm-10">
								<input type="text" id="content" name="geContent"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="replyWriteBtn btn btn-success">작성</button>
							</div>
						</div>
					</form>
				</section>

			</div>


			<form name="updateForm" role="form" method="post"
				action="/sae_goodsboard/replyUpdate">
				<input type="hidden" name="geBno" value="${read.gwBno}"
					readonly="readonly" /> <input type="hidden" id="UpdateFormRno"
					name="geRno" /> <input type="hidden" name="page"
					value="${scri.page}" /> <input type="hidden" name="perPageNum"
					value="${scri.perPageNum}" /> <input type="hidden" name="keyword"
					value="${scri.keyword}" /> <input type="hidden"
					id="UpdateFormContent" name="geContent" />
			</form>

			<form name="deleteForm" role="form" method="post"
				action="/sae_goodsboard/replyDelete">
				<input type="hidden" name="geBno" value="${read.gwBno}"
					readonly="readonly" /> <input type="hidden" id="DeleteFormRno"
					name="geRno" /> <input type="hidden" name="page"
					value="${scri.page}" /> <input type="hidden" name="perPageNum"
					value="${scri.perPageNum}" /> <input type="hidden" name="keyword"
					value="${scri.keyword}" />

			</form>

		</div>
	</div>

	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>
</body>
</html>