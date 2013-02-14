From: Luis Alves <ljalvs@gmail.com>
Subject: [PATCH] Add CPU_NAME for 68000
Date: Thu, 14 Feb 2013 21:18:34 +0000
Message-ID: <1360876714-6675-1-git-send-email-ljalvs@gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org
List-Id: linux-m68k@vger.kernel.org

This patch adds the correct CPU name.
Without this, it just displays UNKNOWN at boot time and at '/proc/cpuinfo'.

Regards,
Luis

Signed-off-by: Luis Alves <ljalvs@gmail.com>
---
 arch/m68k/kernel/setup_no.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 71fb299..911ba47 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -57,6 +57,9 @@ void (*mach_reset)(void);
 void (*mach_halt)(void);
 void (*mach_power_off)(void);
 
+#ifdef CONFIG_M68000
+#define CPU_NAME	"MC68000"
+#endif
 #ifdef CONFIG_M68328
 #define CPU_NAME	"MC68328"
 #endif
-- 
1.7.10.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
