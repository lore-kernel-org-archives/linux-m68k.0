From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel v2.6.38
Date: Sun, 24 Apr 2011 10:12:54 +1200
Message-ID: <4DB34EE6.6010004@gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>	<Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org> <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:41335 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757268Ab1DWWNG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 23 Apr 2011 18:13:06 -0400
Received: by pvg12 with SMTP id 12so740648pvg.19
        for <linux-m68k@vger.kernel.org>; Sat, 23 Apr 2011 15:13:05 -0700 (PDT)
In-Reply-To: <BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Hi Geert,
> On Sat, Apr 23, 2011 at 20:13, Thorsten Glaser <tg@mirbsd.de> wrote:
>  =20
>> =E2=80=A2 Reserve ST RAM early
>>    =20
>
> Yeah, that's a valid one,
> My (and probably lkml's) main issue there is that it introduces yet
> another custom
> allocator. Can we avoid that?
>  =20
Ideally it would not be an issue if we could properly flag ST-RAM only=20
as DMA memory. I've tried in the past but setting the max. DMA address=20
to the 0x00ffffff did have unintended side effects elsewhere in the m68=
k=20
mm code.

If there is a generic lowmem allocator, we might be able to use that=20
instead. It does not need to be available early on, but we need to be=20
able to reserve some lowmem early.

Another possible hack would be to allocate lowmem early on for each=20
compiled-in user and store that in a platform device struct for use by=20
the driver once it initializes. Is there such a thing like early=20
initcalls for this specific purpose (do a minimum early setup such as=20
allocate resources, silence IRQs and the like)?.

If all that is not an option (and for the sake of modules needing=20
ST-RAM), I don't see another way to do it. Some parts of the hardware=20
just need memory below 0x00ffffff.

Cheers,

  Michael

>  =20
>> I=E2=80=99m Bcc=E2=80=99ing the Debian Kernel person I was talking t=
o, so we may
>> get an agreement. I=E2=80=99ll revisit your gitweb later then, to se=
e
>> which patches you actually schedule for Linus, and try to get
>> them into Debian.
>>    =20
>
> As for-2.6.39 got rebased in the mean time, you have to compare
> m68k-v2.6.38 with m68k-queue to see what's (not yet) upstream.
>
> And to back up Christian: keep up the good work!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
