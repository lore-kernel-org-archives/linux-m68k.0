From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Mon, 20 Jan 2014 11:04:58 +1300
Message-ID: <CAOmrzk+LsQXhmtcbyUfdXqMKLXy-sxQbaDN7C90oh03hfXC3RQ@mail.gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de>
	<1388664474-1710039-3-git-send-email-arnd@arndb.de>
	<CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com>
	<70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de>
	<52D1F299.7080909@gmail.com>
	<52D4F579.50806@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:38400 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752105AbaASWE7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Jan 2014 17:04:59 -0500
Received: by mail-oa0-f48.google.com with SMTP id l6so2007920oag.21
        for <linux-m68k@vger.kernel.org>; Sun, 19 Jan 2014 14:04:59 -0800 (PST)
In-Reply-To: <52D4F579.50806@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux//m68k <linux-m68k@vger.kernel.org>

Arnd, Geert,


On Tue, Jan 14, 2014 at 9:29 PM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Arnd,
>
> this one looks like it should be changed as well:
>
>>>> @@ -562,7 +565,10 @@ static void falcon_get_lock(void)
>>>>                         falcon_trying_lock = 0;
>>>>                         wake_up(&falcon_try_wait);
>>>>                 } else {
>>>> -                       sleep_on(&falcon_try_wait);
>>>> +                       wait_event_cmd(falcon_try_wait,
>>>> +                                      !falcon_got_lock &&
>>>> !falcon_trying_lock,
>
>
> I think using falcon_got_lock && !falcon_trying_lock here reflects what we
> try to achieve - the if branch above this will set that exact
> condition, then wake the wait queue. Any other calls to falcon_get_lock that
> have been waiting on the lock should then continue on
> as the lock is now held by the driver. Thoughts?

I can confirm that the condition (falcon_got_lock &&
!falcon_trying_lock) does work here - no problems for basic
operations. Arnd, do you want to handle this, or should I send the
updated patch via Geert?

A bit of stress testing using concurrent SCSI and IDE I/O has revealed
the driver still deadlocks when SCSI commands are queued from softirq
context and the ST-DMA lock is held by the IDE or floppy driver
(presumably; haven't verified that). I will try a few likely
workarounds that had worked in the past, but the real question is
this:

Does stdma_lock need the uninterruptible wait? The comment there says
it is needed to protect locked buffers, but this was all set up back
in the dark ages. IDE takes the host lock in addition to the ST-DMA
lock, SCSI still locks out interrupts where critical (I need to change
that) so it appears all should be safe? Comments?

Cheers,

  Michael
