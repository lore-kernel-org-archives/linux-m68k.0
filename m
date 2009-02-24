From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Fwd: [PATCH] ide: remove CONFIG_BLK_DEV_IDEDOUBLER config option
Date: Tue, 24 Feb 2009 08:58:41 +0100
Message-ID: <10f740e80902232358p6a548f18if0ccb613852f5f6c@mail.gmail.com>
References: <200902232350.39412.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <200902232350.39412.bzolnier@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>

---------- Forwarded message ----------
=46rom: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Mon, Feb 23, 2009 at 23:50
Subject: [PATCH] ide: remove CONFIG_BLK_DEV_IDEDOUBLER config option
To: linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.=
org>


=46rom: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: [PATCH] ide: remove CONFIG_BLK_DEV_IDEDOUBLER config option

Nowadays it is not worth having a separate config option for
Amiga IDE Doubler support so always include it (it still needs
to be explicitly enabled by module parameter).

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
---
=C2=A0drivers/ide/Kconfig | =C2=A0 23 ++++++++---------------
=C2=A0drivers/ide/gayle.c | =C2=A0 12 +-----------
=C2=A02 files changed, 9 insertions(+), 26 deletions(-)

Index: b/drivers/ide/Kconfig
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/drivers/ide/Kconfig
+++ b/drivers/ide/Kconfig
@@ -765,27 +765,20 @@ config BLK_DEV_GAYLE
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This includes on-board IDE interfaces=
 on some Amiga models (A600,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A1200, A4000, and A4000T), and IDE in=
terfaces on the Zorro expansion
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus (M-Tech E-Matrix 530 expansion ca=
rd).
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Say Y if you have an Amiga with a Gayle I=
DE interface and want to use
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 IDE devices (hard disks, CD-ROM drives, e=
tc.) that are connected to
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 it.
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that you also have to enable Zorro b=
us support if you want to
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 use Gayle IDE interfaces on the Zorro exp=
ansion bus.

-config BLK_DEV_IDEDOUBLER
- =C2=A0 =C2=A0 =C2=A0 bool "Amiga IDE Doubler support (EXPERIMENTAL)"
- =C2=A0 =C2=A0 =C2=A0 depends on BLK_DEV_GAYLE && EXPERIMENTAL
- =C2=A0 =C2=A0 =C2=A0 ---help---
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 This feature provides support for the so-=
called `IDE doublers' (made
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 It also provides support for the so-calle=
d `IDE doublers' (made
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by various manufacturers, e.g. Eyetec=
h) that can be connected to
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the on-board IDE interface of some Am=
iga models. Using such an IDE
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doubler, you can connect up to four i=
nstead of two IDE devices to
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 the Amiga's on-board IDE interface.
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 the Amiga's on-board IDE interface. The f=
eature is enabled at kernel
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 runtime using the "gayle.doubler" kernel =
boot parameter.

- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that the normal Amiga Gayle IDE driv=
er may not work correctly
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if you have an IDE doubler and don't enab=
le this feature!
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 Say Y if you have an Amiga with a Gayle I=
DE interface and want to use
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 IDE devices (hard disks, CD-ROM drives, e=
tc.) that are connected to
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 it.

- =C2=A0 =C2=A0 =C2=A0 =C2=A0 Say Y if you have an IDE doubler. =C2=A0T=
he feature is enabled at kernel
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 runtime using the "gayle.doubler" kernel =
boot parameter.
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 Note that you also have to enable Zorro b=
us support if you want to
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 use Gayle IDE interfaces on the Zorro exp=
ansion bus.

=C2=A0config BLK_DEV_BUDDHA
=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Buddha/Catweasel/X-Surf IDE interf=
ace support (EXPERIMENTAL)"
Index: b/drivers/ide/gayle.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/drivers/ide/gayle.c
+++ b/drivers/ide/gayle.c
@@ -53,11 +53,6 @@

=C2=A0#define GAYLE_NEXT_PORT =C2=A0 =C2=A0 =C2=A0 =C2=A00x1000

-#ifndef CONFIG_BLK_DEV_IDEDOUBLER
-#define GAYLE_NUM_HWIFS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A01
-#define GAYLE_NUM_PROBE_HWIFS =C2=A0GAYLE_NUM_HWIFS
-#define GAYLE_HAS_CONTROL_REG =C2=A01
-#else /* CONFIG_BLK_DEV_IDEDOUBLER */
=C2=A0#define GAYLE_NUM_HWIFS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A02
=C2=A0#define GAYLE_NUM_PROBE_HWIFS =C2=A0(ide_doubler ? GAYLE_NUM_HWIF=
S : \
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 GAYLE_NUM_HWIFS-1)
@@ -66,8 +61,6 @@
=C2=A0static int ide_doubler;
=C2=A0module_param_named(doubler, ide_doubler, bool, 0);
=C2=A0MODULE_PARM_DESC(doubler, "enable support for IDE doublers");
-#endif /* CONFIG_BLK_DEV_IDEDOUBLER */
-

=C2=A0 =C2=A0 /*
=C2=A0 =C2=A0 =C2=A0* =C2=A0Check and acknowledge the interrupt status
@@ -151,10 +144,7 @@ static int __init gayle_init(void)
=C2=A0found:
=C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_INFO "ide: Gayle IDE controller =
(A%d style%s)\n",
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 a4000 ? 4000 : 1200,
-#ifdef CONFIG_BLK_DEV_IDEDOUBLER
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ide_doubler ? ", IDE doubler" :
-#endif
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0"");
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ide_doubler ? ", IDE doubler" : "");

=C2=A0 =C2=A0 =C2=A0 =C2=A0if (a4000) {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phys_base =3D GAYLE_BASE_4000;



--=20
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
