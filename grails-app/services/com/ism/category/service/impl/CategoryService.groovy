package com.ism.category.service.impl

import com.ism.good.service.IGoodService
import com.ism.goods.domains.Category
import com.ism.goods.domains.Goods
import grails.transaction.Transactional

@Transactional
class CategoryService implements IGoodService {
    /**
     * 新增分类
     * author ZhengYunFei
     * @param params
     * @return
     */
    Map addCategory(Map params) {
        def result = [:];
        def category=new Category(params);
        if (category.save(flush: true)) {
            result.success = true;
            result.msg = "保存成功";
        }
        return result;
    }
    /**
     * 更新分类
     * author ZhengYunFei
     * @param params
     * @return
     */
    Map updateCategory(Map params){
        def result=[:];
        def category=Category.findById(params.id);
        category.name=params.name;
        category.no=params.no;
        category.market=params.market;
        category.validFlag=params.validFlag;
        category.sortType=params.sortType;
        category.displayNum=params.displayNum;
        if (category.save(flush: true)) {
            result.success = true;
        } else {
            result.success = false;
            result.msg = "保存失败!";
        }
        return result;
    }
    /**
     * 删除分类
     * author ZhengYunFei
     * @param params
     * @return
     */
    Map removeCategory(Map params){
        def result=[:];
        Category category=Category.findById(params.id);
        if(category){
            category.delete(flush:true)
            result.success = true;
        }else{
            result.success=false;
        }
        return result;
    }
}
