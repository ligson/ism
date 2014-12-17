package com.ism.code.domains

/**
 * Created by ZhengYunfei on 2014/12/17.
 * 代码管理
 */
class CodeInfo {
    String codeId;//主键
    CodeSort codeSort;//分类
    String pCode;//父编码
    String codeName;//代码中文名称
    String codeValue;//代码值
    String validFlag;//有效标识
    String dispSn;//序号
    static  mapping = {
        table('ism_codeInfo')
    }
}
