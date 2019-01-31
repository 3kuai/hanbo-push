## REST API

提供满足 REST 规范的 HTTP API 来使用常用的功能

>使用范围

    1. appSdk,
    2. appServer
    3. 管理后台

>功能列表：
>>APP推送

    注册开发者帐号
    开发者账户登录
    创建app应用
    设备注册
    客户端鉴权（appKey+appSecret），返回一路在线的推送服务的连接信息
    推送消息
    
>>IM即时聊天

    IM消息，返回空
    用户维护，返回空
    用户关系维护，返回空
    群组维护，返回空
    群组关系维护，返回空
    
>启动参数 -Dzk.hosts=127.0.0.1:2181

>在线演示 http://127.0.0.1:8080/swagger-ui.html