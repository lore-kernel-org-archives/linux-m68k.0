From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for !CONFIG_ISA
Date: Mon, 4 Oct 2010 15:18:06 +0200
Message-ID: <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
	<Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
	<alpine.OSX.2.00.1010041149030.285@localhost>
	<Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
	<alpine.OSX.2.00.1010041943530.285@localhost>
	<Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>
	<alpine.OSX.2.00.1010042115260.285@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61670 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755010Ab0JDNSM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 09:18:12 -0400
Received: by iwn5 with SMTP id 5so6910595iwn.19
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 06:18:11 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1010042115260.285@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, Oct 4, 2010 at 12:22, Finn Thain <fthain@telegraphics.com.au> w=
rote:
> It builds for me if I disable CONFIG_SPEAKUP. Otherwise, I get:
>
> drivers/staging/speakup/speakup_dtlk.c: In function 'synth_probe':
> drivers/staging/speakup/speakup_dtlk.c:339: error: implicit declarati=
on of function 'inw_p'
> make[3]: *** [drivers/staging/speakup/speakup_dtlk.o] Error 1
> make[2]: *** [drivers/staging/speakup] Error 2
> make[1]: *** [drivers/staging] Error 2
> make: *** [drivers] Error 2
>
> OTOH, I am using my own build of gcc 4.4.4-8 and none of this was bui=
lt
> with apt, so YMMV...
>
> I suppose another alternative would be to omit or reverse the patch t=
hat
> adds speakup in the first place, if that's more convenient.

I don't think it makes sense to build staging drivers on Debian/m68k.
So can't you default to CONFIG_STAGING=3Dn?

While I do enable them in my test builds to catch portability issues, m=
ost of
them don't matter for m68k at all.

> On Mon, 4 Oct 2010, Thorsten Glaser wrote:
>> Finn Thain dixit:
>>
>> >It would be better if we used the same .config, don't you think?
>>
>> *sigh*
>>
>> # apt-get source linux-2.6
>> # cd linux-2.6-2.6.32
>>
>> optionally:
>> # $EDITOR debian/config/m68k/defines
>> =E2=87=92 in [base] comment out everything except =E2=80=9Cflavours:=
=E2=80=9D and =E2=80=9Catari=E2=80=9D
>> =C2=A0 to save time compiling the other images
>>
>> then:
>> # debian/rules clean
>> (this may give you an error message)
>> # dpkg-buildpackage -B
>>
>>
>> So, no modifications to stock Debian. Well, except for #598893=E2=80=
=A6

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
