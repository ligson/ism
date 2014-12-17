package com.ism.code.service

/**
 * Created by zhengYunfei on 2014/12/17.
 */
interface ICodeService {
    /**
     * 新增代码分类
     */
    public Map addCodeSort(Map params);
    /**
     * 编辑代码分类
     */
    public Map editCodeSort(Map params);
    /**
     * 删除代码分类
     */
    public Map deleteCodeSort(Map params);
    /**
     * 新增代码信息
     */
    public Map addCodeInfo(Map params);
    /**
     * 编辑代码信息
     */
    public Map editCodeInfo(Map params);
    /**
     * 删除代码信息
     */
    public Map deleteCodeInfo(Map params);
}
