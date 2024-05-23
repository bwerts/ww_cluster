#!/bin/bash

wwctl container copy rocky8.9-base rocky8.9_prod00

wwctl container exec --bind /root:/root rocky8.9_prod00 /bin/bash /root/testscript.sh
