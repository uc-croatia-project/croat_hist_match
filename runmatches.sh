#!/bin/bash

rm -r output/*
mkdir output/diagnostics/

perl m2b.pl
perl b2m.pl
perl m2m.pl
perl b2d.pl
perl create_initial_dataset.pl
perl correctremar.pl
perl p2d.pl
perl m2d.pl
perl g2p.pl
perl lastevent.pl
