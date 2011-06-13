From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Kill warning in setup_arch() when compiling for Sun3
Date: Mon, 13 Jun 2011 20:08:32 +0200
Message-ID: <1307988512-21518-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:59155 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753970Ab1FMSIf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jun 2011 14:08:35 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

arch/m68k/kernel/setup_mm.c: In function =E2=80=98setup_arch=E2=80=99:
arch/m68k/kernel/setup_mm.c:219: warning: unused variable =E2=80=98i=E2=
=80=99

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/setup_mm.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 931c648..a10b893 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -216,7 +216,9 @@ static void __init m68k_parse_bootinfo(const struct=
 bi_record *record)
=20
 void __init setup_arch(char **cmdline_p)
 {
+#ifndef CONFIG_SUN3
 	int i;
+#endif
=20
 	/* The bootinfo is located right after the kernel bss */
 	m68k_parse_bootinfo((const struct bi_record *)_end);
--=20
1.7.0.4
