package com.ism.message.domains

import com.ism.goods.domains.Goods
import com.ism.vip.domains.Vip

/**
 * Created by zhengyunfei on 14-12-15.
 */
class Message {
    String title;//消息标题
    String content;//消息内容
    String status;//消息状态 0 未读 1 已读
    String msgType;//消息类型
    String sendTime;//发送时间
    String sendAuthor;//发送者
    Vip vip;//接收者
    static mapping = {
        table('ism_message');
    }
    static final Map statusCnName = [
            0 : "未读",
            1 : "已读"
    ]
    static final Map msgTypeName = [
            1: "站内信",
            2 : "短信"
    ]
}
