From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] m68k/bitops: Make bitmap data pointer of atomic ops volatile
Date: Mon,  6 Jun 2011 22:07:53 +0200
Message-ID: <1307390873-29687-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, Akinobu Mita <akinobu.mita@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>

This fixes a.o.

drivers/ide/ide-io.c: In function =E2=80=98ide_lock_host=E2=80=99:
drivers/ide/ide-io.c:415: warning: passing argument 2 of =E2=80=98__con=
stant_test_and_set_bit=E2=80=99 discards qualifiers from pointer target=
 type
drivers/ide/ide-io.c:415: warning: passing argument 2 of =E2=80=98__gen=
eric_test_and_set_bit=E2=80=99 discards qualifiers from pointer target =
type

Suggested-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
I'm not 100% sure whether all of these should be volatile.
We're only getting compiler warnings for calls to test_and_set_bit().

 arch/m68k/include/asm/bitops_mm.h |   22 ++++++++++++++--------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/asm/bitops_mm.h b/arch/m68k/include/asm/=
bitops_mm.h
index 89cf5b8..2d31d5f 100644
--- a/arch/m68k/include/asm/bitops_mm.h
+++ b/arch/m68k/include/asm/bitops_mm.h
@@ -27,7 +27,8 @@
=20
 #define __test_and_set_bit(nr,vaddr) test_and_set_bit(nr,vaddr)
=20
-static inline int __constant_test_and_set_bit(int nr, unsigned long *v=
addr)
+static inline int __constant_test_and_set_bit(int nr,
+					      volatile unsigned long *vaddr)
 {
 	char *p =3D (char *)vaddr + (nr ^ 31) / 8;
 	char retval;
@@ -39,7 +40,8 @@ static inline int __constant_test_and_set_bit(int nr,=
 unsigned long *vaddr)
 	return retval;
 }
=20
-static inline int __generic_test_and_set_bit(int nr, unsigned long *va=
ddr)
+static inline int __generic_test_and_set_bit(int nr,
+					     volatile unsigned long *vaddr)
 {
 	char retval;
=20
@@ -76,7 +78,8 @@ static inline void __generic_set_bit(int nr, volatile=
 unsigned long *vaddr)
=20
 #define __test_and_clear_bit(nr,vaddr) test_and_clear_bit(nr,vaddr)
=20
-static inline int __constant_test_and_clear_bit(int nr, unsigned long =
*vaddr)
+static inline int __constant_test_and_clear_bit(int nr,
+						volatile unsigned long *vaddr)
 {
 	char *p =3D (char *)vaddr + (nr ^ 31) / 8;
 	char retval;
@@ -88,7 +91,8 @@ static inline int __constant_test_and_clear_bit(int n=
r, unsigned long *vaddr)
 	return retval;
 }
=20
-static inline int __generic_test_and_clear_bit(int nr, unsigned long *=
vaddr)
+static inline int __generic_test_and_clear_bit(int nr,
+					       volatile unsigned long *vaddr)
 {
 	char retval;
=20
@@ -131,7 +135,8 @@ static inline void __generic_clear_bit(int nr, vola=
tile unsigned long *vaddr)
 #define __test_and_change_bit(nr,vaddr) test_and_change_bit(nr,vaddr)
 #define __change_bit(nr,vaddr) change_bit(nr,vaddr)
=20
-static inline int __constant_test_and_change_bit(int nr, unsigned long=
 *vaddr)
+static inline int __constant_test_and_change_bit(int nr,
+						 volatile unsigned long *vaddr)
 {
 	char *p =3D (char *)vaddr + (nr ^ 31) / 8;
 	char retval;
@@ -143,7 +148,8 @@ static inline int __constant_test_and_change_bit(in=
t nr, unsigned long *vaddr)
 	return retval;
 }
=20
-static inline int __generic_test_and_change_bit(int nr, unsigned long =
*vaddr)
+static inline int __generic_test_and_change_bit(int nr,
+						volatile unsigned long *vaddr)
 {
 	char retval;
=20
@@ -158,14 +164,14 @@ static inline int __generic_test_and_change_bit(i=
nt nr, unsigned long *vaddr)
    __constant_change_bit(nr, vaddr) : \
    __generic_change_bit(nr, vaddr))
=20
-static inline void __constant_change_bit(int nr, unsigned long *vaddr)
+static inline void __constant_change_bit(int nr, volatile unsigned lon=
g *vaddr)
 {
 	char *p =3D (char *)vaddr + (nr ^ 31) / 8;
 	__asm__ __volatile__ ("bchg %1,%0"
 			: "+m" (*p) : "di" (nr & 7));
 }
=20
-static inline void __generic_change_bit(int nr, unsigned long *vaddr)
+static inline void __generic_change_bit(int nr, volatile unsigned long=
 *vaddr)
 {
 	__asm__ __volatile__ ("bfchg %1{%0:#1}"
 			: : "d" (nr^31), "o" (*vaddr) : "memory");
--=20
1.7.0.4
