let submitContent = document.getElementById('submit-content');
    
	const editor = new toastui.Editor({
		el: document.querySelector('#editor'),
		previewStyle: 'vertical',
		height: '600px',
		initialEditType: 'wysiwyg',
		initialValue: submitContent.value
	});
	
	function clickSubmit() {
		submitContent.value = editor.getHtml();
		document.getElementById('cody-form').submit();
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