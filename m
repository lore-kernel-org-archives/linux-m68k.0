From: Laurent Vivier <laurent@lvivier.info>
Subject: [PATCH 2/2][v3] Add SWIM floppy support for m68k Macs.
Date: Thu,  6 Nov 2008 20:54:29 +0100
Message-ID: <12260012691527-git-send-email-laurent@lvivier.info>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp5-g19.free.fr ([212.27.42.35]:42497 "EHLO smtp5-g19.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753261AbYKFTyg (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 6 Nov 2008 14:54:36 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, 0001-Add-a-new-entry-in-mac_model-to-identify-the-floppy-controller-type.txt@lvivier.info, Laurent Vivier <Laurent@lvivier.info>

From: Laurent Vivier <Laurent@lvivier.info>

It allows to read data from a floppy, but not to write to, and to eject the
floppy (useful on our Mac without eject button).

Changelog:
v2- use platform device infrastructure
v3- some cleanups, probe if chip supports SWIM mode

Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
---
 arch/m68k/mac/via.c      |    9 +
 drivers/block/Kconfig    |    7 +
 drivers/block/Makefile   |    3 +
 drivers/block/swim.c     |  921 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/block/swim_asm.S |  323 ++++++++++++++++
 5 files changed, 1263 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 1bdb03c..5bc30f7 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -654,3 +654,12 @@ int via_irq_pending(int irq)
 	}
 	return 0;
 }
+
+void via1_set_head(int head)
+{
+	if (head == 0)
+		via1[vBufA] &= ~VIA1A_vHeadSel;
+	else
+		via1[vBufA] |= VIA1A_vHeadSel;
+}
+EXPORT_SYMBOL(via1_set_head);
diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index 61ad8d6..f4862a0 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -44,6 +44,13 @@ config MAC_FLOPPY
 	  If you have a SWIM-3 (Super Woz Integrated Machine 3; from Apple)
 	  floppy controller, say Y here. Most commonly found in PowerMacs.
 
+config BLK_DEV_SWIM
+	tristate "Support for SWIM Macintosh floppy"
+	depends on M68K && MAC
+	help
+	  You should select this option if you want floppy support
+	  and you don't have a II, IIfx, Q900, Q950 or AV series.
+
 config AMIGA_Z2RAM
 	tristate "Amiga Zorro II ramdisk support"
 	depends on ZORRO
diff --git a/drivers/block/Makefile b/drivers/block/Makefile
index 204332b..b32b7f9 100644
--- a/drivers/block/Makefile
+++ b/drivers/block/Makefile
@@ -6,6 +6,7 @@
 # 
 
 obj-$(CONFIG_MAC_FLOPPY)	+= swim3.o
+obj-$(CONFIG_BLK_DEV_SWIM)	+= swim_mod.o
 obj-$(CONFIG_BLK_DEV_FD)	+= floppy.o
 obj-$(CONFIG_AMIGA_FLOPPY)	+= amiflop.o
 obj-$(CONFIG_PS3_DISK)		+= ps3disk.o
@@ -32,3 +33,5 @@ obj-$(CONFIG_BLK_DEV_UB)	+= ub.o
 obj-$(CONFIG_BLK_DEV_HD)	+= hd.o
 
 obj-$(CONFIG_XEN_BLKDEV_FRONTEND)	+= xen-blkfront.o
