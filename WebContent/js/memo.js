function check(){
			if(!frm.name.value){
				alert("작성자를 입력하세요");
				frm.name.focus();
				return;
			}
			if(!frm.msg.value){
				alert("메모내용을 입력하세요");
				frm.msg.focus();
				return;
			}
			var len=frm.msg.value.length;
			if(len>100){
				alert("메모내용은 100자 이내여야 해요");
				frm.msg.select();
				return;
			}
			frm.submit();
		}