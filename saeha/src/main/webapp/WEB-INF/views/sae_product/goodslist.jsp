<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/templatemo-style.css">
    <link href="/resources/css/templatemo-xtra-blog.css" rel="stylesheet">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
<%@include file='../include/nav.jsp' %>
<div class="page-content">
<div style="padding:60px 0; height: 100%;">
<div class="section-heading">
				<h1>
					Saeha Shop<br>
					<em>Goods</em>
				</h1>
				<p>
					굿즈보러가기 <br>한복 보러가기
				</p>
			</div>	

<!-- Search form -->
            <div class="row tm-row">
                <div class="col-12">
                    <form method="GET" class="form-inline tm-mb-80 tm-search-form">                
                        <input class="form-control tm-search-input"  name="keyword" id="keywordInput" 
							   value="${srci.keyword}"  type="text" placeholder="Search..." aria-label="Search">
                        <button class="tm-search-button" type="submit">
                            검색
                        </button>                                
                    </form>
                </div>                
            </div> 
				<script>
					$(function() { 
						$('#searchBtn').click(function() {
						self.location = "goodslist" + '${gpageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val()
						+ "&keyword="+ encodeURIComponent($('#keywordInput').val());
							});
						});
			
	</script>

		
		
            
            

		 <form role="form" method="get">
		 
				<c:forEach items="${goodslist }" var="goodslist">

                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">
                    <input value="<c:out value="${goodslist.pd_bno }" />" type="hidden">
                    <a href="post.html" class="effect-lily tm-post-link tm-pt-60">
                           
                        <div class="tm-post-link-inner">
							
							<a href="/sae_product/read?pd_bno=${goodslist.pd_bno}&pd_type=${goodslist.pd_type}&page=${scri.page}&perPageNum=${scri.perPageNum}
									&searchType=${scri.searchType }&keyword=${srci.keyword }"><img src="/resources/productimg/${goodslist.p_filepath }"/></a>
                        </div>
						                         
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title"><c:out value="${goodslist.pd_name}" /></h2>
                    </a>                    
                    <p class="tm-pt-30">
                        <fmt:formatDate value="${goodslist.pd_date}" pattern="yyyy-MM-dd" />
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">
                        <c:out value="${goodslist.pd_price }" /> 원 </span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span><c:out value="${goodslist.pd_readcount }"/> read</span>
                        <span>by people</span>
                    </div>
                </article>

</c:forEach>




<div class="row tm-row tm-mt-100 tm-mb-75">
                <div class="tm-prev-next-wrapper">
                    <a href="goodslist${gpageMaker.makeSearch(gpageMaker.startPage - 1)}" class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
                    <a href="goodslist${gpageMaker.makeSearch(gpageMaker.endPage + 1 )}" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
                </div>
                <div class="tm-paging-wrapper">
                    <span class="d-inline-block mr-3">Page</span>
                    <nav class="tm-paging-nav d-inline-block">
                        <ul>
                           <c:forEach begin="${gpageMaker.startPage}" end="${gpageMaker.endPage}" var="idx">
                            <li class="tm-paging-item active">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">${idx}</a>
                            </li>
			</c:forEach>
                        </ul>
                    </nav>
                </div>                
            </div>            
			

	</form>

</div>
</div>

<footer class="footer">
			<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
		</footer>
</body>
</html>