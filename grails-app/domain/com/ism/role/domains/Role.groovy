package com.ism.role.domains

/**
 * Created by zhengYunFei on 2014/12/17.
 */
class Role {
    String roleName;//角色名称
    String roleNo;//角色编码
    String remark;//备注
    String createDate;//添加时间
    static  mapping = {
        table('ism_role')
    }
}
