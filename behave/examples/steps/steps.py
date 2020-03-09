#!/usr/bin/python
# -*-coding:utf-8 -*-
from behave import *
import time

@Given(u"打开{wctv}程序")
def get_app_sourxe(context,wctv):
    print wctv
@When(u"开始{www}程序")
def get_when(context,www):
    print www
@Then(u"测试{w}数据")
def get_then(context,w):
    print w
