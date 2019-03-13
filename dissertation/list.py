import pandas as pd
import pandas_datareader.data as web
from matplotlib import style
import matplotlib.pyplot as plt
import os
import datetime as dt
import pickle


def get_data_from_yahoo (reload_ssa=False):
    if reload_ssa:
        mylist = save_ssa_tickers()
    else:
        with open("ssa.pickle","rb") as f:
            tickers = pickle.load(f)

    if not os.path.exists('stocks_dfs'):
        os.makedirs('stock_dfs')

    start = dt.datetime(2005,2,19)
    end = dt.datetime(2010,12,31)

    for ticker in tickers:
        if not os.path.exists('stock_dfs/{}.csv'.format(ticker)):
            df = web.DataReader(ticker,'yahoo', start, end)
            df.to_csv('stock_dfs/{}.csv'.format(ticker))
        else:
            print('Already have {}'.format(ticker))

get_data_from_yahoo()
