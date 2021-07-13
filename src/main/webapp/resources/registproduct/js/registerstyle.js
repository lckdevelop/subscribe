let submitContent = document.getElementById('submit-content');
    
	const editor = new toastui.Editor({
		el: document.querySelector('#editor'),
		previewStyle: 'vertical',
		height: '600px',
		initialEditType: 'wysiwyg',
		initialValue: submitContent.value
	});
	
	function getCheckedProduct(){
		var chk_arr=[];
    	$("input[name=product-check]:checked").each(function(){
    		var chk = $(this).val();
    		chk_arr.push(chk);
    	})
    	return chk_arr;
	}
	
	function clickSubmit() {
		//submitContent.value = editor.getHtml();
		
		//alert(editor.getHtml());
		var form = new FormData();
        
		let title = $("input[name=subject]").val();
		let content = editor.getHtml();
		let checkedProduct = getCheckedProduct();
		
		form.append("thumbnail", $("#inputGroupFile01")[0].files[0] );
		form.append("title", title);
		form.append("content", content);
		form.append("checkedProduct", checkedProduct);
		
		
		$.ajax({
    		type : "POST",
    		url : './registerstyle/insert',
    		data : form,
    		enctype: 'multipart/form-data',
    		processData: false,
    		contentType: false,
    		success : function() {
        		location.href="/subscribe/admin/registerstyle";
    		},
    		err : function(err) {
        		alert(err.status);
    		}
		});
	}
	
	
	
	$("#inputGroupFile01").change(function(event) {  
  RecurFadeIn();
  readURL(this);    
});
$("#inputGroupFile01").on('click',function(event){
  RecurFadeIn();
});
function readURL(input) {    
  if (input.files && input.files[0]) {   
    var reader = new FileReader();
    var filename = $("#inputGroupFile01").val();
    filename = filename.substring(filename.lastIndexOf('\\')+1);
    reader.onload = function(e) {
      $('#preview').attr('src', e.target.result);
      $('#preview').hide();
      $('#preview').fadeIn(500);      
      $('.custom-file-label').text(filename);             
    }
    reader.readAsDataURL(input.files[0]);    
  } 
  $(".alert").removeClass("loading").hide();
}
function RecurFadeIn(){ 
  console.log('ran');
  FadeInAlert("Wait for it...");  
}
function FadeInAlert(text){
  $(".alert").show();
  $(".alert").text(text).addClass("loading");  
}