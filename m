From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] m68k/apollo: Rename "timer" to "apollo_timer"
Date: Fri, 20 Jul 2012 23:09:08 +0200
Message-ID: <1342818548-11588-1-git-send-email-geert__36700.3285246485$1342818566$gmane$org@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, Peter De Schrijver <p2@debian.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

In file included from include/linux/kgdb.h:17,
                 from include/linux/fb.h:8,
                 from drivers/video/dnfb.c:15:
include/linux/serial_8250.h:71: error: expected identifier or =E2=80=98=
(=E2=80=99 before numeric constant
include/linux/serial_8250.h:72: error: expected =E2=80=98;=E2=80=99 bef=
ore =E2=80=98struct=E2=80=99
make[1]: *** [drivers/video/dnfb.o] Error 1

This is caused by

    #define timer (IO_BASE + timer_physaddr)

in <asm/apollohw.h>, which conflicts with the new "timer" struct member=
 in
<linux/serial_8250.h>.

Rename "timer" to "apollo_timer", as it's a way too generic name for a
global #define.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
--
http://kisskb.ellerman.id.au/kisskb/buildresult/6739606/
---
 arch/m68k/apollo/config.c        |   16 ++++++++--------
 arch/m68k/include/asm/apollohw.h |    2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/apollo/config.c b/arch/m68k/apollo/config.c
index 0a30406..f5565d6 100644
--- a/arch/m68k/apollo/config.c
+++ b/arch/m68k/apollo/config.c
@@ -177,8 +177,8 @@ irqreturn_t dn_timer_int(int irq, void *dev_id)
=20
 	timer_handler(irq, dev_id);
=20
-	x=3D*(volatile unsigned char *)(timer+3);
-	x=3D*(volatile unsigned char *)(timer+5);
+	x =3D *(volatile unsigned char *)(apollo_timer + 3);
+	x =3D *(volatile unsigned char *)(apollo_timer + 5);
=20
 	return IRQ_HANDLED;
 }
@@ -186,17 +186,17 @@ irqreturn_t dn_timer_int(int irq, void *dev_id)
 void dn_sched_init(irq_handler_t timer_routine)
 {
 	/* program timer 1 */
-	*(volatile unsigned char *)(timer+3)=3D0x01;
-	*(volatile unsigned char *)(timer+1)=3D0x40;
-	*(volatile unsigned char *)(timer+5)=3D0x09;
-	*(volatile unsigned char *)(timer+7)=3D0xc4;
+	*(volatile unsigned char *)(apollo_timer + 3) =3D 0x01;
+	*(volatile unsigned char *)(apollo_timer + 1) =3D 0x40;
+	*(volatile unsigned char *)(apollo_timer + 5) =3D 0x09;
+	*(volatile unsigned char *)(apollo_timer + 7) =3D 0xc4;
=20
 	/* enable IRQ of PIC B */
 	*(volatile unsigned char *)(pica+1)&=3D(~8);
=20
 #if 0
-	printk("*(0x10803) %02x\n",*(volatile unsigned char *)(timer+0x3));
-	printk("*(0x10803) %02x\n",*(volatile unsigned char *)(timer+0x3));
+	printk("*(0x10803) %02x\n",*(volatile unsigned char *)(apollo_timer +=
 0x3));
+	printk("*(0x10803) %02x\n",*(volatile unsigned char *)(apollo_timer +=
 0x3));
 #endif
=20
 	if (request_irq(IRQ_APOLLO, dn_timer_int, 0, "time", timer_routine))
diff --git a/arch/m68k/include/asm/apollohw.h b/arch/m68k/include/asm/a=
pollohw.h
index bbafc91..6c19e0c 100644
--- a/arch/m68k/include/asm/apollohw.h
+++ b/arch/m68k/include/asm/apollohw.h
@@ -86,7 +86,7 @@ extern u_long timer_physaddr;
 #define cpuctrl (*(volatile unsigned int *)(IO_BASE + cpuctrl_physaddr=
))
 #define pica (IO_BASE + pica_physaddr)
 #define picb (IO_BASE + picb_physaddr)
-#define timer (IO_BASE + timer_physaddr)
+#define apollo_timer (IO_BASE + timer_physaddr)
 #define addr_xlat_map ((unsigned short *)(IO_BASE + 0x17000))
=20
 #define isaIO2mem(x) (((((x) & 0x3f8)  << 7) | (((x) & 0xfc00) >> 6) |=
 ((x) & 0x7)) + 0x40000 + IO_BASE)
--=20
1.7.0.4
