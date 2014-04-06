From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Boot crash fix for 68030
Date: Sun, 6 Apr 2014 11:34:46 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1404061132530.6867__45561.950808815$1396776902$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: stable@vger.kernel.org
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Finn Thain <fthain@telegraphics.com.au>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Please queue the two commits below for stable:
  - The second commit fixes a boot crash on 68030,
  - The first commit is a prerequisite for the second.

This fix is needed on all versions that contain commit
e4f2dfbb5e92be4e46c0625f4f8eb101110f756f ("m68k: implement futex.h to s=
upport
userspace robust futexes and PI mutexes"), i.e. v3.10 until v3.14.

The first commit only applies cleanly to v3.14.
I appended a backported version for v3.10..v3.13 at the bottom of this =
email.

Thanks for applying!

commit 03b8c7b623c80af264c4c8d6111e5c6289933666
Author: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: =A0 Sun Mar 2 13:09:47 2014 +0100

=A0 =A0 futex: Allow architectures to skip futex_atomic_cmpxchg_inatomi=
c() test
=A0 =A0
=A0 =A0 If an architecture has futex_atomic_cmpxchg_inatomic() implemen=
ted and there
=A0 =A0 is no runtime check necessary, allow to skip the test within fu=
tex_init().
=A0 =A0
=A0 =A0 This allows to get rid of some code which would always give the=
 same result,
=A0 =A0 and also allows the compiler to optimize a couple of if stateme=
nts away.
=A0 =A0
=A0 =A0 Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
=A0 =A0 Cc: Finn Thain <fthain@telegraphics.com.au>
=A0 =A0 Cc: Geert Uytterhoeven <geert@linux-m68k.org>
=A0 =A0 Link: http://lkml.kernel.org/r/20140302120947.GA3641@osiris
=A0 =A0 Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

commit e571c58f313d35c56e0018470e3375ddd1fd320e
Author: Finn Thain <fthain@telegraphics.com.au>
Date: =A0 Thu Mar 6 10:29:27 2014 +1100

=A0 =A0 m68k: Skip futex_atomic_cmpxchg_inatomic() test
=A0 =A0
=A0 =A0 Skip the futex_atomic_cmpxchg_inatomic() test in futex_init(). =
It causes a
=A0 =A0 fatal exception on 68030 (and presumably 68020 also).
=A0 =A0
=A0 =A0 Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
=A0 =A0 Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
=A0 =A0 Link: http://lkml.kernel.org/r/alpine.LNX.2.00.1403061006440.55=
25@nippy.intranet
=A0 =A0 Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
=46rom 4ff4cbd563da5ff27b61abb31cb6efaf9498cf07 Mon Sep 17 00:00:00 200=
1
=46rom: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Sun, 2 Mar 2014 13:09:47 +0100
Subject: [PATCH] futex: Allow architectures to skip
 futex_atomic_cmpxchg_inatomic() test

If an architecture has futex_atomic_cmpxchg_inatomic() implemented and =
there
is no runtime check necessary, allow to skip the test within futex_init=
().

This allows to get rid of some code which would always give the same re=
sult,
and also allows the compiler to optimize a couple of if statements away=
=2E

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Link: http://lkml.kernel.org/r/20140302120947.GA3641@osiris
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[geert: Backported to v3.10..v3.13]
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/s390/Kconfig     |    1 +
 include/linux/futex.h |    4 ++++
 init/Kconfig          |    7 +++++++
 kernel/futex.c        |   14 ++++++++++++--
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index e9f312532526..c8d8283cb20e 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -117,6 +117,7 @@ config S390
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_TRACE_MCOUNT_TEST
+	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZ4
diff --git a/include/linux/futex.h b/include/linux/futex.h
index b0d95cac826e..6435f46d6e13 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -55,7 +55,11 @@ union futex_key {
 #ifdef CONFIG_FUTEX
 extern void exit_robust_list(struct task_struct *curr);
 extern void exit_pi_state_list(struct task_struct *curr);
+#ifdef CONFIG_HAVE_FUTEX_CMPXCHG
+#define futex_cmpxchg_enabled 1
+#else
 extern int futex_cmpxchg_enabled;
+#endif
 #else
 static inline void exit_robust_list(struct task_struct *curr)
 {
diff --git a/init/Kconfig b/init/Kconfig
index 4e5d96ab2034..66e6759e4436 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1399,6 +1399,13 @@ config FUTEX
 	  support for "fast userspace mutexes".  The resulting kernel may not
 	  run glibc-based applications correctly.
=20
+config HAVE_FUTEX_CMPXCHG
+	bool
+	help
+	  Architectures should select this if futex_atomic_cmpxchg_inatomic()
+	  is implemented and always working. This removes a couple of runtime
+	  checks.
+
 config EPOLL
 	bool "Enable eventpoll support" if EXPERT
 	default y
diff --git a/kernel/futex.c b/kernel/futex.c
index f6ff0191ecf7..0d74e3aecb0b 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -68,7 +68,9 @@
=20
 #include "locking/rtmutex_common.h"
=20
+#ifndef CONFIG_HAVE_FUTEX_CMPXCHG
 int __read_mostly futex_cmpxchg_enabled;
+#endif
=20
 #define FUTEX_HASHBITS (CONFIG_BASE_SMALL ? 4 : 8)
=20
@@ -2731,10 +2733,10 @@ SYSCALL_DEFINE6(futex, u32 __user *, uaddr, int=
, op, u32, val,
 	return do_futex(uaddr, op, val, tp, uaddr2, val2, val3);
 }
=20
-static int __init futex_init(void)
+static void __init futex_detect_cmpxchg(void)
 {
+#ifndef CONFIG_HAVE_FUTEX_CMPXCHG
 	u32 curval;
-	int i;
=20
 	/*
 	 * This will fail and we want it. Some arch implementations do
@@ -2748,6 +2750,14 @@ static int __init futex_init(void)
 	 */
 	if (cmpxchg_futex_value_locked(&curval, NULL, 0, 0) =3D=3D -EFAULT)
 		futex_cmpxchg_enabled =3D 1;
+#endif
+}
+
+static int __init futex_init(void)
+{
+	int i;
+
+	futex_detect_cmpxchg();
=20
 	for (i =3D 0; i < ARRAY_SIZE(futex_queues); i++) {
 		plist_head_init(&futex_queues[i].chain);
--=20
1.7.9.5

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
