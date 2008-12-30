From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: wire up sys_restart_syscall
Date: Tue, 30 Dec 2008 15:31:08 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812301530560.14380@anakin>
References: <jezliekey6.fsf@sykes.suse.de> <Pine.LNX.4.64.0812301311241.14380@anakin>
 <jeabadkdwj.fsf@sykes.suse.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:54760 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752069AbYL3ObL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Dec 2008 09:31:11 -0500
In-Reply-To: <jeabadkdwj.fsf@sykes.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@suse.de>
Cc: linux-m68k@vger.kernel.org

On Tue, 30 Dec 2008, Andreas Schwab wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> 
> > Is there an easy way to test this?
> 
> Run 'sleep 100' and then attach to it with strace.  Without this patch
> the nanosleep syscall returns with an error instead of being restarted.

Thanks! Applied.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
