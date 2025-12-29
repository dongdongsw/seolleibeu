<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<div class="container-fluid">
			<div class="card shadow mb-4" style="margin-top: 16px;">
				<div class="card-header py-3 d-flex justify-content-between align-items-center">
				   <h6 class="m-0 font-weight-bold text-primary">코스 조회</h6>
				    <div class="search-wrapper">
				        <div class="input-group search-bar">
				            <input type="text" class="form-control bg-light border-0 small"
				                placeholder="Search for..." aria-label="Search"
				                aria-describedby="basic-addon2">
				            <div class="input-group-append">
				                <button class="btn btn-primary" type="button">
				                    <i class="fas fa-search fa-sm"></i>
				                </button>
				            </div>
				        </div>
				    </div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th style="width: 5%">번호</th>
									<th style="width: 33%">제목</th>
									<th style="width: 43%">주소</th>
									<th style="width: 7%">등록일</th>
									<th style="width: 7%">상태</th>
									<th style="width: 5%"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>123</td>
									<td>쌍용강북교육센터</td>
									<td>홍대입구 근처</td>
									<td>2011/04/25</td>
									<td>공개/비공개</td>
									<td class="text-center">
										<div class="dropdown">
											<a href="#" data-toggle="dropdown"> <i
												class="fas fa-ellipsis-h"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<a class="dropdown-item" href="#">공개</a>
												<a class="dropdown-item text-danger" href="#">비공개</a>
												
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>123</td>
									<td>쌍용강북교육센터</td>
									<td>홍대입구 근처</td>
									<td>2011/04/25</td>
									<td>공개/비공개</td>
									<td class="text-center">
										<div class="dropdown">
											<a href="#" data-toggle="dropdown"> <i
												class="fas fa-ellipsis-h"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<a class="dropdown-item" href="#">공개</a>
												<a class="dropdown-item text-danger" href="#">비공개</a>
												
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="dataTables_wrapper">
							<div class="dataTables_paginate paging_simple_numbers">
								<ul class="pagination justify-content-center">
									<li class="page-item active"><a class="page-link">1</a></li>
									<li class="page-item"><a class="page-link">2</a></li>
									<li class="page-item"><a class="page-link">3</a></li>
									<li class="page-item"><a class="page-link">4</a></li>
									<li class="page-item"><a class="page-link">5</a></li>
									<li class="page-item"><a class="page-link">6</a></li>
									<li class="page-item"><a class="page-link">7</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>