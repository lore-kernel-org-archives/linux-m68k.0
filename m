From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: wire up sys_restart_syscall
Date: Tue, 30 Dec 2008 13:12:33 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812301311241.14380@anakin>
References: <jezliekey6.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:40073 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751303AbYL3MMf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Dec 2008 07:12:35 -0500
In-Reply-To: <jezliekey6.fsf@sykes.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>
Cc: linux-m68k@vger.kernel.org

	Hi Andreas,

On Mon, 29 Dec 2008, Andreas Schwab wrote:
> Make restart blocks working, required for proper syscall restarting.

Thanks!

Is there an easy way to test this?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
