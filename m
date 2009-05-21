From: Lanttor <lanttor.guo@freescale.com>
Subject: why the PAGE_OFFSET is not 0xc0000000 on m68k platform
Date: Thu, 21 May 2009 12:17:41 +0800
Message-ID: <4A14D5E5.9070103@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:59523 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbZEUEIQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 May 2009 00:08:16 -0400
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n4L48HeJ029885
	for <linux-m68k@vger.kernel.org>; Wed, 20 May 2009 21:08:17 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id n4L48FSu027530
	for <linux-m68k@vger.kernel.org>; Wed, 20 May 2009 23:08:16 -0500 (CDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

I see the definition of PAGE_OFFSET on m68k platform like that:

#define PAGE_OFFSET (PAGE_OFFSET_RAW)

#ifdef CONFIG_MMU
#ifndef CONFIG_SUN3
#define PAGE_OFFSET_RAW         0x00000000
#else
#define PAGE_OFFSET_RAW         0x0E000000
#endif
#else
#define PAGE_OFFSET_RAW         CONFIG_RAMBASE
#endif

In my understanding, the kernel page mapping depends on PAGE_OFFSET.
For example, if PAGE_OFFSET is 0x00000000 (assuming 256M memory), the
kernel virtual address will be at (0x00000000 - 0x10000000), right?

Could this incur some side effect? I see the definition of PAGE_OFFSET
is 0xc0000000 on much platforms.

Thanks,

-- 
Best Regards,
Lanttor


