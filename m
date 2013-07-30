From: Arpit Goel <B44344@freescale.com>
Subject: [PATCH 0/2] Make PPC macro spin_event_timeout() architecture
 independent
Date: Tue, 30 Jul 2013 18:08:18 +0530
Message-ID: <1375187900-17582-1-git-send-email-B44344@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@arm.linux.org.uk, takata@linux-m32r.org, philb@gnu.org, geert@linux-m68k.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, linux390@de.ibm.com, davem@davemloft.net, rob.herring@calxeda.com, arnd@arndb.de, sboyd@codeaurora.org, swarren@nvidia.com, john.stultz@linaro.org, jesper.nilsson@axis.com, gregkh@linuxfoundation.org, sam@ravnborg.org
Cc: linux-m32r-ja@ml.linux-m32r.org, linux-s390@vger.kernel.org, linux-m68k@vger.kernel.org, linux-m32r@ml.linux-m32r.org, Arpit Goel <B44344@freescale.com>, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-m68k@vger.kernel.org

This patch-set moves USECS_PER_JIFFY to architecture timex.h from architecture
specific C files. Patch-set further uses this to make PPC macro
spin_event_timeout() architecture independent. This change enables drivers to
use spin_event_timeout() even in non-PowerPC based SoC's.

This patchset has been compiled for ARM, PowerPC and x86.

Patch[1/2] : Moves USECS_PER_JIFFY to architecture specific timex.h files from
	     architecture specific C files.

Patch[2/2] : Converts PPC macro spin_event_timeout() in architecture independent
	     macro.

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
 12 files changed, 53 insertions(+), 12 deletions(-)

-- 
1.8.1.4
