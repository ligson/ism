package com.ism.code.domains

/**
 * Created by ZhengYunfei on 2014/12/17.
 * 代码管理
 */
class CodeSort {
    String text;//代码分类名
    String codeSortType;//代码分类类型
    String flag;//有效标识
    String remark;//备注
    String pid;
    static  mapping = {
        table('ism_codeSort')
    }
    static final Map validFalgMap = [
            1: "有效",
            0: "禁用"
    ]
    static constraints = {
        remark(nullable: true)
    }
}
