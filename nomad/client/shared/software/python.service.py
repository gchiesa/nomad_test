#!/usr/bin/env python
import os
import pprint
from time import sleep
from datetime import datetime

print('Environment:\n{env}'.format(env=pprint.pprint(os.environ)))

while True:
    print('Running process. Now is: {d}'.format(d=datetime.utcnow()))
    sleep(10)

