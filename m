From: gerg@uclinux.org
Subject: [PATCH] m68k: fix conditional use of init_pointer_table
Date: Mon,  7 Jan 2013 21:44:47 +1000
Message-ID: <1357559087-2536-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outbound-mail01.westnet.com.au ([203.10.1.242]:65180 "EHLO
	outbound-mail01.westnet.com.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754270Ab3AGLoz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Jan 2013 06:44:55 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

Compiling 3.8-rc1 fails for some m68k targets (the non-mmu ones) with:

  CC      arch/m68k/mm/init.o
arch/m68k/mm/init.c: In function =E2=80=98mem_init=E2=80=99:
arch/m68k/mm/init.c:191:2: error: implicit declaration of function =E2=80=
=98init_pointer_table=E2=80=99
arch/m68k/mm/init.c:191:36: error: =E2=80=98kernel_pg_dir=E2=80=99 unde=
clared (first use in this function)
arch/m68k/mm/init.c:191:36: note: each undeclared identifier is reporte=
d only once for each function it appears in
arch/m68k/mm/init.c:192:18: error: =E2=80=98PTRS_PER_PGD=E2=80=99 undec=
lared (first use in this function)
arch/m68k/mm/init.c:194:4: error: implicit declaration of function =E2=80=
=98__pgd_page=E2=80=99
arch/m68k/mm/init.c:198:6: error: =E2=80=98zero_pgtable=E2=80=99 undecl=
ared (first use in this function)
make[2]: *** [arch/m68k/mm/init.o] Error 1
make[1]: *** [arch/m68k/mm] Error 2
make[1]: Leaving directory `/home/gerg/new-wave.git/linux-3.x'
make: *** [linux] Error 1

Change the conditions that define init_pointer_table so that it matches=
 what
actually uses it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/init.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index f0e05bc..afd8106 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -39,6 +39,11 @@
 void *empty_zero_page;
 EXPORT_SYMBOL(empty_zero_page);
=20
+#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
+extern void init_pointer_table(unsigned long ptable);
+extern pmd_t *zero_pgtable;
+#endif
+
 #ifdef CONFIG_MMU
=20
 pg_data_t pg_data_map[MAX_NUMNODES];
@@ -69,9 +74,6 @@ void __init m68k_setup_node(int node)
 	node_set_online(node);
 }
=20
-extern void init_pointer_table(unsigned long ptable);
-extern pmd_t *zero_pgtable;
-
 #else /* CONFIG_MMU */
=20
 /*
--=20
1.7.0.4
