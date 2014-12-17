package com.ism.code.service.impl

import com.ism.address.domains.City
import com.ism.code.domains.CodeInfo
import com.ism.code.domains.CodeSort
import com.ism.code.service.ICodeService
import com.ism.market.domains.Market

/**
 * Created by ZhengYunFei on 2014/12/17.
 */
class CodeService implements ICodeService{
    /**
     * 新增代码分类
     * @param params
     * @return
     */
    @Override
    public Map addCodeSort(Map params) {
        def result = [:];
        def codeSort=new CodeSort(params);
        if (codeSort.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
        }
        return result;
    }
    /**
     * 编辑代码分类
     * @param params
     * @return
     */
    @Override
    public Map editCodeSort(Map params) {
        def result=[:];
        def codeSort=new CodeSort(params.id);
        if (codeSort.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
        }
        return result;
    }
    /**
     * 删除代码分类
     * @param params
     * @return
     */
    @Override
    public Map deleteCodeSort(Map params) {
        def result=[:];
        def codeSort=new CodeSort(params.id);
        if(codeSort){
            codeSort.delete(flush:true)
            result.success = true;
        }else{
            result.success=false;
        }
        return result;
    }
    /**
     * 新增代码
     * @param params
     * @return
     */
    @Override
    public Map addCodeInfo(Map params) {
        def result = [:];
        def codeInfo=new CodeInfo(params);
        def codeSort=CodeSort.findById(params.codeSortId);
        codeInfo.codeSort=codeSort;
        if (codeInfo.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
        }
        return result;
    }
    /**
     * 编辑代码
     * @param params
     * @return
     */
    @Override
    public Map editCodeInfo(Map params) {
        def result=[:];
        def codeInfo=new CodeInfo(params.id);
        if (codeInfo.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
        }
        return result;
    }
    /**
     * 删除代码
     * @param params
     * @return
     */
    @Override
    public Map deleteCodeInfo(Map params) {
        def result=[:];
        def codeInfo=new CodeInfo(params.id);
        if(codeInfo){
            codeInfo.delete(flush:true)
            result.success = true;
        }else{
            result.success=false;
        }
        return result;
    }
}
