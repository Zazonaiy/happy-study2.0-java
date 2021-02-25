package com.happystudy2.happystudy2management.domain.vo.user;

import com.happystudy2.happystudy2management.core.domain.vo.BaseVO;
import com.happystudy2.happystudy2management.domain.vo.TypeVO;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class UserEditVO extends BaseVO {

    private String username;

    //private String password;

    private Integer memberNo;

    private TypeVO memberType;

    private String roleId;

    private String roleName;

    private String roleDescription;
}
