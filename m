From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 33/35] m68k: do not use m68k startup or interrupt code for
 ColdFire CPU's
Date: Wed, 28 Dec 2011 11:09:30 +0100
Message-ID: <CAMuHMdXbjFaWPV8S4g8Z8=h+=Lqimxi9-Xaiao+g80amLB9JnQ@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-34-git-send-email-gerg@snapgear.com>
	<CAMuHMdX00Q9PFWPXRBRyMCFJgXaCmBtP7RLB-R+mU58iPHLwCA@mail.gmail.com>
	<4EF9B8FC.7080206@snapgear.com>
	<CAMuHMdW6Yh33i2H+V_A4o846TNyeDrbDbtwv17=Z794PfCn7vg@mail.gmail.com>
	<4EFA6149.6000509@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:39607 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752836Ab1L1KJb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 05:09:31 -0500
Received: by wgbdr13 with SMTP id dr13so21953725wgb.1
        for <linux-m68k@vger.kernel.org>; Wed, 28 Dec 2011 02:09:30 -0800 (PST)
In-Reply-To: <4EFA6149.6000509@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Greg,

On Wed, Dec 28, 2011 at 01:22, Greg Ungerer <gerg@snapgear.com> wrote:
> On 28/12/11 04:30, Geert Uytterhoeven wrote:
>> On Tue, Dec 27, 2011 at 13:24, Greg Ungerer<gerg@snapgear.com> =C2=A0=
wrote:
>>>>> =C3=83=C2=A1extra-$(CONFIG_MMU) =C3=83=C2=A1 =C3=83=C2=A1 =C3=83=C2=
=A1 =C3=83=C2=A1 =C3=83=C2=A1 =C3=83=C2=A1:=3D head.o
>>>>> =C3=83=C2=A1extra-$(CONFIG_SUN3) =C3=83=C2=A1 :=3D sun3-head.o
>>>>> +extra-$(CONFIG_COLDFIRE) =C3=83=C2=A1 =C3=83=C2=A1 =C3=83=C2=A1 =
:=3D
>>>>
>>>> Why do you need the line above?
>>>
>>> That is to avoid using a "#ifndef CONFIG_COLDFIRE" around these.
>>> This entry clears out extra-y for the case when both CONFIG_MMU
>>> and CONFIG_COLDFIRE are set.
>>
>> Ooh, that's ugly, and easily overlooked (I missed it).
>> So you don't want head.o for Coldfire. What about
>>
>> extra-$(CONFIG_MMU_MOTOROLA) :=3D head.o
>> extra-$(CONFIG_SUN3) =C2=A0 :=3D sun3-head.o
>>
>> ?
>>
>> But since head.o is not really about MMU or not, but about the machi=
ne,
>> perhaps it should be explicitly written as
>>
>> extra-$(CONFIG_AMIGA) :=3D head.o
>> extra-$(CONFIG_ATARI) :=3D head.o
>> ...
>> extra-$(CONFIG_SUN3X) :=3D head.o
>
>
> I am happy to do it either way. The second option here will need a
> longer list. I count 8 machines that use head.o (assuming VME is a
> single machine type) and 1 that uses sun3-head.o. At least the first
> option above just has the 2 lines.
>
> What is your preference?

The latter, as people are experimenting with MMU-less machines now.

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
