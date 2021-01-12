function excelImport($formdata, $excel, type, url, layer){
    if ($excel.val()==""){
        return ;
    }
    var formData = new FormData($formdata[0]);
    formData.append("file", $excel[0].files);

    $.ajax({
        type : type,
        url : url,
        processData : false,
        contentType : false,
        data : formData,
        success : response=>{
            if (response.state == 2){
                layer.msg(response.description, {
                    icon : 3
                });

            }else if (response.state == 1){
                gradeVue.listForm();
                layer.msg(response.description, {
                    end : function () {
                    },
                    icon : 1
                });

            }else{
                layer.msg(response.description, {
                    icon : 7
                })

            }
            $("#excel").val("");
            return ;
        },
        error : function (err) {
            layer.msg(err, {
                icon : 7
            })
            $("#excel").val("");
            return ;
        }
    })

}