From: <gerg@snapgear.com>
Subject: [PATCH] m68k: make syscall_trace_enter/leave exist
	for non-MMU classic m68k types
Date: Fri, 8 Jun 2012 15:28:34 +1000
Message-ID: <1339133314-13265-1-git-send-email-gerg@snapgear.com>
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
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

The assembler entry code calls directly to the syscall_trace_enter() and
syscall_trace_leave() functions. But currently they are conditionaly
compiled out for the non-MMU classic m68k CPU types (so 68328 for example),
resulting in a link error:

      LD      vmlinux
    arch/m68k/platform/68328/built-in.o: In function `do_trace':
    (.text+0x1c): undefined reference to `syscall_trace_enter'
    arch/m68k/platform/68328/built-in.o: In function `do_trace':
    (.text+0x4c): undefined reference to `syscall_trace_leave'

Change the conditional check that includes these functions to be true for
the !defined(CONFIG_MMU) case as well.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/ptrace.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 8b4a222..1bc10e6 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -286,7 +286,7 @@ asmlinkage void syscall_trace(void)
 	}
 }
 
-#ifdef CONFIG_COLDFIRE
+#if defined(CONFIG_COLDFIRE) || !defined(CONFIG_MMU)
 asmlinkage int syscall_trace_enter(void)
 {
 	int ret = 0;
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
