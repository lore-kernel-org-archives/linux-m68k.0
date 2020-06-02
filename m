Return-Path: <SRS0=aBsQ=7P=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DA2C433E1
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 02:22:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEF6C20678
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Jun 2020 02:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgFBCWE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 22:22:04 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:55524 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgFBCWE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 22:22:04 -0400
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1jfwYw-00012T-0H; Mon, 01 Jun 2020 19:21:58 -0700
Date:   Mon, 1 Jun 2020 19:21:57 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
Message-ID: <20200602022157.GA3216@allandria.com>
References: <cover.1590880333.git.fthain@telegraphics.com.au>
 <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com>
 <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet>
 <20200601060915.GA8450@allandria.com>
 <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 02, 2020 at 09:32:29AM +1000, Finn Thain wrote:
> I'm hoping that the SWIM IOP can be used in bypass mode, so it could be 
> used with the swim.c driver. I haven't been able to make that work yet.

Putting the IOP in bypass mode would have a couple issues. The obvious
one is that it will break ADB (and because the shift register attached
to the ADB transceiver is part of the IOP chip itself, there's not an
easy fix for that), but there's also some strangeness in the way the
SWIM chip is attached to the IOP chip that looks like it might break
a few things. In particular, it looks like they only enabled using the
SWIM chip in ISM mode and not IWM mode. The notes I have imply that
the normal Mac floppy driver didn't work on a IIfx even in bypass mode.
In particular, note the direct use of a GPIO line on VIA1 in swim_select
in drivers/block/swim.c.  That won't work on an IOP based system as that
input line to SWIM doesn't appear to be hooked up to anything that can
be accessed directly.

Here's the way it's put in _Guide to the Macintosh Family Hardware_
(Second Edition), on page 155:

"An IOP provides the state-control line SEL to the floppy disk drives.
Among other functions, this line selects which of the two heads is to
be used in a double-sided floppy disk drive."

The bit in VIA1 register A that is normally the "vHeadSel" line is
explicitly listed as "Reserved" on the IIfx.

It's definitely possible to access and drive the SWIM chip in bypass
mode, but that doesn't mean it's as transparent as for the SCC driver.
Apparently this external input line is not strictly required when the
SWIM chip is running in ISM mode. However, our driver appears to force
the chip into ISM mode and yet still depends on this input line.

> You may want to send the patch to the mailing list anyway. Or maybe send 
> it to the linux-mac68k bug tracker on sourceforge.

I've pasted it in here so there is a record of it. The fixes are to
properly handle multiple drives (my IIfx has two floppy drives installed)
and to initialize and handle the auto-polling of drive status properly.

	Brad Boyer
	flar@allandria.com

--- swim_iop.c-cvs	Fri Jul 19 22:49:23 2002
+++ swim_iop.c	Sat Jul 27 00:51:30 2002
@@ -5,12 +5,15 @@
  * Written by Joshua M. Thompson (funaho@jurai.org)
  * based on the SWIM3 driver (c) 1996 by Paul Mackerras.
  *
+ * Misc fixes by Brad A. Boyer (flar@allandria.com)
+ *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
  * as published by the Free Software Foundation; either version
  * 2 of the License, or (at your option) any later version.
  *
  * 1999-06-12 (jmt) - Initial implementation.
+ * 2002-07-26 (bab) - Fixed drive number storage and enabled status updates
  */
 
 /*
@@ -148,6 +151,7 @@
 int swimiop_init(void)
 {
 	volatile struct swim_iop_req req;
+	struct swimcmd_startpoll *poll = (struct swimcmd_startpoll *) &req.command[0];
 	struct swimcmd_status *cmd = (struct swimcmd_status *) &req.command[0];
 	struct swim_drvstatus *ds = &cmd->status;
 	struct floppy_state *fs;
@@ -175,6 +179,19 @@
 		return -EBUSY;
 	}
 
+	printk(KERN_ERR "SWIM_IOP: setting up automatic notification.\n");
+
+	swimiop_init_request(&req);
+	poll->code = CMD_START_POLL;
+	if (swimiop_send_request(&req) != 0) {
+		printk(KERN_ERR "SWIM_IOP: failed to request autonotify.\n");
+	} else {
+		while (!req.complete);
+		if (cmd->error != 0) {
+			printk(KERN_ERR "SWIM_IOP: notify setup failed.\n");
+		}
+	}
+
 	printk(KERN_ERR "SWIM_IOP: probing for installed drives.\n");
 
 	for (i = 0 ; i < MAX_FLOPPIES ; i++) {
@@ -199,6 +216,7 @@
 			ds->info.secondary? "secondary" : "primary");
 		swimiop_status_update(floppy_count, ds);
 		fs->state = idle;
+		fs->drive_num = i + 1;
 
 		init_timer(&fs->timeout);
 		floppy_count++;
@@ -214,6 +232,7 @@
 {
 	req->sent = 0;
 	req->complete = 0;
+	req->fs = NULL;
 	req->done = NULL;
 }
 
@@ -254,6 +273,26 @@
 }
 
 /*
+ * Find the correct status slot for given hardware drive number
+ *
+ * This is only used for unsolicited messages
+ *
+ */
+
+int swimiop_find_slot(int drive_num)
+{
+	struct floppy_state *fs;
+	int i;
+
+	for (i = 0 ; i < MAX_FLOPPIES ; i++) {
+		fs = &floppy_states[i];
+		if(fs->drive_num == drive_num)
+			return i;
+	}
+	return -1;
+}
+
+/*
  * Receive a SWIM message from the IOP.
  *
  * This will be called in two cases:
@@ -267,20 +306,32 @@
 	struct swim_iop_req *req;
 	struct swimmsg_status *sm;
 	struct swim_drvstatus *ds;
+	void	(*done)(struct swim_iop_req *);
+	int drive_slot;
 
 	req = current_req;
 
 	switch(msg->status) {
 		case IOP_MSGSTATUS_COMPLETE:
+			done = req->done;
 			memcpy(&req->command[0], &msg->reply[0], sizeof(req->command));
 			req->complete = 1;
-			if (req->done) (*req->done)(req);
+			if (done) done(req);
 			current_req = NULL;
 			break;
 		case IOP_MSGSTATUS_UNSOL:
 			sm = (struct swimmsg_status *) &msg->message[0];
 			ds = &sm->status;
-			swimiop_status_update(sm->drive_num, ds);
+			drive_slot = swimiop_find_slot(sm->drive_num);
+			if(drive_slot >= 0) {
+				printk(KERN_ERR "SWIM_IOP: unit %d changed.\n",
+					drive_slot);
+				swimiop_status_update(drive_slot, ds);
+			} else {
+				printk("SWIM-IOP: Bad message from drive %d\n",
+				       sm->drive_num);
+			}
+			memcpy(&msg->reply[0], &msg->message[0], IOP_MSG_LEN);
 			iop_complete_message(msg);
 			break;
 	}
@@ -347,7 +398,7 @@
 		schedule_timeout(1);
 	}
 	release_drive(fs);
-	return cmd->error;
+	return cmd->error ? -ENXIO : 0;
 }
 
 static ssize_t floppy_read(struct file *filp, char *buf,

