$(document).ready(function() {
	$(document).on('click', 'submit', function(e) {
		e.preventDefault();
		if($('#user_otp').val() == ""){
			$('.otp-error-container').show();
		}
	})
});
