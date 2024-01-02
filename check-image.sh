#!/bin/sh
therion --version        | grep "therion 6."  && echo "Test 1 Pass" && \
therion --print-encoding | grep "UTF-8"       && echo "Test 2 Pass" && \
therion /samples/areas/thconfig && echo "Test areas Pass" && \
therion /samples/basics/thconfig  && echo "Test basics Pass" && \
therion /samples/cave-list/thconfig && echo "Test cave-list Pass" && \

therion /samples/map-offset/thconfig.1 && echo "Test map-offset 1 Pass" && \
therion /samples/map-offset/thconfig.2 && echo "Test map-offset 2 Pass" && \
therion /samples/map-offset/thconfig.3 && echo "Test map-offset 3 Pass" && \
therion /samples/map-offset/thconfig.4 && echo "Test map-offset 4 Pass" && \
therion /samples/map-offset/thconfig.5 && echo "Test map-offset 5 Pass" && \

therion /samples/morphing/sample1/thconfig.1 && echo "Test morphing 1 Pass" && \
therion /samples/morphing/sample1/thconfig.2 && echo "Test morphing 2 Pass" && \

therion /samples/morphing/sample2/thconfig.1 && echo "Test morphing 1 Pass" && \
therion /samples/morphing/sample2/thconfig.2 && echo "Test morphing 2 Pass" && \
therion /samples/morphing/sample2/thconfig.3 && echo "Test morphing 3 Pass" && \


therion /samples/q-marks/thconfig.1 && echo "Test q-marks Pass" && \
therion /samples/q-marks/thconfig.2 && echo "Test q-marks Pass" && \

therion /samples/survex/thconfig.1 && echo "Test survex Pass" && \
therion /samples/survex/thconfig.2 && echo "Test survex Pass" && \


therion /samples/tests/inputrel/thconfig && echo "Test inputrel Pass" && \
therion /samples/tests/pocket-topo/thconfig && echo "Test pocket-color Pass" && \
therion /samples/tests/proj/thconfig.01 && echo "Test proj Pass" && \
therion /samples/tests/sym-colors/thconfig && echo "Test sym-colors Pass" && \

therion /samples/u-symbols/thconfig.1 && echo "Test u-symbols 1 Pass" && \
therion /samples/u-symbols/thconfig.2 && echo "Test u-symbols 2 Pass" && \

therion /samples/xelevation/thconfig.1 && echo "Test xelevation 1 Pass" && \
therion /samples/xelevation/thconfig.2 && echo "Test xelevation 2 Pass" && \
therion /samples/xelevation/thconfig.3 && echo "Test xelevation 3 Pass" && \
therion /samples/xelevation/thconfig.4 && echo "Test xelevation 4 Pass" && \
therion /samples/xelevation/thconfig.5 && echo "Test xelevation 5 Pass" && \
therion /samples/xelevation/thconfig.6 && echo "Test xelevation 6 Pass" && \
therion /samples/xelevation/thconfig.7 && echo "Test xelevation 7 Pass" && \
echo "All tests passed" || echo "Some test failed"
