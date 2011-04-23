From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Fix for SLUB? (was: Fwd: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards)
Date: Sat, 23 Apr 2011 19:09:56 +0200
Message-ID: <m2tydohp23.fsf@igel.home>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
	<BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
	<BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>
	<BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:59837 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751108Ab1DWRKB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 13:10:01 -0400
In-Reply-To: <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com> (Michael
	Schmitz's message of "Sat, 23 Apr 2011 15:47:23 +1200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>

Michael Schmitz <schmitzmic@googlemail.com> writes:

> Hi,
>
> node_present_pages(node) returns false:
>
> m68k_setup_node: node 0 addr 0 size 14680064
> m68k_setup_node: node 0 not present!
> m68k_setup_node: node 1 addr 16777216 size 268435456
> m68k_setup_node: node 1 not present!

That's because paging_init calls m68k_setup_node before
free_area_init_node, which is where node_present_pages is set.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
