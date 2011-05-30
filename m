From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: linux-2.6_2.6.39-1_amd64.changes ACCEPTED into unstable
Date: Mon, 30 May 2011 19:14:24 +0200
Message-ID: <BANLkTikQSZev=QHYFR2kxsUY2xND37Dr8g@mail.gmail.com>
References: <E1QNV5z-0006jD-Ej@franck.debian.org>
	<20110521122605.GA16345@chumley.earth.sol>
	<Pine.BSM.4.64L.1105211232060.14234@herc.mirbsd.org>
	<Pine.BSM.4.64L.1105211327140.14234@herc.mirbsd.org>
	<BANLkTimfZ4oHhT7chf=7-gHH_DVMQqHH+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35661 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751566Ab1E3ROZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 30 May 2011 13:14:25 -0400
Received: by pzk9 with SMTP id 9so1679228pzk.19
        for <linux-m68k@vger.kernel.org>; Mon, 30 May 2011 10:14:25 -0700 (PDT)
In-Reply-To: <BANLkTimfZ4oHhT7chf=7-gHH_DVMQqHH+g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Thorsten Glaser <tg@mirbsd.de>

Geert,

remind me - what rewrite will be required?

I've seen your work on the chip RAM driver, will take a close look at
adapting this for ST-RAM when I return from overseas.

Cheers,

  Michael


On Tue, May 24, 2011 at 2:22 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sat, May 21, 2011 at 15:28, Thorsten Glaser <tg@mirbsd.de> wrote:
>>>main archive in a few days, then. Just saw there was a new upload.
>>
>> Hm, well. It doesn=E2=80=99t include the =E2=80=9CReserve ST-RAM ear=
ly=E2=80=9D patch =E2=98=B9
>> but we know how to work around the problem, for now, I think.
>> Let=E2=80=99s just hope it=E2=80=99ll end up in 2.6.40 upstream.
>
> I'm sorry, it won't make 2.6.40, unless someone does the rewrite befo=
re Sunday
> (Linus flying to Japan, end-of-merge-window).
>
> Gr{oetje,eeting}s,
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
