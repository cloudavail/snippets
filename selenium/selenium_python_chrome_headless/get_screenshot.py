#!/usr/bin/env python

from selenium import webdriver

options = webdriver.ChromeOptions()
options.binary_location = '/usr/bin/chromium-browser'
# note that --headless is required to run chromium without a
# window manager installed
options.add_argument('headless')
# note that --no-sandbox is only required if running chromium as root
# this is not recommended - but only done to allow this file to
# be run automatically
options.add_argument('no-sandbox')
options.add_argument('window-size=1200x600')

driver = webdriver.Chrome(chrome_options=options)

driver.get('https://cloudavail.com')

driver.get_screenshot_as_file('cloudavail.com.png')
