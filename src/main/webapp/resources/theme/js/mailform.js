
let submitBtn = document.getElementById('submit-btn');
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
	document.getElementById('email-form').submit();
}

window.onpageshow = function() {
	let submitContent = document.getElementById('submit-content');
	editor.setHtml(submitContent.value);
}