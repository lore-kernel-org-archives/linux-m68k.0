From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v4 06/14] nubus: Call proc_mkdir() not more than once per slot
 directory
Date: Wed, 13 Dec 2017 22:16:30 -0500 (EST)
Message-ID: <47692c970f11cd7551d0f2cc784803be59f988c5.1513220582.git.fthain@telegraphics.com.au>
References: <cover.1513220582.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513220582.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

This patch fixes the following WARNING.

proc_dir_entry 'nubus/a' already registered
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.13.0-00036-gd57552077387 #1
Stack from 01c1bd9c:
        01c1bd9c 003c2c8b 01c1bdc0 0001b0fe 00000000 00322f4a 01c43a20 01c43b0c
        01c8c420 01c1bde8 0001b1b8 003a4ac3 00000148 000faa26 00000009 00000000
        01c1bde0 003a4b6c 01c1bdfc 01c1be20 000faa26 003a4ac3 00000148 003a4b6c
        01c43a71 01c8c471 01c10000 00326430 0043d00c 00000005 01c71a00 0020bce0
        00322964 01c1be38 000fac04 01c43a20 01c8c420 01c1bee0 01c8c420 01c1be50
        000fac4c 01c1bee0 00000000 01c43a20 00000000 01c1bee8 0020bd26 01c1bee0
Call Trace: [<0001b0fe>] __warn+0xae/0xde
 [<00322f4a>] memcmp+0x0/0x5c
 [<0001b1b8>] warn_slowpath_fmt+0x2e/0x36
 [<000faa26>] proc_register+0xbe/0xd8
 [<000faa26>] proc_register+0xbe/0xd8
 [<00326430>] sprintf+0x0/0x20
 [<0020bce0>] nubus_proc_attach_device+0x0/0x1b8
 [<00322964>] strcpy+0x0/0x22
 [<000fac04>] proc_mkdir_data+0x64/0x96
 [<000fac4c>] proc_mkdir+0x16/0x1c
 [<0020bd26>] nubus_proc_attach_device+0x46/0x1b8
 [<0020bce0>] nubus_proc_attach_device+0x0/0x1b8
 [<00322964>] strcpy+0x0/0x22
 [<00001ba6>] kernel_pg_dir+0xba6/0x1000
 [<004339a2>] proc_bus_nubus_add_devices+0x1a/0x2e
 [<000faa40>] proc_create_data+0x0/0xf2
 [<0003297c>] parse_args+0x0/0x2d4
 [<00433a08>] nubus_proc_init+0x52/0x5a
 [<00433944>] nubus_init+0x0/0x44
 [<00433982>] nubus_init+0x3e/0x44
 [<000020dc>] do_one_initcall+0x38/0x196
 [<000020a4>] do_one_initcall+0x0/0x196
 [<0003297c>] parse_args+0x0/0x2d4
 [<00322964>] strcpy+0x0/0x22
 [<00040004>] __up_read+0xe/0x40
 [<004231d4>] repair_env_string+0x0/0x7a
 [<0042312e>] kernel_init_freeable+0xee/0x194
 [<00423146>] kernel_init_freeable+0x106/0x194
 [<00433944>] nubus_init+0x0/0x44
 [<000a6000>] kfree+0x0/0x156
 [<0032768c>] kernel_init+0x0/0xda
 [<00327698>] kernel_init+0xc/0xda
 [<0032768c>] kernel_init+0x0/0xda
 [<00002a90>] ret_from_kernel_thread+0xc/0x14
---[ end trace 14a6d619908ea253 ]---
------------[ cut here ]------------

This gets repeated with each additional functional reasource.

The problem here is the call to proc_mkdir() when the directory already
exists. Each nubus_board gets a directory, such as /proc/bus/nubus/s/
where s is the hex slot number. Therefore, store the 'procdir' pointer
in struct nubus_board instead of struct nubus_dev.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/proc.c  | 6 +++++-
 include/linux/nubus.h | 5 +++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index fc20dbcd3b9a..91211192f36f 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -134,9 +134,13 @@ int nubus_proc_attach_device(struct nubus_dev *dev)
 		return -1;
 	}
 		
+	if (dev->board->procdir)
+		return 0;
+
 	/* Create a directory */
 	snprintf(name, sizeof(name), "%x", dev->board->slot);
-	e = dev->procdir = proc_mkdir(name, proc_bus_nubus_dir);
+	e = proc_mkdir(name, proc_bus_nubus_dir);
+	dev->board->procdir = e;
 	if (!e)
 		return -ENOMEM;
 
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index bffd09a07326..474f304485ec 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -53,13 +53,14 @@ struct nubus_board {
 	unsigned char rev;
 	unsigned char format;
 	unsigned char lanes;
+
+	/* Directory entry in /proc/bus/nubus */
+	struct proc_dir_entry *procdir;
 };
 
 struct nubus_dev {
 	/* Next link in device list */
 	struct nubus_dev* next;
-	/* Directory entry in /proc/bus/nubus */
-	struct proc_dir_entry* procdir;
 
 	/* The functional resource ID of this device */
 	unsigned char resid;
-- 
2.13.6
