function changeValidateCode(obj) {
	var timenow = new Date().getTime();
	obj.src = "LoginAction_getRandomPictrue?d=" + timenow;
}

function regChangeValidateCode(obj) {
	var timenow = new Date().getTime();
	obj.src = "RegAction_getRandomPictrue?d=" + timenow;
}

function reg() {
	window.location.href = "/NewsSystem/RegAction_reg";
}