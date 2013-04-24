From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] m68k: Add -ffreestanding to KBUILD_CFLAGS
Date: Wed, 24 Apr 2013 14:10:51 +0200
Message-ID: <CAMuHMdW7x4Uk8Hyb3rVnnAafUiHtFx--BuBN__dchNUmtoribQ@mail.gmail.com>
References: <1365585879-5321-1-git-send-email-geert@linux-m68k.org>
	<51653C5D.4060408@suse.cz>
	<CAMuHMdXEvLMz5rRjQrhENxJ6UHRnPCtzyNg=hqitspuY88G7sA@mail.gmail.com>
	<20130410122611.GB17541@sepie.suse.cz>
	<loom.20130424T140004-252@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f178.google.com ([209.85.210.178]:42973 "EHLO
	mail-ia0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754741Ab3DXMKw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Apr 2013 08:10:52 -0400
Received: by mail-ia0-f178.google.com with SMTP id j38so1494762iad.37
        for <linux-m68k@vger.kernel.org>; Wed, 24 Apr 2013 05:10:51 -0700 (PDT)
In-Reply-To: <loom.20130424T140004-252@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

If you're replying to linux-m68k only, I don't think Michal will see
your reply...

On Wed, Apr 24, 2013 at 2:01 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Michal Marek <mmarek <at> suse.cz> writes:
>
>> exported strcpy symbol. An I would naively assume, that if the compi=
ler
>> sees a static inline definition of a function, then it will not gene=
rate
>> a function call. Although, the C standard does require the standard
>
> =E2=80=9CIf the compiler sees=E2=80=9D but the thing is, the compiler=
 does not see
> a call to strlen, but a call to strncat and replaces that in-tree.
>
>> library functions be available as external functions, so the compile=
r
>
> Only for hosted environments.
>
> Which is why -ffreestanding is the only correct thing to do.
>
> bye,
> //mirabilos
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
