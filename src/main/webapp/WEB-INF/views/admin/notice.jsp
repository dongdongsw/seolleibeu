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
				   <h6 class="m-0 font-weight-bold text-primary">공지사항 조회</h6>
				    <div class="search-wrapper">
					<a href="/admin/notice_create" class="btn btn-xs btn-primary"><i
						class="fas fa-edit"></i>&nbsp;새글</a>
				    </div>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th style="width: 10%">번호</th>
									<th style="width: 50%">제목</th>
									<th style="width: 15%">작성자</th>
									<th style="width: 5%">조회수</th>
									<th style="width: 15%">작성일</th>
									<th style="width: 5%"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Tiger Nixon</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
									<td>2011/04/25</td>
									<td class="text-center">
										<div class="dropdown">
											<a href="#" data-toggle="dropdown"> <i
												class="fas fa-ellipsis-h"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right">
												<a class="dropdown-item" href="/admin/notice_update">수정</a>
												<a class="dropdown-item text-danger" href="#">삭제</a>
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