From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Aranym, more than 244MB FastRAM, garbled display
Date: Fri, 1 Oct 2010 17:49:33 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:41766 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751044Ab0JAP43 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 1 Oct 2010 11:56:29 -0400
Received: from uninett.no (halbrend.uninett.no [158.38.62.143])
	by ufisa.uninett.no (Postfix) with ESMTPSA id C1C8580D3
	for <linux-m68k@vger.kernel.org>; Fri,  1 Oct 2010 17:49:33 +0200 (CEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>


I have almost exclusevly been running Aranym "headless" with Linux/m68k on
it (console=nfcon), but the last couple of days I've been preparing a "how
to" for installing gentoo/m68k and so I need interactive console access,
and since nfcon is read-only (will this ever change?), I've had to use the
SDL window.

One thing I have noticed is that if I set FastRAM in aranym config to
something higher than 244 I get garbled display, kinda like frozen random
noise - the kernel does boot in the background though. I tried with
different kernels (only up to 2.6.34 though), and with different versions
of aranym, but it didn't make much difference.

I should perhaps give 2.6.35 or 2.6.36 a go before reporting a bug, but it
does take a while to build so I thought I'd ask anyhow, if this is a known
issue and if there perhaps are any workarounds. Aranym is set with default
video settings, which should correspond to "video=atafb:vga16" as kernel
option I think.

Screenshots:

http://amiga.nvg.org/moro/aranym-244M.png
http://amiga.nvg.org/moro/aranym-245M.png

-- kolla
