From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: [PATCH] Fix siginfo._uid bug
Date: Wed, 16 Sep 2009 20:35:15 +0400
Message-ID: <4AB113C3.1090606@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060303000108030905010409"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:44723 "EHLO
	mail.codesourcery.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754608AbZIPQfW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Sep 2009 12:35:22 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------060303000108030905010409
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The attached patch fixes bug in m68k's struct siginfo.

Geert, does it look fine to you?

Andreas, glibc-ports/sysdeps/unix/sysv/linux/m68k/bits/siginfo.h needs 
the same fix.  Would you like me to submit a patch for GLIBC ports or 
you prefer to fix it yourself?

Thanks,

--
Maxim K.
CodeSourcery

--------------060303000108030905010409
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-Fix-siginfo._uid-bug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Fix-siginfo._uid-bug.patch"

>From 52913525698a078c594d5cf6ac746761179cd141 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Wed, 16 Sep 2009 20:30:14 +0400
Subject: [PATCH] Fix siginfo._uid bug.

Fix erroneous aliasing of siginfo._kill._uid32 with siginfo._rt._sigval and
siginfo._sigchld._status

Signed-off-by: Maxim Kuvyrkov <maxim@codesourcery.com>

---
The bug is rather elegant and has been present in sources for years.
The problem is that m68k uses a custom siginfo layout due to having
a 16-bit uid field for 'backward compatibility'.  I.e., siginfo._kill
fields are:

  17                 /* kill() */
  18                 struct {
  19                         __kernel_pid_t _pid;    /* sender's pid */
  20                         __kernel_uid_t _uid;    /* backwards compatibility */
  21                         __kernel_uid32_t _uid32; /* sender's uid */
  22                 } _kill;

The same _uid32 field was also added *last* for _rt and _sigchld substructures
(see below).  What the author didn't expect is that the si_uid macro is
defined to _kill._uid32 *even when used in context of _rt or _sigchld*!
Therefore, values intended for _rt._uid32 and _sigchld._uid32 are being
written to _rt._sigval and _sigchld._status respectively.

  33                 /* POSIX.1b signals */
  34                 struct {
  35                         __kernel_pid_t _pid;    /* sender's pid */
  36                         __kernel_uid_t _uid;    /* backwards compatibility */
  37                         sigval_t _sigval;
  38                         __kernel_uid32_t _uid32; /* sender's uid */
  39                 } _rt;
  40
  41                 /* SIGCHLD */
  42                 struct {
  43                         __kernel_pid_t _pid;    /* which child */
  44                         __kernel_uid_t _uid;    /* backwards compatibility */
  45                         int _status;            /* exit code */
  46                         clock_t _utime;
  47                         clock_t _stime;
  48                         __kernel_uid32_t _uid32; /* sender's uid */
  49                 } _sigchld;
...
  71 #define si_uid          _sifields._kill._uid32

Once you know what the problem is, the fix is pretty much straightforward:
ensure that _pid, _uid and _uid32 appear as the first fields in any of
the substructures that mentions them.

This fixes posix/tst-waitid GLIBC test that failed on the wrong value of
_sigchld._status.
---
 arch/m68k/include/asm/siginfo.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/siginfo.h b/arch/m68k/include/asm/siginfo.h
index ca7dde8..207d610 100644
--- a/arch/m68k/include/asm/siginfo.h
+++ b/arch/m68k/include/asm/siginfo.h
@@ -38,18 +38,18 @@ typedef struct siginfo {
 		struct {
 			__kernel_pid_t _pid;	/* sender's pid */
 			__kernel_uid_t _uid;	/* backwards compatibility */
-			sigval_t _sigval;
 			__kernel_uid32_t _uid32; /* sender's uid */
+			sigval_t _sigval;
 		} _rt;
 
 		/* SIGCHLD */
 		struct {
 			__kernel_pid_t _pid;	/* which child */
 			__kernel_uid_t _uid;	/* backwards compatibility */
-			int _status;		/* exit code */
+			__kernel_uid32_t _uid32; /* sender's uid */
 			clock_t _utime;
 			clock_t _stime;
-			__kernel_uid32_t _uid32; /* sender's uid */
+			int _status;		/* exit code */
 		} _sigchld;
 
 		/* SIGILL, SIGFPE, SIGSEGV, SIGBUS */
-- 
1.6.4


--------------060303000108030905010409--
