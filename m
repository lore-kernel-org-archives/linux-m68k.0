From: <gerg@uclinux.org>
Subject: [PATCH] m68k: include asm/cmpxchg.h in our m68k atomic.h
Date: Fri, 30 Mar 2012 15:52:09 +1000
Message-ID: <1333086729-14263-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:14787 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752014Ab2C3GA0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 30 Mar 2012 02:00:26 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: dhowells@redhat.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

After commit 9ffc93f203c18a70623f21950f1dd473c9ec48cd ("Remove all

  CC      init/main.o
In file included from include/linux/mm.h:15:0,
                 from include/linux/ring_buffer.h:5,
                 from include/linux/ftrace_event.h:4,
                 from include/trace/syscall.h:6,
                 from include/linux/syscalls.h:78,
                 from init/main.c:16:
include/linux/debug_locks.h: In function =E2=80=98__debug_locks_off=E2=80=
=99:
include/linux/debug_locks.h:16:2: error: implicit declaration of functi=
on =E2=80=98xchg=E2=80=99

There is no indirect inclusions of the new asm/cmpxchg.h for m68k here.
Looking at most other architectures they include asm/cmpxchg.h in their
asm/atomic.h. M68k currently does not do this. Including this in atomic=
=2Eh
fixes all m68k build problems.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/atomic.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/atomic.h b/arch/m68k/include/asm/ato=
mic.h
index 336e617..f4e32de 100644
--- a/arch/m68k/include/asm/atomic.h
+++ b/arch/m68k/include/asm/atomic.h
@@ -3,6 +3,7 @@
=20
 #include <linux/types.h>
 #include <linux/irqflags.h>
+#include <asm/cmpxchg.h>
=20
 /*
  * Atomic operations that C can't guarantee us.  Useful for
--=20
1.7.0.4
