From: Maxim Kuvyrkov <maxim@codesourcery.com>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Fri, 02 Oct 2009 12:54:00 +0400
Message-ID: <4AC5BFA8.4040805@codesourcery.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home> <4AB3A4AC.6000703@codesourcery.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040502000506000405020504"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.codesourcery.com ([65.74.133.4]:33437 "EHLO
	mail.codesourcery.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751250AbZJBIyG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 2 Oct 2009 04:54:06 -0400
In-Reply-To: <4AB3A4AC.6000703@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------040502000506000405020504
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Maxim Kuvyrkov wrote:
> Andreas Schwab wrote:
>> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
>>
>>> The bug is rather elegant and has been present in sources for years.
>>
>> For more than 9 years, to be precise, when 32 bit uids were introduced.
...
>> Given that there is no way to keep backward compatibility it might be a
>> good opportunity to do same cleanup here.  Like going back to the
>> generic layout.
> 
> There is yet another bug in siginfo.  si_sigval is expected to be at the 
> same offsets in _timer and _rt.  At the moment si_sigval is at offset 8 
> in _timer and at offset 6 in _rt (the patch for fixing uids makes that 
> 8@_timer and 10@_rt).
> 
> This bug causes rt/tst-*timer* tests fail.
> 
> Moving on to the generic version of siginfo.h will certainly fix the 
> problem, otherwise, one needs to pad extra 2 bytes in _timer.

While the discussion is pending, here is an updated version of the patch 
that also patches up sigval.

Thanks,

--
Maxim K.
CodeSourcery

--------------040502000506000405020504
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="0001-Fix-siginfo-layout.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0001-Fix-siginfo-layout.patch"

>From dfb9e5ded82db0fd2daa201f47185aaab3ef4cf8 Mon Sep 17 00:00:00 2001
From: Maxim Kuvyrkov <maxim@codesourcery.com>
Date: Wed, 16 Sep 2009 20:30:14 +0400
Subject: [PATCH] Fix siginfo layout.

Fix erroneous aliasing of siginfo._kill._uid32 with siginfo._rt._sigval and
siginfo._sigchld._status.  Similarly, fix offset of siginfo._timer.sigval.

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

This fixes a number of GLIBC tests.
---
 arch/m68k/include/asm/siginfo.h |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/siginfo.h b/arch/m68k/include/asm/siginfo.h
index ca7dde8..6fd9b71 100644
--- a/arch/m68k/include/asm/siginfo.h
+++ b/arch/m68k/include/asm/siginfo.h
@@ -29,7 +29,8 @@ typedef struct siginfo {
 		struct {
 			timer_t _tid;		/* timer id */
 			int _overrun;		/* overrun count */
-			char _pad[sizeof( __ARCH_SI_UID_T) - sizeof(int)];
+			char _pad[sizeof( __ARCH_SI_UID_T) - sizeof(int)
+				  + sizeof(__kernel_uid_t)];
 			sigval_t _sigval;	/* same as below */
 			int _sys_private;       /* not to be passed to user */
 		} _timer;
@@ -38,18 +39,18 @@ typedef struct siginfo {
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


--------------040502000506000405020504--
