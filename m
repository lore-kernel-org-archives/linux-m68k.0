From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: remove extern definitions of memory_start/memory_end from mm/init
Date: Tue, 23 Aug 2011 17:45:32 +0200
Message-ID: <m2mxf0p1wj.fsf@igel.home>
References: <1314079503-26758-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:34001 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751997Ab1HWPph (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 11:45:37 -0400
In-Reply-To: <1314079503-26758-1-git-send-email-gerg@snapgear.com>
	(gerg@snapgear.com's message of "Tue, 23 Aug 2011 16:05:03 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

<gerg@snapgear.com> writes:

> From: Greg Ungerer <gerg@uclinux.org>
>
> We do not need to have local extern definitions of memory_start and
> memory_end in mm/init_no.c. There are definitions already in asm/page_no.h.

s/definitions/declarations/

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
