From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Fix for SLUB?
Date: Sun, 24 Apr 2011 10:26:18 +0200
Message-ID: <BANLkTi=Q2mYPqsEV+Fz61M7_g7PGF9L2xg@mail.gmail.com>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
	<BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
	<BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>
	<BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>
	<BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>
	<Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>
	<20110423185725.GA16947@chumley.earth.sol>
	<4DB38598.5000607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:59682 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755186Ab1DXI0T convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 04:26:19 -0400
Received: by fxm17 with SMTP id 17so887950fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 24 Apr 2011 01:26:18 -0700 (PDT)
In-Reply-To: <4DB38598.5000607@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Sun, Apr 24, 2011 at 04:06, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> Christian T. Steigies wrote:
>>>
>>> I???m trying now (using a cross compiler, to speed up testing).
>>> Sorry for not doing anything for a while, the ???air has left
>>> me??? (generally and due to lack of progress with m68k as one
>>> can only be the only fighter for ever so long).
>>>
>>
>> I can understand this, but I am very impressed by all the work you h=
ave
>> done
>> for m68k recently! Please don't give up.
>>
>
> I'll second this sentiment wholeheartedly. It's been good to see a fr=
esh
> face injecting a lot of life into the project.
>>
>>
>>>
>>> But I was just told by a member of the Debian Kernel Team on
>>> IRC that the patches from m68k-v2.6.38 will (probably) not be
>>> accepted, unless they go in via Linus??? tree. How are chances
>>> of that happening? (He says they had told that years ago al-
>>> ready.) I???ll need at least the ARAnyM/NatFeat support and some
>>> of the bugfixes. Otherwise I fear this keeps getting obsolete
>>> very fast. ???
>>>
>>
>> As Geert wrote, almost all patches will make it into the official ke=
rnel
>> tree, only m68k usually needs them a little sooner. Is there no m68k=
 DD
>> left
>> who works on the kernel? When I was still submitting patches, there =
never
>> was a problem, but I made sure that m68k patches only got applied to=
 the
>> m68k tree. Of course, the smaller the patches, the better, and Geert=
 was
>> very good with sending m68k patches upstream. In case you can not ge=
t
>> those
>> small patches in, I can give it a try (when I have a properly workin=
g DSL
>> again, and more time, so I can also set up crest and kullervo...).
>>
>
> At the very least, the Debian kernel maintainers ought to take a smal=
l patch
> to disable SLUB for m68k for as long as it takes to get this fix incl=
uded
> via upstream and possibly backporting.

Not only for m68k. The parisc people are already making more noise abou=
t it ;-)

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
