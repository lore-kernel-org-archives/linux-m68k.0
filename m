From: Jin Zhengxiong-R64188 <R64188@freescale.com>
Subject: RE: [PATCH 05/35] m68k: add TASK definitions for ColdFires running
 with MMU
Date: Thu, 8 Dec 2011 02:05:36 +0000
Message-ID: <BE72CBA69B1D6F44B0680DF984332A32313660@039-SN1MPN1-004.039d.mgd.msft.net>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
 <1322192480-22822-6-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:48556 "EHLO
	TX2EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756792Ab1LHCFm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 7 Dec 2011 21:05:42 -0500
In-Reply-To: <1322192480-22822-6-git-send-email-gerg@snapgear.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "gerg@snapgear.com" <gerg@snapgear.com>, "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, "uclinux-dev@uclinux.org" <uclinux-dev@uclinux.org>
Cc: Greg Ungerer <gerg@uclinux.org>


> @@ -66,10 +68,12 @@ static inline void wrusp(unsigned long usp)
>   * space during mmap's.
>   */
>  #ifdef CONFIG_MMU
> -#ifndef CONFIG_SUN3
> -#define TASK_UNMAPPED_BASE	0xC0000000UL
> -#else
> +#if defined(CONFIG_COLDFIRE)
> +#define TASK_UNMAPPED_BASE	0x80000000UL
 
[Jin Zhengxiong-R64188] Need to set TASK_UNMAPPED_BASE somewhere below 0x80000000
to not break runtime linker.  When ld.so is invoked explicitly
(i.e., /lib/ld.so.1 ./myprog), it needs to be loaded below 0x80000000,
otherwise it will overwrite itself with the program it tries to load.

The comments come from codesourcery and we have set it to 0x60000000
in the latest BSP.

Jason
