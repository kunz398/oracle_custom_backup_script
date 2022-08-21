# oracle_custom_backup_script
rman backup for oracle

permission level for L0backup.sh
-rwxrwxrwx. 1 oracle oinstall 539 Jun 15 15:11 L0backup.sh

Crontab 
5 0 * * * /bin/bash /backup/rman/YOUR_ORALCE_SID/backup/L0backup.sh  > /backup/rman/YOUR_ORALCE_SID/backup/rman.log 2>&1 #run everyday at 12.05AM and log the output in rman.log

example of rman.log
##################################################################
[root@hofeschema backup]# cat rman.log

Recovery Manager: Release 12.2.0.1.0 - Production on Mon Aug 22 00:05:11 2022

Copyright (c) 1982, 2017, Oracle and/or its affiliates.  All rights reserved.

connected to target database: SVBO (DBID=3619631449)
using target database control file instead of recovery catalog

RMAN>
Starting backup at 22-AUG-22
current log archived
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=287 device type=DISK
allocated channel: ORA_DISK_2
channel ORA_DISK_2: SID=21 device type=DISK

RMAN>
Starting backup at 22-AUG-22
current log archived
using channel ORA_DISK_1
using channel ORA_DISK_2
skipping archived logs of thread 1 from sequence 9767 to 9769; already backed up
channel ORA_DISK_1: starting compressed archived log backup set
channel ORA_DISK_1: specifying archived log(s) in backup set
input archived log thread=1 sequence=9770 RECID=17721 STAMP=1113351582
channel ORA_DISK_1: starting piece 1 at 22-AUG-22
channel ORA_DISK_2: deleting archived log(s)
archived log file name=/orafra/SVBO1/archivelog/2022_08_21/o1_mf_1_9767_kj3sq8sq_.arc RECID=17715 STAMP=1113336234
archived log file name=/orafra/SVBO1/archivelog/2022_08_22/o1_mf_1_9768_kj47ty8j_.arc RECID=17717 STAMP=1113350688
RMAN-08120: warning: archived log not deleted, not yet applied by standby
archived log file name=/orafra/SVBO1/archivelog/2022_08_22/o1_mf_1_9769_kj47vrq0_.arc thread=1 sequence=9769
channel ORA_DISK_1: finished piece 1 at 22-AUG-22
piece handle=/nas_backup/rman/svbo/backup/6k15opcu_1_1.arch.rman tag=TAG20220822T001942 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:03
channel ORA_DISK_1: deleting archived log(s)
RMAN-08120: warning: archived log not deleted, not yet applied by standby
archived log file name=/orafra/SVBO1/archivelog/2022_08_22/o1_mf_1_9770_kj48pxkg_.arc thread=1 sequence=9770
Finished backup at 22-AUG-22

Starting Control File and SPFILE Autobackup at 22-AUG-22
piece handle=/orafra/SVBO1/autobackup/2022_08_22/o1_mf_s_1113351585_kj48q1t0_.bkp comment=NONE
Finished Control File and SPFILE Autobackup at 22-AUG-22

RMAN>
Starting backup at 22-AUG-22
using channel ORA_DISK_1
using channel ORA_DISK_2
channel ORA_DISK_1: starting compressed full datafile backup set
channel ORA_DISK_1: specifying datafile(s) in backup set
including current control file in backup set
channel ORA_DISK_1: starting piece 1 at 22-AUG-22
channel ORA_DISK_1: finished piece 1 at 22-AUG-22
piece handle=/nas_backup/rman/svbo/backup/6m15opd3_1_1.ctl.rman tag=TAG20220822T001947 comment=NONE
channel ORA_DISK_1: backup set complete, elapsed time: 00:00:01
Finished backup at 22-AUG-22

Starting Control File and SPFILE Autobackup at 22-AUG-22
piece handle=/orafra/SVBO1/autobackup/2022_08_22/o1_mf_s_1113351589_kj48q5g3_.bkp comment=NONE
Finished Control File and SPFILE Autobackup at 22-AUG-22
...
......
..............
RMAN>
RMAN retention policy will be applied to the command
RMAN retention policy is set to recovery window of 7 days
using channel ORA_DISK_1
using channel ORA_DISK_2
Deleting the following obsolete backups and copies:
Type                 Key    Completion Time    Filename/Handle
-------------------- ------ ------------------ --------------------
Backup Set           6550   14-AUG-22
  Backup Piece       6550   14-AUG-22          /backup/rman/YOUR_ORACLE_SID/backup/9l153li8_1_1.datafiles.rman
Backup Set           6551   14-AUG-22
 ...
 .......
 ........
deleted backup piece
backup piece handle=/backup/rman/YOUR_ORACLE_SID/backup/9l153li8_1_1.datafiles.rman RECID=6550 STAMP=1112659534
deleted backup piece
backup piece handle=/backup/rman/YOUR_ORACLE_SID/backup/9m153li8_1_1.datafiles.rman RECID=6551 STAMP=1112659533
deleted backup piece
....
..............
....................
Deleted 13 objects

deleted backup piece
backup piece handle=/backup/rman/YOUR_ORACLE_SID/backup/e2156an6_1_1.ctl.rman RECID=6600 STAMP=1112746727
Deleted 15 objects


RMAN>

Recovery Manager complete.

##################################################################
