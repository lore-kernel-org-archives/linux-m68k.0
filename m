From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Sun, 6 Jul 2014 11:31:10 +0200
Message-ID: <CAMuHMdWKSWeW61Xh5-e6y7MwsXDQMipeYz4+-CLJWommZkncqQ@mail.gmail.com>
References: <87ppk7m3db.fsf@igel.home>
	<loom.20140429T121132-254@post.gmane.org>
	<8738gwxw53.fsf@igel.home>
	<CAMuHMdU50FnSD0K896b7aJN-RPXWpUoW46oiOFy-9AsYP2LGGQ@mail.gmail.com>
	<87sioww0gb.fsf@igel.home>
	<5360A881.7040107@gmail.com>
	<alpine.DEB.2.02.1405251846540.6045@ayla.of.borg>
	<87k381dwwj.fsf@igel.home>
	<CAMuHMdXseK3HydzVyQdSFQg93bOa1Uo29mg=EEHpT_9A3A1+pQ@mail.gmail.com>
	<87fvipdtz8.fsf@igel.home>
	<CAMuHMdV7QTMN+2C4OOf_zyKQ43oXec8g8T9g2qE+jNNU2HFW4w@mail.gmail.com>
	<87bntddrto.fsf@igel.home>
	<CAMuHMdXz-ek=go9dV_rcDRKYYve3q80RASFjfJj4nTCe4aMVoQ@mail.gmail.com>
	<877g41dmoa.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:49235 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbaGFJbM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Jul 2014 05:31:12 -0400
Received: by mail-la0-f53.google.com with SMTP id b8so2063143lan.40
        for <linux-m68k@vger.kernel.org>; Sun, 06 Jul 2014 02:31:10 -0700 (PDT)
In-Reply-To: <877g41dmoa.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

On Sat, Jun 28, 2014 at 6:27 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> I guess this failure can be triggered with some specific memory
>> configuration with your original version, too.
>
> No.

Hmmm...

<guess mode>
Does this (whitespace-damaged) patch help?

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index dbb118e1a4e0..a54788458ca3 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -921,7 +921,8 @@ L(nocon):
        jls     1f
        lsrl    #1,%d1
 1:
-       movel   %d1,m68k_init_mapped_size
+       lea     %pc@(m68k_init_mapped_size),%a0
+       movel   %d1,%a0@
        mmu_map #PAGE_OFFSET,%pc@(L(phys_kernel_start)),%d1,\
                %pc@(m68k_supervisor_cachemode)

</guess mode>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
