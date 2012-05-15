From: <gerg@snapgear.com>
Subject: [PATCH 2/3] m68k: use jbsr to call functions instead
	of bsrl
Date: Tue, 15 May 2012 16:55:48 +1000
Message-ID: <1337064949-966-3-git-send-email-gerg@snapgear.com>
References: <1337064949-966-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1337064949-966-1-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

There is a few places that the m68k entry code uses the bsrl instruction
to call other functions. That instruction is only supported on 68020 and
higher CPU types. If we use jbsr instead the code will be clean for all
68k and ColdFire CPU types.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/entry_mm.S |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/entry_mm.S b/arch/m68k/kernel/entry_mm.S
index f2ecc64..fca00b4 100644
--- a/arch/m68k/kernel/entry_mm.S
+++ b/arch/m68k/kernel/entry_mm.S
@@ -55,7 +55,7 @@ ENTRY(buserr)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
 	movel	%sp,%sp@-		| stack frame pointer argument
-	bsrl	buserr_c
+	jbsr	buserr_c
 	addql	#4,%sp
 	jra	ret_from_exception
 
@@ -63,7 +63,7 @@ ENTRY(trap)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
 	movel	%sp,%sp@-		| stack frame pointer argument
-	bsrl	trap_c
+	jbsr	trap_c
 	addql	#4,%sp
 	jra	ret_from_exception
 
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
