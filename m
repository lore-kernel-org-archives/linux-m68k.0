From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] net: add support for NS8390 based eth controllers on
 some ColdFire boards
Date: Wed, 27 Jun 2012 09:34:51 +0200
Message-ID: <CAMuHMdViAKwh+GwS+CWwJ=w5Z=_U-O_isnRDD_RBZ+0hmArX6g@mail.gmail.com>
References: <1340587792-8596-1-git-send-email-gerg@snapgear.com>
	<1340587792-8596-2-git-send-email-gerg@snapgear.com>
	<CAMuHMdXWCmDfGw65Ckr082xx8x4yJyG62wiNj0i4khxU2k3AhA@mail.gmail.com>
	<4FE945CA.6060509@snapgear.com>
	<CAMuHMdUmKkiHmEvSo7wgVMdE4=KcGoA=f9eJ_KFkc1OGrqm=3w@mail.gmail.com>
	<4FE98777.4090600@snapgear.com>
	<CAMuHMdXSTZ_vxhXr+0GuB+tXdjO3dNC2OVPC1OLci0POaShW2Q@mail.gmail.com>
	<4FE98B7D.4040506@snapgear.com>
	<CAMuHMdW7akU4wchpE9Vk24x41Vcg84nBiqbZtce_PjBXUkhdhw@mail.gmail.com>
	<4FEA762A.4070301@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f51.google.com ([209.85.213.51]:46109 "EHLO
	mail-yw0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753529Ab2F0Hew convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Jun 2012 03:34:52 -0400
Received: by yhnn12 with SMTP id n12so797802yhn.10
        for <linux-m68k@vger.kernel.org>; Wed, 27 Jun 2012 00:34:52 -0700 (PDT)
In-Reply-To: <4FEA762A.4070301@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Greg,

On Wed, Jun 27, 2012 at 4:55 AM, Greg Ungerer <gerg@snapgear.com> wrote=
:
> On 06/26/2012 09:03 PM, Geert Uytterhoeven wrote:
>> On Tue, Jun 26, 2012 at 12:14 PM, Greg Ungerer<gerg@snapgear.com> =C2=
=A0wrote:
>>> On 06/26/2012 08:03 PM, Geert Uytterhoeven wrote:
>>>> On Tue, Jun 26, 2012 at 11:57 AM, Greg Ungerer<gerg@snapgear.com> =
wrote:
>>>>> On 06/26/2012 05:47 PM, Geert Uytterhoeven wrote:
>>>>>>> Do you think I should just silently move the modified mcfne.h
>>>>>>> to a mcf8390.h?
>>>>>>
>>>>>> Sure. Why not?
>>>>>
>>>>> We lose any git history linking the original and new file.
>>>>
>>>> Your commit renaming-and-modifying it will provide the link?
>>>
>>> I would normally do that with a "git mv". But isn't that going to
>>> clash with your "git rm"? Or am I mis-understanding what you mean?
>>
>> It may indeed give a merge conflict.
>>
>> If the conflict is too complicated (we'll see in -next), I can remov=
e its
>> scheduled deletion.
>
> My concern here is that I expect that patch will go through DaveM's
> netdev tree. And he may get a little annoyed when a merge conflict

Point taken.

> arises in Linux next. Given that at this point we have the chance
> to resolve it.

Removed from scheduled removal.

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
