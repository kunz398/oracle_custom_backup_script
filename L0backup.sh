#!/bin/bash
#
export ORACLE_SID=YOUR_ORACLE_SID
export ORACLE_HOME=/oracle/12.2.0.1 #YOUR ORACLE HOME PATH
$ORACLE_HOME/bin/rman target / nocatalog  <<EOF
backup format '/backup/rman/YOUR_ORACLE_SID/backup/%U.arch.rman' filesperset 2 archivelog all delete input;
backup format '/backup/rman/YOUR_ORACLE_SID/backup/%U.datafiles.rman' filesperset 2 incremental level 0 database;
backup format '/backup/rman/YOUR_ORACLE_SID/backup/%U.arch.rman' filesperset 2 archivelog all delete input;
backup format '/backup/rman/YOUR_ORACLE_SID/backup/%U.ctl.rman' current controlfile;
delete noprompt obsolete;
EOF
