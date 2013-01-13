From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] swim: Add missing spinlock init
Date: Sun, 13 Jan 2013 10:42:56 +0100
Message-ID: <CAMuHMdX7QtTOeFf_tQyAeY0XPCdBTUZCYkTmC3jWi4S+3zG-Lw@mail.gmail.com>
References: <20120906134830.52cbdfec@endymion.delvare>
	<CAMuHMdUXvB8P9J26KbMXeicv0BH=gdaCHaRq-ZAP=73hn+ThMw@mail.gmail.com>
	<20121216214800.3ad603b4@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f45.google.com ([209.85.212.45]:39152 "EHLO
	mail-vb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753882Ab3AMJm7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Jan 2013 04:42:59 -0500
In-Reply-To: <20121216214800.3ad603b4@endymion.delvare>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jean Delvare <khali@linux-fr.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Jean,

On Sun, Dec 16, 2012 at 9:48 PM, Jean Delvare <khali@linux-fr.org> wrote:
> On Thu, 6 Sep 2012 14:03:27 +0200, Geert Uytterhoeven wrote:
>> On Thu, Sep 6, 2012 at 1:48 PM, Jean Delvare <khali@linux-fr.org> wrote:
>> > It doesn't seem this spinlock was properly initialized.
>>
>> Quiet possible. There's no SMP on m68k, so all spinlock ops expand to nothing.
>
> Can we apply my patch still? Or were you suggesting you're fine with
> the code as it is?
>
> Certainly this isn't my area of expertise but I don't quite get the
> point of passing a custom lock to blk_init_queue() if locks resolve to
> nothing anyway.

Thanks, applied and queued for 3.9.

>> > Signed-off-by: Jean Delvare <khali@linux-fr.org>
>> > Cc: Finn Thain <fthain@telegraphics.com.au>
>> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> > ---
>> > I can't even build-test this.
>> >
>> >  drivers/block/swim.c |    1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > --- linux-3.6-rc4.orig/drivers/block/swim.c     2012-07-21 22:58:29.000000000 +0200
>> > +++ linux-3.6-rc4/drivers/block/swim.c  2012-09-06 13:09:26.713382169 +0200
>> > @@ -845,6 +845,7 @@ static int __devinit swim_floppy_init(st
>> >                 swd->unit[drive].swd = swd;
>> >         }
>> >
>> > +       spin_lock_init(&swd->lock);
>> >         swd->queue = blk_init_queue(do_fd_request, &swd->lock);
>> >         if (!swd->queue) {
>> >                 err = -ENOMEM;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
