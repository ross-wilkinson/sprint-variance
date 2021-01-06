#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Dec 18 02:20:06 2020

@author: rosswilkinson
"""
#This file shows the square of the numbers from 0 to 5.

def squared(x) :
    return x**2

for ii in range(6) :
    print(ii, squared(ii))
    
    print('Done')