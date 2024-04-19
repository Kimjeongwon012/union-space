<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="resources/css/login.css" type="text/css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        input[name="id"] {
            width: 70%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>회원가입</h3>
        <hr/>
        <form action="join.do" method="post">
            <table>
                <tr>
                    <th>ID</th>
                    <td>
                        <input type="text" name="id"/>
                        <input type="button" value="중복체크" onclick="overlay()"/>
                    </td>
                </tr>
                <tr>
                    <th>PW</th>
                    <td><input type="password" name="pw"/></td>
                </tr>
                <tr>
                    <th>PW확인</th>
                    <td>
                        <input type="password" id="confirm"/>
                        <span id="msg"></span>
                    </td>
                </tr>
                <tr>
                    <th>NAME</th>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <th>PHONE</th>
                    <td><input type="text" name="phone"/></td>
                </tr>
                <tr>
                    <th>GENDER</th>
                    <td>
                        <input type="radio" name="gender" value="남"/>남자
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="gender" value="여"/>여자
                    </td>
                </tr>
                <tr>
                    <th>EMAIL</th>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <th colspan="2"><button type="button" onclick="join()">회원가입</button></th>
                </tr>
            </table>
        </form>
    </div>
</body>
<script>
	var overChk = false;
	
	$('#confirm').on('keyup',function(){
		if($('input[name="pw"]').val()==$(this).val()){
			$('#msg').html('비밀번호가 일치합니다');
			$('#msg').css({'color':'green'});
	}else{
		$('#msg').html('비밀번호가 일치하지 않습니다');
		$('#msg').css({'color':'red'});
	}
	})

	function join(){
		
		var $id = $('input[name="id"]');
		var $pw = $('input[name="pw"]');
		var $name = $('input[name="name"]');
		var $age = $('input[name="phone"]');
		var $gender = $('input[name="gender"]:checked');
		var $email = $('input[name="email"]');
		
		if(overChk==false){
			alert('중복체크를 해주세요!');
			$id.focus();
		}else if($id.val()==''){
			alert('아이디를 입력 해주세요!');
			$id.focus();
		}else if($pw.val()==''){
			alert('비밀번호를 입력 해주세요!');
			$pw.focus();
		}else if($name.val()==''){
			alert('이름을 입력 해주세요!');
			$name.focus();
		}else if($age.val()==''){
			alert('전화번호를 입력 해주세요!');
			$age.focus();
		}else if($gender.val()==null){
			alert('성별을 체크 해주세요!');
		}else if($email.val()==''){
			alert('이메일을 입력 해주세요!');
			$email.focus();
		}else{		
		//데이터를 넣기전에 확인
		var regExp = new RegExp('[a-zA-zㄱ-ㅎ가-힣]');
		var match = regExp.test($age.val());  // 위의 표현식 일치여부
		if(match){
			alert('숫자만 입력해 주세요!');
			$age.val('');
			$age.focus();
			return false;
		}
		
		console.log('서버로 회원가입 요청')
		$('form').submit();	//submit 버튼 역할
	}
}

	var msg = '${msg}'; // 쿼터 빠지면 넣은 문구가 변수로 인식됨.
	if(msg != ''){
		alert(msg);
	}
	function overlay() {
		console.log('click');
		var id = $('input[name="id"]').val();
		//ajax를 이용한 비동기 통신 (자바스크렙트를 사용해 보안성이 좋지 못함 취약함)
		$.ajax({
			type:'post', // method 방식
			url:'overlay.do', // 요청한 주소
			data:{'id':id}, // 파라메터
			success:function(data){ // 통신 성공했을경우
			//ajax에서 XmlhttpRequest 객체를 통해 대신 받아와서
			//여기에 뿌려준다
				console.log(data);
				if(data.use > 0){
					alert('이미 사용중인 아이디 입니다.');
					$('input[name="id"]').val('');
				}else{
					alert('사용 가능한 아이디 입니다.');
					overChk = true;
				}
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
</script>
</html>