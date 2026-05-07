<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<link href="/img/favicon.png" rel="shortcut icon" type="image/x-icon">
<link href="/css/common.css" rel="stylesheet"/>
<style>

	table {width:100%;}
	
	td {
		padding:5px 10px;
		text-align:center;
		}
	
	td:nth-of-type(1) {
		background-color: black;
		color: white;
		border-bottom: 1px solid white;
		}
		
	input[type=text],input[type=number],input[type=password],input[type=email] {
		width:100%;
		}
		
	input[type=button],input[type=submit] {
		width:100px;
		}
		
	input[name=userid] {
		width: 60%
		}
	
	#table1 {
		margin-bottom: 150px;
		td {
			&:nth-of-type(1){
				width: 150px;
				background-color: black;
				color: white;
				}
			&:nth-of-type(2){
				width: 150px;
				background-color: white;
				color: black;
				}
			&:nth-of-type(3){
				width: 150px;
				background-color: black;
				color: white;
				border-bottom: 1px solid white;
				}
			&:nth-of-type(4){
				width: 150px;
				background-color: white;
				color: black;
				}
			}
		}
	
	#table1 tr:last-of-type > td {
		background: white;
		border: 1px solid black;
		}
	
	#table1 tr:nth-of-type(3) td:nth-of-type(2) {
		text-align:left;
		}
	
	#table1 tr:nth-of-type(4) {
		height:400px;
		}
	
	.menu {
		margin-top: 10px;
		td {
			border: 1px solid white;
			}
		}
	
</style>

</head> 
<body>
	<main>
	<%@include file="/WEB-INF/include/menus.jsp" %>
	  <h2>게시글 내용</h2>
	  
	   <table id="table1">
	     <tr>
	       <td>게시글 번호</td>
	       <td>${board.idx}</td>
	       <td>조회수</td>
	       <td>${board.hit}</td>  
	     </tr>	    
	     <tr>
	       <td>작성자</td>
	       <td>${board.writer}</td>
	       <td>작성일</td>
	       <td>${board.regdate}</td>
	     </tr>
	     <tr>
	       <td>제목</td>
	       <td colspan="3">${board.title}</td>
	     </tr>
	     <tr>
	       <td>내용</td>
	       <td colspan="3">${board.content}</td>
	     </tr>
	     <tr>
	       <td colspan="4">
	       	<a href="/Board/WriteForm?menu_id=${board.menu_id}"                   class="btn btn-primary">새글쓰기</a>
	       	<a href="/Board/UpdateForm?idx=${board.idx}&menu_id=${board.menu_id}" class="btn btn-warning">수정</a>
	       	<a href="/Board/Delete?idx=${board.idx}&menu_id=${board.menu_id}"     class="btn btn-danger">삭제</a>
	       	<a href="/Board/List?menu_id=${board.menu_id}"                        class="btn btn-info">목록</a>
	       	<a href="/"                                                           class="btn btn-success">Home</a>
	       </td>
	      </tr>
	   </table>
	 
	</main>
	
<!-- javascript -->
	<script>
	    var   idDupChecked = false 	
	
		const formEl     = document.querySelector('form');
		const useridEl   = document.querySelector('[name="userid"]');
		const passwdEl   = document.querySelector('#passwd');
		const passwd2El  = document.querySelector('#passwd2');
		const usernameEl = document.querySelector('[name="username"]');
		
		// 입력확인 체크
		formEl.addEventListener('submit', function (e) {
			
			// 아이디 체크 
			if(useridEl.value.trim() == '') {
				alert('아이디를 입력하세요')
				useridEl.focus();
				e.preventDefault()  // 이벤트 취소
				e.stopPropagation() // 이벤트 버블링 방지
				return;
			}
			// 아이디 중복확인 체크 확인 여부
			if(!idDupChecked){
				alert("아이디 중복확인을 하세요")
				e.preventDefault()  // 이벤트 취소
				e.stopPropagation() // 이벤트 버블링 방지
				return;
			}
			// 비밀번호 체크 
			if(passwdEl.value.trim() == '') {
				alert('비밀번호를 입력하세요')
				passwdEl.focus();
				e.preventDefault()  // 이벤트 취소
				e.stopPropagation() // 이벤트 버블링 방지
				return;
			}
			// 비밀번호가 == 비밀번호확인 체크 
			if(passwd2El.value != passwdEl.value) {
				alert('비밀번호가 일치하지 않습니다')
				passwd2El.focus();
				e.preventDefault()  // 이벤트 취소
				e.stopPropagation() // 이벤트 버블링 방지
				return;
			}
			// 이름 체크 
			if(usernameEl.value.trim() == '') {
				alert('이름을 입력하세요')
				usernameEl.focus();
				e.preventDefault()  // 이벤트 취소
				e.stopPropagation() // 이벤트 버블링 방지
				return;
			}
			
		})
	
	
	</script>
	<script>
		// 아이디 중복확인(새창열기)
		const btnDup1El = document.querySelector("#dupCheck1")
		
		btnDup1El.addEventListener('click', function() {
			alert('ok')
			// 새창을 띄운다
			let url     = '/Users/DupCheckWindow?frist=true';
// 			let url     = '/Users/DupCheckWindow';                 // session 활용 방식
			let taget   = 'dupcheck';                              // 새창 이름있으면 한개만 열림
			let feature = 'left=800,top=200,width=400,height=300'; 
			window.open(url, taget, feature)
		})
		
	</script>
	<script>
		// 아이디 중복확인2(Ajax)
		const btnDup2El = document.querySelector("#dupCheck2")
		
		btnDup2El.addEventListener('click', function() {
			if(useridEl.value.trim() == '') {
				alert('아이디를 입력하세요')
				useridEl.focus()
				return
			}
			alert('ok')
			let url = '/Users/IdDupCheck2?userid=' + useridEl.value
					
			fetch(url)
			.then(response => response.json())
			.then(data => {
					console.log(data.userid)
					if(data.userid != null) {
						alert('사용불가능')
						idDupChecked = false
					} else {
						alert('사용가능')
						idDupChecked = true
						}
				});
			
		})
		
		// userid 의 value가 바뀌면 idDupChecked = false
		useridEl.addEventListener('change', function() {
			idDupChecked = false
		})
		
		
	</script>
	
</body>
</html>