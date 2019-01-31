## 推送管理页面

>功能列表：

    注册开发者帐号
    开发者账户登录
    创建应用
    应用列表
    推送消息
    消息列表
    
>nginx 配置

    location / {
            root   /静态资源目录/push-webUI;
            index  index.html index.htm;
    }
        
    location /pushAdmin/ {
        proxy_pass   http://127.0.0.1:8080;
    }            