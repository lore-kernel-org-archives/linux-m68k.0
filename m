From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] USB: isp116x: isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA
Date: Fri, 29 Aug 2014 18:16:06 +0200
Message-ID: <1409328966-10079-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

If CONFIG_ATARI_ROM_ISA=3Dn:

drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_write_addr=E2=80=
=99:
drivers/usb/host/isp116x.h:382: error: implicit declaration of function=
 =E2=80=98isa_rom_writew_raw=E2=80=99
drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_write_data=
16=E2=80=99:
drivers/usb/host/isp116x.h:394: error: implicit declaration of function=
 =E2=80=98isa_rom_writew=E2=80=99
drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_read_data16=E2=
=80=99:
drivers/usb/host/isp116x.h:402: error: implicit declaration of function=
 =E2=80=98isa_rom_readw_raw=E2=80=99
drivers/usb/host/isp116x.h: In function =E2=80=98isp116x_raw_read_data1=
6=E2=80=99:
drivers/usb/host/isp116x.h:411: error: implicit declaration of function=
 =E2=80=98isa_rom_readw=E2=80=99

The isa_rom_*() calls should depend on CONFIG_ATARI_ROM_ISA instead of
on CONFIG_ATARI.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be folded into "m68k/atari: USB - add ISP1160 USB host controller
support"
---
 drivers/usb/host/isp116x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
index c436f55f2882..634258df159b 100644
--- a/drivers/usb/host/isp116x.h
+++ b/drivers/usb/host/isp116x.h
@@ -355,7 +355,7 @@ struct isp116x_ep {
 #endif
=20
=20
-#ifdef CONFIG_ATARI
+#ifdef CONFIG_ATARI_ROM_ISA
   /*
    * 16 bit data bus byte swapped in hardware on both Atari variants.
    * EtherNAT variant of ISP1160 integration is memory mapped at 0x800=
000XX,
--=20
1.9.1
