From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Wed, 24 Jul 2013 10:57:30 +0200
Message-ID: <87li4wpc79.fsf@igel.home>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40568 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751889Ab3GXI5f (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Jul 2013 04:57:35 -0400
In-Reply-To: <201307232255.r6NMt8Z9027017@herc.mirbsd.org> (Thorsten Glaser's
	message of "Tue, 23 Jul 2013 22:51:45 +0000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

Thorsten Glaser <tg@debian.org> writes:

> - nfblock: doesn't create /dev/nfhd8p1 device node after modprobe
> - nfcon: is totally useless as module, almost only used during boot
> - nfeth: says "No such device" upon insmod

The problem is that aranym expects the parameters of the natfeat calls
to be physical addresses.  The nf_get_id calls use literal strings as
parameters which only works when the drivers are builtin because phys ==
virt then.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
