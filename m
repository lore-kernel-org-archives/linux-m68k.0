From: Laurent@lvivier.info
Subject: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sat,  1 Nov 2008 10:43:11 +0100
Message-ID: <12255325912043-git-send-email-Laurent@lvivier.info>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp6-g19.free.fr ([212.27.42.36]:33192 "EHLO smtp6-g19.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751210AbYKAJnQ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 1 Nov 2008 05:43:16 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@lvivier.info>

From: Laurent Vivier <Laurent@lvivier.info>

This patch is a port of the driver I wrote for kernel 2.2.

It allows to read data from a floppy, but not to write to, and to eject the
floppy (useful on our Mac without eject button).

I have tested it on a Quadra 800, but it is supposed to work on:

II, IIci, IIsi, IIvx, IIx, IIcx, SE/30,
PowerBook 100, PowerBook 140, PowerBook 145, PowerBook 160,
PowerBook 165, PowerBook 165c, PowerBook 170, PowerBook 180,
PowerBook 180c, PowerBook 190, PowerBook 190cs, PowerBook 500,
Performa 460, Performa 550, LC II, LC III, LC 520, Color Classic,
Color Classic II, ClassicII,
Quadra 700, Quadra 800, Quadra 650, Quadra 605, Quadra 610,
Centris 610, Quadra 630, Performa 580, LC 475, LC 575,

Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
---
 arch/m68k/mac/Makefile   |    2 
 arch/m68k/mac/config.c   |    2 
 arch/m68k/mac/swim.c     |  111 +++++
 arch/m68k/mac/via.c      |    1 
 drivers/block/Kconfig    |   16 
 drivers/block/Makefile   |    3 
 drivers/block/swim.c     |  886 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/block/swim_asm.S |  295 +++++++++++++++
 8 files changed, 1315 insertions(+), 1 deletion(-)

Index: linux-2.6/arch/m68k/mac/Makefile
===================================================================
--- linux-2.6.orig/arch/m68k/mac/Makefile	2008-11-01 06:13:53.000000000 +0100
+++ linux-2.6/arch/m68k/mac/Makefile	2008-11-01 06:14:39.000000000 +0100
@@ -3,4 +3,4 @@
 #
 
 obj-y		:= config.o macints.o iop.o via.o oss.o psc.o \
-			baboon.o macboing.o debug.o misc.o
+			baboon.o macboing.o debug.o misc.o swim.o
Index: linux-2.6/arch/m68k/mac/config.c
===================================================================
--- linux-2.6.orig/arch/m68k/mac/config.c	2008-11-01 06:13:53.000000000 +0100
+++ linux-2.6/arch/m68k/mac/config.c	2008-11-01 06:14:39.000000000 +0100
@@ -70,6 +70,7 @@
 extern void oss_init(void);
 extern void psc_init(void);
 extern void baboon_init(void);
+extern void swim_init(void);
 
 extern void mac_mksound(unsigned int, unsigned int);
 
@@ -815,6 +816,7 @@
 	oss_init();
 	psc_init();
 	baboon_init();
+	swim_init();
 }
 
 static void __init mac_report_hardware(void)
Index: linux-2.6/arch/m68k/mac/swim.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux-2.6/arch/m68k/mac/swim.c	2008-11-01 06:14:39.000000000 +0100
@@ -0,0 +1,111 @@
+/*
+ * Driver for SWIM (Sander. Woz Integrated Machine) floppy controller
+ *
+ * Copyright (C) 2004,2008 Laurent Vivier <Laurent@lvivier.info>
+ *
+ * based on netBSD IWM driver (c) 1997, 1998 Hauke Fath.
+ * based  on Alastair Bridgewater SWIM analysis, 2001
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * 2004-09-02 (lv) - Initial implementation
+ * 2008-10-30 (lv) - Port to kernel 2.6
+ */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#include <asm/macintosh.h>
+#include <asm/mac_via.h>
+
+volatile __u8 *SWIMBase;
+EXPORT_SYMBOL(SWIMBase);
+
+#define writePhase	*(SWIMBase + 0x0800)
+#define readPhase	*(SWIMBase + 0x1800)
+
+/*
+ * According to IWM netBSD driver, there are four kinds of SWIM:
+ *
+ * - QUADRA, QUADRA2, P580 -> SWIM base address is VIA1 + 0x1E000;
+ * - II, PB, LC		   -> SWIM base address is VIA1 + 0x16000;
+ * - IIfx, Q900, Q950	   -> managed by IOP driver
+ * - AV			   -> not managed
+ *
+ */
+
+void __init swim_init(void)
+{
+	switch(macintosh_config->ident)
+	{
+	case MAC_MODEL_Q700:
+	case MAC_MODEL_Q800:
+	case MAC_MODEL_Q650:
+	case MAC_MODEL_Q605:
+	case MAC_MODEL_Q605_ACC:
+	case MAC_MODEL_Q610:
+	case MAC_MODEL_Q630:
+	case MAC_MODEL_P475:
+	case MAC_MODEL_P475F:
+	case MAC_MODEL_P575:
+	case MAC_MODEL_P588:
+		SWIMBase =  (__u8*)(VIA1_BASE + 0x1E000);
+		break;
+	case MAC_MODEL_II:
+	case MAC_MODEL_IIX:
+	case MAC_MODEL_IICX:
+	case MAC_MODEL_SE30:
+	case MAC_MODEL_PB140:
+	case MAC_MODEL_PB145:
+	case MAC_MODEL_PB160:
+	case MAC_MODEL_PB165:
+	case MAC_MODEL_PB165C:
+	case MAC_MODEL_PB170:
+	case MAC_MODEL_PB180:
+	case MAC_MODEL_PB180C:
+	case MAC_MODEL_PB190:
+	case MAC_MODEL_PB520:
+	case MAC_MODEL_PB150:
+	case MAC_MODEL_PB210:
+	case MAC_MODEL_PB230:
+	case MAC_MODEL_PB250:
+	case MAC_MODEL_PB270C:
+	case MAC_MODEL_PB280:
+	case MAC_MODEL_PB280C:
+	case MAC_MODEL_IICI:
+	case MAC_MODEL_IISI:
+	case MAC_MODEL_IIVI:
+	case MAC_MODEL_IIVX:
+	case MAC_MODEL_P600:
+	case MAC_MODEL_P460:
+	case MAC_MODEL_P550:
+	case MAC_MODEL_TV:
+	case MAC_MODEL_LCII:
+	case MAC_MODEL_LCIII:
+	case MAC_MODEL_P520:
+	case MAC_MODEL_CLII:
+	case MAC_MODEL_CCL:
+		SWIMBase =  (__u8*)(VIA1_BASE + 0x16000);
+		break;
+	case MAC_MODEL_IIFX:
+	case MAC_MODEL_Q900:
+	case MAC_MODEL_Q950:
+		SWIMBase = NULL;
+		break;
+	default:
+		SWIMBase = NULL;
+		printk("SWIM: unknown Macintosh: report to maintainer !\n");
+		break;
+	}
+
+	if (SWIMBase == NULL)
+		return;
+
+	printk("SWIM floppy controller base at 0x%p\n", SWIMBase);
+}
Index: linux-2.6/arch/m68k/mac/via.c
===================================================================
--- linux-2.6.orig/arch/m68k/mac/via.c	2008-11-01 06:13:53.000000000 +0100
+++ linux-2.6/arch/m68k/mac/via.c	2008-11-01 06:14:39.000000000 +0100
@@ -36,6 +36,7 @@
 #include <asm/mac_psc.h>
 
 volatile __u8 *via1, *via2;
