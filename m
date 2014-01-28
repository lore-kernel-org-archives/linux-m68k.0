From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] m68k/atari - Atari NCR5380 SCSI driver fixes
Date: Tue, 28 Jan 2014 09:02:08 +0100
Message-ID: <CAMuHMdXJD_nMnAWgfU+2Y7RcxmXd890HCRUm3CLO4OG40GSp4g@mail.gmail.com>
References: <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com>
	<1390895551-16270-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:42080 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754726AbaA1ICJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Jan 2014 03:02:09 -0500
Received: by mail-pd0-f172.google.com with SMTP id p10so49609pdj.3
        for <linux-m68k@vger.kernel.org>; Tue, 28 Jan 2014 00:02:09 -0800 (PST)
In-Reply-To: <1390895551-16270-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Tue, Jan 28, 2014 at 8:52 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> this patch series brings the Atari NCR5380 driver up to date with current 3.x
> (or even 2.6) series SCSI midlevel and error handling changes.
>
> The first patch fixes completion condition errors contained in Arnd Bergmann's
> patch ([PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race). The locking
> scheme still isn't 100% race free that way, but much improved, and I've seen
> the driver successfully handle error recovery from aborting a disconnected
> command via bus reset with all three patches applied. Never managed to do that
> before. Not sure whether this one should be taken through your tree or handled
> by Arnd rather.
>
> The other two are a rehash of old patches I had prepared somewhere along the
> 2.6 series - somehow or other these were lost when one of my old git trees
> went pear shaped. Abort and reset handler return codes have changed, and the
> SCSI midlevel now queues commands (in particular error handling ones) from
> softirq context - the Falcon locking scheme was ill equipped to deal with that.

Can you please resend the series including
  1. the SCSI maintainer,
  2. the SCSI mailing list,
  3. Arnd Bergmann?

scripts/get_maintainer.pl is your friend.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
