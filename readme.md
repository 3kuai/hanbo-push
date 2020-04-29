# 推送核心服务

>架构总览

![推送概览](https://github.com/lmx1989219/push-core/blob/master/%E6%8E%A8%E9%80%81%E4%BA%91.png)

>架构设计

![推送架构图](https://github.com/3kuai/push-core/blob/master/%E6%8E%A8%E9%80%81%E6%9E%B6%E6%9E%84.png)
>推送流程

![推送流程图](https://github.com/3kuai/push-core/blob/master/%E6%8E%A8%E9%80%81%E6%B5%81%E7%A8%8B%E5%9B%BE.png)


## 准备工作
- java8
- redis3， mysql5.5 ，zookeeper3

## 启动应用
- 配置ngx，部署webUI
- 参考各module的readme，分别启动server，admin，webproxy
- 登录后台
- 新建应用
- 初始化设备，同时启动模拟客户端（client->junit模拟客户端并发数）
- 发布消息
- 查看大盘监控

## 步骤演示
    1. 注册登陆
![4](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzQucG5n?x-oss-process=image/format,png)

![2](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzIucG5n?x-oss-process=image/format,png)
    
    2. 实时大盘

![8](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzgucG5n?x-oss-process=image/format,png)
    
    3. 新建应用
![6](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzYucG5n?x-oss-process=image/format,png)

![7](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzcucG5n?x-oss-process=image/format,png)
    
    4. 发布消息
![1](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzEucG5n?x-oss-process=image/format,png)

    5. 消息监控
![3](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzMucG5n?x-oss-process=image/format,png)

    6. 消息明细
![5](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jLzUucG5n?x-oss-process=image/format,png)

    7.tcp客户端
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jL3B1c2gtYXBwLnBuZw?x-oss-process=image/format,png)
    
    8.websocket客户端
![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9naXRlZS5jb20vbG14XzAwNy9oYW5iby1wdXNoL3Jhdy9yZWxlYXNlMjAyMDA1MDEvZG9jL3B1c2gtdWkucG5n?x-oss-process=image/format,png)    




