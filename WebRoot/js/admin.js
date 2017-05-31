function adminChangeValidateCode(obj) {
	var timenow = new Date().getTime();
	obj.src = "AdminAction_getRandomPictrue?d=" + timenow;
}

function changePasswordValidateCode(obj) {
	var timenow = new Date().getTime();
	obj.src = "AdminAction_getRandomPictrue?d=" + timenow;
}