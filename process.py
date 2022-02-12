import numpy as np 
import pandas as pd 
import re 
data=pd.read_csv("info.csv",encoding="utf-8")
data['staff']=data["staff"].apply(lambda x:x.strip().split()[1])
data.to_excel("info.xlsx")
