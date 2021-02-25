package com.happystudy2.happystudy2management.core.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.shiro.subject.Subject;

@Data
@Builder
@ApiModel("用户登录返回数据")
@EqualsAndHashCode
@JsonInclude(JsonInclude.Include.NON_NULL)
public class LoginParam {
    private Boolean success;
    private String description;
    private Subject currentUser;
}
