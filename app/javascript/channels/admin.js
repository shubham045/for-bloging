$(document).ready(function() {
	$(document).on('click', '.submit-otp-form', function(e) {
		e.preventDefault()
		if($('#user_otp').val() == ""){
			$('.otp-error-container').show();
		}
		else{
			$('.otp-form').submit();
		}
	})
});
