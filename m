From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Mon, 31 Mar 2014 22:58:39 +0200
Message-ID: <87a9c63x1c.fsf@igel.home>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:56480 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbaCaU6n (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 16:58:43 -0400
In-Reply-To: <CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	(Michael Schmitz's message of "Mon, 31 Mar 2014 14:55:05 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, debian m68k <debian-68k@lists.debian.org>

Michael Schmitz <schmitzmic@gmail.com> writes:

> see attached. I may have disabled nfcon entirely - usually I use
> parallel debug with ARAnyM.

Thanks, with debug=par early printk is working.  So the problem is that
kernel-in-FastRAM does not solve the kernel-too-big/FastRAM-too-big
problem, since the page tables for the first node (== FastRAM) memory
must still fit in INIT_MAPPED_SIZE (== 4Mb) - kernel-size.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
