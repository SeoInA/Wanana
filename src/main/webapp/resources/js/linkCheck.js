/**
 * 
 */
 var dup_check = true;

function isValidForm(){
    if(!dup_check){
        alert("포트폴리오 URL을 다시 입력 해주세요.");
        $("#red_ck_link").focus();
    	return false;
    }
    else return true;
}

$( document ).ready(function() {
	//keydown event 없애기 (enter 눌러도 전송안되게)
	document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);
	const randomString = Math.random().toString(36).slice(2);
	$('.linkBox #link').val(randomString);
	$("#select_template_url").val($("#link").val());
	//중복 체크 안하면 못 넘어가게
	//링크 중복 체크 
	$("#link").blur(function(){
		if($("#link").val()==""){
	        //$("#link").focus();
	        alert("링크를 입력해주세요.");
	    }
	    else{
	    	$.ajax({
	          type: "post",
	          url: "link_finder",
	          data : {
	            "link" : $("#link").val()
	          },
	          dataType: 'text',
	          success : function(data){
	            if(data=="success"){
	              $("#link_dup_txt").html("<span style='color:green;' class='overlap_msg' >사용가능</span>");
	              $("#link").css("background-color","#e4eee4");
	              $("#select_template_url").val($("#link").val());
	              dup_check=true;
	            }
	            else{
	              $("#link").val("");
	              $("#link_dup_txt").html("<span style='color:red;' class='overlap_msg'>사용불가</span>");
	              $("#link").css("background-color","#eee6e4");
	              dup_check=false;
	            }
	          }, error:function(request, status, error){
	    		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          }
	    	});
		}
	});
	
	$("#link").on("propertychange change keyup paste input", function() {
	    $("#link_dup_txt").html("");
	});
});//document.ready 끝