From: Arpit Goel <B44344@freescale.com>
Subject: [PATCH v2 0/2] Make PPC macro spin_event_timeout() architecture independent
Date: Wed, 14 Aug 2013 12:33:53 +0530
Message-ID: <1376463835-13040-1-git-send-email-B44344@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]:11642
	"EHLO va3outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752942Ab3HNHEe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 14 Aug 2013 03:04:34 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux@arm.linux.org.uk, takata@linux-m32r.org, philb@gnu.org, geert@linux-m68k.org
Cc: schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, linux390@de.ibm.com, davem@davemloft.net, rob.herring@calxeda.com, arnd@arndb.de, swarren@nvidia.com, john.stultz@linaro.org, jesper.nilsson@axis.com, gregkh@linuxfoundation.org, sam@ravnborg.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m32r@ml.linux-m32r.org, linux-m32r-ja@ml.linux-m32r.org, linux-m68k@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, mattw@codeaurora.org, timur@tabi.org, sboyd@codeaurora.org, akpm@linux-foundation.org, Arpit Goel <B44344@freescale.com>

This patch-set moves USECS_PER_JIFFY to architecture timex.h from architecture
specific C files. Patch-set further uses this to make PPC macro
spin_event_timeout() architecture independent. This change enables drivers to
use spin_event_timeout() even in non-PowerPC based SoC's.

This patchset has been compiled for ARM, PowerPC and x86.

Patch[1/2] : Moves USECS_PER_JIFFY to architecture specific timex.h files from
	     architecture specific C files.

Patch[2/2] : Converts PPC macro spin_event_timeout() in architecture independent
	     macro.

Changes in v2:
	Patch[1/2] Adds USEC_PER_JIFFY to linux/timex.h
	Patch[2/2] uses usecs_to_jiffies for conversion

Arpit Goel (2):
  Make USECS_PER_JIFFY available for generic use
  Convert PowerPC macro spin_event_timeout() to architecture independent
    macro

 arch/arm/include/asm/timex.h      |  2 ++
 arch/arm/kernel/time.c            |  3 ---
 arch/m32r/include/asm/timex.h     |  2 ++
 arch/m32r/kernel/time.c           |  3 ---
 arch/m68k/hp300/time.c            |  4 +---
 arch/m68k/include/asm/timex.h     |  2 ++
 arch/s390/include/asm/timex.h     |  2 ++
 arch/s390/kernel/time.c           |  2 --
 arch/sparc/include/asm/timex_32.h |  2 ++
 arch/sparc/include/asm/timex_64.h |  2 ++
 arch/sparc/kernel/pcic.c          |  1 -
 include/linux/delay.h             | 40 +++++++++++++++++++++++++++++++++++++++
 include/linux/timex.h             |  5 +++++
 13 files changed, 58 insertions(+), 12 deletions(-)

-- 
1.8.1.4
