Return-Path: <SRS0=9XsF=7R=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48C1C433E0
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Jun 2020 04:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9A6E2072E
	for <linux-m68k@archiver.kernel.org>; Thu,  4 Jun 2020 04:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgFDEta (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 4 Jun 2020 00:49:30 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:33904 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgFDEta (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 4 Jun 2020 00:49:30 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id B44C629AC5;
        Thu,  4 Jun 2020 00:49:24 -0400 (EDT)
Date:   Thu, 4 Jun 2020 14:49:24 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Brad Boyer <flar@allandria.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 0/4] Mac IOP driver fixes
In-Reply-To: <20200604031938.GA25970@allandria.com>
Message-ID: <alpine.LNX.2.22.394.2006041424440.8@nippy.intranet>
References: <cover.1590880333.git.fthain@telegraphics.com.au> <CAMuHMdVb2C7asip_-_zbc3JP+nqn6siKqmikOK98tM5=2BYqcQ@mail.gmail.com> <alpine.LNX.2.22.394.2006010931070.8@nippy.intranet> <20200601060915.GA8450@allandria.com> <alpine.LNX.2.22.394.2006020922570.8@nippy.intranet>
 <20200602022157.GA3216@allandria.com> <alpine.LNX.2.22.394.2006021317230.8@nippy.intranet> <20200604031938.GA25970@allandria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 3 Jun 2020, Brad Boyer wrote:

> On Tue, Jun 02, 2020 at 01:48:22PM +1000, Finn Thain wrote:
> > 
> > Yes, I was aware of that issue. But the GTMFH 2ed. figure 9-14 
> > indicates that (on the IIfx) pin 12 in the drive connector is driven 
> > by the SWIM HDSEL pin instead of VIA1 Port A output. So, I wrote a 
> > patch to attempt to get the SWIM to drive this pin. But nothing worked 
> > because I never succeeded in putting the chip into bypass mode.
> 
> There does appear to be a bit in the mode register to directly control 
> the SEL line to the drive. Nothing in our code appears to use it. You 
> would write HEDSEL to mode0 to clear the line, and write HEDSEL to mode1 
> to set the line. However, it looks like the first bit in the setup 
> register controls if that line is input or output. Not sure why we have 
> it named S_INV_WDATA, but the state machine to the actual floppy drive 
> is way beyond my comprehension. I'll note that the swim3.c driver uses 
> the SELECT bit in the control register to do the same basic thing (and 
> it's the same bit value as HEDSEL in swim.c).
> 

I think that agrees with the patch I wrote a couple of years ago, back 
when I was working on this problem:

diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 392e57c2e5ea..ea77b983ccb9 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -130,6 +130,7 @@
 /* Non-zero if the IOPs are present */
 
 int iop_scc_present, iop_ism_present;
+EXPORT_SYMBOL(iop_ism_present);
 
 /* structure for tracking channel listeners */
 
diff --git a/drivers/block/swim.c b/drivers/block/swim.c
index 0e31884a9519..883ff1bc1ea0 100644
--- a/drivers/block/swim.c
+++ b/drivers/block/swim.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 
 #include <asm/mac_via.h>
+#include <asm/mac_iop.h>
 
 #define CARDNAME "swim"
 
@@ -135,7 +136,8 @@ struct iwm {
 
 /* bits in setup register */
 
-#define S_INV_WDATA	0x01
+#define S_Q3_OUTPUT	0x01 /* SWIM */
+#define S_INV_WDATA	0x01 /* SWIM 2 */
 #define S_3_5_SELECT	0x02
 #define S_GCR		0x04
 #define S_FCLK_DIV2	0x08
@@ -273,8 +275,13 @@ static inline void swim_select(struct swim __iomem *base, int sel)
 {
 	swim_write(base, phase, RELAX);
 
-	via1_set_head(sel & 0x100);
-
+	if (iop_ism_present) {
+		if (sel & 0x100)
+			swim_write(base, mode1, HEDSEL);
+		else
+			swim_write(base, mode0, HEDSEL);
+	} else
+		via1_set_head(sel & 0x100);
 	swim_write(base, phase, sel & CA_MASK);
 }
 
@@ -646,7 +653,12 @@ static int floppy_open(struct block_device *bdev, fmode_t mode)
 	else
 		fs->ref_count++;
 
-	swim_write(base, setup, S_IBM_DRIVE  | S_FCLK_DIV2);
+	if (iop_ism_present)
+		swim_write(base, setup, S_IBM_DRIVE | S_FCLK_DIV2 |
+					S_Q3_OUTPUT);
+	else
+		swim_write(base, setup, S_IBM_DRIVE | S_FCLK_DIV2);
+
 	udelay(10);
 	swim_drive(base, fs->location);
 	swim_motor(base, ON);

> I know we at least used to have a problem where the SCC ports only 
> worked if they were already in bypass mode. There was something we 
> weren't doing right about setting the bypass mode. I'm not sure if we 
> ever fixed it. If you turn off the "Compatible Mode" in the Serial 
> Switch control panel, does the Linux kernel SCC driver still work 
> afterwards? I know that was a problem at one point.
> 

Yes, it's still a problem. This relates directly to patch 2/4, so I asked 
Stan to confirm this before I sent the present patch series. Apparently 
the IOP_BYPASS bit is read-only. To effect a switch to bypass mode I 
believe that it is necessary to send the right message to the IOP kernel.

> > With regard to PowerBooks, we will need to power up the drive. And 
> > with regard to the IIfx, the A/UX iop.h header file indicates that, in 
> > bypass mode, the ISM registers have a 2-byte spacing (instead of 
> > 512-byte).
> 
> The notes I have indicate the SWIM registers are at the same spacing as 
> the SCC registers on the other IOP. That's definitely not 512-byte, so I 
> presume it's 2-byte spacing as that's what the SCC driver looks like it 
> does.
> 
> > But I wish I knew why the driver doesn't work on an LC III, which 
> > supposedly has a SWIM 2, just like the Quadra 800.
> 
> If I had to guess, the select line isn't in the same place. For example, 
> on the Mac Portable (which obviously isn't supported in Linux) that line 
> is apparently in VIA2 register B (as are most of the other bits that 
> normally show up in register A). Based on looking at the driver, being 
> unable to drive that line to the disk drive would break lots of stuff, 
> including the detection of the disk inserted in the drive.
> 

OK. I see that figure 9-11 has these details. I never noticed that, being 
that the Portable seemed to have no relevance.

We will have to experiment further to find out whether setting this bit 
has any effect on the LC III.
