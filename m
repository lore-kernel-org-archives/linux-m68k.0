From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [PATCH] fix --build-id breakage for sun3
Date: Mon, 5 Jan 2009 17:28:10 +0000
Message-ID: <20090105172810.GQ28946@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org

Counterpart of commit 08a3db94f2a36c28278922732bc281c1722ceb18 for
sun3 build.

Signet-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/m68k/kernel/vmlinux-sun3.lds |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/vmlinux-sun3.lds b/arch/m68k/kernel/vmlinux-sun3.lds
index 8a4919e..d9368c0 100644
--- a/arch/m68k/kernel/vmlinux-sun3.lds
+++ b/arch/m68k/kernel/vmlinux-sun3.lds
@@ -33,6 +33,7 @@ SECTIONS
 	} :data
   /* End of data goes *here* so that freeing init code works properly. */
   _edata = .;
+  NOTES
 
   /* will be freed after init */
   . = ALIGN(PAGE_SIZE);	/* Init code and data */
-- 
1.5.6.5


