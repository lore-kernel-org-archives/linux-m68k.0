Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C0FC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:56:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8635E60F4B
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237049AbhIMF5v (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 01:57:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:33236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237032AbhIMF5u (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 01:57:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0723160F24;
        Mon, 13 Sep 2021 05:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631512595;
        bh=2QA8dwKKOmBevJTM8u0TYJ7PSPw9xQ3xjolWSkjdzoc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rI55nKNpZBWShklng240qQqAtcSf+Hp5Dzg+qC/QtCV0croEj9MN+alqouew22FT3
         qx45n2GvyEKtpXoATooz3rrf4LcZRik+ZQtlRCPXQ+XD1lhT5N5ugbJId419GsAhYs
         VyNlrmtASk4ahp/29ZdTvazaldUbag1ZO/VmQunqOodwtQ4EY0jX4SiDGa3fxeFL+G
         e/zuE/zkGzwX9RxwhCxOrwzIuliXDRTKwVO75sSNLqCKjwhiqxueIoRQJsBxLOOuPe
         e8ugE26IKqKoTfr/WkdbdYNhqey3NViCUGeCOjnaK+LKlCJSxlvJDR+h7HF7GrbwYn
         TMpP5wcgkM2XA==
Date:   Mon, 13 Sep 2021 08:56:28 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
Message-ID: <YT7oDJhKHNVyHZU9@kernel.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
 <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
 <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Mon, Sep 13, 2021 at 03:17:33PM +1000, Finn Thain wrote:
> On Mon, 13 Sep 2021, Michael Schmitz wrote:
> 
> > 
> > I'm amazed this works - I'd expect the kernel text segment to get 
> > trashed by the memory test routines.
> 
> I think the initramfs may get clobbered when the 'memtest' parameter is 
> set. But that may be expected behaviour...

It's not the expected behaviour. The initramfs is clobbered because memtest
runs before initramfs memory is reserved. The patch below (not even compile
tested) should help. Now, for some reason the reservation of initrd does
not happen on SUN3, which is probably wrong, so maybe we can drop that 
#ifndef CONFIG_SUN3 before #ifdef CONFIG_BLK_DEV_INITRD.

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 4b51bfd38e5f..4ca8f1120abc 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -338,12 +338,6 @@ void __init setup_arch(char **cmdline_p)
 		panic("No configuration setup");
 	}
 
-	paging_init();
-
-#ifdef CONFIG_NATFEAT
-	nf_init();
-#endif
-
 #ifndef CONFIG_SUN3
 #ifdef CONFIG_BLK_DEV_INITRD
 	if (m68k_ramdisk.size) {
@@ -352,8 +346,16 @@ void __init setup_arch(char **cmdline_p)
 		initrd_end = initrd_start + m68k_ramdisk.size;
 		pr_info("initrd: %08lx - %08lx\n", initrd_start, initrd_end);
 	}
+#endif
 #endif
 
+	paging_init();
+
+#ifdef CONFIG_NATFEAT
+	nf_init();
+#endif
+
+#ifndef CONFIG_SUN3
 #ifdef CONFIG_ATARI
 	if (MACH_IS_ATARI)
 		atari_stram_reserve_pages((void *)availmem);
 
-- 
Sincerely yours,
Mike.
