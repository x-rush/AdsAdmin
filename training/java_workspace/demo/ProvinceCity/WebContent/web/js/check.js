
function isInteger(str){
	return str.search("^[1-9]+(\\d*)$")==0;
}



/**
* Positive Integer Check
*/
function isPositiveInteger(str){
	var regex=new RegExp("^[1-9]+\\d*$");
	return regex.test(str);
}

/**
* Negative Integer Check
*/
function isNegativeInteger(str){
	var regex=new RegExp("^-{1}\\d+$");
	return regex.test(str);
}

/**
* Nonnegative Integer Check
*/
function isNonnegativeInteger(str){
	var regex=new RegExp("^\\d+$");
	return regex.test(str);
}

/**
* Integer Check
*/
function isInteger(str){
	var regex=new RegExp("^-?\\d+$");
	return regex.test(str);
}

/**
* Rational number Check
*/
function isRationalNumber(str){
	var regex=new RegExp("^-?\\d+(\\.*)(\\d*)$");
	return regex.test(str);
}

/**
* Letter Check
*/
function isLetter(str){
	var regex=new RegExp("^[a-zA-Z]+$");
	return regex.test(str);
}

/**
* Letter Integer Check
*/
function isLetterOrInteger(str){
	var regex=new RegExp("^[a-zA-Z0-9]+$");
	return regex.test(str);
}

/**
* Email Check
*/
function isEmail(str){
	var regex=new RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$");
	return regex.test(str);
}

/**
* Character Check
*/
function isCharacter(str){
	var regex=new RegExp("^[\u4E00-\u9FA5]+$");
	return regex.test(str);
}

/**
* Currency Check
*/
function isCurrency(str){
	return str.search("^\\d+(\\.\\d{0,2})*$")==0;
}

function isABC(str){
	alert(str);
	//var regex=/\d+/;
	var regex=new RegExp("^[abc]$");
	var b=regex.test(str);
	alert(b);
	return regex.test(str);
}
