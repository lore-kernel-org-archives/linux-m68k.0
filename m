From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] zorro: Defer device_register() until all devices have been
 identified
Date: Thu, 22 Sep 2011 21:47:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1109222140510.8856@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, =?ISO-8859-15?Q?Ingo_J=FCrgensmann?= <ij@2011.bluespice.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

As the Amiga Zorro II address space is limited to 8.5 MiB and Zorro dev=
ices
can contain only one BAR, several Amiga Zorro II expansion boards (main=
ly
graphics cards) contain multiple Zorro devices: a small one for the con=
trol
registers and one (or more) for the graphics memory.

The conversion of cirrusfb to the new driver framework introduced a
regression: the driver contains a zorro_driver for the first Zorro devi=
ce,
and uses the (old) zorro_find_device() call to find the second Zorro
device.
However, as the Zorro core calls device_register() as soon as a Zorro
device is identified, it may not have identified the second Zorro devic=
e
belonging to the same physical Zorro expansion card. Hence cirrusfb cou=
ld
no longer find the second part of the Picasso II graphics card, causing=
 a
NULL pointer dereference.

Defer the registration of Zorro devices with the driver framework until
all Zorro devices have been identified to fix this.

Note that the alternative solution (modifying cirrusfb to register a
zorro_driver for all Zorro devices belonging to a graphics card, instea=
d
of only for the first one, and adding a synchronization mechanism to de=
fer
initialization until all have been found), is not an option, as on some
cards one device may be optional (e.g. the second bank of 2 MiB of
graphics memory on the Picasso IV in Zorro II mode).

Reported-by: Ingo J=FCrgensmann <ij@2011.bluespice.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: stable@kernel.org
---
    Hi Linus,

Since kernel.org is still down and I have only one remaining patch for =
3.1,
I'm sending it by email.

Please apply. Thanks a lot!

Authorization code F68KAMYRULEZ.

 drivers/zorro/zorro.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
index e0c2807..181fa81 100644
--- a/drivers/zorro/zorro.c
+++ b/drivers/zorro/zorro.c
@@ -148,10 +148,10 @@ static int __init amiga_zorro_probe(struct platfo=
rm_device *pdev)
 	}
 	platform_set_drvdata(pdev, bus);
=20
-	/* Register all devices */
 	pr_info("Zorro: Probing AutoConfig expansion devices: %u device%s\n",
 		 zorro_num_autocon, zorro_num_autocon =3D=3D 1 ? "" : "s");
=20
+	/* First identify all devices ... */
 	for (i =3D 0; i < zorro_num_autocon; i++) {
 		z =3D &zorro_autocon[i];
 		z->id =3D (z->rom.er_Manufacturer<<16) | (z->rom.er_Product<<8);
@@ -172,6 +172,11 @@ static int __init amiga_zorro_probe(struct platfor=
m_device *pdev)
 		dev_set_name(&z->dev, "%02x", i);
 		z->dev.parent =3D &bus->dev;
 		z->dev.bus =3D &zorro_bus_type;
+	}
+
+	/* ... then register them */
+	for (i =3D 0; i < zorro_num_autocon; i++) {
+		z =3D &zorro_autocon[i];
 		error =3D device_register(&z->dev);
 		if (error) {
 			dev_err(&bus->dev, "Error registering device %s\n",
--=20
1.7.0.4

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
