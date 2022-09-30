#!/bin/bash

awk -F ,  '{if (NR>1) {print "github," $1}}' voter-roll.csv > helios-voter-roll.csv
echo "Voters file for Helios generated as 'helios-voter-roll.csv'"