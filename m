From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Thu, 30 Jan 2014 08:57:57 +0100
Message-ID: <CAMuHMdWM=MXZveRHMQPbBvg88MFABViVueVfo0mT4esXZuvfsg@mail.gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de>
	<70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de>
	<52D1F299.7080909@gmail.com>
	<201401122100.28877.arnd@arndb.de>
	<52E61895.6000007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:44183 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbaA3H56 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jan 2014 02:57:58 -0500
Received: by mail-pb0-f49.google.com with SMTP id up15so2800253pbc.22
        for <linux-m68k@vger.kernel.org>; Wed, 29 Jan 2014 23:57:58 -0800 (PST)
In-Reply-To: <52E61895.6000007@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux//m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Mon, Jan 27, 2014 at 9:28 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> While working on the driver, I noticed my Falcon ran into a memory squeeze
> once a day, resulting in oom-killing processes and rendering the system
> unusable. Most likely culprit to trigger this is the daily updatedb run.
> This sort of trouble started pretty much with my work on the SCSI driver,
> based on commit aa5311c454ed0ff959adca29c65be2157f52a84c (3.13-rc7). Do you
> know of any memory leak affecting m68k, introduced between last November and
> 3.13-rc7?

How much RAM and swap do you have?

Modern kernels just require more memory...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
