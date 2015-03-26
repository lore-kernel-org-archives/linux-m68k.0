From: gerg@uclinux.org
Subject: [PATCH] m68knommu: fix fec setup warning for ColdFire 5271 builds
Date: Thu, 26 Mar 2015 13:22:36 +1000
Message-ID: <1427340156-11839-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas04p.mx.bigpond.com ([61.9.189.146]:32666 "EHLO
	nschwmtas04p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751413AbbCZDWV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 25 Mar 2015 23:22:21 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

Building for the ColdFire 5271 produces the following warning:

arch/m68k/coldfire/m527x.c: In function =E2=80=98m527x_fec_init=E2=80=99=
:
arch/m68k/coldfire/m527x.c:95:6: warning: unused variable =E2=80=98par=E2=
=80=99

=46ix it my moving the definition of par inside the 5271 conditional co=
de.

Reported-by: ertheb <3rth3bnospam@ethe.fr>
Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/coldfire/m527x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/m527x.c b/arch/m68k/coldfire/m527x.c
index 2ba4707..c0b3e28 100644
--- a/arch/m68k/coldfire/m527x.c
+++ b/arch/m68k/coldfire/m527x.c
@@ -92,7 +92,6 @@ static void __init m527x_uarts_init(void)
=20
 static void __init m527x_fec_init(void)
 {
-	u16 par;
 	u8 v;
=20
 	/* Set multi-function pins to ethernet mode for fec0 */
@@ -100,6 +99,8 @@ static void __init m527x_fec_init(void)
 	v =3D readb(MCFGPIO_PAR_FECI2C);
 	writeb(v | 0xf0, MCFGPIO_PAR_FECI2C);
 #else
+	u16 par;
+
 	par =3D readw(MCFGPIO_PAR_FECI2C);
 	writew(par | 0xf00, MCFGPIO_PAR_FECI2C);
 	v =3D readb(MCFGPIO_PAR_FEC0HL);
--=20
1.9.1