+EXPORT_SYMBOL(via1);
 int rbv_present;
 int via_alt_mapping;
 EXPORT_SYMBOL(via_alt_mapping);
Index: linux-2.6/drivers/block/Kconfig
===================================================================
--- linux-2.6.orig/drivers/block/Kconfig	2008-11-01 06:13:53.000000000 +0100
+++ linux-2.6/drivers/block/Kconfig	2008-11-01 06:14:39.000000000 +0100
@@ -44,6 +44,22 @@
 	  If you have a SWIM-3 (Super Woz Integrated Machine 3; from Apple)
 	  floppy controller, say Y here. Most commonly found in PowerMacs.
 
+config BLK_DEV_SWIM
+	tristate "Support for SWIM Macintosh floppy"
+	depends on M68K && MAC
+	help
+           You should select this option, if you want floppy support and
+           you have one of following macintoshes:
+
+           II, IIci, IIsi, IIvx, IIx, IIcx, SE/30,
+           PowerBook 100, PowerBook 140, PowerBook 145, PowerBook 160,
+           PowerBook 165, PowerBook 165c, PowerBook 170, PowerBook 180,
+           PowerBook 180c, PowerBook 190, PowerBook 190cs, PowerBook 500,
+           Performa 460, Performa 550, LC II, LC III, LC 520, Color Classic,
+           Color Classic II, ClassicII,
+           Quadra 700, Quadra 800, Quadra 650, Quadra 605, Quadra 610,
+           Centris 610, Quadra 630, Performa 580, LC 475, LC 575,
+
 config AMIGA_Z2RAM
 	tristate "Amiga Zorro II ramdisk support"
 	depends on ZORRO
Index: linux-2.6/drivers/block/Makefile
===================================================================
--- linux-2.6.orig/drivers/block/Makefile	2008-11-01 06:13:53.000000000 +0100
+++ linux-2.6/drivers/block/Makefile	2008-11-01 06:14:39.000000000 +0100
@@ -6,6 +6,7 @@
 # 
 
 obj-$(CONFIG_MAC_FLOPPY)	+= swim3.o
+obj-$(CONFIG_BLK_DEV_SWIM)	+= swim_mod.o
 obj-$(CONFIG_BLK_DEV_FD)	+= floppy.o
 obj-$(CONFIG_AMIGA_FLOPPY)	+= amiflop.o
 obj-$(CONFIG_PS3_DISK)		+= ps3disk.o
@@ -32,3 +33,5 @@
 obj-$(CONFIG_BLK_DEV_HD)	+= hd.o
 
 obj-$(CONFIG_XEN_BLKDEV_FRONTEND)	+= xen-blkfront.o
