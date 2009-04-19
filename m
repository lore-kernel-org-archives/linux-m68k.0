From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH] m68k: Atari GEMDOS FAT option fix: use correct logical sector
 size
Date: Sun, 19 Apr 2009 03:20:17 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904190308310.8939__43034.6462213949$1240107751$gmane$org@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
 <1239698381.2049.25.camel@petr>
 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
 <1239774966.20245.4.camel@petr>
 <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
 <1239862075.12777.14.camel@petr>
 <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
 <1239868903.12777.25.camel@petr>
 <alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Stehlik <pstehlik@sophics.cz>, Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Fix erroneous use of device blocksize instead of logical sector size in 
Atari GEMDOS FAT code (GEMDOS uses a 16 bit FAT and a constant 2 logical 
sectors per cluster, and modifies the logical sector size to cope with the 
limits imposed by the 16 bit FAT). The bug was probably introduced by me when 
porting this code forward from 2.4.
With this fix, I can successfully mount GEMDOS partitons up to 256 MB in size as 
prepared by Petr Stehlik. 512 MB require 8k sector size, sorry. 

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 fs/fat/inode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 34dda7a..8156229 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -1387,7 +1387,7 @@ int fat_fill_super(struct super_block *sb, void *data, int silent,
 		 * it's a real MSDOS partition with 12-bit fat.
 		 */
 		if (sbi->fat_bits != 32 && total_clusters+2 > sbi->
-			fat_length*SECTOR_SIZE*8/sbi->fat_bits)
+			fat_length*sb->s_blocksize*8/sbi->fat_bits)
 			sbi->fat_bits = 12;
 		/* if it's a floppy disk --> 12bit fat */
 		if (sbi->fat_bits != 32 && MAJOR(sb->s_dev) == FLOPPY_MAJOR)
-- 
1.5.6.5

