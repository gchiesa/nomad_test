#!/usr/bin/env python
# from __future__ import print_function
import json
import os
import pprint
import sys
from time import sleep

sys.stderr.write('Environment:\n{env}\n'.format(env=pprint.pformat(dict(**os.environ))))

for i in xrange(120):
    print('Running process. Iteration: {i}'.format(i=i))
    sys.stdout.flush()
    sleep(1)

