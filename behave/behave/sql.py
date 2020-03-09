#!/usr/bin/python
#-*-coding:utf-8 -*-
import pymysql
import xml.etree.ElementTree as ET
import os
def get_mobile_params(file,gen):
    tree = ET.parse(file)
    root = tree.getroot()
    s = [dict(simgleMobile) for simgleMobile in map(lambda x:[(y.tag,y.text) for y in x],[mobile for mobile in root.findall(gen) if mobile.attrib["use"]=="true"])][0] if len([mobile for mobile in root.findall(gen)  if mobile.attrib["use"]=="true" ])==1 else 0
    if s:
        return s
    else:
        raise Exception,'Error :   <mobile use="true">存在多个配置,只能存在一个使用配置！'
class betaDB(object):
    def __init__(self):
        # dirname, filename = os.path.split(os.path.abspath(__file__))
        import sys
        dirname = sys.path[0]
        xmlFile = dirname+"/config/config.xml"
        host = get_mobile_params(xmlFile,gen="service")['host']
        port = get_mobile_params(xmlFile,gen="service")['port']
        user = get_mobile_params(xmlFile,gen="service")['user']
        pwd = get_mobile_params(xmlFile,gen="service")['pwd']
        database = get_mobile_params(xmlFile,gen="service")['database']
        charset = get_mobile_params(xmlFile,gen="service")['charset']
        self.db = pymysql.connect(host, user, pwd, database, port=int(port),charset=charset)
        self.cursor = self.db.cursor()

    def execute_select(self,sql):
        self.cursor.execute(sql)
        data = self.cursor.fetchall()
        return data
    def execute_close(self):
        self.db.close()
def getFeature(domain):
    db = betaDB()
    featureSql = """select Feature from behave_feature bf where bf.Domain="{domain}";""".format(domain=domain)
    featureDatas = db.execute_select(featureSql)
    featureList = []
    for feature in featureDatas:
        featureList.append(feature[0])

    # stepSql = """select
    # CONCAT(bp.Behave," ",bp.Step,"\\r\\n")
    # from behave_step bp
    # where
    # bp.Feature="%s"
    # and bp.Scenario="%s" order by bp.OrderId asc"""
    # db.execute_select(domdb = betaDB()ainFeatureScenarioSql)
    db.execute_close()
    return featureList

def getScenario(feature):
    db = betaDB()
    featureScenarioSql = """SELECT
                bs.Scenario
            FROM
                behave_scenario bs
            right join	behave_feature bf on bs.Feature=bf.Feature
            WHERE
                bf.STATUS = 1
            AND bs.STATUS = 1
            AND bf.Feature = "{feature}"
            order by bs.ScenoderId asc""".format(feature=feature.encode("utf8"))
    scenarioDatas = db.execute_select(featureScenarioSql)
    scenarioList = []
    for scenario in scenarioDatas:
        scenarioList.append(scenario[0])
    db.execute_close()
    featureDict= {"Feature":feature,"Scenarios":scenarioList}
    return featureDict
def getStep(featureDict):
    db = betaDB()
    steps = ""
    all_scenario_step = ""
    for scenario in featureDict["Scenarios"]:
        scenarioStr = "Scenario: {scenario}\r\n".format(scenario=scenario.encode("utf8"))
        featureScenarioStepSql = """
        SELECT
	        CONCAT(bp.Behave," ",Step,"\r\n")
        FROM
	        behave_step bp
        WHERE
	        bp.STATUS = 1
            AND bp.Feature = "{feature}"
            AND bp.Scenario = "{scenario}"
            ORDER BY
	        bp.OrderId ASC
        """.format(feature=featureDict["Feature"].encode("utf8"),scenario=scenario.encode("utf8"))
        getSteps = db.execute_select(featureScenarioStepSql)
        for step in getSteps:
            steps += step[0]
        all_scenario_step += scenarioStr+steps.encode("utf8")
    db.execute_close()
    return all_scenario_step

if __name__ == "__main__":
    data = getFeature("测试")
    print data
    data = getScenario(data[0])
    print data
    print getStep(data)
    # with open("text.txt","w") as f:
    #     demo = ""
    #     for m in datas:
    #         demo += m[3]
    #     f.write(demo.encode("utf8"))
    # s.execute_close()