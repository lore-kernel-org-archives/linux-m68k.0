From: gerg@uclinux.org
Subject: [PATCH] m68knommu: fix misnamed GPIO pin definition for ColdFire 528x CPU
Date: Mon,  4 Mar 2013 15:18:43 +1000
Message-ID: <1362374323-23471-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas04p.mx.bigpond.com ([61.9.168.146]:54984 "EHLO
	nskntmtas04p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750740Ab3CDFTK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Mar 2013 00:19:10 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

Compiling for a ColdFire 528x CPU will result in:

arch/m68k/platform/coldfire/m528x.c: In function =E2=80=98m528x_uarts_i=
nit=E2=80=99:
arch/m68k/platform/coldfire/m528x.c:72: error: =E2=80=98MCF5282_GPIO_PU=
APAR=E2=80=99 undeclared (first use in this function)
arch/m68k/platform/coldfire/m528x.c:72: error: (Each undeclared identif=
ier is reported only once
arch/m68k/platform/coldfire/m528x.c:72: error: for each function it app=
ears in.)

The MCF5282_GPIO_PUAPAR definition changed names in the ColdFire defini=
tions
cleanup. It is now MCFGPIO_PUAPAR, so change it.

Not sure how this one got missed, 2 lines below it is the correct use o=
f
this definition.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/m528x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/platform/coldfire/m528x.c b/arch/m68k/platform/c=
oldfire/m528x.c
index 83b7dad..b03a9d2 100644
--- a/arch/m68k/platform/coldfire/m528x.c
+++ b/arch/m68k/platform/coldfire/m528x.c
@@ -69,7 +69,7 @@ static void __init m528x_uarts_init(void)
 	u8 port;
=20
 	/* make sure PUAPAR is set for UART0 and UART1 */
-	port =3D readb(MCF5282_GPIO_PUAPAR);
+	port =3D readb(MCFGPIO_PUAPAR);
 	port |=3D 0x03 | (0x03 << 2);
 	writeb(port, MCFGPIO_PUAPAR);
 }
--=20
1.8.1.4
