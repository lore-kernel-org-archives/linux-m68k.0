From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH 3/6] m68k: mac - Add SWIM floppy support
Date: Wed, 25 Mar 2009 16:28:19 +0100
Message-ID: <20090325152819.GW27476@kernel.dk>
References: <1235899275-23630-1-git-send-email-geert@linux-m68k.org> <1235899275-23630-2-git-send-email-geert@linux-m68k.org> <1235899275-23630-3-git-send-email-geert@linux-m68k.org> <1235899275-23630-4-git-send-email-geert@linux-m68k.org> <10f740e80903250755o5b0e0315g2c3c27d3d0af1be0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1762984AbZCYP2w@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10f740e80903250755o5b0e0315g2c3c27d3d0af1be0@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, Laurent Vivier <laurent@lvivier.info>, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Wed, Mar 25 2009, Geert Uytterhoeven wrote:
> Hi Jens,
>=20
> Is this OK for you to go in through the m68k tree?

Sure!

>=20
> Thanks!
>=20
> On Sun, Mar 1, 2009 at 10:21, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> > From: Laurent Vivier <laurent@lvivier.info>
> >
> > It allows to read data from a floppy, but not to write to, and to e=
ject the
> > floppy (useful on our Mac without eject button).
> >
> > Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > ---
> > =A0arch/m68k/mac/config.c =A0 | =A0 44 ++
> > =A0arch/m68k/mac/via.c =A0 =A0 =A0| =A0 =A09 +
> > =A0drivers/block/Kconfig =A0 =A0| =A0 =A07 +
> > =A0drivers/block/Makefile =A0 | =A0 =A03 +
> > =A0drivers/block/swim.c =A0 =A0 | =A0995 ++++++++++++++++++++++++++=
++++++++++++++++++++
> > =A0drivers/block/swim_asm.S | =A0247 ++++++++++++
> > =A06 files changed, 1305 insertions(+), 0 deletions(-)
> > =A0create mode 100644 drivers/block/swim.c
> > =A0create mode 100644 drivers/block/swim_asm.S
> >
> > diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
> > index 3a1c0b2..be01798 100644
> > --- a/arch/m68k/mac/config.c
> > +++ b/arch/m68k/mac/config.c
> > @@ -22,6 +22,7 @@
> > =A0/* keyb */
> > =A0#include <linux/init.h>
> > =A0#include <linux/vt_kern.h>
> > +#include <linux/platform_device.h>
> >
> > =A0#define BOOTINFO_COMPAT_1_0
> > =A0#include <asm/setup.h>
> > @@ -43,6 +44,10 @@
> > =A0#include <asm/mac_oss.h>
> > =A0#include <asm/mac_psc.h>
> >
> > +/* platform device info */
> > +
> > +#define SWIM_IO_SIZE 0x2000 =A0 =A0/* SWIM IO resource size */
> > +
> > =A0/* Mac bootinfo struct */
> >
> > =A0struct mac_booter_data mac_bi_data;
> > @@ -870,3 +875,42 @@ static void mac_get_model(char *str)
> > =A0 =A0 =A0 =A0strcpy(str, "Macintosh ");
> > =A0 =A0 =A0 =A0strcat(str, macintosh_config->name);
> > =A0}
> > +
> > +static struct resource swim_resources[1];
> > +
> > +static struct platform_device swim_device =3D {
> > + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "swim",
> > + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> > + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(swim_resources),
> > + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D swim_resources,
> > +};
> > +
> > +static struct platform_device *mac_platform_devices[] __initdata =3D=
 {
> > + =A0 =A0 =A0 &swim_device
> > +};
> > +
> > +int __init mac_platform_init(void)
> > +{
> > + =A0 =A0 =A0 u8 *swim_base;
> > +
> > + =A0 =A0 =A0 switch (macintosh_config->floppy_type) {
> > + =A0 =A0 =A0 case MAC_FLOPPY_SWIM_ADDR1:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_base =3D (u8 *)(VIA1_BASE + 0x1E=
000);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 case MAC_FLOPPY_SWIM_ADDR2:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_base =3D (u8 *)(VIA1_BASE + 0x16=
000);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 default:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 swim_resources[0].name =3D "swim-regs";
> > + =A0 =A0 =A0 swim_resources[0].start =3D (resource_size_t)swim_bas=
e;
> > + =A0 =A0 =A0 swim_resources[0].end =3D (resource_size_t)(swim_base=
 + SWIM_IO_SIZE);
> > + =A0 =A0 =A0 swim_resources[0].flags =3D IORESOURCE_MEM;
> > +
> > + =A0 =A0 =A0 return platform_add_devices(mac_platform_devices,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 ARRAY_SIZE(mac_platform_devices));
> > +}
> > +
> > +arch_initcall(mac_platform_init);
> > diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> > index 7d97ba5..11bce3c 100644
> > --- a/arch/m68k/mac/via.c
> > +++ b/arch/m68k/mac/via.c
> > @@ -645,3 +645,12 @@ int via_irq_pending(int irq)
> > =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0return 0;
> > =A0}
> > +
> > +void via1_set_head(int head)
> > +{
> > + =A0 =A0 =A0 if (head =3D=3D 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 via1[vBufA] &=3D ~VIA1A_vHeadSel;
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 via1[vBufA] |=3D VIA1A_vHeadSel;
> > +}
> > +EXPORT_SYMBOL(via1_set_head);
> > diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
> > index 0344a8a..e7b8aa0 100644
> > --- a/drivers/block/Kconfig
> > +++ b/drivers/block/Kconfig
> > @@ -45,6 +45,13 @@ config MAC_FLOPPY
> > =A0 =A0 =A0 =A0 =A0If you have a SWIM-3 (Super Woz Integrated Machi=
ne 3; from Apple)
> > =A0 =A0 =A0 =A0 =A0floppy controller, say Y here. Most commonly fou=
nd in PowerMacs.
> >
> > +config BLK_DEV_SWIM
> > + =A0 =A0 =A0 tristate "Support for SWIM Macintosh floppy"
> > + =A0 =A0 =A0 depends on M68K && MAC
> > + =A0 =A0 =A0 help
> > + =A0 =A0 =A0 =A0 You should select this option if you want floppy =
support
> > + =A0 =A0 =A0 =A0 and you don't have a II, IIfx, Q900, Q950 or AV s=
eries.
> > +
> > =A0config AMIGA_Z2RAM
> > =A0 =A0 =A0 =A0tristate "Amiga Zorro II ramdisk support"
> > =A0 =A0 =A0 =A0depends on ZORRO
> > diff --git a/drivers/block/Makefile b/drivers/block/Makefile
> > index 204332b..b32b7f9 100644
> > --- a/drivers/block/Makefile
> > +++ b/drivers/block/Makefile
> > @@ -6,6 +6,7 @@
> > =A0#
> >
> > =A0obj-$(CONFIG_MAC_FLOPPY) =A0 =A0 =A0 +=3D swim3.o
> > +obj-$(CONFIG_BLK_DEV_SWIM) =A0 =A0 +=3D swim_mod.o
> > =A0obj-$(CONFIG_BLK_DEV_FD) =A0 =A0 =A0 +=3D floppy.o
> > =A0obj-$(CONFIG_AMIGA_FLOPPY) =A0 =A0 +=3D amiflop.o
> > =A0obj-$(CONFIG_PS3_DISK) =A0 =A0 =A0 =A0 +=3D ps3disk.o
> > @@ -32,3 +33,5 @@ obj-$(CONFIG_BLK_DEV_UB) =A0 =A0 =A0+=3D ub.o
> > =A0obj-$(CONFIG_BLK_DEV_HD) =A0 =A0 =A0 +=3D hd.o
> >
> > =A0obj-$(CONFIG_XEN_BLKDEV_FRONTEND) =A0 =A0 =A0+=3D xen-blkfront.o
> > +
> > +swim_mod-objs =A0:=3D swim.o swim_asm.o
> > diff --git a/drivers/block/swim.c b/drivers/block/swim.c
> > new file mode 100644
> > index 0000000..d22cc38
> > --- /dev/null
> > +++ b/drivers/block/swim.c
> > @@ -0,0 +1,995 @@
> > +/*
> > + * Driver for SWIM (Sander Woz Integrated Machine) floppy controll=
er
> > + *
> > + * Copyright (C) 2004,2008 Laurent Vivier <Laurent@lvivier.info>
> > + *
> > + * based on Alastair Bridgewater SWIM analysis, 2001
> > + * based on SWIM3 driver (c) Paul Mackerras, 1996
> > + * based on netBSD IWM driver (c) 1997, 1998 Hauke Fath.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + *
> > + * 2004-08-21 (lv) - Initial implementation
> > + * 2008-10-30 (lv) - Port to 2.6
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/fd.h>
> > +#include <linux/blkdev.h>
> > +#include <linux/hdreg.h>
> > +#include <linux/kernel.h>
> > +#include <linux/delay.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <asm/macintosh.h>
> > +#include <asm/mac_via.h>
> > +
> > +#define CARDNAME "swim"
> > +
> > +struct sector_header {
> > + =A0 =A0 =A0 unsigned char side;
> > + =A0 =A0 =A0 unsigned char track;
> > + =A0 =A0 =A0 unsigned char sector;
> > + =A0 =A0 =A0 unsigned char size;
> > + =A0 =A0 =A0 unsigned char crc0;
> > + =A0 =A0 =A0 unsigned char crc1;
> > +} __attribute__((packed));
> > +
> > +#define DRIVER_VERSION "Version 0.2 (2008-10-30)"
> > +
> > +#define REG(x) unsigned char x, x ## _pad[0x200 - 1];
> > +
> > +struct swim {
> > + =A0 =A0 =A0 REG(write_data)
> > + =A0 =A0 =A0 REG(write_mark)
> > + =A0 =A0 =A0 REG(write_CRC)
> > + =A0 =A0 =A0 REG(write_parameter)
> > + =A0 =A0 =A0 REG(write_phase)
> > + =A0 =A0 =A0 REG(write_setup)
> > + =A0 =A0 =A0 REG(write_mode0)
> > + =A0 =A0 =A0 REG(write_mode1)
> > +
> > + =A0 =A0 =A0 REG(read_data)
> > + =A0 =A0 =A0 REG(read_mark)
> > + =A0 =A0 =A0 REG(read_error)
> > + =A0 =A0 =A0 REG(read_parameter)
> > + =A0 =A0 =A0 REG(read_phase)
> > + =A0 =A0 =A0 REG(read_setup)
> > + =A0 =A0 =A0 REG(read_status)
> > + =A0 =A0 =A0 REG(read_handshake)
> > +} __attribute__((packed));
> > +
> > +#define swim_write(base, reg, v) =A0 =A0 =A0 out_8(&(base)->write_=
##reg, (v))
> > +#define swim_read(base, reg) =A0 =A0 =A0 =A0 =A0 in_8(&(base)->rea=
d_##reg)
> > +
> > +/* IWM registers */
> > +
> > +struct iwm {
> > + =A0 =A0 =A0 REG(ph0L)
> > + =A0 =A0 =A0 REG(ph0H)
> > + =A0 =A0 =A0 REG(ph1L)
> > + =A0 =A0 =A0 REG(ph1H)
> > + =A0 =A0 =A0 REG(ph2L)
> > + =A0 =A0 =A0 REG(ph2H)
> > + =A0 =A0 =A0 REG(ph3L)
> > + =A0 =A0 =A0 REG(ph3H)
> > + =A0 =A0 =A0 REG(mtrOff)
> > + =A0 =A0 =A0 REG(mtrOn)
> > + =A0 =A0 =A0 REG(intDrive)
> > + =A0 =A0 =A0 REG(extDrive)
> > + =A0 =A0 =A0 REG(q6L)
> > + =A0 =A0 =A0 REG(q6H)
> > + =A0 =A0 =A0 REG(q7L)
> > + =A0 =A0 =A0 REG(q7H)
> > +} __attribute__((packed));
> > +
> > +#define iwm_write(base, reg, v) =A0 =A0 =A0 =A0out_8(&(base)->reg,=
 (v))
