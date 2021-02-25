package com.happystudy2.happystudy2management.domain.dto.user;

import com.happystudy2.happystudy2management.core.domain.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("创建账号/修改密码 对象")
public class UserEditDTO extends BaseDTO {

    private String username;

    private String password;

    private Integer memberNo;

    private Integer memberType;

    private String newPassword;
}
