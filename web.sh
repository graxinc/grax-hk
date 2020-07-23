#!/bin/bash
set -ex

( cd graxinc/grax; ./grax ) &
( cd HardingPoint/grax; PORT=5000 ./grax web )
