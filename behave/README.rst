======
Behave
======
感谢,Behave框架的开发维护人员!
PS:Python2.7
根据业务需要,修改行为框架内部文件,支持读取Mysql数据库数据,从而省去创建.feature文件;
运行目录等级举例:
first_level:
    config/config.xml    配置数据库连接;(该文件模板存在于安装目录文件夹:examples内;PS:数据表结构创建语句亦存储至该目录)
    steps    步骤模板(教程内包含,无须赘述)
    environment.py   环境配置文件(教程内包含,无需赘述)
    start_client.py  启动文件(修改该文件内的project内容(list),传入值为domain)
实现逻辑:
    Mysql内创建三个表,分别是 behave_feature,behave_scenario,behave_step 表,对应关系为: 一个 domain 存在多个 feature ,feature 存在多个scenario,scenario 存在多个step;
    业务需要: 根据功能域,查找对应的案例,根据案例查找对应场景,根据场景查找步骤,组合为运行脚本;
    
