import pandas as pd
import pandas_datareader.data as web
from matplotlib import style
import os
import matplotlib.pyplot as plt
import datetime as dt
import pickle

def ssa_tickers():
    file_location = "/Users/alan/Desktop/AED/pt23/AB_update.xlsx"
    sheet = pd.read_excel(file_location)

    mylist = sheet['a'].tolist()

    with open("ssa.pickle","wb") as f:
        pickle.dump(mylist, f)

    print(mylist)

    return(mylist)

ssa_tickers()
