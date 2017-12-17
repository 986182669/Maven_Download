/*function usercheck(){
    var $user = $("#username")
    alert($user.val())
}*/
$(document).ready(function () {
    $("#username").blur(function () {
       var user = $(this).val();
        if(user==null||user==""){
           var text = $("#error").text("45646465465465");
        }
    });
    $("#file").blur(function () {
       var file = $(this).val();
       if(file==null||file==""){
           var text = $("#error").text("45646465465465");
       }
    });

})
function upload() {
    var formData = new FormData($("#myform")[0]);
    var url = "/download/up";
    $.ajax({
        type:"POST",
        url:url,
        data:formData,
        async:true,
        cache:false,
        contentType:false,
        processData:false,
        success:function (data) {
            $("#msg").text("文件上传成功");
        },
        error:function (data) {
            alert("gun")
        }
    })
}