+
+swim_mod-objs	:= swim.o swim_asm.o
Index: linux-2.6/drivers/block/swim.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux-2.6/drivers/block/swim.c	2008-11-01 10:36:05.000000000 +0100
@@ -0,0 +1,886 @@
+/*
+ * Driver for SWIM (Sander. Woz Integrated Machine) floppy controller
+ *
+ * Copyright (C) 2004,2008 Laurent Vivier <Laurent@lvivier.info>
+ *
+ * based on Alastair Bridgewater SWIM analysis, 2001
+ * based on SWIM3 driver (c) Paul Mackerras, 1996
+ * based on netBSD IWM driver (c) 1997, 1998 Hauke Fath.
+ *
+ * Supported Macintoshes:
+ *
+ *   II, IIci, IIsi, IIvx, IIx, IIcx, SE/30,
+ *   PowerBook 100, PowerBook 140, PowerBook 145, PowerBook 160,
+ *   PowerBook 165, PowerBook 165c, PowerBook 170, PowerBook 180,
+ *   PowerBook 180c, PowerBook 190, PowerBook 190cs, PowerBook 500,
+ *   Performa 460, Performa 550, LC II, LC III, LC 520, Color Classic,
+ *   Color Classic II, ClassicII,
+ *   Quadra 700, Quadra 800, Quadra 650, Quadra 605, Quadra 610,
+ *   Centris 610, Quadra 630, Performa 580, LC 475, LC 575,
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * 2004-08-21 (lv) - Initial implementation
+ * 2008-10-30 (lv) - Port to 2.6
+ */
+
+#include <linux/module.h>
+#include <linux/fd.h>
+#include <linux/blkdev.h>
+#include <linux/hdreg.h>
+#include <linux/kernel.h>
+#include <linux/delay.h>
+
+#include <asm/mac_via.h>
+
+static char *base __devinitdata = 0;
+module_param(base, charp, 0444);
+MODULE_PARM_DESC(base, "Base address of SWIM chip.");
+
+struct sector_header {
+	unsigned char side;
+	unsigned char track;
+	unsigned char sector;
+	unsigned char size;
+	unsigned char crc0;
+	unsigned char crc1;
+} __attribute__((packed));
+
+extern int swim_mode(int enable);
+extern int swim_read_sector_header(struct sector_header* header);
+extern int swim_read_sector_data(unsigned char *data);
+
+#define DRIVER_VERSION "Version 0.2 (2008-10-30)"
+
+#define REG(x)	volatile unsigned char x, x ## _pad[0x200 - 1];
+
+struct swim {
+	REG(write_data)
+	REG(write_mark)
+	REG(write_CRC)
+	REG(write_parameter)
+	REG(write_phase)
+	REG(write_setup)
+	REG(write_mode0)
+	REG(write_mode1)
+
+	REG(read_data)
+	REG(read_mark)
+	REG(read_error)
+	REG(read_parameter)
+	REG(read_phase)
+	REG(read_setup)
+	REG(read_status)
+	REG(read_handshake)
+} __attribute__((packed));
+
+extern struct swim *SWIMBase;
+
+#define swim_write(reg, v) 	SWIMBase->write_##reg = v
+#define swim_read(reg)		SWIMBase->read_##reg
+
+/* bits in phase register */
+
+#define SEEK_POSITIVE	0x070
+#define SEEK_NEGATIVE	0x074
+#define STEP		0x071
+#define MOTOR_ON	0x072
+#define MOTOR_OFF	0x076
+#define INDEX		0x073
+#define EJECT		0x077
+#define SETMFM		0x171
+#define SETGCR		0x175
+
+#define RELAX		0x033
+#define LSTRB		0x008
+
+#define CA_MASK		0x077
+
+/* Select values for swim_select and swim_readbit */
+
+#define STEP_DIR	0x070
+#define STEPPING	0x071
+#define MOTOR_ON	0x072
+#define ELAX		0x073	/* also eject in progress */
+#define READ_DATA_0	0x074
+#define TWOMEG_DRIVE	0x075
+#define SINGLE_SIDED	0x076
+#define DRIVE_PRESENT	0x077
+#define DISK_IN		0x170
+#define WRITE_PROT	0x171
+#define TRACK_ZERO	0x172
+#define TACHO		0x173
+#define READ_DATA_1	0x174
+#define MFM_MODE	0x175
+#define SEEK_COMPLETE	0x176
+#define ONEMEG_MEDIA	0x177
+
+/* Bits in handshake register */
+
+#define MARK_BYTE	0x01
+#define CRC_ZERO	0x02
+#define RDDATA		0x04
+#define SENSE		0x08
+#define MOTEN		0x10
+#define ERROR		0x20
+#define DAT2BYTE	0x40
+#define DAT1BYTE	0x80
+
+/* bits in setup register */
+
+#define S_INV_WDATA	0x01
+#define S_3_5_SELECT	0x02
+#define S_GCR		0x04
+#define S_FCLK_DIV2	0x08
+#define S_ERROR_CORR	0x10
+#define S_IBM_DRIVE	0x20
+#define S_GCR_WRITE	0x40
+#define S_TIMEOUT	0x80
+
+/* bits in mode register */
+
+#define CLFIFO		0x01
+#define ENBL1		0x02
+#define ENBL2		0x04
+#define ACTION		0x08
+#define	WRITE_MODE	0x10
+#define	HEDSEL		0x20
+#define	MOTON		0x80
+
+
+/*----------------------------------------------------------------------------*/
+
+typedef enum {
+	INTERNAL_DRIVE = 0x02,
+	EXTERNAL_DRIVE = 0x04,
+} drive_location_t;
+
+typedef enum {
+	DD_MEDIA,
+	HD_MEDIA,
+} media_type_t;
+
+struct floppy_state {
+
+	/* physical properties */
+
+	drive_location_t location;	/* internal or external drive */
+	int		 head_number;	/* single- or double-sided drive */
+
+	/* media */
+
+	int		 disk_in;
+	int		 ejected;
+	media_type_t	 type;
+	int		 write_protected;
+
+	int		 total_secs;
+	int		 secpercyl;
+	int		 secpertrack;
+
+	/* in-use information */
+
+	int		track;
+	int		ref_count;
+
+	struct gendisk *disk;
+};
+
+typedef enum {
+	OFF,
+	ON,
+} motor_action_t;
+
+typedef enum {
+	LOWER_HEAD = 0,
+	UPPER_HEAD = 1,
+} head_t;
+
+static struct request_queue *floppy_queue;
+
+static DEFINE_SPINLOCK(swim_lock);
+
+#define FD_MAX_UNIT	2
+
+static struct floppy_state unit[FD_MAX_UNIT];
+static int floppy_count = 0;
+
+static inline void swim_select(int sel)
+{
+	swim_write(phase, RELAX);
+
+	if (sel & 0x100)
+		via1[vBufA] |= VIA1A_vHeadSel;
+	else
+		via1[vBufA] &= ~VIA1A_vHeadSel;
+
+	swim_write(phase, sel & CA_MASK);
+}
+
+static inline void swim_action(int action)
+{
+	swim_select(action);
+	udelay(1);
+	swim_write(phase, (LSTRB<<4) | LSTRB);
+	udelay(1);
+	swim_write(phase, (LSTRB<<4) | ((~LSTRB) & 0x0F));
+	udelay(1);
+	swim_write(phase, RELAX);
+}
+
+static inline int swim_readbit(int bit)
+{
+	int stat;
+
+	swim_select(bit);
+
+	udelay(10);
+
+	stat = swim_read(handshake);
+
+	swim_write(phase, RELAX);
+
+	return (stat & SENSE) == 0;
+}
+
+static inline void swim_drive(drive_location_t location)
+{
+	if (location == INTERNAL_DRIVE) {
+		swim_write(mode0, EXTERNAL_DRIVE);	/* clear drive 1 bit */
+		swim_write(mode1, INTERNAL_DRIVE);	/* set drive 0 bit */
+	} else if (location == EXTERNAL_DRIVE) {
+		swim_write(mode0, INTERNAL_DRIVE);	/* clear drive 0 bit */
+		swim_write(mode1, EXTERNAL_DRIVE);	/* set drive 1 bit */
+	}
+}
+
+static inline void swim_motor(motor_action_t action)
+{
+	if (action == ON) {
+		int i;
+
+		swim_action(MOTOR_ON);
+
+		for (i = 0; i < 2*HZ; i++) {
+			if (swim_readbit(MOTOR_ON))
+				break;
+			current->state = TASK_INTERRUPTIBLE;
+			schedule_timeout(1);
+		}
+	} else if (action == OFF)
+		swim_action(MOTOR_OFF);
+}
+
+static inline void swim_eject(void)
+{
+	int i;
+
+	swim_action(EJECT);
+
+	for (i = 0; i < 2*HZ; i++) {
+		if (swim_readbit(RELAX))
+			break;
+		current->state = TASK_INTERRUPTIBLE;
+		schedule_timeout(1);
+	}
+}
+
+static inline void swim_head(head_t head)
+{
+	/* FIXME: IWM reads bits SEL, CA2, CA1 to wait drive ready... */
+
+	/* wait drive is ready */
+
+	if (head == UPPER_HEAD)
+		swim_select(READ_DATA_1);
+	else if (head == LOWER_HEAD)
+		swim_select(READ_DATA_0);
+}
+
+static inline int swim_step(void)
+{
+	int wait;
+
+	swim_action(STEP);
+
+	for (wait = 0; wait < 80; wait++) {
+
+		current->state = TASK_INTERRUPTIBLE;
+		schedule_timeout(1);
+
+		if (!swim_readbit(STEPPING))
+			return 0;
+	}
+
+	return -1;
+}
+
+static inline int swim_track00(void)
+{
+	int try;
+
+	swim_motor(ON);
+
+	swim_action(SEEK_NEGATIVE);
+
+	for (try = 0; try < 100; try++) {
+
+		if (swim_readbit(TRACK_ZERO))
+			break;
+
+		if (swim_step())
+			return -1;
+	}
+
+	if (swim_readbit(TRACK_ZERO))
+		return 0;
+
+	return -1;
+}
+
+static inline int swim_seek(int step)
+{
+	if (step == 0)
+		return 0;
+
+	swim_motor(ON);
+
+	if (step < 0) {
+		swim_action(SEEK_NEGATIVE);
+		step = -step;
+	} else
+		swim_action(SEEK_POSITIVE);
+
+	for ( ; step > 0; step--) {
+		if (swim_step())
+			return -1;
+	}
+
+	return 0;
+}
+
+static inline int swim_track(struct floppy_state *fs,  int track)
+{
+	int ret;
+
+	ret = swim_seek(track - fs->track);
+
+	if (ret == 0)
+		fs->track = track;
+	else {
+		swim_track00();
+		fs->track = 0;
+	}
+
+	return ret;
+}
+
+static int floppy_eject(struct floppy_state *fs)
+{
+	swim_drive(fs->location);
+	swim_motor(OFF);
+	swim_eject();
+
+	fs->disk_in = 0;
+	fs->ejected = 1;
+
+	return 0;
+}
+
+static inline int swim_read_sector(struct floppy_state *fs,
+				   int side, int track,
+				   int sector, unsigned char *buffer)
+{
+	unsigned long flags;
+	struct sector_header header;
+	int ret = -1;
+	short i;
+
+	swim_track(fs, track);
+
+	swim_write(mode1, MOTON);
+	swim_head(side);
+	swim_write(mode0, side);
+
+	local_save_flags(flags);
+	local_irq_disable();
+	for (i = 0; i < 20000; i++) {
+		ret = swim_read_sector_header(&header);
+		if ( !ret && (header.sector == sector) ) {
+
+			/* found */
+
+			ret = swim_read_sector_data(buffer);
+			break;
+		}
+	}
+	swim_write(mode0, MOTON);
+	local_irq_restore(flags);
+
+	if ( (header.side != side)  || (header.track != track) ||
+	     (header.sector != sector) )
+		return 0;
+
+	return ret;
+}
+
+static int floppy_read_sectors(struct floppy_state *fs,
+			       int req_sector, int sectors_nb,
+			       unsigned char* buffer)
+{
+	int ret;
+	int side;
+	int track;
+	int sector;
+	int i;
+	int try;
+
+	swim_drive(fs->location);
+	for (i = req_sector; i < req_sector + sectors_nb; i++) {
+		int x;
+		track = i / fs->secpercyl;
+		x = i % fs->secpercyl;
+		side = x / fs->secpertrack;
+		sector = x % fs->secpertrack + 1;
+
+		try = 5;
+		do {
+			ret = swim_read_sector(fs, side, track, sector,
+						buffer);
+			if (try-- == 0)
+				return -1;
+		} while(ret != 512);
+
+		buffer += ret;
+	}
+
+	return 0;
+}
+
+static void redo_fd_request(void)
+{
+	struct request *req;
+	struct floppy_state *fs;
+
+	while((req = elv_next_request(floppy_queue))) {
+
+		fs = &unit[(long)req->rq_disk->private_data];
+		if (req->sector < 0 || req->sector >= fs->total_secs) {
+			end_request(req, 0);
+			continue;
+		}
+		if (req->current_nr_sectors == 0) {
+			end_request(req, 1);
+			continue;
+		}
+		if (!fs->disk_in) {
+			end_request(req, 0);
+			continue;
+		}
+		if (rq_data_dir(req) == WRITE) {
+			if (fs->write_protected) {
+                                end_request(req, 0);
+                                continue;
+                        }
+		}
+		switch(rq_data_dir(req)) {
+		case WRITE:
+			/* NOT IMPLEMENTED */
+			end_request(req, 0);
+			break;
+		case READ:
+			if (floppy_read_sectors(fs, req->sector,
+						req->current_nr_sectors,
+						req->buffer)) {
+				end_request(req, 0);
+				continue;
+			}
+			req->nr_sectors -= req->current_nr_sectors;
+			req->sector += req->current_nr_sectors;
+			req->buffer += req->current_nr_sectors * 512;
+			end_request(req, 1);
+			break;
+		}
+	}
+}
+
+static void do_fd_request(struct request_queue * q)
+{
+	redo_fd_request();
+}
+
+static struct floppy_struct floppy_type[4] = {
+	{    0, 0,0, 0,0,0x00,0x00,0x00,0x00,NULL },	/*  0 no testing    */
+	{  720, 9,1,80,0,0x2A,0x02,0xDF,0x50,NULL },	/*  3 360KB SS 3.5" */
+	{ 1440, 9,2,80,0,0x2A,0x02,0xDF,0x50,NULL },	/*  4 720KB 3.5"    */
+	{ 2880,18,2,80,0,0x1B,0x00,0xCF,0x6C,NULL },    /*  7 1.44MB 3.5"   */
+};
+
+static int get_floppy_geometry(int drive, int type, struct floppy_struct **g)
+{
+	struct floppy_state *fs;
+	fs = &unit[drive];
+
+	if (drive > floppy_count)
+		return -ENODEV;
+
+	if (type >= ARRAY_SIZE(floppy_type))
+		return -EINVAL;
+
+	if (type)
+		*g = &floppy_type[type];
+	else if (fs->type == HD_MEDIA) /* High-Density media */
+		*g = &floppy_type[3];
+	else if (fs->head_number == 2) /* double-sided */
+		*g = &floppy_type[2];
+	else
+		*g = &floppy_type[1];
+
+	return 0;
+}
+
+static void setup_medium(int drive)
+{
+	struct floppy_state *fs;
+	fs = &unit[drive];
+
+	if (swim_readbit(DISK_IN)) {
+		struct floppy_struct *g;
+		fs->disk_in = 1;
+		fs->write_protected = swim_readbit(WRITE_PROT);
+		fs->type = swim_readbit(ONEMEG_MEDIA);
+
+		if (swim_track00())
+			printk(KERN_ERR
+				"SWIM: cannot move floppy head to track 0\n");
+
+		swim_track00();
+
+		get_floppy_geometry(drive, 0, &g);
+		fs->total_secs = g->size;
+		fs->secpercyl = g->head * g->sect;
+		fs->secpertrack = g->sect;
+		fs->track = 0;
+	} else {
+		fs->disk_in = 0;
+	}
+}
+
+static int floppy_open(struct block_device *bdev, fmode_t mode)
+{
+	int drive = MINOR(bdev->bd_dev) & 3;
+	struct floppy_state *fs;
+	int err;
+
+	if (drive >= floppy_count)
+		return -ENODEV;
+
+	fs = &unit[drive];
+
+	if (fs->ref_count == -1 || (fs->ref_count && mode & FMODE_EXCL))
+		return -EBUSY;
+
+	if (mode & FMODE_EXCL)
+		fs->ref_count = -1;
+	else
+		fs->ref_count++;
+
+	swim_write(setup, S_IBM_DRIVE  | S_FCLK_DIV2);
+	udelay(10);
+	swim_drive(INTERNAL_DRIVE);
+	swim_motor(ON);
+	swim_action(SETMFM);
+	if (fs->ejected)
+		setup_medium(drive);
+	if (!fs->disk_in) {
+		err = -ENXIO;
+		goto out;
+	}
+
+	if (mode & FMODE_NDELAY)
+		return 0;
+
+	if (mode & (FMODE_READ|FMODE_WRITE)) {
+		check_disk_change(bdev);
+		if ((mode & FMODE_WRITE) && fs->write_protected) {
+			err = -EROFS;
+			goto out;
+		}
+	}
+	return 0;
+out:
+	if (fs->ref_count < 0)
+		fs->ref_count = 0;
+	else if (fs->ref_count > 0)
+		--fs->ref_count;
+
+	if (fs->ref_count == 0)
+		swim_motor(OFF);
+	return err;
+}
+
+static int floppy_release(struct gendisk *disk, fmode_t mode)
+{
+	struct floppy_state *fs = &unit[(long)disk->private_data];
+
+	if (fs->ref_count < 0)
+		fs->ref_count = 0;
+	else if (fs->ref_count > 0)
+		--fs->ref_count;
+
+	if (fs->ref_count == 0)
+		swim_motor(OFF);
+
+	return 0;
+}
+
+static int floppy_ioctl(struct block_device *bdev, fmode_t mode,
+			unsigned int cmd, unsigned long param)
+{
+	struct floppy_state *fs;
+	int err;
+	int drive = (long)bdev->bd_disk->private_data;
+
+	if (drive >= floppy_count)
+		return -ENODEV;
+
+	if ((cmd & 0x80) && !capable(CAP_SYS_ADMIN))
+			return -EPERM;
+
+	fs = &unit[drive];
+
+	switch (cmd) {
+	case FDEJECT:
+		if (fs->ref_count != 1)
+			return -EBUSY;
+		err = floppy_eject(fs);
+		return err;
+
+	case FDGETPRM:
+		if (copy_to_user((void *) param, (void *) &floppy_type,
+				 sizeof(struct floppy_struct)))
+			return -EFAULT;
+		break;
+
+	default:
+		printk(KERN_DEBUG "SWIM floppy_ioctl: unknown cmd %d\n",
+		       cmd);
+		return -ENOSYS;
+	}
+	return 0;
+}
+
+static int floppy_getgeo(struct block_device *bdev, struct hd_geometry *geo)
+{
+	int drive = (long)bdev->bd_disk->private_data;
+	struct floppy_struct *g;
+	int ret;
+
+	ret = get_floppy_geometry(drive, 0, &g);
+	if (ret)
+		return ret;
+
+	geo->heads = g->head;
+	geo->sectors = g->sect;
+	geo->cylinders = g->track;
+
+	return 0;
+}
+
+static int floppy_check_change(struct gendisk *disk)
+{
+	struct floppy_state *fs;
+	int drive = (long)disk->private_data;
+
+	if (drive >= floppy_count)
+		return 0;
+
+	fs = &unit[drive];
+
+	return fs->ejected;
+}
+
+static int floppy_revalidate(struct gendisk *disk)
+{
+	struct floppy_state *fs;
+	int drive = (long)disk->private_data;
+
+	if (drive >= floppy_count)
+		return 0;
+
+	fs = &unit[drive];
+
+	swim_drive(fs->location);
+
+	if (fs->ejected)
+		setup_medium(drive);
+
+	if (!fs->disk_in) {
+		swim_motor(OFF);
+	} else {
+		fs->ejected = 0;
+	}
+
+	return !fs->disk_in;
+}
+
+static struct block_device_operations floppy_fops = {
+	.owner		= THIS_MODULE,
+	.open		= floppy_open,
+	.release	= floppy_release,
+	.locked_ioctl	= floppy_ioctl,
+	.getgeo		= floppy_getgeo,
+	.media_changed	= floppy_check_change,
+	.revalidate_disk= floppy_revalidate,
+};
+
+static struct kobject *floppy_find(dev_t dev, int *part, void *data)
+{
+	int drive = (*part & 3);
+
+	if (drive > floppy_count)
+		return NULL;
+
+	*part = 0;
+	return get_disk(unit[drive].disk);
+}
+
+static int swim_add_floppy(drive_location_t location)
+{
+	struct floppy_state *fs = &unit[floppy_count];
+
+	fs->location = location;
+
+	swim_drive(location);
+
+	swim_motor(OFF);
+
+	if (swim_readbit(SINGLE_SIDED)) {
+		printk(KERN_INFO "SWIM: drive is single sided\n");
+		fs->head_number = 1;
+	} else
+		fs->head_number = 2;
+	fs->ref_count = 0;
+	fs->ejected = 1;
+
+	floppy_count++;
+
+	return 0;
+}
+
+static int __init swim_floppy_init(void)
+{
+	int err;
+	int drive;
+
+	if (SWIMBase == NULL)
+		return 0;
+
+	printk(KERN_INFO "SWIM floppy driver version %s\n", DRIVER_VERSION);
+
+	/* scan floppy drives */
+
+	swim_mode(1);
+
+	swim_drive(INTERNAL_DRIVE);
+	if (swim_readbit(DRIVE_PRESENT)) {
+		printk("SWIM: internal floppy drive detected\n");
+		swim_add_floppy(INTERNAL_DRIVE);
+	}
+	swim_drive(EXTERNAL_DRIVE);
+	if (swim_readbit(DRIVE_PRESENT)) {
+		printk("SWIM: external floppy drive detected\n");
+		swim_add_floppy(EXTERNAL_DRIVE);
+	}
+
+	/* register floppy drives */
+
+	err = register_blkdev(FLOPPY_MAJOR, "fd");
+	if (err) {
+		printk(KERN_ERR "Unable to get major %d for SWIM floppy\n",
+		       FLOPPY_MAJOR);
+		return -EBUSY;
+	}
+
+	for (drive = 0; drive < floppy_count; drive++) {
+		unit[drive].disk = alloc_disk(1);
+		if (unit[drive].disk == NULL) {
+			err = -ENOMEM;
+			goto exit_put_disks;
+		}
+	}
+
+	floppy_queue = blk_init_queue(do_fd_request, &swim_lock);
+	if (!floppy_queue) {
+		err = -ENOMEM;
+		goto exit_put_disks;
+	}
+
+	for (drive = 0; drive < floppy_count; drive++) {
+		unit[drive].disk->flags = GENHD_FL_REMOVABLE;
+		unit[drive].disk->major = FLOPPY_MAJOR;
+		unit[drive].disk->first_minor = drive;
+		sprintf(unit[drive].disk->disk_name, "fd%d", drive);
+		unit[drive].disk->fops = &floppy_fops;
+		unit[drive].disk->private_data = (void*)(long)drive;
+		unit[drive].disk->queue = floppy_queue;
+		set_capacity(unit[drive].disk, 2880);
+		add_disk(unit[drive].disk);
+	}
+
+	blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS_MODULE,
+			    floppy_find, NULL, NULL);
+
+	return 0;
+
+exit_put_disks:
+	unregister_blkdev(FLOPPY_MAJOR, "fd");
+	while (drive--)
+		put_disk(unit[drive].disk);
+	return err;
+}
+
+static int __init swim_init(void)
+{
+	printk(KERN_INFO "Inserting SWIM floppy driver\n");
+
+	if (base) {
+		printk(KERN_INFO "SWIM: Setting SWIMBase to 0x%p\n", base);
+		SWIMBase = (struct swim *)base;
+	}
+
+	return swim_floppy_init();
+}
+module_init(swim_init)
+
+static void __exit swim_cleanup(void)
+{
+	int drive;
+
+	printk(KERN_INFO "Removing SWIM floppy driver\n");
+
+	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
+
+	for (drive = 0; drive < floppy_count; drive++) {
+		del_gendisk(unit[drive].disk);
+		put_disk(unit[drive].disk);
+	}
+
+	unregister_blkdev(FLOPPY_MAJOR, "fd");
+
+	blk_cleanup_queue(floppy_queue);
+
+	/* eject floppies */
+
+	for (drive = 0; drive < floppy_count; drive++)
+		floppy_eject(&unit[drive]);
+}
+module_exit(swim_cleanup)
+
+MODULE_DESCRIPTION("Driver for SWIM (Sander. Woz Integrated Machine) floppy controller");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Laurent Vivier");
+MODULE_ALIAS_BLOCKDEV_MAJOR(FLOPPY_MAJOR);
Index: linux-2.6/drivers/block/swim_asm.S
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ linux-2.6/drivers/block/swim_asm.S	2008-11-01 06:14:39.000000000 +0100
@@ -0,0 +1,295 @@
+/*
+ * low-level functions for the SWIM floppy controller
+ *
+ * needs assembly language because is very timing dependent
+ * this controller exists only on macintosh 680x0 based
+ *
+ * Copyright (C) 2004,2008 Laurent Vivier <Laurent@lvivier.info>
+ *
+ * based on Alastair Bridgewater SWIM analysis, 2001
+ * based on netBSD IWM driver (c) 1997, 1998 Hauke Fath.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * 2004-08-21 (lv) - Initial implementation
+ */
+
+	.equ	ph0L,		0x0000
+	.equ	ph0H,		0x0200
+	.equ	ph1L,		0x0400
+	.equ	ph1H,		0x0600
+	.equ	ph2L,		0x0800
+	.equ	ph2H,		0x0a00
+	.equ	ph3L,		0x0c00
+	.equ	ph3H,		0x0e00
+	.equ	mtrOff,		0x1000
+	.equ	mtrOn,		0x1200
+	.equ	intDrive,	0x1400
+	.equ	extDrive,	0x1600
+	.equ	q6L,		0x1800
+	.equ	q6H,		0x1a00
+	.equ	q7L,		0x1c00
+	.equ	q7H,		0x1e00
+
+	.equ	write_data,	0x0000
+	.equ	write_mark,	0x0200
+	.equ	write_CRC,	0x0400
+	.equ	write_parameter,0x0600
+	.equ	write_phase,	0x0800
+	.equ	write_setup,	0x0a00
+	.equ	write_mode0,	0x0c00
+	.equ	write_mode1,	0x0e00
+	.equ	read_data,	0x1000
+	.equ	read_mark,	0x1200
+	.equ	read_error,	0x1400
+	.equ	read_parameter,	0x1600
+	.equ	read_phase,	0x1800
+	.equ	read_setup,	0x1a00
+	.equ	read_status,	0x1c00
+	.equ	read_handshake,	0x1e00
+
+	.equ	o_side, 0
+	.equ	o_track, 1
+	.equ	o_sector, 2
+	.equ	o_size, 3
+	.equ	o_crc0, 4
+	.equ	o_crc1, 5
+
+	.equ	seek_time, 30000
+	.equ	max_retry, 40
+	.equ	sector_size, 512
+
+	.global swim_mode
+swim_mode:
+	link	%a6, #0
+	moveml	%a0/%d2, %sp@-
+
+	movel	SWIMBase, %a0
+
+	tstl	%a6@(0x08)
+	beq	iwm_mode
+
+	/* switch to SWIM mode */
+
+	tstb	%a0@(q7L)
+	tstb	%a0@(mtrOff)
+	tstb	%a0@(q6H)
+	moveb	#0x57, %d2
+	moveb	%d2, %a0@(q7H)
+	moveb	#0x17, %a0@(q7H)
+	moveb	%d2, %a0@(q7H)
+	moveb	%d2, %a0@(q7H)
+	moveml	%sp@+, %a0/%d2
+	unlk	%a6
+	rts
+iwm_mode:
+	/* switch to IWM mode */
+
+	moveb	#0xf8, %a0@(write_mode0)
+	moveml	%sp@+, %a0/%d2
+	unlk	%a6
+	rts
+
+
+	.global swim_read_sector_header
+swim_read_sector_header:
+	link	%a6, #0
+	moveml	%d1-%d5/%a0-%a4,%sp@-
+	movel	%a6@(0x08), %a4
+	bsr	mfm_read_addrmark
+	moveml	%sp@+, %d1-%d5/%a0-%a4
+	unlk	%a6
+	rts
+
+sector_address_mark:
+	.byte	0xa1, 0xa1, 0xa1, 0xfe
+sector_data_mark:
+	.byte	0xa1, 0xa1, 0xa1, 0xfb
+
+mfm_read_addrmark:
+	movel	SWIMBase, %a3
+	lea	%a3@(read_handshake), %a2
+	lea	%a3@(read_mark), %a3
+	moveq	#-1, %d0
+	movew	#seek_time, %d2
+
+wait_header_init:
+	tstb	%a3@(read_error - read_mark)
+	moveb	#0x18, %a3@(write_mode0 - read_mark)
+	moveb	#0x01, %a3@(write_mode1 - read_mark)
+	moveb	#0x01, %a3@(write_mode0 - read_mark)
+	tstb	%a3@(read_error - read_mark)
+	moveb	#0x08, %a3@(write_mode1 - read_mark)
+
+	lea	sector_address_mark, %a0
+	moveq	#3, %d1
+
+wait_addr_mark_byte:
+
+	tstb	%a2@
+	dbmi	%d2, wait_addr_mark_byte
+	bpl	header_exit
+
+	moveb	%a3@, %d3
+	cmpb	%a0@+, %d3
+	dbne	%d1, wait_addr_mark_byte
+	bne	wait_header_init
+
+	moveq	#max_retry, %d2
+
+amark0:	tstb	%a2@
+	dbmi	%d2, amark0
+	bpl	signal_nonyb
+
+	moveb	%a3@, %a4@(o_track)
+
+	moveq	#max_retry, %d2
+
+amark1:	tstb	%a2@
+	dbmi	%d2, amark1
+	bpl	signal_nonyb
+
+	moveb	%a3@, %a4@(o_side)
+
+	moveq	#max_retry, %d2
+
+amark2:	tstb	%a2@
+	dbmi	%d2, amark2
+	bpl	signal_nonyb
+
+	moveb	%a3@, %a4@(o_sector)
+
+	moveq	#max_retry, %d2
+
+amark3:	tstb	%a2@
+	dbmi	%d2, amark3
+	bpl	signal_nonyb
+
+	moveb	%a3@, %a4@(o_size)
+
+	moveq	#max_retry, %d2
+
+crc0:	tstb	%a2@
+	dbmi	%d2, crc0
+	bpl	signal_nonyb
+
+	moveb	%a3@, %a4@(o_crc0)
+
+	moveq	#max_retry, %d2
+
+crc1:	tstb	%a2@
+	dbmi	%d2, crc1
+	bpl	signal_nonyb
+
+	moveb	%a3@, %a4@(o_crc1)
+
+	tstb	%a3@(read_error - read_mark)
+
+header_exit:
+	moveq	#0, %d0
+	moveb	#0x18, %a3@(write_mode0 - read_mark)
+	rts
+signal_nonyb:
+	moveq	#-1, %d0
+	moveb	#0x18, %a3@(write_mode0 - read_mark)
+	rts
+
+	.global swim_read_sector_data
+swim_read_sector_data:
+	link	%a6, #0
+	moveml	%d1-%d5/%a0-%a5,%sp@-
+	movel	%a6@(0x08), %a4
+	bsr	mfm_read_data
+	moveml	%sp@+, %d1-%d5/%a0-%a5
+	unlk	%a6
+	rts
+
+mfm_read_data:
+	movel	SWIMBase, %a3
+	lea	%a3@(read_handshake), %a2
+	lea	%a3@(read_data), %a5
+	lea	%a3@(read_mark), %a3
+	movew	#seek_time, %d2
+
+wait_data_init:
+	tstb	%a3@(read_error - read_mark)
+	moveb	#0x18, %a3@(write_mode0 - read_mark)
+	moveb	#0x01, %a3@(write_mode1 - read_mark)
+	moveb	#0x01, %a3@(write_mode0 - read_mark)
+	tstb	%a3@(read_error - read_mark)
+	moveb	#0x08, %a3@(write_mode1 - read_mark)
+
+	lea	sector_data_mark, %a0
+	moveq	#3, %d1
+
+	/* wait data address mark */
+
+wait_data_mark_byte:
+
+	tstb	%a2@
+	dbmi	%d2, wait_data_mark_byte
+	bpl	data_exit
+
+	moveb	%a3@, %d3
+	cmpb	%a0@+, %d3
+	dbne	%d1, wait_data_mark_byte
+	bne	wait_data_init
+
+	/* read data */
+
+	tstb	%a3@(read_error - read_mark)
+
+	movel	#sector_size-1, %d4		/* sector size */
+read_new_data:
+	movew	#max_retry, %d2
+read_data_loop:
+	moveb	%a2@, %d5
+	andb	#0xc0, %d5
+	dbne	%d2, read_data_loop
+	beq	data_exit
+	moveb	%a5@, %a4@+
+	andb	#0x40, %d5
+	dbne	%d4, read_new_data
+	beq	exit_loop
+	moveb	%a5@, %a4@+
+	dbra	%d4, read_new_data
+exit_loop:
+
+	/* read CRC */
+
+	movew	#max_retry, %d2
+data_crc0:
+
+	tstb	%a2@
+	dbmi	%d2, data_crc0
+	bpl	data_exit
+
+	moveb	%a3@, %d5
+
+	moveq	#max_retry, %d2
+
+data_crc1:
+
+	tstb	%a2@
+	dbmi	%d2, data_crc1
+	bpl	data_exit
+
+	moveb	%a3@, %d5
+
+	tstb	%a3@(read_error - read_mark)
+
+	moveb	#0x18, %a3@(write_mode0 - read_mark)
+
+	/* return number of bytes read */
+
+	movel	#sector_size, %d0
+	addw	#1, %d4
+	subl	%d4, %d0
+	rts
+data_exit:
+	moveb	#0x18, %a3@(write_mode0 - read_mark)
+	moveq	#-1, %d0
+	rts
