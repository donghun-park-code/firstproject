<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div id="containermain">
	<div id="companyrank">
		<h2 style="text-align: center">경 ★푸홀스 700홈런 달성★ 축</h2>
		<ul>

			<li>
				<div class="company-item">
					<div class="company-cover"></div>
					<div class="album-info">
						<p class="company_title">세인트루이스 카디널스</p>
						<p class="likerank">GOAT</p>
					</div>
				</div>
			</li>
			<li>
				<div class="company-item">
					<div class="company-cover1"></div>
					<div class="company-info">
						<p class="company_title">애틀란타 브레이브스</p>
						<p class="likerank">존 스몰츠</p>
					</div>
				</div>
			</li>
			<li>
				<div class="company-item">
					<div class="company-cover2"></div>
					<div class="album-info">
						<p class="company_title">시애틀 매리너스</p>
						<p class="likerank">켄 그리피 주니어</p>
					</div>
				</div>
			</li>
		</ul>
	</div>
<div class="mb-3"></div>
<div class="dropdown">
<div class="d-flex justify-content-between" style="width:1190px">
	<select id="select_category" name="category" style="width: 150px; left: 10%">
		<option id="categories" value="5">==관심분야==</option>
		<option id="categoryFrontend" value="1">프론트엔드</option>
		<option id="categoryBackend" value="2">백엔드</option>
		<option id="categoryDevops" value="3">데브옵스</option>
		<option id="categoryAll" value="4">전체보기</option>
	</select>

	<form class="d-flex" method="get" action="/main/${number}">
		<input class="searchForm" type="text" placeholder="Search"
			name="keyword">
		<button id="keyword" class="searchsubmit" type="submit">🔍</button>
		
	</form>
</div>

<div class="d-flex justify-content-center">
	<c:set var="userprincipal" value="${empty sessionScope.principal || empty sessionScope.principal.companyId  ?  true : false}"></c:set>
	<c:choose>
		<c:when test="${userprincipal}">
			<table class="table table-bordered" style="text-align: center">
				<thead>
					<tr>
						<th>채용공고 제목</th>
						<th>마감일</th>
					</tr>
				</thead>
				<tbody id="table">
					<c:forEach var="jobPostingBoardList" items="${jobPostingBoardList}">
						<tr>
							<td>
								<div id="apply" class="container p-4 my-4 border">
									<a
										href="/personal/jobPostingBoard/${jobPostingBoardList.jobPostingBoardId}">
										${jobPostingBoardList.jobPostingBoardTitle}</a>
								</div>
							</td>
							<td><div id="apply" class="container p-4 my-4 border">${jobPostingBoardList.formatDeadLine}<br>${jobPostingBoardList.state}</div>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</c:when>
		<c:otherwise>
			<table class="table table-bordered" style="text-align: center">
				<thead>
					<tr>
						<th>이력서 제목</th>
						<th>희망근무지역</th>
					</tr>
				</thead>
				<tbody id="table">
					<c:forEach var="resumesList" items="${resumesList}">
						<tr>
							<td>
								<div id="apply" class="container p-4 my-4 border">
									<a href="/personal/resumes/${resumesList.resumesId}">
										${resumesList.resumesTitle}</a>
								</div>
							</td>
							<td>${resumesList.resumesPlace}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</div>
</div>
</div>
<div class="d-flex justify-content-center">
	<ul class="pagination">
		<li class='page-item ${paging.first ? "disabled" : " "}'><a
			class="page-link"
			href="?page=${paging.currentPage-1}&keyword=${paging.keyword}">Prev</a>
		</li>

		<c:forEach var="num" begin="${paging.startPageNum}"
			end="${paging.lastPageNum}" step="1">
			<li class='page-item ${paging.currentPage == num-1 ? "active" : ""}'>
				<a class="page-link" href="?page=${num-1}&keyword=${paging.keyword}">${num}</a>
			</li>
		</c:forEach>

		<li class='page-item ${paging.last ? "disabled" : " "}'><a
			class="page-link"
			href="?page=${paging.currentPage+1}&keyword=${paging.keyword}">Next</a>
		</li>
	</ul>
</div>

<script src="/js/main.js"></script>
<%@ include file="../layout/footer.jsp"%>