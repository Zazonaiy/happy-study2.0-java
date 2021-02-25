package com.happystudy2.happystudy2management.domain.vo.login;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class LoginVO extends BaseVO {
    private Boolean success;
    private String description;

}
