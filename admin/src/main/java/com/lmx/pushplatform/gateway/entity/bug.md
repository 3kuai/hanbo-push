# lombok不是万能的，在hibernate里面有大坑
    实体之间有一对多或者多对一关系的toString方法会出现无限循环调用，导致stack溢出