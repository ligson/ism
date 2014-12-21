package com.ism.code.domains

/**
 * Created by ZhengYunfei on 2014/12/17.
 * 代码管理
 */
class CodeInfo {
    CodeSort codeSort;//分类
    String pCode;//父编码
    String codeName;//代码中文名称
    String codeValue;//代码值
    String validFlag;//有效标识
    String dispSn;//序号
    static  mapping = {
        table('ism_codeInfo')
    }
    static final Map validFalgMap = [
            1: "有效",
            0: "禁用"
    ]
}
