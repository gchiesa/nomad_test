#!/usr/bin/env python
import os
import pprint
from time import sleep

print('Environment:\n{env}'.format(env=pprint.pprint(os.environ)))

for i in xrange(120):
    print('Running process. Iteration: {i}'.format(i=i))
    sleep(10)

