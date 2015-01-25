From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: CONFIG_DEVTMPFS_MOUNT
Date: Sun, 25 Jan 2015 11:33:29 +0100
Message-ID: <CAMuHMdXeQ13BHLewpKA0CHRX=pq_3V1_E4AY=k1k3PwKgvh37w@mail.gmail.com>
References: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
	<87wq4ke0ai.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:33123 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753206AbbAYKdb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Jan 2015 05:33:31 -0500
Received: by mail-la0-f53.google.com with SMTP id gq15so3770197lab.12
        for <linux-m68k@vger.kernel.org>; Sun, 25 Jan 2015 02:33:29 -0800 (PST)
In-Reply-To: <87wq4ke0ai.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.org>, Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Jan 18, 2015 at 1:33 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> While init on Beetle's system complained about not being able to open
>> tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MOUNT
>> broke remote login using ssh on my ARAnyM:
>>
>> $ ssh atari
>> PTY allocation request failed on channel 0
>> stdin: is not a tty
>
> What are the available ptys and is devpts properly mounted?

None.

The ancient /etc/init.d/mountdevsubfs.h looked for devfs instead of devtmpfs.
After fixing that, it works again.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
