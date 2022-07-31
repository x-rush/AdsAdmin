/**
* Check a object will be checked when sbmit a form
*/
function createToBeCheckedObj(textboxName,msgSpanId,validChar,isRequired){
    // Create the object will be checked
	var toBeCheckedObj=new Object;
	
	// Set propertied to toBeCheckedObj
	toBeCheckedObj.textboxName=textboxName;
	toBeCheckedObj.msgSpanId=msgSpanId;
	toBeCheckedObj.validChar=validChar;
	toBeCheckedObj.isRequired=isRequired;
	
	// create a method of toBeCheckedObj
	toBeCheckedObj.showProperties=function(){
		alert("TextboxName="+this.textboxName+" MsgSpanId="+this.msgSpanId+" ValidChar="+this.validChar+" IsRequired"+this.isRequired);
	}
 
    // return the object will be checked
	return toBeCheckedObj;
}

/**
* Check form
*/
function checkForm(toBeCheckedObjArray){
	
	for(var i=0;i<toBeCheckedObjArray.length;i++){
		var	toBeCheckedObj=toBeCheckedObjArray[i];	
		// toBeCheckedObj.showProperties();
		
		var checkResult=checkTextBox(toBeCheckedObj);
		
		if(checkResult){
			document.getElementById(toBeCheckedObj.msgSpanId).className="feedbackHide";
		}
		else{		
			document.getElementById(toBeCheckedObj.msgSpanId).className="feedbackShow";
			document.getElementById(toBeCheckedObj.textboxName).focus();
			return false;
		}				
	}
 
 	// alert("all passed");
	return true;
}

/**
* Check text field in the form 
*/
function checkTextBox(toBeCheckedObj){
	var validChar=toBeCheckedObj.validChar;
	var isRequired=toBeCheckedObj.isRequired;
	var inputValue=document.getElementById(toBeCheckedObj.textboxName).value;
	
	if(isRequired!="true" && inputValue.length<1){
		return true;
	}
	else{
		var regexStr="^"+validChar+"$";
		var regex=new RegExp(regexStr);
		return regex.test(inputValue);
	}
}
