function submitComment() {
	var id = $('#newsId').val();
	var comment = $('#comment').val();
	var jData = {
		"newsId" : id,
		"comment" : comment,
		"date" : new Date()
	};

	$.ajax({
		type : "POST",
		url : "NewsAction_publishComment",
		processData : true,
		dataType : "json",
		data : jData,
		success : function(data) {
			callBackFunction(data, false);
		}
	});

}

function deleteComment(id,flag) {
	var _flag = flag;
	var newId = $('#newsId').val();
	var commentId = id;
	var jData = {
		"newsId" : newId,
		"commentId" : commentId,
		"date" : new Date()
	};
	if(!flag){
	$.ajax({
		type : "POST",
		url : "NewsAction_deleteComment",
		processData : true,
		dataType : "json",
		data : jData,
		success : function(data) {
			callBackFunction(data, true);
		}
	});
	}else{
		$.ajax({
			type : "POST",
			url : "NewsAction_deleteComment",
			processData : true,
			dataType : "json",
			data : jData,
			success : function(data) {
				callBackFunction(data, false);
			}
		});
	}
}

function callBackFunction(data, flag) {
	$("#res").nextAll("tr").remove();
	var i = 0;
	var _flag = flag;
	var uid = $("#userId").val();
	for (i = 0; i < data.length; i++) {
		var username = data[i].user.username;
		var createTime = formatterDate(new Date(data[i].createTime));
		var content = data[i].content;
		var id = data[i].id;
		var cid = data[i].user.id;
		var temp;
		if (!_flag) {
			if(uid == cid){
				temp = $('<tr><td colspan="2">' + (i + 1) + '楼</td></tr>'
						+ '<tr><td>评论者：' + username + '</td><td>评论时间：' + createTime
						+ '</td></tr>' + '<tr><td colspan="2">内容：' + content
						+ '<span style="float: right"><a href="javascript:void(0);"'
						+ 'onclick="deleteComment('+ id +',true)">删除</a></span>'
						+ '</td></tr>');
			}else{
				temp = $('<tr><td colspan="2">' + (i + 1) + '楼</td></tr>'
						+ '<tr><td>评论者：' + username + '</td><td>评论时间：' + createTime
						+ '</td></tr>' + '<tr><td colspan="2">内容：' + content
						+ '</td></tr>');
			}
			
		} else {
				temp = $('<tr><td>' + (i + 1) + '楼</td></tr>'
					+ '<tr><td>评论者：' + username + '</td><td><span style="float: right">评论时间：' + createTime
					+ '</span></td></tr>' + '<tr><td colspan="2">内容：' + content
					+ '<span style="float: right"><a href="javascript:void(0);"'
					+ 'onclick="deleteComment('+ id +',false)">删除该评论</a></span></td></tr>');
		}
		$('#res').parent().find('tr:last').after(temp);
	}
	if(i==0){
		var temp = $('<tr><td align="center">还没有人评论，抢个沙发试试！</td></tr>');
		$('#res').parent().find('tr:last').after(temp);
	}
	$("#count").html(i);
	$('#comment').val("");
}

function formatterDate(date) {
	var datetime = date.getFullYear()
			+ "-"// "年"
			+ ((date.getMonth() + 1) > 10 ? (date.getMonth() + 1) : "0"
					+ (date.getMonth() + 1))
			+ "-"// "月"
			+ (date.getDate() < 10 ? "0" + date.getDate() : date.getDate())
			+ " "
			+ (date.getHours() < 10 ? "0" + date.getHours() : date.getHours())
			+ ":"
			+ (date.getMinutes() < 10 ? "0" + date.getMinutes() : date
					.getMinutes())
			+ ":"
			+ (date.getSeconds() < 10 ? "0" + date.getSeconds() : date
					.getSeconds());
	return datetime;
}