+
+swim_mod-objs	:= swim.o swim_asm.o
diff --git a/drivers/block/swim.c b/drivers/block/swim.c
new file mode 100644
index 0000000..85315e0
--- /dev/null
+++ b/drivers/block/swim.c
@@ -0,0 +1,921 @@
+/*
+ * Driver for SWIM (Sander Woz Integrated Machine) floppy controller
+ *
+ * Copyright (C) 2004,2008 Laurent Vivier <Laurent@lvivier.info>
+ *
+ * based on Alastair Bridgewater SWIM analysis, 2001
+ * based on SWIM3 driver (c) Paul Mackerras, 1996
+ * based on netBSD IWM driver (c) 1997, 1998 Hauke Fath.
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
+#include <linux/platform_device.h>
+
+#include <asm/macintosh.h>
+#include <asm/mac_via.h>
+
+static char *base __devinitdata;
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
+#define DRIVER_VERSION "Version 0.2 (2008-10-30)"
+
+#define REG(x)	unsigned char x, x ## _pad[0x200 - 1];
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
+#define swim_write(base, reg, v) 	out_8(&(base)->write_##reg, (v))
+#define swim_read(base, reg)		in_8(&(base)->read_##reg)
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
+#define WRITE_MODE	0x10
+#define HEDSEL		0x20
+#define MOTON		0x80
+
+
+/*----------------------------------------------------------------------------*/
+
+enum drive_location {
+	INTERNAL_DRIVE = 0x02,
+	EXTERNAL_DRIVE = 0x04,
+};
+
+enum media_type {
+	DD_MEDIA,
+	HD_MEDIA,
+};
+
+struct floppy_state {
+
+	/* physical properties */
+
+	enum drive_location location;	/* internal or external drive */
+	int		 head_number;	/* single- or double-sided drive */
+
+	/* media */
+
+	int		 disk_in;
+	int		 ejected;
+	enum media_type	 type;
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
+
+	/* parent controller */
+
+	struct swim_priv *swd;
+};
+
+enum motor_action {
+	OFF,
+	ON,
+};
+
+enum head {
+	LOWER_HEAD = 0,
+	UPPER_HEAD = 1,
+};
+
+#define FD_MAX_UNIT	2
+
+struct swim_priv {
+	struct swim __iomem *base;
+	spinlock_t lock;
+	struct request_queue *queue;
+	int floppy_count;
+	struct floppy_state unit[FD_MAX_UNIT];
+};
+
+static struct platform_device *swim_device;
+
+extern int get_swim_mode(struct swim *base);
+extern void set_swim_mode(struct swim *base, int enable);
+extern int swim_read_sector_header(struct swim *base,
+				   struct sector_header *header);
+extern int swim_read_sector_data(struct swim *base, unsigned char *data);
+
+static inline void swim_select(struct swim *base, int sel)
+{
+	swim_write(base, phase, RELAX);
+
+	via1_set_head(sel & 0x100);
+
+	swim_write(base, phase, sel & CA_MASK);
+}
+
+static inline void swim_action(struct swim *base, int action)
+{
+	swim_select(base, action);
+	udelay(1);
+	swim_write(base, phase, (LSTRB<<4) | LSTRB);
+	udelay(1);
+	swim_write(base, phase, (LSTRB<<4) | ((~LSTRB) & 0x0F));
+	udelay(1);
+	swim_write(base, phase, RELAX);
+}
+
+static inline int swim_readbit(struct swim *base, int bit)
+{
+	int stat;
+
+	swim_select(base, bit);
+
+	udelay(10);
+
+	stat = swim_read(base, handshake);
+
+	swim_write(base, phase, RELAX);
+
+	return (stat & SENSE) == 0;
+}
+
+static inline void swim_drive(struct swim *base, enum drive_location location)
+{
+	if (location == INTERNAL_DRIVE) {
+		swim_write(base, mode0, EXTERNAL_DRIVE); /* clear drive 1 bit */
+		swim_write(base, mode1, INTERNAL_DRIVE); /* set drive 0 bit */
+	} else if (location == EXTERNAL_DRIVE) {
+		swim_write(base, mode0, INTERNAL_DRIVE); /* clear drive 0 bit */
+		swim_write(base, mode1, EXTERNAL_DRIVE); /* set drive 1 bit */
+	}
+}
+
+static inline void swim_motor(struct swim *base, enum motor_action action)
+{
+	if (action == ON) {
+		int i;
+
+		swim_action(base, MOTOR_ON);
+
+		for (i = 0; i < 2*HZ; i++) {
+			if (swim_readbit(base, MOTOR_ON))
+				break;
+			current->state = TASK_INTERRUPTIBLE;
+			schedule_timeout(1);
+		}
+	} else if (action == OFF)
+		swim_action(base, MOTOR_OFF);
+}
+
+static inline void swim_eject(struct swim *base)
+{
+	int i;
+
+	swim_action(base, EJECT);
+
+	for (i = 0; i < 2*HZ; i++) {
+		if (swim_readbit(base, RELAX))
+			break;
+		current->state = TASK_INTERRUPTIBLE;
+		schedule_timeout(1);
+	}
+}
+
+static inline void swim_head(struct swim *base, enum head head)
+{
+	/* FIXME: IWM reads bits SEL, CA2, CA1 to wait drive ready... */
+
+	/* wait drive is ready */
+
+	if (head == UPPER_HEAD)
+		swim_select(base, READ_DATA_1);
+	else if (head == LOWER_HEAD)
+		swim_select(base, READ_DATA_0);
+}
+
+static inline int swim_step(struct swim *base)
+{
+	int wait;
+
+	swim_action(base, STEP);
+
+	for (wait = 0; wait < HZ; wait++) {
+
+		current->state = TASK_INTERRUPTIBLE;
+		schedule_timeout(1);
+
+		if (!swim_readbit(base, STEP))
+			return 0;
+	}
+
+	return -1;
+}
+
+static inline int swim_track00(struct swim *base)
+{
+	int try;
+
+	swim_motor(base, ON);
+
+	swim_action(base, SEEK_NEGATIVE);
+
+	for (try = 0; try < 100; try++) {
+
+		if (swim_readbit(base, TRACK_ZERO))
+			break;
+
+		if (swim_step(base))
+			return -1;
+	}
+
+	if (swim_readbit(base, TRACK_ZERO))
+		return 0;
+
+	return -1;
+}
+
+static inline int swim_seek(struct swim *base, int step)
+{
+	if (step == 0)
+		return 0;
+
+	swim_motor(base, ON);
+
+	if (step < 0) {
+		swim_action(base, SEEK_NEGATIVE);
+		step = -step;
+	} else
+		swim_action(base, SEEK_POSITIVE);
+
+	for ( ; step > 0; step--) {
+		if (swim_step(base))
+			return -1;
+	}
+
+	return 0;
+}
+
+static inline int swim_track(struct floppy_state *fs,  int track)
+{
+	struct swim *base = fs->swd->base;
+	int ret;
+
+	ret = swim_seek(base, track - fs->track);
+
+	if (ret == 0)
+		fs->track = track;
+	else {
+		swim_track00(base);
+		fs->track = 0;
+	}
+
+	return ret;
+}
+
+static int floppy_eject(struct floppy_state *fs)
+{
+	struct swim *base = fs->swd->base;
+
+	swim_drive(base, fs->location);
+	swim_motor(base, OFF);
+	swim_eject(base);
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
+	struct swim *base = fs->swd->base;
+	unsigned long flags;
+	struct sector_header header;
+	int ret = -1;
+	short i;
+
+	swim_track(fs, track);
+
+	swim_write(base, mode1, MOTON);
+	swim_head(base, side);
+	swim_write(base, mode0, side);
+
+	local_save_flags(flags);
+	local_irq_disable();
+	for (i = 0; i < 20000; i++) {
+		ret = swim_read_sector_header(base, &header);
+		if (!ret && (header.sector == sector)) {
+			/* found */
+
+			ret = swim_read_sector_data(base, buffer);
+			break;
+		}
+	}
+	swim_write(base, mode0, MOTON);
+	local_irq_restore(flags);
+
+	if ((header.side != side)  || (header.track != track) ||
+	     (header.sector != sector))
+		return 0;
+
+	return ret;
+}
+
+static int floppy_read_sectors(struct floppy_state *fs,
+			       int req_sector, int sectors_nb,
+			       unsigned char *buffer)
+{
+	struct swim *base = fs->swd->base;
+	int ret;
+	int side, track, sector;
+	int i, try;
+
+	swim_drive(base, fs->location);
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
+		} while (ret != 512);
+
+		buffer += ret;
+	}
+
+	return 0;
+}
+
+static void redo_fd_request(struct request_queue *q)
+{
+	struct request *req;
+	struct floppy_state *fs;
+
+	while ((req = elv_next_request(q))) {
+
+		fs = req->rq_disk->private_data;
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
+				end_request(req, 0);
+				continue;
+			}
+		}
+		switch (rq_data_dir(req)) {
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
+static void do_fd_request(struct request_queue *q)
+{
+	redo_fd_request(q);
+}
+
+static struct floppy_struct floppy_type[4] = {
+	{    0,  0, 0,  0, 0, 0x00, 0x00, 0x00, 0x00, NULL }, /* no testing   */
+	{  720,  9, 1, 80, 0, 0x2A, 0x02, 0xDF, 0x50, NULL }, /* 360KB SS 3.5"*/
+	{ 1440,  9, 2, 80, 0, 0x2A, 0x02, 0xDF, 0x50, NULL }, /* 720KB 3.5"   */
+	{ 2880, 18, 2, 80, 0, 0x1B, 0x00, 0xCF, 0x6C, NULL }, /* 1.44MB 3.5"  */
+};
+
+static int get_floppy_geometry(struct floppy_state *fs, int type,
+			       struct floppy_struct **g)
+{
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
+static void setup_medium(struct floppy_state *fs)
+{
+	struct swim *base = fs->swd->base;
+
+	if (swim_readbit(base, DISK_IN)) {
+		struct floppy_struct *g;
+		fs->disk_in = 1;
+		fs->write_protected = swim_readbit(base, WRITE_PROT);
+		fs->type = swim_readbit(base, ONEMEG_MEDIA);
+
+		if (swim_track00(base))
+			printk(KERN_ERR
+				"SWIM: cannot move floppy head to track 0\n");
+
+		swim_track00(base);
+
+		get_floppy_geometry(fs, 0, &g);
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
+	struct floppy_state *fs = bdev->bd_disk->private_data;
+	struct swim *base = fs->swd->base;
+	int err;
+
+	if (fs->ref_count == -1 || (fs->ref_count && mode & FMODE_EXCL))
+		return -EBUSY;
+
+	if (mode & FMODE_EXCL)
+		fs->ref_count = -1;
+	else
+		fs->ref_count++;
+
+	swim_write(base, setup, S_IBM_DRIVE  | S_FCLK_DIV2);
+	udelay(10);
+	swim_drive(base, INTERNAL_DRIVE);
+	swim_motor(base, ON);
+	swim_action(base, SETMFM);
+	if (fs->ejected)
+		setup_medium(fs);
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
+		swim_motor(base, OFF);
+	return err;
+}
+
+static int floppy_release(struct gendisk *disk, fmode_t mode)
+{
+	struct floppy_state *fs = disk->private_data;
+	struct swim *base = fs->swd->base;
+
+	if (fs->ref_count < 0)
+		fs->ref_count = 0;
+	else if (fs->ref_count > 0)
+		--fs->ref_count;
+
+	if (fs->ref_count == 0)
+		swim_motor(base, OFF);
+
+	return 0;
+}
+
+static int floppy_ioctl(struct block_device *bdev, fmode_t mode,
+			unsigned int cmd, unsigned long param)
+{
+	struct floppy_state *fs = bdev->bd_disk->private_data;
+	int err;
+
+	if ((cmd & 0x80) && !capable(CAP_SYS_ADMIN))
+			return -EPERM;
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
+	struct floppy_state *fs = bdev->bd_disk->private_data;
+	struct floppy_struct *g;
+	int ret;
+
+	ret = get_floppy_geometry(fs, 0, &g);
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
+	struct floppy_state *fs = disk->private_data;
+
+	return fs->ejected;
+}
+
+static int floppy_revalidate(struct gendisk *disk)
+{
+	struct floppy_state *fs = disk->private_data;
+	struct swim *base = fs->swd->base;
+
+	swim_drive(base, fs->location);
+
+	if (fs->ejected)
+		setup_medium(fs);
+
+	if (!fs->disk_in)
+		swim_motor(base, OFF);
+	else
+		fs->ejected = 0;
+
+	return !fs->disk_in;
+}
+
+static struct block_device_operations floppy_fops = {
+	.owner		 = THIS_MODULE,
+	.open		 = floppy_open,
+	.release	 = floppy_release,
+	.locked_ioctl	 = floppy_ioctl,
+	.getgeo		 = floppy_getgeo,
+	.media_changed	 = floppy_check_change,
+	.revalidate_disk = floppy_revalidate,
+};
+
+static struct kobject *floppy_find(dev_t dev, int *part, void *data)
+{
+	struct swim_priv *swd = data;
+	int drive = (*part & 3);
+
+	if (drive > swd->floppy_count)
+		return NULL;
+
+	*part = 0;
+	return get_disk(swd->unit[drive].disk);
+}
+
+static int __devinit swim_add_floppy(struct swim_priv *swd,
+				     enum drive_location location)
+{
+	struct floppy_state *fs = &swd->unit[swd->floppy_count];
+	struct swim *base = swd->base;
+
+	fs->location = location;
+
+	swim_drive(base, location);
+
+	swim_motor(base, OFF);
+
+	if (swim_readbit(base, SINGLE_SIDED))
+		fs->head_number = 1;
+	else
+		fs->head_number = 2;
+	fs->ref_count = 0;
+	fs->ejected = 1;
+
+	swd->floppy_count++;
+
+	return 0;
+}
+
+static int __devinit swim_floppy_init(struct swim_priv *swd)
+{
+	int err;
+	int drive;
+	struct swim *base = swd->base;
+
+	/* scan floppy drives */
+
+	swim_drive(base, INTERNAL_DRIVE);
+	if (swim_readbit(base, DRIVE_PRESENT))
+		swim_add_floppy(swd, INTERNAL_DRIVE);
+	swim_drive(base, EXTERNAL_DRIVE);
+	if (swim_readbit(base, DRIVE_PRESENT))
+		swim_add_floppy(swd, EXTERNAL_DRIVE);
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
+	for (drive = 0; drive < swd->floppy_count; drive++) {
+		swd->unit[drive].disk = alloc_disk(1);
+		if (swd->unit[drive].disk == NULL) {
+			err = -ENOMEM;
+			goto exit_put_disks;
+		}
+		swd->unit[drive].swd = swd;
+	}
+
+	swd->queue = blk_init_queue(do_fd_request, &swd->lock);
+	if (!swd->queue) {
+		err = -ENOMEM;
+		goto exit_put_disks;
+	}
+
+	for (drive = 0; drive < swd->floppy_count; drive++) {
+		swd->unit[drive].disk->flags = GENHD_FL_REMOVABLE;
+		swd->unit[drive].disk->major = FLOPPY_MAJOR;
+		swd->unit[drive].disk->first_minor = drive;
+		sprintf(swd->unit[drive].disk->disk_name, "fd%d", drive);
+		swd->unit[drive].disk->fops = &floppy_fops;
+		swd->unit[drive].disk->private_data = &swd->unit[drive];
+		swd->unit[drive].disk->queue = swd->queue;
+		set_capacity(swd->unit[drive].disk, 2880);
+		add_disk(swd->unit[drive].disk);
+	}
+
+	blk_register_region(MKDEV(FLOPPY_MAJOR, 0), 256, THIS_MODULE,
+			    floppy_find, NULL, swd);
+
+	return 0;
+
+exit_put_disks:
+	unregister_blkdev(FLOPPY_MAJOR, "fd");
+	while (drive--)
+		put_disk(swd->unit[drive].disk);
+	return err;
+}
+
+static int __devinit swim_probe(struct platform_device *dev)
+{
+	struct swim *swim_base;
+	struct swim_priv *swd;
+
+	if (!MACH_IS_MAC)
+		return -ENODEV;
+
+	switch (macintosh_config->floppy_type) {
+	case MAC_FLOPPY_SWIM_ADDR1:
+		swim_base = (struct swim *)(VIA1_BASE + 0x1E000);
+		break;
+	case MAC_FLOPPY_SWIM_ADDR2:
+		swim_base = (struct swim *)(VIA1_BASE + 0x16000);
+		break;
+	default:
+		swim_base = (struct swim *)base;
+		break;
+	}
+
+	if (swim_base == NULL)
+		return -ENODEV;
+
+	printk(KERN_INFO "SWIM base adress 0x%p\n", swim_base);
+
+	/* probe device */
+
+	set_swim_mode(swim_base, 1);
+	if (!get_swim_mode(swim_base)) {
+		printk(KERN_INFO "SWIM device not found !\n");
+		return -ENODEV;
+	}
+
+	/* set platform driver data */
+
+	swd = kzalloc(sizeof(struct swim_priv), GFP_KERNEL);
+	if (!swd)
+		return -ENOMEM;
+	platform_set_drvdata(dev, swd);
+
+	swd->base = swim_base;
+
+	return swim_floppy_init(swd);
+}
+
+static int __devexit swim_remove(struct platform_device *dev)
+{
+	struct swim_priv *swd = platform_get_drvdata(dev);
+	int drive;
+
+	blk_unregister_region(MKDEV(FLOPPY_MAJOR, 0), 256);
+
+	for (drive = 0; drive < swd->floppy_count; drive++) {
+		del_gendisk(swd->unit[drive].disk);
+		put_disk(swd->unit[drive].disk);
+	}
+
+	unregister_blkdev(FLOPPY_MAJOR, "fd");
+
+	blk_cleanup_queue(swd->queue);
+
+	/* eject floppies */
+
+	for (drive = 0; drive < swd->floppy_count; drive++)
+		floppy_eject(&swd->unit[drive]);
+	kfree(swd);
+
+	return 0;
+}
+
+static struct platform_driver swim_driver = {
+	.probe  = swim_probe,
+	.remove = __devexit_p(swim_remove),
+	.driver   = {
+		.name   = "swim",
+	},
+};
+
+static int __init swim_init(void)
+{
+	int err;
+
+	printk(KERN_INFO "SWIM floppy driver version %s\n", DRIVER_VERSION);
+
+	err = platform_driver_register(&swim_driver);
+	if (err)
+		return err;
+
+	swim_device = platform_device_alloc("swim", 0);
+	if (!swim_device) {
+		platform_driver_unregister(&swim_driver);
+		return -ENOMEM;
+	}
+
+	if (platform_device_add(swim_device)) {
+		platform_device_put(swim_device);
+		platform_driver_unregister(&swim_driver);
+		swim_device = NULL;
+	}
+
+	return 0;
+}
+module_init(swim_init);
+
+static void __exit swim_exit(void)
+{
+	platform_driver_unregister(&swim_driver);
+
+	if (swim_device) {
+		platform_device_unregister(swim_device);
+		swim_device = NULL;
+	}
+}
+module_exit(swim_exit);
+
+MODULE_DESCRIPTION("Driver for SWIM floppy controller");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Laurent Vivier <laurent@lvivier.info>");
+MODULE_ALIAS_BLOCKDEV_MAJOR(FLOPPY_MAJOR);
diff --git a/drivers/block/swim_asm.S b/drivers/block/swim_asm.S
new file mode 100644
index 0000000..3e0d4bb
--- /dev/null
+++ b/drivers/block/swim_asm.S
@@ -0,0 +1,323 @@
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
+ * 2008-11-05 (lv) - add get_swim_mode
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
+	.global get_swim_mode
+get_swim_mode:
+	link	%a6, #0
+	moveml	%a0/%d2, %sp@-
+	movel	%a6@(0x08), %a0
+	moveb	#0xf5, %a0@(write_phase)
+	moveb	%a0@(read_phase), %d2
+	cmpb	#0xf5, %d2
+	bne	is_iwm
+	moveb	#0xf6, %a0@(write_phase)
+	moveb	%a0@(read_phase), %d2
+	cmpb	#0xf6, %d2
+	bne	is_iwm
+	moveb	#0xf7, %a0@(write_phase)
+	moveb	%a0@(read_phase), %d2
+	cmpb	#0xf7, %d2
+	bne	is_iwm
+	moveq	#1, %d0
+	moveml	%sp@+, %a0/%d2
+	unlk	%a6
+	rts
+is_iwm:
+	moveq	#0, %d0
+	moveml	%sp@+, %a0/%d2
+	unlk	%a6
+	rts
+
+	.global set_swim_mode
+set_swim_mode:
+	link	%a6, #0
+	moveml	%a0/%d2, %sp@-
+
+	movel	%a6@(0x08), %a0
+
+	tstl	%a6@(0x0c)
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
+	movel	%a6@(0x0c), %a4
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
+	movel	%a6@(0x08), %a3
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
+	movel	%a6@(0x0c), %a4
+	bsr	mfm_read_data
+	moveml	%sp@+, %d1-%d5/%a0-%a5
+	unlk	%a6
+	rts
+
+mfm_read_data:
+	movel	%a6@(0x08), %a3
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
-- 
1.4.4.4

