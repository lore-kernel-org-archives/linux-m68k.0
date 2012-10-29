From: <gerg@snapgear.com>
Subject: [PATCH] m68k: fix unused variable warning in mempcy.c
Date: Mon, 29 Oct 2012 16:20:40 +1000
Message-ID: <1351491640-19281-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:62127 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951Ab2J2GUX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Oct 2012 02:20:23 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

When compiling for original 68000 or ColdFire targets you will get the
following warning when compiling arch/m68k/lib/memcpy.c:

  CC      arch/m68k/lib/memcpy.o
arch/m68k/lib/memcpy.c: In function =E2=80=98__builtin_memcpy=E2=80=99:
arch/m68k/lib/memcpy.c:13:15: warning: unused variable =E2=80=98temp1=E2=
=80=99

This is easily fixed by moving the definition of temp1 into the code bl=
ock
where it is used.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/lib/memcpy.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/lib/memcpy.c b/arch/m68k/lib/memcpy.c
index 10ca051..c1e2dfb 100644
--- a/arch/m68k/lib/memcpy.c
+++ b/arch/m68k/lib/memcpy.c
@@ -10,7 +10,7 @@
 void *memcpy(void *to, const void *from, size_t n)
 {
 	void *xto =3D to;
-	size_t temp, temp1;
+	size_t temp;
=20
 	if (!n)
 		return xto;
@@ -47,6 +47,7 @@ void *memcpy(void *to, const void *from, size_t n)
 		for (; temp; temp--)
 			*lto++ =3D *lfrom++;
 #else
+		size_t temp1;
 		asm volatile (
 			"	movel %2,%3\n"
 			"	andw  #7,%3\n"
--=20
1.7.0.4
