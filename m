Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCCFC28D13
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Aug 2022 09:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233707AbiHVJJg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 Aug 2022 05:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232778AbiHVJJe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 Aug 2022 05:09:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD90428705
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Aug 2022 02:09:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6435B80EA0;
        Mon, 22 Aug 2022 09:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35330C433C1;
        Mon, 22 Aug 2022 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661159369;
        bh=XI4zIMZ5pjEhQzmcRIEOJWCstaCLgvrUV3k1RkrUHhk=;
        h=Subject:To:Cc:From:Date:From;
        b=IcpLEdODg0b+9JhDH7imI5EnP5nGk+0dmmZKfShHJdCD/WsQKhvrFcQf25cfyQSgV
         i1OL/3sTTfWgdC/CPHGTaeRsv10y4iqkhnz58WKz5FLwVgBv2gLVS4FcmV6FCXgzCS
         kKNSMLEv2vTLAqrmV6nkHPK3755/c5v51+N1pIk0=
Subject: Patch "m68k: coldfire/device.c: protect FLEXCAN blocks" has been added to the 5.19-stable tree
To:     angelo@kernel-space.org, geert@linux-m68k.org, gerg@linux-m68k.org,
        gregkh@linuxfoundation.org, linux-m68k@lists.linux-m68k.org,
        rdunlap@infradead.org, uclinux-dev@uclinux.org
Cc:     <stable-commits@vger.kernel.org>
From:   <gregkh@linuxfoundation.org>
Date:   Mon, 22 Aug 2022 11:05:59 +0200
Message-ID: <1661159159157226@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    m68k: coldfire/device.c: protect FLEXCAN blocks

to the 5.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     m68k-coldfire-device.c-protect-flexcan-blocks.patch
and it can be found in the queue-5.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 3c2bf173501652fced1d058834e9c983d295b126 Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Mon, 30 May 2022 19:17:12 -0700
Subject: m68k: coldfire/device.c: protect FLEXCAN blocks

From: Randy Dunlap <rdunlap@infradead.org>

commit 3c2bf173501652fced1d058834e9c983d295b126 upstream.

When CAN_FLEXCAN=y and M5441x is not set/enabled, there are build
errors in coldfire/device.c:

../arch/m68k/coldfire/device.c:595:26: error: 'MCFFLEXCAN_BASE0' undeclared here (not in a function); did you mean 'MCFDMA_BASE0'?
  595 |                 .start = MCFFLEXCAN_BASE0,
../arch/m68k/coldfire/device.c:596:43: error: 'MCFFLEXCAN_SIZE' undeclared here (not in a function)
  596 |                 .end = MCFFLEXCAN_BASE0 + MCFFLEXCAN_SIZE,
../arch/m68k/coldfire/device.c:600:26: error: 'MCF_IRQ_IFL0' undeclared here (not in a function); did you mean 'MCF_IRQ_I2C0'?
  600 |                 .start = MCF_IRQ_IFL0,
../arch/m68k/coldfire/device.c:605:26: error: 'MCF_IRQ_BOFF0' undeclared here (not in a function); did you mean 'MCF_IRQ_I2C0'?
  605 |                 .start = MCF_IRQ_BOFF0,
../arch/m68k/coldfire/device.c:610:26: error: 'MCF_IRQ_ERR0' undeclared here (not in a function); did you mean 'MCF_IRQ_I2C0'?
  610 |                 .start = MCF_IRQ_ERR0,

Protect the FLEXCAN code blocks by checking if MCFFLEXCAN_SIZE
is defined.

Fixes: 35a9f9363a89 ("m68k: m5441x: add flexcan support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: uclinux-dev@uclinux.org
Cc: Angelo Dureghello <angelo@kernel-space.org>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/m68k/coldfire/device.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -581,7 +581,7 @@ static struct platform_device mcf_esdhc
 };
 #endif /* MCFSDHC_BASE */
 
-#if IS_ENABLED(CONFIG_CAN_FLEXCAN)
+#ifdef MCFFLEXCAN_SIZE
 
 #include <linux/can/platform/flexcan.h>
 
@@ -620,7 +620,7 @@ static struct platform_device mcf_flexca
 	.resource = mcf5441x_flexcan0_resource,
 	.dev.platform_data = &mcf5441x_flexcan_info,
 };
-#endif /* IS_ENABLED(CONFIG_CAN_FLEXCAN) */
+#endif /* MCFFLEXCAN_SIZE */
 
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
@@ -657,7 +657,7 @@ static struct platform_device *mcf_devic
 #ifdef MCFSDHC_BASE
 	&mcf_esdhc,
 #endif
-#if IS_ENABLED(CONFIG_CAN_FLEXCAN)
+#ifdef MCFFLEXCAN_SIZE
 	&mcf_flexcan0,
 #endif
 };


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-5.19/um-add-missing-apply_returns.patch
queue-5.19/m68k-coldfire-device.c-protect-flexcan-blocks.patch
