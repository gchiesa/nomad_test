#!/usr/bin/env python
# from __future__ import print_function
import json
import os
import pprint
import sys
from time import sleep
from datetime import datetime

sys.stderr.write('Environment:\n{env}\n'.format(env=pprint.pformat(dict(**os.environ))))

while True:
    print('Running process. Now is: {d}'.format(d=datetime.utcnow()))
    sys.stdout.flush()
    sleep(60)

