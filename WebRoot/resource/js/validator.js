(function ($)
{
	 var s="";
    $.validator.addMethod(
            "notnull",
            function (value, element)
            {
                if (!value) return true;
                return !$(element).hasClass("l-text-field-null");
            },
            "不能为空"
    );
    //数字
    jQuery.validator.addMethod("nums", function (value, element)
    {
       return this.optional(element) || /^[0-9]*$/g.test(value);
    }, "只能为数字");
    //字母数字
    jQuery.validator.addMethod("alnum", function (value, element)
    {
        return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
    }, "只能包括英文字母和数字");
    //密码验证
    jQuery.validator.addMethod("password", function (value, element)
    {
       return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value)&&value.length>=6;
    }, "请输入6位以上的个人密码,并且必须包含字母和数字");
    jQuery.validator.addMethod("passwords", function (value, element)
    {
    	 return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value)&&value.length>=6;
    }, "请输入6位以上的个人密码,并且必须包含字母和数字");
    //确认密码 
    jQuery.validator.addMethod("passwordtwo", function(value, element) {
     return value==$("#password").val();
    }, $.validator.format("两次输入的密码不一致"));
    jQuery.validator.addMethod("passwordtwos", function(value, element) {
        return value==$("#passwords").val();
       }, $.validator.format("两次输入的密码不一致"));
    
    //身份证验证
    jQuery.validator.addMethod("idcode", function (value, element)
    {    	
    	 var myreg =/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    	 return this.optional(element) || (myreg.test(value));  	 
    }, $.validator.format("身份证号码格式不正确"));
    
    // 手机号码验证   
    jQuery.validator.addMethod("cellphone", function (value, element)
    {
        var length = value.length;
        return this.optional(element) || (length == 11 && /^(1\d{10})$/.test(value));
    }, "请正确填写手机号码");

    // 电话号码验证   
    jQuery.validator.addMethod("telephone", function (value, element)
    {
        var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
        return this.optional(element) || (tel.test(value));
    }, "请正确填写电话号码");

    // 邮政编码验证
    jQuery.validator.addMethod("zipcode", function (value, element)
    {
        var tel = /^[0-9]{6}$/;
        return this.optional(element) || (tel.test(value));
    }, "请正确填写邮政编码");
    //email 验证
    jQuery.validator.addMethod("email", function (value, element)
    	    {
        var tel = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    	        return this.optional(element) || (tel.test(value));
    	    }, "请正确填写邮箱号码");
    
    // 汉字
    jQuery.validator.addMethod("chcharacter", function (value, element)
    {
        var tel = /^[\u4e00-\u9fa5]+$/;
        return this.optional(element) || (tel.test(value));
    }, "请输入汉字");

    // 正整数
    jQuery.validator.addMethod("positive_int", function (value, element)
    {
        var tel = /^[0-9]*[1-9][0-9]*$/;
        return this.optional(element) || (tel.test(value));
    }, "请输入正整数");

    // QQ
    jQuery.validator.addMethod("qq", function (value, element)
    {
        var tel = /^[1-9][0-9]{4,}$/;
        return this.optional(element) || (tel.test(value));
    }, "请输入正确的QQ");

    // 用户名
    jQuery.validator.addMethod("username", function (value, element)
    {
        return this.optional(element) || /^[a-zA-Z][a-zA-Z0-9_]+$/.test(value)&&value.length<=25;
    }, "用户名格式不正确(2-25位)");
    jQuery.validator.addMethod("names", function (value, element)
    {
    	        return this.optional(element) || /^[\u4E00-\u9FA5]{2,5}$/.test(value)&&value.length<=25;
     }, "中文名字格式不正确");
    jQuery.validator.addMethod("suffix", function (value, element)
    {
    	if(/^[a-zA-Z0-9]+$/.test(value)){
    		$("#suffixlabel").val(basepath+'site/'+value);
    	}
        return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value)&&value.length<=10;
    }, "只能包括英文字母和数字,且长度不能超过10位");
    jQuery.validator.addMethod("suffixExist", function (value, element)
    {
    	var flag = true;
    	if(edit_suffix == value && edit_suffix != ''){
			flag = true;
		}else{
			if(suffixExist(value) == 0){
				flag = true;
			}else{
				flag = false;
			}
		}
        return flag;
    }, "该域名已存在");
    jQuery.validator.addMethod("teamExist1", function (value, element)
    	    {
    	    	var flag = true;
    	    	if(teamExist(element.form.orgid.value) < 0){
					flag = false;
				}
    	        return flag;
    	    }, "该团队不存在或无效");
    jQuery.validator.addMethod("teamExist2", function (value, element)
    	    {
    	    	var flag = true;
    	    	if(edit_orgid == element.form.orgid.value && edit_orgid != ''){
    				flag = true;
    			}else{
    				if(teamExist(element.form.orgid.value) > 0){
    					flag = false;
    				}else{
    					flag = true;
    				}
    			}
    	        return flag;
    	    }, "该团队已绑定");
    jQuery.validator.addMethod("linkurl", function (value, element)
    	    {
    	        return this.optional(element) || /^http:\/\/[\s\S]*$/.test(value);
    	    }, "链接地址请以http://开头");
})(jQuery);