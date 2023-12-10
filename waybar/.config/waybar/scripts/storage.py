#!/bin/python3
import json
import shutil

total, free, used = shutil.disk_usage(__file__)

dec = free / total

perc_num = dec * 100

rounded = round(perc_num,1)
print(f"{rounded}%")
