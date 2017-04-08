From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 05/10] nubus: Fix nubus_rewinddir (from mac68k CVS)
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <300978027f60bf0e506734477753e3a708792d65.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

From: David Huggins-Daines <dhd@debian.org>

A long forgotten fix from the linux-mac68k CVS:

Initialize dir->done pointer in nubus_rewinddir().

The original commit is here:

http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/nubus/nubus.c?r1=1.22&r2=1.22.2.1&pathrev=linux-2_2

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 3319cf1..ea9202d 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -285,6 +285,8 @@ EXPORT_SYMBOL(nubus_readdir);
 int nubus_rewinddir(struct nubus_dir* dir)
 {
 	dir->ptr = dir->base;
+	dir->done = 0;
+
 	return 0;
 }
 EXPORT_SYMBOL(nubus_rewinddir);
-- 
2.10.2
