<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<input id="companyId" type="hidden" value="${companyInfo.companyId}">
<input id="jobPostingBoardId" type="hidden"
	value="${jobPostingPS.jobPostingBoardId}">
<div class="container">
	<section id="about" class="about">
		<div class="row">
			<div class="col-lg-4" data-aos="fade-right">
				
				<div id="image_container">
					<img id="oldImg" src="/img/${companyInfo.companyPicture}">
				</div>
			</div>
			<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
				<h2 style="margin-left: 80px">회사 정보</h2>

				<div class="row">
					<div class="col-lg-6"></div>
					<div class="col-lg-6">
						<ul>
							<li style="margin-bottom: 10px"><i
								class="bi bi-chevron-right"></i> <strong>회사 이름 :</strong> <span>${companyInfo.companyName}</span></li>
							<li style="margin-bottom: 10px"><i
								class="bi bi-chevron-right"></i> <strong> 전화번호 :</strong> <span>${companyInfo.companyPhoneNumber}</span></li>
							<li style="margin-bottom: 10px"><i
								class="bi bi-chevron-right"></i> <strong>회사 이메일 :</strong> <span>
									${companyInfo.companyEmail}</span></li>
							<li style="margin-bottom: 10px"><i
								class="bi bi-chevron-right"></i> <strong>회사 주소:</strong>
								 <span>${address.roadJibunAddr}${address.detailAddress}</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container mt-3" style="border: 3px solid #000000">
		<h2>현재 채용중인 공고</h2>
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="jobPostingBoard" items="${jobPostingBoardList}">
				<div class="card" style="width: 18rem;">
					<a
						href="/company/jobPostingBoardDetail/${jobPostingBoard.jobPostingBoardId}"><img
						class="card-img-top"
						src="/image/하림.jpg"
						alt="Card image cap"></a>
					<div class="card-body">
						<p class="card-text">${jobPostingBoard.jobPostingBoardTitle}</p>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<div class="btn-update" style="text-align: right">
		<button id="btnSub"
			style="background-color: rgba(0, 195, 98, 255); border: none; margin-bottom: 10px; margin-top: 10px; margin-bottom: 20px;"
			type="button" class="btn btn-primary">구독하기</button>
	</div>
</div>
<script src="/js/subscribe.js"></script>
<script> function setThumbnail(event) {
    let reader = new FileReader();
    reader.onload = function (event) {
        if (document.getElementById("newImg")) {
            document.getElementById("newImg").remove();
        }
        let img = document.createElement("img");
        let oldImg = $("#oldImg");
        oldImg.remove();
        img.setAttribute("src", event.target.result);
        img.setAttribute("id", "newImg");
        document.querySelector("#image_container").appendChild(img);
    };
    reader.readAsDataURL(event.target.files[0]);
}</script>
<%@ include file="../layout/footer.jsp"%>