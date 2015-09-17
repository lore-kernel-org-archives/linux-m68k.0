From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/4] m68k: Wire up direct ipc calls
Date: Thu, 17 Sep 2015 17:18:53 +0200
Message-ID: <CAMuHMdW+An7Qa5Jt=JpHooy4Q9LopdKJWrpcJ0-0YsFi-i_FUQ@mail.gmail.com>
References: <1442221006-2027-1-git-send-email-geert@linux-m68k.org>
	<1442221006-2027-4-git-send-email-geert__19660.9066486873$1442221083$gmane$org@linux-m68k.org>
	<mvma8slm7wd.fsf@hawking.suse.de>
	<CAMuHMdUncyXjxkS99SDTjx0-sU26jtCmFuHeU1=0DoqZL2AWvQ@mail.gmail.com>
	<mvmvbb9krpd.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35688 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723AbbIQPSx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Sep 2015 11:18:53 -0400
In-Reply-To: <mvmvbb9krpd.fsf@hawking.suse.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Andreas,

On Thu, Sep 17, 2015 at 5:09 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> You mean that we should drop "select ARCH_WANT_IPC_PARSE_VERSION",
>> but we can't do that because an indirect call through sys_ipc() would
>> still need it when dispatching to sys_{sem,shm,msg}ctl()?
>
> Yes.  But all architectures that currently use both sys_ipc and
> ARCH_WANT_IPC_PARSE_VERSION would benefit from decoupling it when they
> add the direct syscalls.

Do we currently have architectures that use both sys_ipc and the direct
syscalls, where keeping ipc_parse_version() in the direct syscalls is required?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
