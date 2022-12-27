<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
li{list-style: none; display:inline; padding: 6px;}
</style>

<ul>
<li>
<c:if test="${member != null}"><a href="/sae_member/logout">로그아웃</a></c:if>
<c:if test="${member == null}"><a href="/">로그인</a></c:if>
</li>
<li>
<c:if test="${member != null}">
<p>&nbsp;&nbsp;&nbsp;${member.userId}님 안녕하세요.</p>
</c:if>
</li>

<li><a href="/sae_goodsboard/writeView?pno=${pno}">글 작성</a></li>
</ul>
