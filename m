From: Mikael Pettersson <mikpe@it.uu.se>
Subject: [PATCH][M68K] implement futex.h to support userspace robust futexes and PI mutexes
Date: Fri, 8 Mar 2013 15:03:53 +0100
Message-ID: <20793.61385.652975.797741@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp1.uu.se ([130.238.7.54]:44023 "EHLO smtp1.uu.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756973Ab3CHOMi (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 8 Mar 2013 09:12:38 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Mikael Pettersson <mikpe@it.uu.se>

Linux/M68K currently doesn't support robust futexes or PI mutexes.
The problem is that the futex code needs to perform certain ops
(cmpxchg, set, add, or, andn, xor) atomically on user-space
addresses, and M68K's lack of a futex.h causes those operations
to be unsupported and disabled.

This patch adds that support, but only for uniprocessor machines,
which is adequate for M68K.  For UP it's enough to disable preemption
to ensure mutual exclusion (futexes don't need to care about other
hardware agents), and the mandatory pagefault_disable() does just that.

This patch is closely based on the one I co-wrote for UP ARM back
in August 2008.  The main change is that this patch uses the C
get_user/put_user accessors instead of inline assembly code with
exception table fixups.

For non-MMU machines the new futex.h simply redirects to the generic
futex.h, so there is no functional change for them.

Tested on aranym with the glibc-2.17 test suite: no regressions, and
a number of mutex/condvar test cases went from failing to succeeding
(tst-mutexpi{5,5a,6,9}, tst-cond2[45], tst-robust[1-9], tst-robustpi[1-8]).
Also tested with glibc-2.18 HEAD and a local glibc patch to enable PI
mutexes: no regressions.

Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
---
 arch/m68k/include/asm/futex.h |   94 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

--- linux-3.8/arch/m68k/include/asm/futex.h.~1~	1970-01-01 01:00:00.000000000 +0100
+++ linux-3.8/arch/m68k/include/asm/futex.h	2013-02-20 22:07:23.459917612 +0100
@@ -0,0 +1,94 @@
+#ifndef _ASM_M68K_FUTEX_H
+#define _ASM_M68K_FUTEX_H
+
+#ifdef __KERNEL__
+#if !defined(CONFIG_MMU)
+#include <asm-generic/futex.h>
+#else	/* CONFIG_MMU */
+
+#include <linux/futex.h>
+#include <linux/uaccess.h>
+#include <asm/errno.h>
+
+static inline int
+futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
+			      u32 oldval, u32 newval)
+{
+	u32 val;
+
+	if (unlikely(get_user(val, uaddr) != 0))
+		return -EFAULT;
+
+	if (val == oldval && unlikely(put_user(newval, uaddr) != 0))
+		return -EFAULT;
+
+	*uval = val;
+
+	return 0;
+}
+
+static inline int
+futex_atomic_op_inuser(int encoded_op, u32 __user *uaddr)
+{
+	int op = (encoded_op >> 28) & 7;
+	int cmp = (encoded_op >> 24) & 15;
+	int oparg = (encoded_op << 8) >> 20;
+	int cmparg = (encoded_op << 20) >> 20;
+	int oldval, ret;
+	u32 tmp;
+
+	if (encoded_op & (FUTEX_OP_OPARG_SHIFT << 28))
+		oparg = 1 << oparg;
+
+	pagefault_disable();	/* implies preempt_disable() */
+
+	ret = -EFAULT;
+	if (unlikely(get_user(oldval, uaddr) != 0))
+		goto out_pagefault_enable;
+
+	ret = 0;
+	tmp = oldval;
+
+	switch (op) {
+	case FUTEX_OP_SET:
+		tmp = oparg;
+		break;
+	case FUTEX_OP_ADD:
+		tmp += oparg;
+		break;
+	case FUTEX_OP_OR:
+		tmp |= oparg;
+		break;
+	case FUTEX_OP_ANDN:
+		tmp &= ~oparg;
+		break;
+	case FUTEX_OP_XOR:
+		tmp ^= oparg;
+		break;
+	default:
+		ret = -ENOSYS;
+	}
+
+	if (ret == 0 && unlikely(put_user(tmp, uaddr) != 0))
+		ret = -EFAULT;
+
+out_pagefault_enable:
+	pagefault_enable();	/* subsumes preempt_enable() */
+
+	if (ret == 0) {
+		switch (cmp) {
+		case FUTEX_OP_CMP_EQ: ret = (oldval == cmparg); break;
+		case FUTEX_OP_CMP_NE: ret = (oldval != cmparg); break;
+		case FUTEX_OP_CMP_LT: ret = (oldval < cmparg); break;
+		case FUTEX_OP_CMP_GE: ret = (oldval >= cmparg); break;
+		case FUTEX_OP_CMP_LE: ret = (oldval <= cmparg); break;
+		case FUTEX_OP_CMP_GT: ret = (oldval > cmparg); break;
+		default: ret = -ENOSYS;
+		}
+	}
+	return ret;
+}
+
+#endif /* CONFIG_MMU */
+#endif /* __KERNEL__ */
+#endif /* _ASM_M68K_FUTEX_H */
