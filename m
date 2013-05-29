From: gerg@uclinux.org
Subject: [PATCH] m68k: only use local gpio_request_one if not using GPIOLIB
Date: Wed, 29 May 2013 17:08:57 +1000
Message-ID: <1369811337-31628-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv01p.mx.bigpond.com ([61.9.189.231]:64830 "EHLO
	nschwqsrv01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964850Ab3E2H6l (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 29 May 2013 03:58:41 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

Compiling for targets that use the local gpio code (not GPIOLIB) fail t=
o
compile with:

  CC      arch/m68k/platform/coldfire/device.o
In file included from include/linux/gpio.h:45:0,
                 from arch/m68k/platform/coldfire/device.c:15:
/home/gerg/new-wave.git/linux-3.x/arch/m68k/include/asm/gpio.h:89:19: e=
rror: static declaration of =E2=80=98gpio_request_one=E2=80=99 follows =
non-static declaration
include/asm-generic/gpio.h:195:12: note: previous declaration of =E2=80=
=98gpio_request_one=E2=80=99 was here

=46ix by conditionally using the local gpio_request_one() function base=
d on
!CONFIG_GPIOLIB.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/gpio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.=
h
index 8cc8343..2f6eec1 100644
--- a/arch/m68k/include/asm/gpio.h
+++ b/arch/m68k/include/asm/gpio.h
@@ -86,6 +86,7 @@ static inline int gpio_cansleep(unsigned gpio)
 	return gpio < MCFGPIO_PIN_MAX ? 0 : __gpio_cansleep(gpio);
 }
=20
+#ifndef CONFIG_GPIOLIB
 static inline int gpio_request_one(unsigned gpio, unsigned long flags,=
 const char *label)
 {
 	int err;
@@ -105,5 +106,5 @@ static inline int gpio_request_one(unsigned gpio, u=
nsigned long flags, const cha
=20
 	return err;
 }
-
+#endif /* !CONFIG_GPIOLIB */
 #endif
--=20
1.8.1.4
