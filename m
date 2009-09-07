From: sfking@fdwdc.com
Subject: [RFC 27/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 23:02:30 -0700
Message-ID: <62b2356a9fcc7aabd73a6ac6b65ee4608a691a31.1252222135.git.sfking@fdwdc.com>
References: <0b049a980e0bb00153e690539c9ce623e985e583.1252222135.git.sfking@fdwdc.com>
 <465903f0a328dc0355b41585754da335575049a5.1252222135.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp100.biz.mail.mud.yahoo.com ([68.142.201.176]:48497 "HELO
	smtp100.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758903AbZIGGC4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 02:02:56 -0400
In-Reply-To: <465903f0a328dc0355b41585754da335575049a5.1252222135.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/{m68knommu => m68k}/platform/5206/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5206/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5206/gpio.c      |    0 
 .../platform/5206 => m68k/platform/5206e}/Makefile |    0 
 arch/{m68knommu => m68k}/platform/5206e/config.c   |    0 
 .../platform/5206 => m68k/platform/5206e}/gpio.c   |    0 
 arch/{m68knommu => m68k}/platform/520x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/520x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/520x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/523x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/523x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/523x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5249/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5249/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5249/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5249/intc2.c     |    0 
 arch/{m68knommu => m68k}/platform/5272/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5272/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5272/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5272/intc.c      |    0 
 arch/{m68knommu => m68k}/platform/527x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/527x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/527x/gpio.c      |    0 
 .../platform/527x => m68k/platform/528x}/Makefile  |    0 
 arch/{m68knommu => m68k}/platform/528x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/528x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5307/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5307/config.c    |    0 
 arch/{m68knommu => m68k}/platform/5307/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/532x/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/532x/config.c    |    0 
 arch/{m68knommu => m68k}/platform/532x/gpio.c      |    0 
 arch/{m68knommu => m68k}/platform/5407/Makefile    |    0 
 arch/{m68knommu => m68k}/platform/5407/config.c    |    0 
 .../platform/5307 => m68k/platform/5407}/gpio.c    |    0 
 arch/{m68knommu => m68k}/platform/68328/Makefile   |    0 
 arch/{m68knommu => m68k}/platform/68328/bootlogo.h |    0 
 .../{m68knommu => m68k}/platform/68328/bootlogo.pl |    0 
 arch/{m68knommu => m68k}/platform/68328/config.c   |    0 
 arch/{m68knommu => m68k}/platform/68328/entry.S    |    0 
 arch/{m68knommu => m68k}/platform/68328/head-de2.S |    0 
 .../platform/68328/head-pilot.S                    |    0 
 arch/{m68knommu => m68k}/platform/68328/head-ram.S |    0 
 arch/{m68knommu => m68k}/platform/68328/head-rom.S |    0 
 arch/{m68knommu => m68k}/platform/68328/ints.c     |    0 
 arch/{m68knommu => m68k}/platform/68328/romvec.S   |    0 
 arch/{m68knommu => m68k}/platform/68328/timers.c   |    0 
 arch/{m68knommu => m68k}/platform/68360/Makefile   |    0 
 arch/{m68knommu => m68k}/platform/68360/commproc.c |    0 
 arch/{m68knommu => m68k}/platform/68360/config.c   |    0 
 arch/{m68knommu => m68k}/platform/68360/entry.S    |    0 
 arch/{m68knommu => m68k}/platform/68360/head-ram.S |    0 
 arch/{m68knommu => m68k}/platform/68360/head-rom.S |    0 
 arch/{m68knommu => m68k}/platform/68360/ints.c     |    0 
 arch/{m68knommu => m68k}/platform/68EZ328/Makefile |    0 
 .../platform/68EZ328/bootlogo.h                    |    0 
 arch/{m68knommu => m68k}/platform/68EZ328/config.c |    0 
 arch/{m68knommu => m68k}/platform/68VZ328/Makefile |    0 
 arch/{m68knommu => m68k}/platform/68VZ328/config.c |    0 
 arch/{m68knommu => m68k}/platform/Makefile         |    0 
 .../{m68knommu => m68k}/platform/coldfire/Makefile |    0 
 arch/{m68knommu => m68k}/platform/coldfire/clk.c   |    0 
 arch/{m68knommu => m68k}/platform/coldfire/dma.c   |    0 
 .../platform/coldfire/dma_timer.c                  |    0 
 arch/{m68knommu => m68k}/platform/coldfire/entry.S |    0 
 arch/{m68knommu => m68k}/platform/coldfire/gpio.c  |    0 
 arch/{m68knommu => m68k}/platform/coldfire/head.S  |    0 
 .../{m68knommu => m68k}/platform/coldfire/intc-2.c |    0 
 .../platform/coldfire/intc-simr.c                  |    0 
 arch/{m68knommu => m68k}/platform/coldfire/intc.c  |    0 
 .../{m68knommu => m68k}/platform/coldfire/pinmux.c |    0 
 arch/{m68knommu => m68k}/platform/coldfire/pit.c   |    0 
 .../{m68knommu => m68k}/platform/coldfire/timers.c |    0 
 .../platform/coldfire/vectors.c                    |    0 
 74 files changed, 0 insertions(+), 0 deletions(-)
 copy arch/{m68knommu => m68k}/platform/5206/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/5206/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/5206/gpio.c (100%)
 copy arch/{m68knommu/platform/5206 => m68k/platform/5206e}/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/5206e/config.c (100%)
 copy arch/{m68knommu/platform/5206 => m68k/platform/5206e}/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/520x/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/520x/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/520x/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/523x/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/523x/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/523x/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/5249/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/5249/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/5249/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/5249/intc2.c (100%)
 copy arch/{m68knommu => m68k}/platform/5272/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/5272/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/5272/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/5272/intc.c (100%)
 copy arch/{m68knommu => m68k}/platform/527x/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/527x/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/527x/gpio.c (100%)
 copy arch/{m68knommu/platform/527x => m68k/platform/528x}/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/528x/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/528x/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/5307/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/5307/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/5307/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/532x/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/532x/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/532x/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/5407/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/5407/config.c (100%)
 copy arch/{m68knommu/platform/5307 => m68k/platform/5407}/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/68328/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/68328/bootlogo.h (100%)
 copy arch/{m68knommu => m68k}/platform/68328/bootlogo.pl (100%)
 copy arch/{m68knommu => m68k}/platform/68328/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/68328/entry.S (100%)
 copy arch/{m68knommu => m68k}/platform/68328/head-de2.S (100%)
 copy arch/{m68knommu => m68k}/platform/68328/head-pilot.S (100%)
 copy arch/{m68knommu => m68k}/platform/68328/head-ram.S (100%)
 copy arch/{m68knommu => m68k}/platform/68328/head-rom.S (100%)
 copy arch/{m68knommu => m68k}/platform/68328/ints.c (100%)
 copy arch/{m68knommu => m68k}/platform/68328/romvec.S (100%)
 copy arch/{m68knommu => m68k}/platform/68328/timers.c (100%)
 copy arch/{m68knommu => m68k}/platform/68360/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/68360/commproc.c (100%)
 copy arch/{m68knommu => m68k}/platform/68360/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/68360/entry.S (100%)
 copy arch/{m68knommu => m68k}/platform/68360/head-ram.S (100%)
 copy arch/{m68knommu => m68k}/platform/68360/head-rom.S (100%)
 copy arch/{m68knommu => m68k}/platform/68360/ints.c (100%)
 copy arch/{m68knommu => m68k}/platform/68EZ328/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/68EZ328/bootlogo.h (100%)
 copy arch/{m68knommu => m68k}/platform/68EZ328/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/68VZ328/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/68VZ328/config.c (100%)
 copy arch/{m68knommu => m68k}/platform/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/Makefile (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/clk.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/dma.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/dma_timer.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/entry.S (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/gpio.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/head.S (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/intc-2.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/intc-simr.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/intc.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/pinmux.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/pit.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/timers.c (100%)
 copy arch/{m68knommu => m68k}/platform/coldfire/vectors.c (100%)

diff --git a/arch/m68knommu/platform/5206/Makefile b/arch/m68k/platform/5206/Makefile
similarity index 100%
copy from arch/m68knommu/platform/5206/Makefile
copy to arch/m68k/platform/5206/Makefile
diff --git a/arch/m68knommu/platform/5206/config.c b/arch/m68k/platform/5206/config.c
similarity index 100%
copy from arch/m68knommu/platform/5206/config.c
copy to arch/m68k/platform/5206/config.c
diff --git a/arch/m68knommu/platform/5206/gpio.c b/arch/m68k/platform/5206/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/5206/gpio.c
copy to arch/m68k/platform/5206/gpio.c
diff --git a/arch/m68knommu/platform/5206/Makefile b/arch/m68k/platform/5206e/Makefile
similarity index 100%
copy from arch/m68knommu/platform/5206/Makefile
copy to arch/m68k/platform/5206e/Makefile
diff --git a/arch/m68knommu/platform/5206e/config.c b/arch/m68k/platform/5206e/config.c
similarity index 100%
copy from arch/m68knommu/platform/5206e/config.c
copy to arch/m68k/platform/5206e/config.c
diff --git a/arch/m68knommu/platform/5206/gpio.c b/arch/m68k/platform/5206e/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/5206/gpio.c
copy to arch/m68k/platform/5206e/gpio.c
diff --git a/arch/m68knommu/platform/520x/Makefile b/arch/m68k/platform/520x/Makefile
similarity index 100%
copy from arch/m68knommu/platform/520x/Makefile
copy to arch/m68k/platform/520x/Makefile
diff --git a/arch/m68knommu/platform/520x/config.c b/arch/m68k/platform/520x/config.c
similarity index 100%
copy from arch/m68knommu/platform/520x/config.c
copy to arch/m68k/platform/520x/config.c
diff --git a/arch/m68knommu/platform/520x/gpio.c b/arch/m68k/platform/520x/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/520x/gpio.c
copy to arch/m68k/platform/520x/gpio.c
diff --git a/arch/m68knommu/platform/523x/Makefile b/arch/m68k/platform/523x/Makefile
similarity index 100%
copy from arch/m68knommu/platform/523x/Makefile
copy to arch/m68k/platform/523x/Makefile
diff --git a/arch/m68knommu/platform/523x/config.c b/arch/m68k/platform/523x/config.c
similarity index 100%
copy from arch/m68knommu/platform/523x/config.c
copy to arch/m68k/platform/523x/config.c
diff --git a/arch/m68knommu/platform/523x/gpio.c b/arch/m68k/platform/523x/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/523x/gpio.c
copy to arch/m68k/platform/523x/gpio.c
diff --git a/arch/m68knommu/platform/5249/Makefile b/arch/m68k/platform/5249/Makefile
similarity index 100%
copy from arch/m68knommu/platform/5249/Makefile
copy to arch/m68k/platform/5249/Makefile
diff --git a/arch/m68knommu/platform/5249/config.c b/arch/m68k/platform/5249/config.c
similarity index 100%
copy from arch/m68knommu/platform/5249/config.c
copy to arch/m68k/platform/5249/config.c
diff --git a/arch/m68knommu/platform/5249/gpio.c b/arch/m68k/platform/5249/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/5249/gpio.c
copy to arch/m68k/platform/5249/gpio.c
diff --git a/arch/m68knommu/platform/5249/intc2.c b/arch/m68k/platform/5249/intc2.c
similarity index 100%
copy from arch/m68knommu/platform/5249/intc2.c
copy to arch/m68k/platform/5249/intc2.c
diff --git a/arch/m68knommu/platform/5272/Makefile b/arch/m68k/platform/5272/Makefile
similarity index 100%
copy from arch/m68knommu/platform/5272/Makefile
copy to arch/m68k/platform/5272/Makefile
diff --git a/arch/m68knommu/platform/5272/config.c b/arch/m68k/platform/5272/config.c
similarity index 100%
copy from arch/m68knommu/platform/5272/config.c
copy to arch/m68k/platform/5272/config.c
diff --git a/arch/m68knommu/platform/5272/gpio.c b/arch/m68k/platform/5272/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/5272/gpio.c
copy to arch/m68k/platform/5272/gpio.c
diff --git a/arch/m68knommu/platform/5272/intc.c b/arch/m68k/platform/5272/intc.c
similarity index 100%
copy from arch/m68knommu/platform/5272/intc.c
copy to arch/m68k/platform/5272/intc.c
diff --git a/arch/m68knommu/platform/527x/Makefile b/arch/m68k/platform/527x/Makefile
similarity index 100%
copy from arch/m68knommu/platform/527x/Makefile
copy to arch/m68k/platform/527x/Makefile
diff --git a/arch/m68knommu/platform/527x/config.c b/arch/m68k/platform/527x/config.c
similarity index 100%
copy from arch/m68knommu/platform/527x/config.c
copy to arch/m68k/platform/527x/config.c
diff --git a/arch/m68knommu/platform/527x/gpio.c b/arch/m68k/platform/527x/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/527x/gpio.c
copy to arch/m68k/platform/527x/gpio.c
diff --git a/arch/m68knommu/platform/527x/Makefile b/arch/m68k/platform/528x/Makefile
similarity index 100%
copy from arch/m68knommu/platform/527x/Makefile
copy to arch/m68k/platform/528x/Makefile
diff --git a/arch/m68knommu/platform/528x/config.c b/arch/m68k/platform/528x/config.c
similarity index 100%
copy from arch/m68knommu/platform/528x/config.c
copy to arch/m68k/platform/528x/config.c
diff --git a/arch/m68knommu/platform/528x/gpio.c b/arch/m68k/platform/528x/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/528x/gpio.c
copy to arch/m68k/platform/528x/gpio.c
diff --git a/arch/m68knommu/platform/5307/Makefile b/arch/m68k/platform/5307/Makefile
similarity index 100%
copy from arch/m68knommu/platform/5307/Makefile
copy to arch/m68k/platform/5307/Makefile
diff --git a/arch/m68knommu/platform/5307/config.c b/arch/m68k/platform/5307/config.c
similarity index 100%
copy from arch/m68knommu/platform/5307/config.c
copy to arch/m68k/platform/5307/config.c
diff --git a/arch/m68knommu/platform/5307/gpio.c b/arch/m68k/platform/5307/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/5307/gpio.c
copy to arch/m68k/platform/5307/gpio.c
diff --git a/arch/m68knommu/platform/532x/Makefile b/arch/m68k/platform/532x/Makefile
similarity index 100%
copy from arch/m68knommu/platform/532x/Makefile
copy to arch/m68k/platform/532x/Makefile
diff --git a/arch/m68knommu/platform/532x/config.c b/arch/m68k/platform/532x/config.c
similarity index 100%
copy from arch/m68knommu/platform/532x/config.c
copy to arch/m68k/platform/532x/config.c
diff --git a/arch/m68knommu/platform/532x/gpio.c b/arch/m68k/platform/532x/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/532x/gpio.c
copy to arch/m68k/platform/532x/gpio.c
diff --git a/arch/m68knommu/platform/5407/Makefile b/arch/m68k/platform/5407/Makefile
similarity index 100%
copy from arch/m68knommu/platform/5407/Makefile
copy to arch/m68k/platform/5407/Makefile
diff --git a/arch/m68knommu/platform/5407/config.c b/arch/m68k/platform/5407/config.c
similarity index 100%
copy from arch/m68knommu/platform/5407/config.c
copy to arch/m68k/platform/5407/config.c
diff --git a/arch/m68knommu/platform/5307/gpio.c b/arch/m68k/platform/5407/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/5307/gpio.c
copy to arch/m68k/platform/5407/gpio.c
diff --git a/arch/m68knommu/platform/68328/Makefile b/arch/m68k/platform/68328/Makefile
similarity index 100%
copy from arch/m68knommu/platform/68328/Makefile
copy to arch/m68k/platform/68328/Makefile
diff --git a/arch/m68knommu/platform/68328/bootlogo.h b/arch/m68k/platform/68328/bootlogo.h
similarity index 100%
copy from arch/m68knommu/platform/68328/bootlogo.h
copy to arch/m68k/platform/68328/bootlogo.h
diff --git a/arch/m68knommu/platform/68328/bootlogo.pl b/arch/m68k/platform/68328/bootlogo.pl
similarity index 100%
copy from arch/m68knommu/platform/68328/bootlogo.pl
copy to arch/m68k/platform/68328/bootlogo.pl
diff --git a/arch/m68knommu/platform/68328/config.c b/arch/m68k/platform/68328/config.c
similarity index 100%
copy from arch/m68knommu/platform/68328/config.c
copy to arch/m68k/platform/68328/config.c
diff --git a/arch/m68knommu/platform/68328/entry.S b/arch/m68k/platform/68328/entry.S
similarity index 100%
copy from arch/m68knommu/platform/68328/entry.S
copy to arch/m68k/platform/68328/entry.S
diff --git a/arch/m68knommu/platform/68328/head-de2.S b/arch/m68k/platform/68328/head-de2.S
similarity index 100%
copy from arch/m68knommu/platform/68328/head-de2.S
copy to arch/m68k/platform/68328/head-de2.S
diff --git a/arch/m68knommu/platform/68328/head-pilot.S b/arch/m68k/platform/68328/head-pilot.S
similarity index 100%
copy from arch/m68knommu/platform/68328/head-pilot.S
copy to arch/m68k/platform/68328/head-pilot.S
diff --git a/arch/m68knommu/platform/68328/head-ram.S b/arch/m68k/platform/68328/head-ram.S
similarity index 100%
copy from arch/m68knommu/platform/68328/head-ram.S
copy to arch/m68k/platform/68328/head-ram.S
diff --git a/arch/m68knommu/platform/68328/head-rom.S b/arch/m68k/platform/68328/head-rom.S
similarity index 100%
copy from arch/m68knommu/platform/68328/head-rom.S
copy to arch/m68k/platform/68328/head-rom.S
diff --git a/arch/m68knommu/platform/68328/ints.c b/arch/m68k/platform/68328/ints.c
similarity index 100%
copy from arch/m68knommu/platform/68328/ints.c
copy to arch/m68k/platform/68328/ints.c
diff --git a/arch/m68knommu/platform/68328/romvec.S b/arch/m68k/platform/68328/romvec.S
similarity index 100%
copy from arch/m68knommu/platform/68328/romvec.S
copy to arch/m68k/platform/68328/romvec.S
diff --git a/arch/m68knommu/platform/68328/timers.c b/arch/m68k/platform/68328/timers.c
similarity index 100%
copy from arch/m68knommu/platform/68328/timers.c
copy to arch/m68k/platform/68328/timers.c
diff --git a/arch/m68knommu/platform/68360/Makefile b/arch/m68k/platform/68360/Makefile
similarity index 100%
copy from arch/m68knommu/platform/68360/Makefile
copy to arch/m68k/platform/68360/Makefile
diff --git a/arch/m68knommu/platform/68360/commproc.c b/arch/m68k/platform/68360/commproc.c
similarity index 100%
copy from arch/m68knommu/platform/68360/commproc.c
copy to arch/m68k/platform/68360/commproc.c
diff --git a/arch/m68knommu/platform/68360/config.c b/arch/m68k/platform/68360/config.c
similarity index 100%
copy from arch/m68knommu/platform/68360/config.c
copy to arch/m68k/platform/68360/config.c
diff --git a/arch/m68knommu/platform/68360/entry.S b/arch/m68k/platform/68360/entry.S
similarity index 100%
copy from arch/m68knommu/platform/68360/entry.S
copy to arch/m68k/platform/68360/entry.S
diff --git a/arch/m68knommu/platform/68360/head-ram.S b/arch/m68k/platform/68360/head-ram.S
similarity index 100%
copy from arch/m68knommu/platform/68360/head-ram.S
copy to arch/m68k/platform/68360/head-ram.S
diff --git a/arch/m68knommu/platform/68360/head-rom.S b/arch/m68k/platform/68360/head-rom.S
similarity index 100%
copy from arch/m68knommu/platform/68360/head-rom.S
copy to arch/m68k/platform/68360/head-rom.S
diff --git a/arch/m68knommu/platform/68360/ints.c b/arch/m68k/platform/68360/ints.c
similarity index 100%
copy from arch/m68knommu/platform/68360/ints.c
copy to arch/m68k/platform/68360/ints.c
diff --git a/arch/m68knommu/platform/68EZ328/Makefile b/arch/m68k/platform/68EZ328/Makefile
similarity index 100%
copy from arch/m68knommu/platform/68EZ328/Makefile
copy to arch/m68k/platform/68EZ328/Makefile
diff --git a/arch/m68knommu/platform/68EZ328/bootlogo.h b/arch/m68k/platform/68EZ328/bootlogo.h
similarity index 100%
copy from arch/m68knommu/platform/68EZ328/bootlogo.h
copy to arch/m68k/platform/68EZ328/bootlogo.h
diff --git a/arch/m68knommu/platform/68EZ328/config.c b/arch/m68k/platform/68EZ328/config.c
similarity index 100%
copy from arch/m68knommu/platform/68EZ328/config.c
copy to arch/m68k/platform/68EZ328/config.c
diff --git a/arch/m68knommu/platform/68VZ328/Makefile b/arch/m68k/platform/68VZ328/Makefile
similarity index 100%
copy from arch/m68knommu/platform/68VZ328/Makefile
copy to arch/m68k/platform/68VZ328/Makefile
diff --git a/arch/m68knommu/platform/68VZ328/config.c b/arch/m68k/platform/68VZ328/config.c
similarity index 100%
copy from arch/m68knommu/platform/68VZ328/config.c
copy to arch/m68k/platform/68VZ328/config.c
diff --git a/arch/m68knommu/platform/Makefile b/arch/m68k/platform/Makefile
similarity index 100%
copy from arch/m68knommu/platform/Makefile
copy to arch/m68k/platform/Makefile
diff --git a/arch/m68knommu/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
similarity index 100%
copy from arch/m68knommu/platform/coldfire/Makefile
copy to arch/m68k/platform/coldfire/Makefile
diff --git a/arch/m68knommu/platform/coldfire/clk.c b/arch/m68k/platform/coldfire/clk.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/clk.c
copy to arch/m68k/platform/coldfire/clk.c
diff --git a/arch/m68knommu/platform/coldfire/dma.c b/arch/m68k/platform/coldfire/dma.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/dma.c
copy to arch/m68k/platform/coldfire/dma.c
diff --git a/arch/m68knommu/platform/coldfire/dma_timer.c b/arch/m68k/platform/coldfire/dma_timer.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/dma_timer.c
copy to arch/m68k/platform/coldfire/dma_timer.c
diff --git a/arch/m68knommu/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
similarity index 100%
copy from arch/m68knommu/platform/coldfire/entry.S
copy to arch/m68k/platform/coldfire/entry.S
diff --git a/arch/m68knommu/platform/coldfire/gpio.c b/arch/m68k/platform/coldfire/gpio.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/gpio.c
copy to arch/m68k/platform/coldfire/gpio.c
diff --git a/arch/m68knommu/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
similarity index 100%
copy from arch/m68knommu/platform/coldfire/head.S
copy to arch/m68k/platform/coldfire/head.S
diff --git a/arch/m68knommu/platform/coldfire/intc-2.c b/arch/m68k/platform/coldfire/intc-2.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/intc-2.c
copy to arch/m68k/platform/coldfire/intc-2.c
diff --git a/arch/m68knommu/platform/coldfire/intc-simr.c b/arch/m68k/platform/coldfire/intc-simr.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/intc-simr.c
copy to arch/m68k/platform/coldfire/intc-simr.c
diff --git a/arch/m68knommu/platform/coldfire/intc.c b/arch/m68k/platform/coldfire/intc.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/intc.c
copy to arch/m68k/platform/coldfire/intc.c
diff --git a/arch/m68knommu/platform/coldfire/pinmux.c b/arch/m68k/platform/coldfire/pinmux.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/pinmux.c
copy to arch/m68k/platform/coldfire/pinmux.c
diff --git a/arch/m68knommu/platform/coldfire/pit.c b/arch/m68k/platform/coldfire/pit.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/pit.c
copy to arch/m68k/platform/coldfire/pit.c
diff --git a/arch/m68knommu/platform/coldfire/timers.c b/arch/m68k/platform/coldfire/timers.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/timers.c
copy to arch/m68k/platform/coldfire/timers.c
diff --git a/arch/m68knommu/platform/coldfire/vectors.c b/arch/m68k/platform/coldfire/vectors.c
similarity index 100%
copy from arch/m68knommu/platform/coldfire/vectors.c
copy to arch/m68k/platform/coldfire/vectors.c
-- 
1.5.6.5

