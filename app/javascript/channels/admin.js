$(document).ready(function() {
	$(document).on('click', '.otp-form-btn', function(e) {
		if($('#user_otp').val() == ""){
			e.preventDefault();
			$('.otp-error-container').show();
		}
		else{
			$('.otp-form-btn').click();
		}
	})
});
