Last login: Tue Sep 26 12:15:46 on ttys000
(base) zoemeziere@ZoeMeziereMacBook ~ % 
(base) zoemeziere@ZoeMeziereMacBook ~ % 
(base) zoemeziere@ZoeMeziereMacBook ~ % 
(base) zoemeziere@ZoeMeziereMacBook ~ % ssh uqzmezie@bunya.rcc.uq.edu.au     
(uqzmezie@bunya.rcc.uq.edu.au) Password: 
(uqzmezie@bunya.rcc.uq.edu.au) Duo two-factor login for uqzmezie

Enter a passcode or select one of the following options:

 1. Duo Push to +XX XXX XXX 242

Passcode or option (1-1): 1
Success. Logging you in...

Welcome to Bunya! 

The UQ HPC Facility welcomes authorised clients and partners.
Access without authority is strictly prohibited.

For further information and support, please refer to /sw/help/Getting_Support.txt
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CURRENT STATUS

* 12 September:
  --partition=general
  Includes 60 phase-1 CPU nodes (epyc3) and 33 phase-2 CPU nodes (epyc4)
  H100, A100 and L40 GPUs are now available via gpu_cuda partition (gpu_viz L40 only)
  Please read the User Guide for more details: https://github.com/UQ-RCC/hpc-docs

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Last login: Tue Sep 26 12:16:08 2023 from 10.89.244.249
(base) [uqzmezie@bunya3 ~]$ cd /scratch/project/phd_coral_genomics/Stylophora/RAD_gbr_genome/dadi/
(base) [uqzmezie@bunya3 dadi]$ ll
total 38
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Apr  1 16:00 C1CBHE-C1ONLI
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Mar 31 14:37 C1CBHE-C5CBHE
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Apr  3 12:52 C1CBLM-C5CBLM
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Apr  3 08:30 C1OCCH-C3OCCH
drwxr-sr-x.  7 uqzmezie Q5253RW  4096 Apr 15 16:01 C1ONLI-C2TS
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Apr  3 12:01 C1ONMO-C3ONMO
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Mar 31 09:34 C2TSAU-C2TSMA
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Apr  1 16:42 C3OCCH-C3ONMO
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Apr  3 17:26 C4CBHE-C5CBHE
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Mar 31 07:31 C5CBLM-C5CBHE
-rwx------.  1 uqzmezie Q5253RW 26914 Jan 16  2023 easySFS.py
drwxr-sr-x.  6 uqzmezie Q5253RW  4096 Mar 31 07:28 old_tries
drwxr-sr-x. 14 uqzmezie Q5253RW  4096 Mar  3  2023 sympatry_allopatry_pairs
(base) [uqzmezie@bunya3 dadi]$ cd C1CBHE-C5CBHE
(base) [uqzmezie@bunya3 C1CBHE-C5CBHE]$ cd scripts/
(base) [uqzmezie@bunya3 scripts]$ ll
total 17823
-rw-r--r--. 1 uqzmezie Q5253RW    737 Apr  9 16:38 ancmigration_1f_initial_params.txt
-rw-r--r--. 1 uqzmezie Q5253RW    527 Apr  8 12:50 ancmigration_3f_initial_params.txt
drwxr-sr-x. 2 uqzmezie Q5253RW  16384 Apr 12 13:25 ancmig_runs
-rw-r--r--. 1 uqzmezie Q5253RW    518 Mar 31 14:37 asymmig_3f_initial_params.txt
drwxr-sr-x. 2 uqzmezie Q5253RW  16384 Mar 31 14:37 asymmig_runs
-rw-r--r--. 1 uqzmezie Q5253RW  45965 Apr 14 12:33 bootstrap.out
-rw-r--r--. 1 uqzmezie Q5253RW  45936 Apr 14 10:04 bootstrap_secontact.out
-rw-r--r--. 1 uqzmezie Q5253RW    362 Apr 14 10:46 bootstrap.sh
-rw-r--r--. 1 uqzmezie Q5253RW    963 Apr  9 16:34 C1CBHE-C5CBHE_ancmigration.sh
-rw-r--r--. 1 uqzmezie Q5253RW    952 Mar 31 14:45 C1CBHE-C5CBHE_asymmig.sh
-rw-r--r--. 1 uqzmezie Q5253RW    969 Sep 26 14:25 C1CBHE-C5CBHE_im2m.sh
-rw-r--r--. 1 uqzmezie Q5253RW    903 Apr 12 12:40 C1CBHE-C5CBHE_nomig.sh
-rw-r--r--. 1 uqzmezie Q5253RW    963 Apr  9 16:34 C1CBHE-C5CBHE_seccontact.sh
-rw-r--r--. 1 uqzmezie Q5253RW    924 Apr  4 14:33 C1CBHE-C5CBHE_symmig_b.sh
-rw-r--r--. 1 uqzmezie Q5253RW    923 Apr  9 16:31 C1CBHE-C5CBHE_symmig.sh
-rwx------. 1 uqzmezie Q5253RW   3986 Apr 12 13:30 compare_model.py
-rwx------. 1 uqzmezie Q5253RW   7342 Apr 15 15:34 confindence_intervals.py
-rwx------. 1 uqzmezie Q5253RW  20440 Sep 26 14:24 demo_models_kp.py
-rw-r--r--. 1 uqzmezie Q5253RW   3289 Apr 15 15:52 FIM_confindence_intervals.py
-rw-r--r--. 1 uqzmezie Q5253RW  35936 Sep  9 19:18 im2m_5722967_10.out
-rw-r--r--. 1 uqzmezie Q5253RW 240319 Sep  9 15:54 im2m_5722967_11.out
-rw-r--r--. 1 uqzmezie Q5253RW  71461 Sep  9 15:58 im2m_5722967_12.out
-rw-r--r--. 1 uqzmezie Q5253RW  97909 Sep  9 16:05 im2m_5722967_13.out
-rw-r--r--. 1 uqzmezie Q5253RW 101201 Sep  9 17:53 im2m_5722967_14.out
-rw-r--r--. 1 uqzmezie Q5253RW 281368 Sep  9 17:05 im2m_5722967_15.out
-rw-r--r--. 1 uqzmezie Q5253RW  95770 Sep  9 20:05 im2m_5722967_16.out
-rw-r--r--. 1 uqzmezie Q5253RW 356678 Sep  9 17:11 im2m_5722967_17.out
-rw-r--r--. 1 uqzmezie Q5253RW 228237 Sep  9 17:14 im2m_5722967_18.out
-rw-r--r--. 1 uqzmezie Q5253RW 103328 Sep  9 18:32 im2m_5722967_19.out
-rw-r--r--. 1 uqzmezie Q5253RW  72157 Sep  9 15:17 im2m_5722967_1.out
-rw-r--r--. 1 uqzmezie Q5253RW 319819 Sep  9 18:50 im2m_5722967_20.out
-rw-r--r--. 1 uqzmezie Q5253RW  75869 Sep  9 17:58 im2m_5722967_21.out
-rw-r--r--. 1 uqzmezie Q5253RW 145017 Sep  9 18:00 im2m_5722967_22.out
-rw-r--r--. 1 uqzmezie Q5253RW 429871 Sep  9 18:06 im2m_5722967_23.out
-rw-r--r--. 1 uqzmezie Q5253RW 383298 Sep  9 18:15 im2m_5722967_24.out
-rw-r--r--. 1 uqzmezie Q5253RW  68103 Sep  9 18:22 im2m_5722967_25.out
-rw-r--r--. 1 uqzmezie Q5253RW 100693 Sep  9 18:30 im2m_5722967_26.out
-rw-r--r--. 1 uqzmezie Q5253RW 374669 Sep  9 19:53 im2m_5722967_27.out
-rw-r--r--. 1 uqzmezie Q5253RW  51509 Sep  9 18:43 im2m_5722967_28.out
-rw-r--r--. 1 uqzmezie Q5253RW 162667 Sep  9 19:16 im2m_5722967_29.out
-rw-r--r--. 1 uqzmezie Q5253RW  91865 Sep  9 15:19 im2m_5722967_2.out
-rw-r--r--. 1 uqzmezie Q5253RW  31918 Sep  9 22:14 im2m_5722967_30.out
-rw-r--r--. 1 uqzmezie Q5253RW  96981 Sep  9 15:18 im2m_5722967_3.out
-rw-r--r--. 1 uqzmezie Q5253RW  79813 Sep  9 15:26 im2m_5722967_4.out
-rw-r--r--. 1 uqzmezie Q5253RW  52669 Sep  9 15:21 im2m_5722967_5.out
-rw-r--r--. 1 uqzmezie Q5253RW 239052 Sep  9 16:18 im2m_5722967_6.out
-rw-r--r--. 1 uqzmezie Q5253RW 415718 Sep  9 15:48 im2m_5722967_7.out
-rw-r--r--. 1 uqzmezie Q5253RW  95705 Sep  9 15:36 im2m_5722967_8.out
-rw-r--r--. 1 uqzmezie Q5253RW 247964 Sep  9 15:47 im2m_5722967_9.out
-rw-r--r--. 1 uqzmezie Q5253RW  31711 Sep 10 08:37 im2m_5726338_1.out
-rw-r--r--. 1 uqzmezie Q5253RW  35949 Sep 10 13:17 im2m_5726340_10.out
-rw-r--r--. 1 uqzmezie Q5253RW 336662 Sep 10 09:51 im2m_5726340_11.out
-rw-r--r--. 1 uqzmezie Q5253RW 256431 Sep 10 13:14 im2m_5726340_12.out
-rw-r--r--. 1 uqzmezie Q5253RW  75243 Sep 10 13:17 im2m_5726340_13.out
-rw-r--r--. 1 uqzmezie Q5253RW  91224 Sep 10 13:17 im2m_5726340_14.out
-rw-r--r--. 1 uqzmezie Q5253RW 147271 Sep 10 09:59 im2m_5726340_15.out
-rw-r--r--. 1 uqzmezie Q5253RW 373108 Sep 10 13:21 im2m_5726340_16.out
-rw-r--r--. 1 uqzmezie Q5253RW  90856 Sep 10 12:50 im2m_5726340_17.out
-rw-r--r--. 1 uqzmezie Q5253RW 214677 Sep 10 09:55 im2m_5726340_18.out
-rw-r--r--. 1 uqzmezie Q5253RW 395389 Sep 10 10:00 im2m_5726340_19.out
-rw-r--r--. 1 uqzmezie Q5253RW 114961 Sep 10 10:20 im2m_5726340_1.out
-rw-r--r--. 1 uqzmezie Q5253RW 225166 Sep 10 10:12 im2m_5726340_20.out
-rw-r--r--. 1 uqzmezie Q5253RW 155329 Sep 10 10:09 im2m_5726340_21.out
-rw-r--r--. 1 uqzmezie Q5253RW 122584 Sep 10 10:03 im2m_5726340_22.out
-rw-r--r--. 1 uqzmezie Q5253RW 142280 Sep 10 10:06 im2m_5726340_23.out
-rw-r--r--. 1 uqzmezie Q5253RW  47859 Sep 10 13:36 im2m_5726340_24.out
-rw-r--r--. 1 uqzmezie Q5253RW 125175 Sep 10 10:18 im2m_5726340_25.out
-rw-r--r--. 1 uqzmezie Q5253RW 122159 Sep 10 10:23 im2m_5726340_26.out
-rw-r--r--. 1 uqzmezie Q5253RW   3425 Sep 10 10:19 im2m_5726340_27.out
-rw-r--r--. 1 uqzmezie Q5253RW  80741 Sep 10 10:56 im2m_5726340_28.out
-rw-r--r--. 1 uqzmezie Q5253RW  27815 Sep 10 13:51 im2m_5726340_29.out
-rw-r--r--. 1 uqzmezie Q5253RW  44781 Sep 10 11:28 im2m_5726340_2.out
-rw-r--r--. 1 uqzmezie Q5253RW   3538 Sep 10 10:25 im2m_5726340_30.out
-rw-r--r--. 1 uqzmezie Q5253RW  45245 Sep 10 09:50 im2m_5726340_3.out
-rw-r--r--. 1 uqzmezie Q5253RW 287182 Sep 10 09:57 im2m_5726340_4.out
-rw-r--r--. 1 uqzmezie Q5253RW 100285 Sep 10 13:16 im2m_5726340_5.out
-rw-r--r--. 1 uqzmezie Q5253RW 383122 Sep 10 12:41 im2m_5726340_6.out
-rw-r--r--. 1 uqzmezie Q5253RW 237794 Sep 10 13:16 im2m_5726340_7.out
-rw-r--r--. 1 uqzmezie Q5253RW 188035 Sep 10 09:51 im2m_5726340_8.out
-rw-r--r--. 1 uqzmezie Q5253RW  87933 Sep 10 09:49 im2m_5726340_9.out
-rw-r--r--. 1 uqzmezie Q5253RW  19677 Sep 10 15:40 im2m_5726430_10.out
-rw-r--r--. 1 uqzmezie Q5253RW  52327 Sep 10 12:18 im2m_5726430_11.out
-rw-r--r--. 1 uqzmezie Q5253RW 108819 Sep 10 13:00 im2m_5726430_12.out
-rw-r--r--. 1 uqzmezie Q5253RW  19097 Sep 10 16:00 im2m_5726430_13.out
-rw-r--r--. 1 uqzmezie Q5253RW 162991 Sep 10 14:33 im2m_5726430_14.out
-rw-r--r--. 1 uqzmezie Q5253RW  24915 Sep 10 16:12 im2m_5726430_15.out
-rw-r--r--. 1 uqzmezie Q5253RW   3538 Sep 10 12:53 im2m_5726430_16.out
-rw-r--r--. 1 uqzmezie Q5253RW  15489 Sep 10 16:24 im2m_5726430_17.out
-rw-r--r--. 1 uqzmezie Q5253RW  25525 Sep 10 14:27 im2m_5726430_18.out
-rw-r--r--. 1 uqzmezie Q5253RW   2387 Sep 10 16:44 im2m_5726430_19.out
-rw-r--r--. 1 uqzmezie Q5253RW  34573 Sep 10 11:46 im2m_5726430_1.out
-rw-r--r--. 1 uqzmezie Q5253RW  12705 Sep 10 16:47 im2m_5726430_20.out
-rw-r--r--. 1 uqzmezie Q5253RW 101621 Sep 10 16:03 im2m_5726430_21.out
-rw-r--r--. 1 uqzmezie Q5253RW  51393 Sep 10 13:22 im2m_5726430_22.out
-rw-r--r--. 1 uqzmezie Q5253RW  38401 Sep 10 15:14 im2m_5726430_23.out
-rw-r--r--. 1 uqzmezie Q5253RW  31033 Sep 10 16:48 im2m_5726430_24.out
-rw-r--r--. 1 uqzmezie Q5253RW  72279 Sep 10 13:30 im2m_5726430_25.out
-rw-r--r--. 1 uqzmezie Q5253RW  19782 Sep 10 13:36 im2m_5726430_26.out
-rw-r--r--. 1 uqzmezie Q5253RW   3954 Sep 10 13:40 im2m_5726430_27.out
-rw-r--r--. 1 uqzmezie Q5253RW 108465 Sep 10 13:46 im2m_5726430_28.out
-rw-r--r--. 1 uqzmezie Q5253RW  62615 Sep 10 17:07 im2m_5726430_29.out
-rw-r--r--. 1 uqzmezie Q5253RW  34573 Sep 10 11:48 im2m_5726430_2.out
-rw-r--r--. 1 uqzmezie Q5253RW   3532 Sep 10 13:45 im2m_5726430_30.out
-rw-r--r--. 1 uqzmezie Q5253RW  62297 Sep 10 11:51 im2m_5726430_3.out
-rw-r--r--. 1 uqzmezie Q5253RW  47565 Sep 10 11:54 im2m_5726430_4.out
-rw-r--r--. 1 uqzmezie Q5253RW 134449 Sep 10 12:02 im2m_5726430_5.out
-rw-r--r--. 1 uqzmezie Q5253RW  63341 Sep 10 12:03 im2m_5726430_6.out
-rw-r--r--. 1 uqzmezie Q5253RW  63063 Sep 10 15:00 im2m_5726430_7.out
-rw-r--r--. 1 uqzmezie Q5253RW 126561 Sep 10 12:13 im2m_5726430_8.out
-rw-r--r--. 1 uqzmezie Q5253RW  47717 Sep 10 12:09 im2m_5726430_9.out
-rw-r--r--. 1 uqzmezie Q5253RW 106609 Sep 11 07:29 im2m_C1CBHE-C5CBHE_5734578_10.out
-rw-r--r--. 1 uqzmezie Q5253RW  64385 Sep 11 07:27 im2m_C1CBHE-C5CBHE_5734578_11.out
-rw-r--r--. 1 uqzmezie Q5253RW  98373 Sep 11 07:32 im2m_C1CBHE-C5CBHE_5734578_12.out
-rw-r--r--. 1 uqzmezie Q5253RW  52205 Sep 11 07:33 im2m_C1CBHE-C5CBHE_5734578_13.out
-rw-r--r--. 1 uqzmezie Q5253RW  74825 Sep 11 07:36 im2m_C1CBHE-C5CBHE_5734578_14.out
-rw-r--r--. 1 uqzmezie Q5253RW  54525 Sep 11 07:38 im2m_C1CBHE-C5CBHE_5734578_15.out
-rw-r--r--. 1 uqzmezie Q5253RW  59397 Sep 11 07:38 im2m_C1CBHE-C5CBHE_5734578_16.out
-rw-r--r--. 1 uqzmezie Q5253RW  64153 Sep 11 07:42 im2m_C1CBHE-C5CBHE_5734578_17.out
-rw-r--r--. 1 uqzmezie Q5253RW 125401 Sep 11 07:50 im2m_C1CBHE-C5CBHE_5734578_18.out
-rw-r--r--. 1 uqzmezie Q5253RW  93617 Sep 11 07:47 im2m_C1CBHE-C5CBHE_5734578_19.out
-rw-r--r--. 1 uqzmezie Q5253RW  66705 Sep 11 07:05 im2m_C1CBHE-C5CBHE_5734578_1.out
-rw-r--r--. 1 uqzmezie Q5253RW 160549 Sep 11 07:57 im2m_C1CBHE-C5CBHE_5734578_20.out
-rw-r--r--. 1 uqzmezie Q5253RW  64037 Sep 11 07:57 im2m_C1CBHE-C5CBHE_5734578_21.out
-rw-r--r--. 1 uqzmezie Q5253RW  71461 Sep 11 08:05 im2m_C1CBHE-C5CBHE_5734578_22.out
-rw-r--r--. 1 uqzmezie Q5253RW 106841 Sep 11 08:09 im2m_C1CBHE-C5CBHE_5734578_23.out
-rw-r--r--. 1 uqzmezie Q5253RW  74129 Sep 11 08:13 im2m_C1CBHE-C5CBHE_5734578_24.out
-rw-r--r--. 1 uqzmezie Q5253RW 104057 Sep 11 08:19 im2m_C1CBHE-C5CBHE_5734578_25.out
-rw-r--r--. 1 uqzmezie Q5253RW 128765 Sep 11 08:25 im2m_C1CBHE-C5CBHE_5734578_26.out
-rw-r--r--. 1 uqzmezie Q5253RW  78653 Sep 11 08:27 im2m_C1CBHE-C5CBHE_5734578_27.out
-rw-r--r--. 1 uqzmezie Q5253RW  95589 Sep 11 08:34 im2m_C1CBHE-C5CBHE_5734578_28.out
-rw-r--r--. 1 uqzmezie Q5253RW 102207 Sep 11 08:38 im2m_C1CBHE-C5CBHE_5734578_29.out
-rw-r--r--. 1 uqzmezie Q5253RW  37033 Sep 11 07:02 im2m_C1CBHE-C5CBHE_5734578_2.out
-rw-r--r--. 1 uqzmezie Q5253RW  96407 Sep 11 08:38 im2m_C1CBHE-C5CBHE_5734578_30.out
-rw-r--r--. 1 uqzmezie Q5253RW 164377 Sep 11 07:11 im2m_C1CBHE-C5CBHE_5734578_3.out
-rw-r--r--. 1 uqzmezie Q5253RW  79117 Sep 11 07:09 im2m_C1CBHE-C5CBHE_5734578_4.out
-rw-r--r--. 1 uqzmezie Q5253RW 119833 Sep 11 07:16 im2m_C1CBHE-C5CBHE_5734578_5.out
-rw-r--r--. 1 uqzmezie Q5253RW  83757 Sep 11 07:16 im2m_C1CBHE-C5CBHE_5734578_6.out
-rw-r--r--. 1 uqzmezie Q5253RW  95125 Sep 11 07:19 im2m_C1CBHE-C5CBHE_5734578_7.out
-rw-r--r--. 1 uqzmezie Q5253RW  74941 Sep 11 07:23 im2m_C1CBHE-C5CBHE_5734578_8.out
-rw-r--r--. 1 uqzmezie Q5253RW 114149 Sep 11 07:27 im2m_C1CBHE-C5CBHE_5734578_9.out
-rw-r--r--. 1 uqzmezie Q5253RW 127373 Sep 26 15:03 im2m_C1CBHE-C5CBHE_5851161_10.out
-rw-r--r--. 1 uqzmezie Q5253RW  74251 Sep 26 15:04 im2m_C1CBHE-C5CBHE_5851161_11.out
-rw-r--r--. 1 uqzmezie Q5253RW 120669 Sep 26 15:47 im2m_C1CBHE-C5CBHE_5851161_12.out
-rw-r--r--. 1 uqzmezie Q5253RW  73787 Sep 26 15:23 im2m_C1CBHE-C5CBHE_5851161_13.out
-rw-r--r--. 1 uqzmezie Q5253RW 160317 Sep 26 17:56 im2m_C1CBHE-C5CBHE_5851161_14.out
-rw-r--r--. 1 uqzmezie Q5253RW  42693 Sep 26 15:02 im2m_C1CBHE-C5CBHE_5851161_15.out
-rw-r--r--. 1 uqzmezie Q5253RW 123551 Sep 26 15:27 im2m_C1CBHE-C5CBHE_5851161_16.out
-rw-r--r--. 1 uqzmezie Q5253RW  87469 Sep 26 15:08 im2m_C1CBHE-C5CBHE_5851161_17.out
-rw-r--r--. 1 uqzmezie Q5253RW  80631 Sep 26 15:21 im2m_C1CBHE-C5CBHE_5851161_18.out
-rw-r--r--. 1 uqzmezie Q5253RW  57249 Sep 26 18:35 im2m_C1CBHE-C5CBHE_5851161_19.out
-rw-r--r--. 1 uqzmezie Q5253RW  84019 Sep 26 14:52 im2m_C1CBHE-C5CBHE_5851161_1.out
-rw-r--r--. 1 uqzmezie Q5253RW 117751 Sep 26 15:16 im2m_C1CBHE-C5CBHE_5851161_20.out
-rw-r--r--. 1 uqzmezie Q5253RW 130621 Sep 26 16:19 im2m_C1CBHE-C5CBHE_5851161_21.out
-rw-r--r--. 1 uqzmezie Q5253RW  58817 Sep 26 15:11 im2m_C1CBHE-C5CBHE_5851161_22.out
-rw-r--r--. 1 uqzmezie Q5253RW  91297 Sep 26 15:16 im2m_C1CBHE-C5CBHE_5851161_23.out
-rw-r--r--. 1 uqzmezie Q5253RW  89789 Sep 26 15:14 im2m_C1CBHE-C5CBHE_5851161_24.out
-rw-r--r--. 1 uqzmezie Q5253RW  71577 Sep 26 15:18 im2m_C1CBHE-C5CBHE_5851161_25.out
-rw-r--r--. 1 uqzmezie Q5253RW  85497 Sep 26 15:58 im2m_C1CBHE-C5CBHE_5851161_26.out
-rw-r--r--. 1 uqzmezie Q5253RW 153595 Sep 26 16:31 im2m_C1CBHE-C5CBHE_5851161_27.out
-rw-r--r--. 1 uqzmezie Q5253RW  48615 Sep 26 15:27 im2m_C1CBHE-C5CBHE_5851161_28.out
-rw-r--r--. 1 uqzmezie Q5253RW  92573 Sep 26 15:29 im2m_C1CBHE-C5CBHE_5851161_29.out
-rw-r--r--. 1 uqzmezie Q5253RW  61773 Sep 26 18:11 im2m_C1CBHE-C5CBHE_5851161_2.out
-rw-r--r--. 1 uqzmezie Q5253RW  94203 Sep 26 15:37 im2m_C1CBHE-C5CBHE_5851161_30.out
-rw-r--r--. 1 uqzmezie Q5253RW 136653 Sep 26 14:51 im2m_C1CBHE-C5CBHE_5851161_3.out
-rw-r--r--. 1 uqzmezie Q5253RW 121109 Sep 26 14:53 im2m_C1CBHE-C5CBHE_5851161_4.out
-rw-r--r--. 1 uqzmezie Q5253RW  96663 Sep 26 14:58 im2m_C1CBHE-C5CBHE_5851161_5.out
-rw-r--r--. 1 uqzmezie Q5253RW 166929 Sep 26 16:27 im2m_C1CBHE-C5CBHE_5851161_6.out
-rw-r--r--. 1 uqzmezie Q5253RW  61601 Sep 26 14:53 im2m_C1CBHE-C5CBHE_5851161_7.out
-rw-r--r--. 1 uqzmezie Q5253RW  53829 Sep 26 14:54 im2m_C1CBHE-C5CBHE_5851161_8.out
-rw-r--r--. 1 uqzmezie Q5253RW  96755 Sep 26 15:05 im2m_C1CBHE-C5CBHE_5851161_9.out
-rw-r--r--. 1 uqzmezie Q5253RW    871 Sep 11 06:57 im2m_params_1f.txt
-rw-r--r--. 1 uqzmezie Q5253RW    667 Sep 10 08:29 im2m_params.txt
-rw-r--r--. 1 uqzmezie Q5253RW   1922 Apr 13 09:38 LRT_sec_contact.py
-rwx------. 1 uqzmezie Q5253RW   7150 Apr 12 12:25 make_fs.py
-rw-r--r--. 1 uqzmezie Q5253RW    431 Apr  9 16:30 nomig_1f_initial_params.txt
-rw-r--r--. 1 uqzmezie Q5253RW    310 Mar 31 14:37 nomig_3f_initial_params.txt
drwxr-sr-x. 2 uqzmezie Q5253RW  32768 Apr 12 13:25 nomig_runs
-rwx------. 1 uqzmezie Q5253RW   5591 Apr 14 10:46 nonparametric_bootstrap_subsample.py
-rwx------. 1 uqzmezie Q5253RW  12297 Sep 26 14:24 optimise_manual.py
drwxr-sr-x. 2 uqzmezie Q5253RW  16384 Sep 26 14:40 __pycache__
-rw-r--r--. 1 uqzmezie Q5253RW    688 Apr  9 16:37 seccontact_1f_initial_params.txt
-rw-r--r--. 1 uqzmezie Q5253RW    527 Apr  6 18:05 seccontact_3f_initial_params.txt
drwxr-sr-x. 2 uqzmezie Q5253RW   4096 Apr  8 12:28 seccontact_runs
-rw-r--r--. 1 uqzmezie Q5253RW    526 Apr  9 16:33 symmig_1f_initial_params.txt
-rw-r--r--. 1 uqzmezie Q5253RW    479 Apr  4 13:15 symmig_3fb_initial_params.txt
-rw-r--r--. 1 uqzmezie Q5253RW    425 Mar 31 14:40 symmig_3f_initial_params.txt
drwxr-sr-x. 2 uqzmezie Q5253RW  16384 Apr 13 12:10 symmig_runs
(base) [uqzmezie@bunya3 scripts]$ nano bootstrap.sh
(base) [uqzmezie@bunya3 scripts]$ nano LRT_sec_contact.py
(base) [uqzmezie@bunya3 scripts]$ nano LRT_sec_contact.py
(base) [uqzmezie@bunya3 scripts]$ nano LRT_sec_contact.py
(base) [uqzmezie@bunya3 scripts]$ nano make_fs.py
(base) [uqzmezie@bunya3 scripts]$ nano nonparametric_bootstrap_subsample.py
(base) [uqzmezie@bunya3 scripts]$ nano confindence_intervals.py

  GNU nano 2.9.8                                                                confindence_intervals.py                                                                          

    # For comparison, we can estimate uncertainties with the Fisher Information
    # Matrix, which doesn't account for linkage in the data and thus underestimates
    # uncertainty. (Although it's a fine approach if you think your data is truly
    # unlinked.)
    # if multinom = True

    # uncert contains the estimated standard deviations of each parameter, with
    # theta as the final entry in the list.
    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex,PTS,opt,fs,multinom=True,eps=0.1)
    # print('Estimate parameter standard deviations from FIM with eps=0.1: {0}'.format(uncerts_fim))

    # eps: Fractional stepsize to use when taking finite-difference derivatives.
    #         Note that if eps*param is < 1e-6, then the step size for that parameter
    #         will simply be eps, to avoid numerical issues with small parameter
    #         perturbations.
    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex, PTS, opt, fs, multinom=True, eps=0.01)
    # print('Estimate parameter standard deviations from FIM with ep=0.01: {0}'.format(uncerts_fim))

    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex,PTS,opt,fs,multinom=True,eps=0.001)
    # print('Estimate parameter standard deviations from FIM: {0}'.format(uncerts_fim))

    # uncerts_fim = dadi.Godambe.FIM_uncert(func_ex,PTS,opt,fs,log=True,multinom=True)
    # print('Estimate Log parameter standard deviations from FIM: {0}'.format(uncerts_fim))


if __name__ == "__main__":
    # Arguments
    parser = argparse.ArgumentParser(prog="GIM uncertainity")
    parser.add_argument("snps")
    parser.add_argument("model")
    parser.add_argument("sims", type=int)
    parser.add_argument("eps", type=float)
    parser.add_argument("-o", "--opt_params", nargs="+", type=float)
    args: Namespace = parser.parse_args()

    # Setting variables
    snps = args.snps
    model = args.model
    sims = args.sims
    eps = args.eps
    opt = args.opt_params

    # Extrapolation of grid size
    PTS = [50, 60, 70]

    main(snps, model, sims, eps, opt, PTS)
