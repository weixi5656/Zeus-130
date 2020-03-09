#!/usr/bin/python
#-*-coding:utf-8 -*-
from behave.__main__ import main as man
import sys
if sys.getdefaultencoding() !="utf-8":
    reload(sys)
    sys.setdefaultencoding("utf-8")
# man()
man(project=["测试"])