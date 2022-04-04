<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		border: 1px red solid;
	}
	.admin-container{
		height: 100vh;
		width: 100vw;
	}
	.sub_nav {
		width: 15vw;
		float: left;
		height: auto;
	}	
	.mypage {
		float: left;
		width: 75vw;
		position: relative;
	}	
	.end{
		clear: both;
	}
	.content{
            /*border: 1px solid rgb(247, 202 , 201);*/
            width: 1000px;
            margin: auto;           
    }
    .btn{
      		height:35px;
    }
	#main{
            width: 1000px;
            margin: auto;
            margin-top: 50px;     
            margin-bottom: 150px;
        }
        #search{
            margin : 20px 0px 0px 0px;
            height: 30px;
        }
        #search>select{
            height: 100%;
        }
        #search>input[name=search]{
            box-sizing: border-box;
            height: 100%;
        }
        
       
        #button>button{
            background-color: rgb(247, 202, 201);  
            color: white; 
            border: 0ch;
            border-radius: 3px;
            height: 30px;
        }
        #list{
            margin: 40px 0px 40px 0px;          
        }
        table{
            text-align: center;
            margin: auto;
            width: 1000px;
        }
        table tr{
            height: 35px;
        }
        table tr th{
            background-color: rgb(240, 240, 240);
        }
        #paging{
            margin-top: 50px;
            width:fit-content; 
            margin: auto;
        }
        #paging button{
            background-color: rgb(221, 221, 221);
            color: rgb(87, 87, 87);
            padding: 7px;
            border: 0ch;
            border-radius: 3px;
        }

</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/header.jsp" />
	
	<div class="admin-container">
		<div class="sub_nav">
			<jsp:include page="adminNavi.jsp"/>
		</div>
		<div class="mypage"> 
			<br><br>
			<div class="content">
				<div id="main">
					<div id="title">
						<h2>신고 관리</h2>
					</div>
					
					<div id="search">
						<select name="" id="">
							<option value="">제목</option>
							<option value="">작성자</option>
							<option value="">내용</option>
						</select>
						<input type="text" id="" name="search">
					</div>
			
					<div id="button">
						<button onclick="location.href='reportBList.ad?bpage=1'" id="board-report">글</button>
						<button onclick="location.href='reportRList.ad?bpage=1'" id="reply-report">댓글</button>
						<button onclick="location.href='reportHList.ad?bpage=1'" id="house-report">하우스</button>
					</div>
			
					<div id="reportBList">
						<table>				
							<thead>
								<tr>
									<th>No.</th>
									<th>신고게시물 고유번호</th>
									<th>신고 사유</th>
									<th>신고자</th>						
								</tr>
							</thead>
							<tbody>				
							<c:choose>
								<c:when test="${ empty list }">
									<tr>
					                   <td colspan="4">게시글이 없습니다.</td>
					                </tr>							
								</c:when>
								<c:otherwise>
									<c:forEach var="br" items="${list}">
									<tr>
										<td>${br.reportNo }</td>							
										<td>${br.boardNo }</td>
										<td class="report-cate">${br.reportCate }</td>
										<td>${br.userId }</td>                  								
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>	
			
						</table>			
					</div>
					
				
					
				
					<div id="paging">
					<!-- board 페이징 -->
						<div id="bListPaging">
			        	<c:if test="${ Bpi.currentPage ne 1 }">
			        		<c:choose>
			        			<c:when test="${empty condition }">
			        				<button onclick="location.href='reportBList.ad?bpage=${Bpi.currentPage - 1}'">&lt;</button> 
			        			</c:when>
			        			
			        		</c:choose>
			        	</c:if>	        	
			        	<c:forEach var="n" begin="${Bpi.startPage }" end="${Bpi.endPage }" step="1">
			        		<c:choose>
			        			<c:when test="${empty condition }">
			        				<button onclick="location.href='reportBList.ad?bpage=${n}'">${ n }</button>
			        			</c:when>
			        			
			        		</c:choose>
			        	</c:forEach>	        	
			        	<c:if test="${ Bpi.currentPage ne Bpi.maxPage }">
			        		<c:choose>
			        			<c:when test="${empty condition }">
			        				<button onclick="location.href='reportBList.ad?bpage=${pi.currentPage + 1}'">&gt;</button> 
			        			</c:when>
			        			
			        		</c:choose>
			        	</c:if>
			        	</div>
			        <!-- board페이징 끝 -->
       			 </div>
				
				</div>
				
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		
		/*var repoCate = $('.report-cate').text()
		var arr = repoCate.split("");
		
		console.log($('.report-cate').text())
		console.log(arr)
		
		for(var i = 0 i<arr.length; i++){
			$('.report-cate').text("a?")
		}*/
		
		$('.report-cate').each(function(){
			  var text = $(this).text();
			  console.log(text);
			  
			  if(text == 1){
				  $(this).text("스팸, 홍보, 도배글")
			  }else if(text == 2){
				  $(this).text("욕설 및 음란물")
			  }else if(text == 3){
				  $(this).text("불법정보")
			  }else if(text == 4){
				  $(this).text("개인정보 노출 게시물")
			  }
			
			});
		
	})
		
		
	

	</script>

</body>
</html>