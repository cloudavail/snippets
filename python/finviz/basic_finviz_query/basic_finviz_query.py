#!/usr/bin/env python3

from finviz.screener import Screener
filters=['fa_pe_profitable',]
stock_list = Screener(filters=filters, table='Valuation', order='pe') 

print(stock_list)
