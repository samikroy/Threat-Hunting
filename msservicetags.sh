#!/bin/bash

wget -O - -q -t 1 https://www.microsoft.com/en-us/download/details.aspx?id=56519 | grep -F -q '"success"'
exit $?