> > +#define iwm_read(base, reg) =A0 =A0 =A0 =A0 =A0 =A0in_8(&(base)->r=
eg)
> > +
> > +/* bits in phase register */
> > +
> > +#define SEEK_POSITIVE =A00x070
> > +#define SEEK_NEGATIVE =A00x074
> > +#define STEP =A0 =A0 =A0 =A0 =A0 0x071
> > +#define MOTOR_ON =A0 =A0 =A0 0x072
> > +#define MOTOR_OFF =A0 =A0 =A00x076
> > +#define INDEX =A0 =A0 =A0 =A0 =A00x073
> > +#define EJECT =A0 =A0 =A0 =A0 =A00x077
> > +#define SETMFM =A0 =A0 =A0 =A0 0x171
> > +#define SETGCR =A0 =A0 =A0 =A0 0x175
> > +
> > +#define RELAX =A0 =A0 =A0 =A0 =A00x033
> > +#define LSTRB =A0 =A0 =A0 =A0 =A00x008
> > +
> > +#define CA_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x077
> > +
> > +/* Select values for swim_select and swim_readbit */
> > +
> > +#define READ_DATA_0 =A0 =A00x074
> > +#define TWOMEG_DRIVE =A0 0x075
> > +#define SINGLE_SIDED =A0 0x076
> > +#define DRIVE_PRESENT =A00x077
> > +#define DISK_IN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x170
> > +#define WRITE_PROT =A0 =A0 0x171
> > +#define TRACK_ZERO =A0 =A0 0x172
> > +#define TACHO =A0 =A0 =A0 =A0 =A00x173
> > +#define READ_DATA_1 =A0 =A00x174
> > +#define MFM_MODE =A0 =A0 =A0 0x175
> > +#define SEEK_COMPLETE =A00x176
> > +#define ONEMEG_MEDIA =A0 0x177
> > +
> > +/* Bits in handshake register */
> > +
> > +#define MARK_BYTE =A0 =A0 =A00x01
> > +#define CRC_ZERO =A0 =A0 =A0 0x02
> > +#define RDDATA =A0 =A0 =A0 =A0 0x04
> > +#define SENSE =A0 =A0 =A0 =A0 =A00x08
> > +#define MOTEN =A0 =A0 =A0 =A0 =A00x10
> > +#define ERROR =A0 =A0 =A0 =A0 =A00x20
> > +#define DAT2BYTE =A0 =A0 =A0 0x40
> > +#define DAT1BYTE =A0 =A0 =A0 0x80
> > +
> > +/* bits in setup register */
> > +
> > +#define S_INV_WDATA =A0 =A00x01
> > +#define S_3_5_SELECT =A0 0x02
> > +#define S_GCR =A0 =A0 =A0 =A0 =A00x04
> > +#define S_FCLK_DIV2 =A0 =A00x08
> > +#define S_ERROR_CORR =A0 0x10
> > +#define S_IBM_DRIVE =A0 =A00x20
> > +#define S_GCR_WRITE =A0 =A00x40
> > +#define S_TIMEOUT =A0 =A0 =A00x80
> > +
> > +/* bits in mode register */
> > +
> > +#define CLFIFO =A0 =A0 =A0 =A0 0x01
> > +#define ENBL1 =A0 =A0 =A0 =A0 =A00x02
> > +#define ENBL2 =A0 =A0 =A0 =A0 =A00x04
> > +#define ACTION =A0 =A0 =A0 =A0 0x08
> > +#define WRITE_MODE =A0 =A0 0x10
> > +#define HEDSEL =A0 =A0 =A0 =A0 0x20
> > +#define MOTON =A0 =A0 =A0 =A0 =A00x80
> > +
> > +/*----------------------------------------------------------------=
------------*/
> > +
> > +enum drive_location {
> > + =A0 =A0 =A0 INTERNAL_DRIVE =3D 0x02,
> > + =A0 =A0 =A0 EXTERNAL_DRIVE =3D 0x04,
> > +};
> > +
> > +enum media_type {
> > + =A0 =A0 =A0 DD_MEDIA,
> > + =A0 =A0 =A0 HD_MEDIA,
> > +};
> > +
> > +struct floppy_state {
> > +
> > + =A0 =A0 =A0 /* physical properties */
> > +
> > + =A0 =A0 =A0 enum drive_location location; =A0 /* internal or exte=
rnal drive */
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0head_number; =A0 /* si=
ngle- or double-sided drive */
> > +
> > + =A0 =A0 =A0 /* media */
> > +
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0disk_in;
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0ejected;
> > + =A0 =A0 =A0 enum media_type =A0type;
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0write_protected;
> > +
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0total_secs;
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0secpercyl;
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 =A0secpertrack;
> > +
> > + =A0 =A0 =A0 /* in-use information */
> > +
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 track;
> > + =A0 =A0 =A0 int =A0 =A0 =A0 =A0 =A0 =A0 ref_count;
> > +
> > + =A0 =A0 =A0 struct gendisk *disk;
> > +
> > + =A0 =A0 =A0 /* parent controller */
> > +
> > + =A0 =A0 =A0 struct swim_priv *swd;
> > +};
> > +
> > +enum motor_action {
> > + =A0 =A0 =A0 OFF,
> > + =A0 =A0 =A0 ON,
> > +};
> > +
> > +enum head {
> > + =A0 =A0 =A0 LOWER_HEAD =3D 0,
> > + =A0 =A0 =A0 UPPER_HEAD =3D 1,
> > +};
> > +
> > +#define FD_MAX_UNIT =A0 =A02
> > +
> > +struct swim_priv {
> > + =A0 =A0 =A0 struct swim __iomem *base;
> > + =A0 =A0 =A0 spinlock_t lock;
> > + =A0 =A0 =A0 struct request_queue *queue;
> > + =A0 =A0 =A0 int floppy_count;
> > + =A0 =A0 =A0 struct floppy_state unit[FD_MAX_UNIT];
> > +};
> > +
> > +extern int swim_read_sector_header(struct swim __iomem *base,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
struct sector_header *header);
> > +extern int swim_read_sector_data(struct swim __iomem *base,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0un=
signed char *data);
> > +
> > +static inline void set_swim_mode(struct swim __iomem *base, int en=
able)
> > +{
> > + =A0 =A0 =A0 struct iwm __iomem *iwm_base;
> > + =A0 =A0 =A0 unsigned long flags;
> > +
> > + =A0 =A0 =A0 if (!enable) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_write(base, mode0, 0xf8);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 iwm_base =3D (struct iwm __iomem *)base;
> > + =A0 =A0 =A0 local_irq_save(flags);
> > +
> > + =A0 =A0 =A0 iwm_read(iwm_base, q7L);
> > + =A0 =A0 =A0 iwm_read(iwm_base, mtrOff);
> > + =A0 =A0 =A0 iwm_read(iwm_base, q6H);
> > +
> > + =A0 =A0 =A0 iwm_write(iwm_base, q7H, 0x57);
> > + =A0 =A0 =A0 iwm_write(iwm_base, q7H, 0x17);
> > + =A0 =A0 =A0 iwm_write(iwm_base, q7H, 0x57);
> > + =A0 =A0 =A0 iwm_write(iwm_base, q7H, 0x57);
> > +
> > + =A0 =A0 =A0 local_irq_restore(flags);
> > +}
> > +
> > +static inline int get_swim_mode(struct swim __iomem *base)
> > +{
> > + =A0 =A0 =A0 unsigned long flags;
> > +
> > + =A0 =A0 =A0 local_irq_save(flags);
> > +
> > + =A0 =A0 =A0 swim_write(base, phase, 0xf5);
> > + =A0 =A0 =A0 if (swim_read(base, phase) !=3D 0xf5)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto is_iwm;
> > + =A0 =A0 =A0 swim_write(base, phase, 0xf6);
> > + =A0 =A0 =A0 if (swim_read(base, phase) !=3D 0xf6)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto is_iwm;
> > + =A0 =A0 =A0 swim_write(base, phase, 0xf7);
> > + =A0 =A0 =A0 if (swim_read(base, phase) !=3D 0xf7)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto is_iwm;
> > + =A0 =A0 =A0 local_irq_restore(flags);
> > + =A0 =A0 =A0 return 1;
> > +is_iwm:
> > + =A0 =A0 =A0 local_irq_restore(flags);
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static inline void swim_select(struct swim __iomem *base, int sel)
> > +{
> > + =A0 =A0 =A0 swim_write(base, phase, RELAX);
> > +
> > + =A0 =A0 =A0 via1_set_head(sel & 0x100);
> > +
> > + =A0 =A0 =A0 swim_write(base, phase, sel & CA_MASK);
> > +}
> > +
> > +static inline void swim_action(struct swim __iomem *base, int acti=
on)
> > +{
> > + =A0 =A0 =A0 unsigned long flags;
> > +
> > + =A0 =A0 =A0 local_irq_save(flags);
> > +
> > + =A0 =A0 =A0 swim_select(base, action);
> > + =A0 =A0 =A0 udelay(1);
> > + =A0 =A0 =A0 swim_write(base, phase, (LSTRB<<4) | LSTRB);
> > + =A0 =A0 =A0 udelay(1);
> > + =A0 =A0 =A0 swim_write(base, phase, (LSTRB<<4) | ((~LSTRB) & 0x0F=
));
> > + =A0 =A0 =A0 udelay(1);
> > +
> > + =A0 =A0 =A0 local_irq_restore(flags);
> > +}
> > +
> > +static inline int swim_readbit(struct swim __iomem *base, int bit)
> > +{
> > + =A0 =A0 =A0 int stat;
> > +
> > + =A0 =A0 =A0 swim_select(base, bit);
> > +
> > + =A0 =A0 =A0 udelay(10);
> > +
> > + =A0 =A0 =A0 stat =3D swim_read(base, handshake);
> > +
> > + =A0 =A0 =A0 return (stat & SENSE) =3D=3D 0;
> > +}
> > +
> > +static inline void swim_drive(struct swim __iomem *base,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum driv=
e_location location)
> > +{
> > + =A0 =A0 =A0 if (location =3D=3D INTERNAL_DRIVE) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_write(base, mode0, EXTERNAL_DRIV=
E); /* clear drive 1 bit */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_write(base, mode1, INTERNAL_DRIV=
E); /* set drive 0 bit */
> > + =A0 =A0 =A0 } else if (location =3D=3D EXTERNAL_DRIVE) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_write(base, mode0, INTERNAL_DRIV=
E); /* clear drive 0 bit */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_write(base, mode1, EXTERNAL_DRIV=
E); /* set drive 1 bit */
> > + =A0 =A0 =A0 }
> > +}
> > +
> > +static inline void swim_motor(struct swim __iomem *base,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum moto=
r_action action)
> > +{
> > + =A0 =A0 =A0 if (action =3D=3D ON) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int i;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_action(base, MOTOR_ON);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < 2*HZ; i++) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_select(base, REL=
AX);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (swim_readbit(base=
, MOTOR_ON))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break=
;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->state =3D TA=
SK_INTERRUPTIBLE;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule_timeout(1);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 } else if (action =3D=3D OFF) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_action(base, MOTOR_OFF);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_select(base, RELAX);
> > + =A0 =A0 =A0 }
> > +}
> > +
> > +static inline void swim_eject(struct swim __iomem *base)
> > +{
> > + =A0 =A0 =A0 int i;
> > +
> > + =A0 =A0 =A0 swim_action(base, EJECT);
> > +
> > + =A0 =A0 =A0 for (i =3D 0; i < 2*HZ; i++) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_select(base, RELAX);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!swim_readbit(base, DISK_IN))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->state =3D TASK_INTERRUPTIBLE=
;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule_timeout(1);
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 swim_select(base, RELAX);
> > +}
> > +
> > +static inline void swim_head(struct swim __iomem *base, enum head =
head)
> > +{
> > + =A0 =A0 =A0 /* wait drive is ready */
> > +
> > + =A0 =A0 =A0 if (head =3D=3D UPPER_HEAD)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_select(base, READ_DATA_1);
> > + =A0 =A0 =A0 else if (head =3D=3D LOWER_HEAD)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_select(base, READ_DATA_0);
> > +}
> > +
> > +static inline int swim_step(struct swim __iomem *base)
> > +{
> > + =A0 =A0 =A0 int wait;
> > +
> > + =A0 =A0 =A0 swim_action(base, STEP);
> > +
> > + =A0 =A0 =A0 for (wait =3D 0; wait < HZ; wait++) {
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 current->state =3D TASK_INTERRUPTIBLE=
;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 schedule_timeout(1);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_select(base, RELAX);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!swim_readbit(base, STEP))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 return -1;
> > +}
> > +
> > +static inline int swim_track00(struct swim __iomem *base)
> > +{
> > + =A0 =A0 =A0 int try;
> > +
> > + =A0 =A0 =A0 swim_action(base, SEEK_NEGATIVE);
> > +
> > + =A0 =A0 =A0 for (try =3D 0; try < 100; try++) {
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_select(base, RELAX);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (swim_readbit(base, TRACK_ZERO))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (swim_step(base))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 if (swim_readbit(base, TRACK_ZERO))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > +
> > + =A0 =A0 =A0 return -1;
> > +}
> > +
> > +static inline int swim_seek(struct swim __iomem *base, int step)
> > +{
> > + =A0 =A0 =A0 if (step =3D=3D 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > +
> > + =A0 =A0 =A0 if (step < 0) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_action(base, SEEK_NEGATIVE);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 step =3D -step;
> > + =A0 =A0 =A0 } else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_action(base, SEEK_POSITIVE);
> > +
> > + =A0 =A0 =A0 for ( ; step > 0; step--) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (swim_step(base))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static inline int swim_track(struct floppy_state *fs, =A0int track=
)
> > +{
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > + =A0 =A0 =A0 int ret;
> > +
> > + =A0 =A0 =A0 ret =3D swim_seek(base, track - fs->track);
> > +
> > + =A0 =A0 =A0 if (ret =3D=3D 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->track =3D track;
> > + =A0 =A0 =A0 else {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_track00(base);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->track =3D 0;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 return ret;
> > +}
> > +
> > +static int floppy_eject(struct floppy_state *fs)
> > +{
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > +
> > + =A0 =A0 =A0 swim_drive(base, fs->location);
> > + =A0 =A0 =A0 swim_motor(base, OFF);
> > + =A0 =A0 =A0 swim_eject(base);
> > +
> > + =A0 =A0 =A0 fs->disk_in =3D 0;
> > + =A0 =A0 =A0 fs->ejected =3D 1;
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static inline int swim_read_sector(struct floppy_state *fs,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
int side, int track,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
int sector, unsigned char *buffer)
> > +{
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > + =A0 =A0 =A0 unsigned long flags;
> > + =A0 =A0 =A0 struct sector_header header;
> > + =A0 =A0 =A0 int ret =3D -1;
> > + =A0 =A0 =A0 short i;
> > +
> > + =A0 =A0 =A0 swim_track(fs, track);
> > +
> > + =A0 =A0 =A0 swim_write(base, mode1, MOTON);
> > + =A0 =A0 =A0 swim_head(base, side);
> > + =A0 =A0 =A0 swim_write(base, mode0, side);
> > +
> > + =A0 =A0 =A0 local_irq_save(flags);
> > + =A0 =A0 =A0 for (i =3D 0; i < 36; i++) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D swim_read_sector_header(base,=
 &header);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ret && (header.sector =3D=3D sec=
tor)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* found */
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D swim_read_sec=
tor_data(base, buffer);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 local_irq_restore(flags);
> > +
> > + =A0 =A0 =A0 swim_write(base, mode0, MOTON);
> > +
> > + =A0 =A0 =A0 if ((header.side !=3D side) =A0|| (header.track !=3D =
track) ||
> > + =A0 =A0 =A0 =A0 =A0 =A0(header.sector !=3D sector))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > +
> > + =A0 =A0 =A0 return ret;
> > +}
> > +
> > +static int floppy_read_sectors(struct floppy_state *fs,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int re=
q_sector, int sectors_nb,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsign=
ed char *buffer)
> > +{
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > + =A0 =A0 =A0 int ret;
> > + =A0 =A0 =A0 int side, track, sector;
> > + =A0 =A0 =A0 int i, try;
> > +
> > +
> > + =A0 =A0 =A0 swim_drive(base, fs->location);
> > + =A0 =A0 =A0 for (i =3D req_sector; i < req_sector + sectors_nb; i=
++) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int x;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 track =3D i / fs->secpercyl;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 x =3D i % fs->secpercyl;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 side =3D x / fs->secpertrack;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sector =3D x % fs->secpertrack + 1;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 try =3D 5;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D swim_read_sec=
tor(fs, side, track, sector,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 buffer);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (try-- =3D=3D 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retur=
n -1;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (ret !=3D 512);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buffer +=3D ret;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static void redo_fd_request(struct request_queue *q)
> > +{
> > + =A0 =A0 =A0 struct request *req;
> > + =A0 =A0 =A0 struct floppy_state *fs;
> > +
> > + =A0 =A0 =A0 while ((req =3D elv_next_request(q))) {
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs =3D req->rq_disk->private_data;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (req->sector < 0 || req->sector >=3D=
 fs->total_secs) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_request(req, 0);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (req->current_nr_sectors =3D=3D 0)=
 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_request(req, 1);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!fs->disk_in) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_request(req, 0);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rq_data_dir(req) =3D=3D WRITE) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fs->write_protect=
ed) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_r=
equest(req, 0);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 conti=
nue;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (rq_data_dir(req)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case WRITE:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* NOT IMPLEMENTED */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_request(req, 0);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case READ:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (floppy_read_secto=
rs(fs, req->sector,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 req->current_nr_sectors,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 req->buffer)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_r=
equest(req, 0);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 conti=
nue;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 req->nr_sectors -=3D =
req->current_nr_sectors;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 req->sector +=3D req-=
>current_nr_sectors;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 req->buffer +=3D req-=
>current_nr_sectors * 512;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_request(req, 1);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 }
> > +}
> > +
> > +static void do_fd_request(struct request_queue *q)
> > +{
> > + =A0 =A0 =A0 redo_fd_request(q);
> > +}
> > +
> > +static struct floppy_struct floppy_type[4] =3D {
> > + =A0 =A0 =A0 { =A0 =A00, =A00, 0, =A00, 0, 0x00, 0x00, 0x00, 0x00,=
 NULL }, /* no testing =A0 */
> > + =A0 =A0 =A0 { =A0720, =A09, 1, 80, 0, 0x2A, 0x02, 0xDF, 0x50, NUL=
L }, /* 360KB SS 3.5"*/
> > + =A0 =A0 =A0 { 1440, =A09, 2, 80, 0, 0x2A, 0x02, 0xDF, 0x50, NULL =
}, /* 720KB 3.5" =A0 */
> > + =A0 =A0 =A0 { 2880, 18, 2, 80, 0, 0x1B, 0x00, 0xCF, 0x6C, NULL },=
 /* 1.44MB 3.5" =A0*/
> > +};
> > +
> > +static int get_floppy_geometry(struct floppy_state *fs, int type,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct=
 floppy_struct **g)
> > +{
> > + =A0 =A0 =A0 if (type >=3D ARRAY_SIZE(floppy_type))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> > +
> > + =A0 =A0 =A0 if (type)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *g =3D &floppy_type[type];
> > + =A0 =A0 =A0 else if (fs->type =3D=3D HD_MEDIA) /* High-Density me=
dia */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *g =3D &floppy_type[3];
> > + =A0 =A0 =A0 else if (fs->head_number =3D=3D 2) /* double-sided */
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *g =3D &floppy_type[2];
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *g =3D &floppy_type[1];
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static void setup_medium(struct floppy_state *fs)
> > +{
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > +
> > + =A0 =A0 =A0 if (swim_readbit(base, DISK_IN)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct floppy_struct *g;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->disk_in =3D 1;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->write_protected =3D swim_readbit(=
base, WRITE_PROT);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->type =3D swim_readbit(base, ONEME=
G_MEDIA);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (swim_track00(base))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "SWIM=
: cannot move floppy head to track 0\n");
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_track00(base);
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 get_floppy_geometry(fs, 0, &g);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->total_secs =3D g->size;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->secpercyl =3D g->head * g->sect;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->secpertrack =3D g->sect;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->track =3D 0;
> > + =A0 =A0 =A0 } else {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->disk_in =3D 0;
> > + =A0 =A0 =A0 }
> > +}
> > +
> > +static int floppy_open(struct block_device *bdev, fmode_t mode)
> > +{
> > + =A0 =A0 =A0 struct floppy_state *fs =3D bdev->bd_disk->private_da=
ta;
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > + =A0 =A0 =A0 int err;
> > +
> > + =A0 =A0 =A0 if (fs->ref_count =3D=3D -1 || (fs->ref_count && mode=
 & FMODE_EXCL))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
> > +
> > + =A0 =A0 =A0 if (mode & FMODE_EXCL)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->ref_count =3D -1;
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->ref_count++;
> > +
> > + =A0 =A0 =A0 swim_write(base, setup, S_IBM_DRIVE =A0| S_FCLK_DIV2)=
;
> > + =A0 =A0 =A0 udelay(10);
> > + =A0 =A0 =A0 swim_drive(base, INTERNAL_DRIVE);
> > + =A0 =A0 =A0 swim_motor(base, ON);
> > + =A0 =A0 =A0 swim_action(base, SETMFM);
> > + =A0 =A0 =A0 if (fs->ejected)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_medium(fs);
> > + =A0 =A0 =A0 if (!fs->disk_in) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -ENXIO;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 if (mode & FMODE_NDELAY)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> > +
> > + =A0 =A0 =A0 if (mode & (FMODE_READ|FMODE_WRITE)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_disk_change(bdev);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((mode & FMODE_WRITE) && fs->write=
_protected) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -EROFS;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 return 0;
> > +out:
> > + =A0 =A0 =A0 if (fs->ref_count < 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->ref_count =3D 0;
> > + =A0 =A0 =A0 else if (fs->ref_count > 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --fs->ref_count;
> > +
> > + =A0 =A0 =A0 if (fs->ref_count =3D=3D 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_motor(base, OFF);
> > + =A0 =A0 =A0 return err;
> > +}
> > +
> > +static int floppy_release(struct gendisk *disk, fmode_t mode)
> > +{
> > + =A0 =A0 =A0 struct floppy_state *fs =3D disk->private_data;
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > +
> > + =A0 =A0 =A0 if (fs->ref_count < 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->ref_count =3D 0;
> > + =A0 =A0 =A0 else if (fs->ref_count > 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --fs->ref_count;
> > +
> > + =A0 =A0 =A0 if (fs->ref_count =3D=3D 0)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_motor(base, OFF);
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static int floppy_ioctl(struct block_device *bdev, fmode_t mode,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int cmd, uns=
igned long param)
> > +{
> > + =A0 =A0 =A0 struct floppy_state *fs =3D bdev->bd_disk->private_da=
ta;
> > + =A0 =A0 =A0 int err;
> > +
> > + =A0 =A0 =A0 if ((cmd & 0x80) && !capable(CAP_SYS_ADMIN))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EPERM;
> > +
> > + =A0 =A0 =A0 switch (cmd) {
> > + =A0 =A0 =A0 case FDEJECT:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fs->ref_count !=3D 1)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D floppy_eject(fs);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return err;
> > +
> > + =A0 =A0 =A0 case FDGETPRM:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_to_user((void __user *) para=
m, (void *) &floppy_type,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0si=
zeof(struct floppy_struct)))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EFAULT;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> > +
> > + =A0 =A0 =A0 default:
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "SWIM floppy_ioctl:=
 unknown cmd %d\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cmd);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOSYS;
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static int floppy_getgeo(struct block_device *bdev, struct hd_geom=
etry *geo)
> > +{
> > + =A0 =A0 =A0 struct floppy_state *fs =3D bdev->bd_disk->private_da=
ta;
> > + =A0 =A0 =A0 struct floppy_struct *g;
> > + =A0 =A0 =A0 int ret;
> > +
> > + =A0 =A0 =A0 ret =3D get_floppy_geometry(fs, 0, &g);
> > + =A0 =A0 =A0 if (ret)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> > +
> > + =A0 =A0 =A0 geo->heads =3D g->head;
> > + =A0 =A0 =A0 geo->sectors =3D g->sect;
> > + =A0 =A0 =A0 geo->cylinders =3D g->track;
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static int floppy_check_change(struct gendisk *disk)
> > +{
> > + =A0 =A0 =A0 struct floppy_state *fs =3D disk->private_data;
> > +
> > + =A0 =A0 =A0 return fs->ejected;
> > +}
> > +
> > +static int floppy_revalidate(struct gendisk *disk)
> > +{
> > + =A0 =A0 =A0 struct floppy_state *fs =3D disk->private_data;
> > + =A0 =A0 =A0 struct swim __iomem *base =3D fs->swd->base;
> > +
> > + =A0 =A0 =A0 swim_drive(base, fs->location);
> > +
> > + =A0 =A0 =A0 if (fs->ejected)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 setup_medium(fs);
> > +
> > + =A0 =A0 =A0 if (!fs->disk_in)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_motor(base, OFF);
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->ejected =3D 0;
> > +
> > + =A0 =A0 =A0 return !fs->disk_in;
> > +}
> > +
> > +static struct block_device_operations floppy_fops =3D {
> > + =A0 =A0 =A0 .owner =A0 =A0 =A0 =A0 =A0 =3D THIS_MODULE,
> > + =A0 =A0 =A0 .open =A0 =A0 =A0 =A0 =A0 =A0=3D floppy_open,
> > + =A0 =A0 =A0 .release =A0 =A0 =A0 =A0 =3D floppy_release,
> > + =A0 =A0 =A0 .locked_ioctl =A0 =A0=3D floppy_ioctl,
> > + =A0 =A0 =A0 .getgeo =A0 =A0 =A0 =A0 =A0=3D floppy_getgeo,
> > + =A0 =A0 =A0 .media_changed =A0 =3D floppy_check_change,
> > + =A0 =A0 =A0 .revalidate_disk =3D floppy_revalidate,
> > +};
> > +
> > +static struct kobject *floppy_find(dev_t dev, int *part, void *dat=
a)
> > +{
> > + =A0 =A0 =A0 struct swim_priv *swd =3D data;
> > + =A0 =A0 =A0 int drive =3D (*part & 3);
> > +
> > + =A0 =A0 =A0 if (drive > swd->floppy_count)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> > +
> > + =A0 =A0 =A0 *part =3D 0;
> > + =A0 =A0 =A0 return get_disk(swd->unit[drive].disk);
> > +}
> > +
> > +static int __devinit swim_add_floppy(struct swim_priv *swd,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0enum drive_location location)
> > +{
> > + =A0 =A0 =A0 struct floppy_state *fs =3D &swd->unit[swd->floppy_co=
unt];
> > + =A0 =A0 =A0 struct swim __iomem *base =3D swd->base;
> > +
> > + =A0 =A0 =A0 fs->location =3D location;
> > +
> > + =A0 =A0 =A0 swim_drive(base, location);
> > +
> > + =A0 =A0 =A0 swim_motor(base, OFF);
> > +
> > + =A0 =A0 =A0 if (swim_readbit(base, SINGLE_SIDED))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->head_number =3D 1;
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fs->head_number =3D 2;
> > + =A0 =A0 =A0 fs->ref_count =3D 0;
> > + =A0 =A0 =A0 fs->ejected =3D 1;
> > +
> > + =A0 =A0 =A0 swd->floppy_count++;
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static int __devinit swim_floppy_init(struct swim_priv *swd)
> > +{
> > + =A0 =A0 =A0 int err;
> > + =A0 =A0 =A0 int drive;
> > + =A0 =A0 =A0 struct swim __iomem *base =3D swd->base;
> > +
> > + =A0 =A0 =A0 /* scan floppy drives */
> > +
> > + =A0 =A0 =A0 swim_drive(base, INTERNAL_DRIVE);
> > + =A0 =A0 =A0 if (swim_readbit(base, DRIVE_PRESENT))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_add_floppy(swd, INTERNAL_DRIVE);
> > + =A0 =A0 =A0 swim_drive(base, EXTERNAL_DRIVE);
> > + =A0 =A0 =A0 if (swim_readbit(base, DRIVE_PRESENT))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swim_add_floppy(swd, EXTERNAL_DRIVE);
> > +
> > + =A0 =A0 =A0 /* register floppy drives */
> > +
> > + =A0 =A0 =A0 err =3D register_blkdev(FLOPPY_MAJOR, "fd");
> > + =A0 =A0 =A0 if (err) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Unable to get major =
%d for SWIM floppy\n",
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FLOPPY_MAJOR);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 for (drive =3D 0; drive < swd->floppy_count; drive++)=
 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].disk =3D alloc_disk(=
1);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (swd->unit[drive].disk =3D=3D NULL=
) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -ENOMEM;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit_put_disks;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].swd =3D swd;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 swd->queue =3D blk_init_queue(do_fd_request, &swd->lo=
ck);
> > + =A0 =A0 =A0 if (!swd->queue) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -ENOMEM;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto exit_put_disks;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 for (drive =3D 0; drive < swd->floppy_count; drive++)=
 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].disk->flags =3D GENH=
D_FL_REMOVABLE;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].disk->major =3D FLOP=
PY_MAJOR;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].disk->first_minor =3D=
 drive;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sprintf(swd->unit[drive].disk->disk_n=
ame, "fd%d", drive);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].disk->fops =3D &flop=
py_fops;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].disk->private_data =3D=
 &swd->unit[drive];
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 swd->unit[drive].disk->queue =3D swd-=
>queue;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_capacity(swd->unit[drive].disk, 2=
880);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_disk(swd->unit[drive].disk);
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS=
_MODULE,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 floppy_find, =
NULL, swd);
> > +
> > + =A0 =A0 =A0 return 0;
> > +
> > +exit_put_disks:
> > + =A0 =A0 =A0 unregister_blkdev(FLOPPY_MAJOR, "fd");
> > + =A0 =A0 =A0 while (drive--)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 put_disk(swd->unit[drive].disk);
> > + =A0 =A0 =A0 return err;
> > +}
> > +
> > +static int __devinit swim_probe(struct platform_device *dev)
> > +{
> > + =A0 =A0 =A0 struct resource *res;
> > + =A0 =A0 =A0 struct swim __iomem *swim_base;
> > + =A0 =A0 =A0 struct swim_priv *swd;
> > + =A0 =A0 =A0 int ret;
> > +
> > + =A0 =A0 =A0 res =3D platform_get_resource_byname(dev, IORESOURCE_=
MEM, "swim-regs");
> > + =A0 =A0 =A0 if (!res) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 if (!request_mem_region(res->start, resource_size(res=
), CARDNAME)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 swim_base =3D ioremap(res->start, resource_size(res))=
;
> > + =A0 =A0 =A0 if (!swim_base) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_release_io;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 /* probe device */
> > +
> > + =A0 =A0 =A0 set_swim_mode(swim_base, 1);
> > + =A0 =A0 =A0 if (!get_swim_mode(swim_base)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "SWIM device not fou=
nd !\n");
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_iounmap;
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 /* set platform driver data */
> > +
> > + =A0 =A0 =A0 swd =3D kzalloc(sizeof(struct swim_priv), GFP_KERNEL)=
;
> > + =A0 =A0 =A0 if (!swd) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_iounmap;
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 platform_set_drvdata(dev, swd);
> > +
> > + =A0 =A0 =A0 swd->base =3D swim_base;
> > +
> > + =A0 =A0 =A0 ret =3D swim_floppy_init(swd);
> > + =A0 =A0 =A0 if (ret)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_kfree;
> > +
> > + =A0 =A0 =A0 return 0;
> > +
> > +out_kfree:
> > + =A0 =A0 =A0 platform_set_drvdata(dev, NULL);
> > + =A0 =A0 =A0 kfree(swd);
> > +out_iounmap:
> > + =A0 =A0 =A0 iounmap(swim_base);
> > +out_release_io:
> > + =A0 =A0 =A0 release_mem_region(res->start, resource_size(res));
> > +out:
> > + =A0 =A0 =A0 return ret;
> > +}
> > +
> > +static int __devexit swim_remove(struct platform_device *dev)
> > +{
> > + =A0 =A0 =A0 struct swim_priv *swd =3D platform_get_drvdata(dev);
> > + =A0 =A0 =A0 int drive;
> > + =A0 =A0 =A0 struct resource *res;
> > +
> > + =A0 =A0 =A0 blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
> > +
> > + =A0 =A0 =A0 for (drive =3D 0; drive < swd->floppy_count; drive++)=
 {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 del_gendisk(swd->unit[drive].disk);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 put_disk(swd->unit[drive].disk);
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 unregister_blkdev(FLOPPY_MAJOR, "fd");
> > +
> > + =A0 =A0 =A0 blk_cleanup_queue(swd->queue);
> > +
> > + =A0 =A0 =A0 /* eject floppies */
> > +
> > + =A0 =A0 =A0 for (drive =3D 0; drive < swd->floppy_count; drive++)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 floppy_eject(&swd->unit[drive]);
> > +
> > + =A0 =A0 =A0 iounmap(swd->base);
> > +
> > + =A0 =A0 =A0 res =3D platform_get_resource_byname(dev, IORESOURCE_=
MEM, "swim-regs");
> > + =A0 =A0 =A0 if (res)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 release_mem_region(res->start, resour=
ce_size(res));
> > +
> > + =A0 =A0 =A0 platform_set_drvdata(dev, NULL);
> > + =A0 =A0 =A0 kfree(swd);
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static struct platform_driver swim_driver =3D {
> > + =A0 =A0 =A0 .probe =A0=3D swim_probe,
> > + =A0 =A0 =A0 .remove =3D __devexit_p(swim_remove),
> > + =A0 =A0 =A0 .driver =A0 =3D {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =3D CARDNAME,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =A0=3D THIS_MODULE,
> > + =A0 =A0 =A0 },
> > +};
> > +
> > +static int __init swim_init(void)
> > +{
> > + =A0 =A0 =A0 printk(KERN_INFO "SWIM floppy driver %s\n", DRIVER_VE=
RSION);
> > +
> > + =A0 =A0 =A0 return platform_driver_register(&swim_driver);
> > +}
> > +module_init(swim_init);
> > +
> > +static void __exit swim_exit(void)
> > +{
> > + =A0 =A0 =A0 platform_driver_unregister(&swim_driver);
> > +}
> > +module_exit(swim_exit);
> > +
> > +MODULE_DESCRIPTION("Driver for SWIM floppy controller");
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Laurent Vivier <laurent@lvivier.info>");
> > +MODULE_ALIAS_BLOCKDEV_MAJOR(FLOPPY_MAJOR);
> > diff --git a/drivers/block/swim_asm.S b/drivers/block/swim_asm.S
> > new file mode 100644
> > index 0000000..c966820
> > --- /dev/null
> > +++ b/drivers/block/swim_asm.S
> > @@ -0,0 +1,247 @@
> > +/*
> > + * low-level functions for the SWIM floppy controller
> > + *
> > + * needs assembly language because is very timing dependent
> > + * this controller exists only on macintosh 680x0 based
> > + *
> > + * Copyright (C) 2004,2008 Laurent Vivier <Laurent@lvivier.info>
> > + *
> > + * based on Alastair Bridgewater SWIM analysis, 2001
> > + * based on netBSD IWM driver (c) 1997, 1998 Hauke Fath.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the License, or (at your option) any later version.
> > + *
> > + * 2004-08-21 (lv) - Initial implementation
> > + * 2008-11-05 (lv) - add get_swim_mode
> > + */
> > +
> > + =A0 =A0 =A0 .equ =A0 =A0write_data, =A0 =A0 0x0000
> > + =A0 =A0 =A0 .equ =A0 =A0write_mark, =A0 =A0 0x0200
> > + =A0 =A0 =A0 .equ =A0 =A0write_CRC, =A0 =A0 =A00x0400
> > + =A0 =A0 =A0 .equ =A0 =A0write_parameter,0x0600
> > + =A0 =A0 =A0 .equ =A0 =A0write_phase, =A0 =A00x0800
> > + =A0 =A0 =A0 .equ =A0 =A0write_setup, =A0 =A00x0a00
> > + =A0 =A0 =A0 .equ =A0 =A0write_mode0, =A0 =A00x0c00
> > + =A0 =A0 =A0 .equ =A0 =A0write_mode1, =A0 =A00x0e00
> > + =A0 =A0 =A0 .equ =A0 =A0read_data, =A0 =A0 =A00x1000
> > + =A0 =A0 =A0 .equ =A0 =A0read_mark, =A0 =A0 =A00x1200
> > + =A0 =A0 =A0 .equ =A0 =A0read_error, =A0 =A0 0x1400
> > + =A0 =A0 =A0 .equ =A0 =A0read_parameter, 0x1600
> > + =A0 =A0 =A0 .equ =A0 =A0read_phase, =A0 =A0 0x1800
> > + =A0 =A0 =A0 .equ =A0 =A0read_setup, =A0 =A0 0x1a00
> > + =A0 =A0 =A0 .equ =A0 =A0read_status, =A0 =A00x1c00
> > + =A0 =A0 =A0 .equ =A0 =A0read_handshake, 0x1e00
> > +
> > + =A0 =A0 =A0 .equ =A0 =A0o_side, 0
> > + =A0 =A0 =A0 .equ =A0 =A0o_track, 1
> > + =A0 =A0 =A0 .equ =A0 =A0o_sector, 2
> > + =A0 =A0 =A0 .equ =A0 =A0o_size, 3
> > + =A0 =A0 =A0 .equ =A0 =A0o_crc0, 4
> > + =A0 =A0 =A0 .equ =A0 =A0o_crc1, 5
> > +
> > + =A0 =A0 =A0 .equ =A0 =A0seek_time, 30000
> > + =A0 =A0 =A0 .equ =A0 =A0max_retry, 40
> > + =A0 =A0 =A0 .equ =A0 =A0sector_size, 512
> > +
> > + =A0 =A0 =A0 .global swim_read_sector_header
> > +swim_read_sector_header:
> > + =A0 =A0 =A0 link =A0 =A0%a6, #0
> > + =A0 =A0 =A0 moveml =A0%d1-%d5/%a0-%a4,%sp@-
> > + =A0 =A0 =A0 movel =A0 %a6@(0x0c), %a4
> > + =A0 =A0 =A0 bsr =A0 =A0 mfm_read_addrmark
> > + =A0 =A0 =A0 moveml =A0%sp@+, %d1-%d5/%a0-%a4
> > + =A0 =A0 =A0 unlk =A0 =A0%a6
> > + =A0 =A0 =A0 rts
> > +
> > +sector_address_mark:
> > + =A0 =A0 =A0 .byte =A0 0xa1, 0xa1, 0xa1, 0xfe
> > +sector_data_mark:
> > + =A0 =A0 =A0 .byte =A0 0xa1, 0xa1, 0xa1, 0xfb
> > +
> > +mfm_read_addrmark:
> > + =A0 =A0 =A0 movel =A0 %a6@(0x08), %a3
> > + =A0 =A0 =A0 lea =A0 =A0 %a3@(read_handshake), %a2
> > + =A0 =A0 =A0 lea =A0 =A0 %a3@(read_mark), %a3
> > + =A0 =A0 =A0 moveq =A0 #-1, %d0
> > + =A0 =A0 =A0 movew =A0 #seek_time, %d2
> > +
> > +wait_header_init:
> > + =A0 =A0 =A0 tstb =A0 =A0%a3@(read_error - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x18, %a3@(write_mode0 - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x01, %a3@(write_mode1 - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x01, %a3@(write_mode0 - read_mark)
> > + =A0 =A0 =A0 tstb =A0 =A0%a3@(read_error - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x08, %a3@(write_mode1 - read_mark)
> > +
> > + =A0 =A0 =A0 lea =A0 =A0 sector_address_mark, %a0
> > + =A0 =A0 =A0 moveq =A0 #3, %d1
> > +
> > +wait_addr_mark_byte:
> > +
> > + =A0 =A0 =A0 tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, wait_addr_mark_byte
> > + =A0 =A0 =A0 bpl =A0 =A0 header_exit
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %d3
> > + =A0 =A0 =A0 cmpb =A0 =A0%a0@+, %d3
> > + =A0 =A0 =A0 dbne =A0 =A0%d1, wait_addr_mark_byte
> > + =A0 =A0 =A0 bne =A0 =A0 wait_header_init
> > +
> > + =A0 =A0 =A0 moveq =A0 #max_retry, %d2
> > +
> > +amark0: =A0 =A0 =A0 =A0tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, amark0
> > + =A0 =A0 =A0 bpl =A0 =A0 signal_nonyb
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %a4@(o_track)
> > +
> > + =A0 =A0 =A0 moveq =A0 #max_retry, %d2
> > +
> > +amark1: =A0 =A0 =A0 =A0tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, amark1
> > + =A0 =A0 =A0 bpl =A0 =A0 signal_nonyb
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %a4@(o_side)
> > +
> > + =A0 =A0 =A0 moveq =A0 #max_retry, %d2
> > +
> > +amark2: =A0 =A0 =A0 =A0tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, amark2
> > + =A0 =A0 =A0 bpl =A0 =A0 signal_nonyb
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %a4@(o_sector)
> > +
> > + =A0 =A0 =A0 moveq =A0 #max_retry, %d2
> > +
> > +amark3: =A0 =A0 =A0 =A0tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, amark3
> > + =A0 =A0 =A0 bpl =A0 =A0 signal_nonyb
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %a4@(o_size)
> > +
> > + =A0 =A0 =A0 moveq =A0 #max_retry, %d2
> > +
> > +crc0: =A0tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, crc0
> > + =A0 =A0 =A0 bpl =A0 =A0 signal_nonyb
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %a4@(o_crc0)
> > +
> > + =A0 =A0 =A0 moveq =A0 #max_retry, %d2
> > +
> > +crc1: =A0tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, crc1
> > + =A0 =A0 =A0 bpl =A0 =A0 signal_nonyb
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %a4@(o_crc1)
> > +
> > + =A0 =A0 =A0 tstb =A0 =A0%a3@(read_error - read_mark)
> > +
> > +header_exit:
> > + =A0 =A0 =A0 moveq =A0 #0, %d0
> > + =A0 =A0 =A0 moveb =A0 #0x18, %a3@(write_mode0 - read_mark)
> > + =A0 =A0 =A0 rts
> > +signal_nonyb:
> > + =A0 =A0 =A0 moveq =A0 #-1, %d0
> > + =A0 =A0 =A0 moveb =A0 #0x18, %a3@(write_mode0 - read_mark)
> > + =A0 =A0 =A0 rts
> > +
> > + =A0 =A0 =A0 .global swim_read_sector_data
> > +swim_read_sector_data:
> > + =A0 =A0 =A0 link =A0 =A0%a6, #0
> > + =A0 =A0 =A0 moveml =A0%d1-%d5/%a0-%a5,%sp@-
> > + =A0 =A0 =A0 movel =A0 %a6@(0x0c), %a4
> > + =A0 =A0 =A0 bsr =A0 =A0 mfm_read_data
> > + =A0 =A0 =A0 moveml =A0%sp@+, %d1-%d5/%a0-%a5
> > + =A0 =A0 =A0 unlk =A0 =A0%a6
> > + =A0 =A0 =A0 rts
> > +
> > +mfm_read_data:
> > + =A0 =A0 =A0 movel =A0 %a6@(0x08), %a3
> > + =A0 =A0 =A0 lea =A0 =A0 %a3@(read_handshake), %a2
> > + =A0 =A0 =A0 lea =A0 =A0 %a3@(read_data), %a5
> > + =A0 =A0 =A0 lea =A0 =A0 %a3@(read_mark), %a3
> > + =A0 =A0 =A0 movew =A0 #seek_time, %d2
> > +
> > +wait_data_init:
> > + =A0 =A0 =A0 tstb =A0 =A0%a3@(read_error - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x18, %a3@(write_mode0 - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x01, %a3@(write_mode1 - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x01, %a3@(write_mode0 - read_mark)
> > + =A0 =A0 =A0 tstb =A0 =A0%a3@(read_error - read_mark)
> > + =A0 =A0 =A0 moveb =A0 #0x08, %a3@(write_mode1 - read_mark)
> > +
> > + =A0 =A0 =A0 lea =A0 =A0 sector_data_mark, %a0
> > + =A0 =A0 =A0 moveq =A0 #3, %d1
> > +
> > + =A0 =A0 =A0 /* wait data address mark */
> > +
> > +wait_data_mark_byte:
> > +
> > + =A0 =A0 =A0 tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, wait_data_mark_byte
> > + =A0 =A0 =A0 bpl =A0 =A0 data_exit
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %d3
> > + =A0 =A0 =A0 cmpb =A0 =A0%a0@+, %d3
> > + =A0 =A0 =A0 dbne =A0 =A0%d1, wait_data_mark_byte
> > + =A0 =A0 =A0 bne =A0 =A0 wait_data_init
> > +
> > + =A0 =A0 =A0 /* read data */
> > +
> > + =A0 =A0 =A0 tstb =A0 =A0%a3@(read_error - read_mark)
> > +
> > + =A0 =A0 =A0 movel =A0 #sector_size-1, %d4 =A0 =A0 =A0 =A0 =A0 =A0=
 /* sector size */
> > +read_new_data:
> > + =A0 =A0 =A0 movew =A0 #max_retry, %d2
> > +read_data_loop:
> > + =A0 =A0 =A0 moveb =A0 %a2@, %d5
> > + =A0 =A0 =A0 andb =A0 =A0#0xc0, %d5
> > + =A0 =A0 =A0 dbne =A0 =A0%d2, read_data_loop
> > + =A0 =A0 =A0 beq =A0 =A0 data_exit
> > + =A0 =A0 =A0 moveb =A0 %a5@, %a4@+
> > + =A0 =A0 =A0 andb =A0 =A0#0x40, %d5
> > + =A0 =A0 =A0 dbne =A0 =A0%d4, read_new_data
> > + =A0 =A0 =A0 beq =A0 =A0 exit_loop
> > + =A0 =A0 =A0 moveb =A0 %a5@, %a4@+
> > + =A0 =A0 =A0 dbra =A0 =A0%d4, read_new_data
> > +exit_loop:
> > +
> > + =A0 =A0 =A0 /* read CRC */
> > +
> > + =A0 =A0 =A0 movew =A0 #max_retry, %d2
> > +data_crc0:
> > +
> > + =A0 =A0 =A0 tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, data_crc0
> > + =A0 =A0 =A0 bpl =A0 =A0 data_exit
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %d5
> > +
> > + =A0 =A0 =A0 moveq =A0 #max_retry, %d2
> > +
> > +data_crc1:
> > +
> > + =A0 =A0 =A0 tstb =A0 =A0%a2@
> > + =A0 =A0 =A0 dbmi =A0 =A0%d2, data_crc1
> > + =A0 =A0 =A0 bpl =A0 =A0 data_exit
> > +
> > + =A0 =A0 =A0 moveb =A0 %a3@, %d5
> > +
> > + =A0 =A0 =A0 tstb =A0 =A0%a3@(read_error - read_mark)
> > +
> > + =A0 =A0 =A0 moveb =A0 #0x18, %a3@(write_mode0 - read_mark)
> > +
> > + =A0 =A0 =A0 /* return number of bytes read */
> > +
> > + =A0 =A0 =A0 movel =A0 #sector_size, %d0
> > + =A0 =A0 =A0 addw =A0 =A0#1, %d4
> > + =A0 =A0 =A0 subl =A0 =A0%d4, %d0
> > + =A0 =A0 =A0 rts
> > +data_exit:
> > + =A0 =A0 =A0 moveb =A0 #0x18, %a3@(write_mode0 - read_mark)
> > + =A0 =A0 =A0 moveq =A0 #-1, %d0
> > + =A0 =A0 =A0 rts
> > --
> > 1.6.1.3
> >
> >
>=20
>=20
>=20
> --=20
> Gr{oetje,eeting}s,
>=20
> 						Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> 							    -- Linus Torvalds

--=20
Jens Axboe
