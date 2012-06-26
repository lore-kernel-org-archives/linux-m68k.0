From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] net: add support for NS8390 based eth controllers on
 some ColdFire boards
Date: Tue, 26 Jun 2012 13:03:10 +0200
Message-ID: <CAMuHMdW7akU4wchpE9Vk24x41Vcg84nBiqbZtce_PjBXUkhdhw@mail.gmail.com>
References: <1340587792-8596-1-git-send-email-gerg@snapgear.com>
	<1340587792-8596-2-git-send-email-gerg@snapgear.com>
	<CAMuHMdXWCmDfGw65Ckr082xx8x4yJyG62wiNj0i4khxU2k3AhA@mail.gmail.com>
	<4FE945CA.6060509@snapgear.com>
	<CAMuHMdUmKkiHmEvSo7wgVMdE4=KcGoA=f9eJ_KFkc1OGrqm=3w@mail.gmail.com>
	<4FE98777.4090600@snapgear.com>
	<CAMuHMdXSTZ_vxhXr+0GuB+tXdjO3dNC2OVPC1OLci0POaShW2Q@mail.gmail.com>
	<4FE98B7D.4040506@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:43190 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931Ab2FZLDL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 26 Jun 2012 07:03:11 -0400
Received: by yenl2 with SMTP id l2so3610087yen.19
        for <linux-m68k@vger.kernel.org>; Tue, 26 Jun 2012 04:03:11 -0700 (PDT)
In-Reply-To: <4FE98B7D.4040506@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Greg,

On Tue, Jun 26, 2012 at 12:14 PM, Greg Ungerer <gerg@snapgear.com> wrot=
e:
> On 06/26/2012 08:03 PM, Geert Uytterhoeven wrote:
>> On Tue, Jun 26, 2012 at 11:57 AM, Greg Ungerer<gerg@snapgear.com> =C2=
=A0wrote:
>>> On 06/26/2012 05:47 PM, Geert Uytterhoeven wrote:
>>>> On Tue, Jun 26, 2012 at 7:16 AM, Greg Ungerer<gerg@snapgear.com>
>>>> =C2=A0wrote:
>>>>> On 06/25/2012 05:59 PM, Geert Uytterhoeven wrote:
>>>>>> On Mon, Jun 25, 2012 at 3:29 AM,<gerg@snapgear.com> =C2=A0 =C2=A0=
 =C2=A0wrote:
>>>>>>> =C2=A0arch/m68k/include/asm/mcfne.h =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
129 +---------
>>>>>>
>>>>>> mcf8390.h?
>>>>>> mcfne.h is queued for removal.
>>>>>
>>>>> I was trying to save it :-)
>>>>> Do you think I should just silently move the modified mcfne.h
>>>>> to a mcf8390.h?
>>>>
>>>> Sure. Why not?
>>>
>>> We lose any git history linking the original and new file.
>>
>> Your commit renaming-and-modifying it will provide the link?
>
> I would normally do that with a "git mv". But isn't that going to
> clash with your "git rm"? =C2=A0Or am I mis-understanding what you me=
an?

It may indeed give a merge conflict.

If the conflict is too complicated (we'll see in -next), I can remove i=
ts
scheduled deletion.

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
