From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/11] Atari: fix EtherNAT interrupt; conditonal platform
 device register
Date: Wed, 6 Jun 2012 10:10:29 +0200
Message-ID: <CAMuHMdVd2NsyWwS+JAJRB5w9zDWHtxz=zWQg199vfVuskgP=QQ@mail.gmail.com>
References: <E1SXMDv-0002Xe-6F@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdUrFzgjRmB6B9N7u9M2pT3Ta_D3eAmXX68oXQK5KZD7Rw@mail.gmail.com>
	<CAOmrzkKUxxYZh1CyD2+KFum=_go77RLXh4v=i=AFv+pBryG3+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:50327 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862Ab2FFIKa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:10:30 -0400
Received: by yhmm54 with SMTP id m54so4606119yhm.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:10:29 -0700 (PDT)
In-Reply-To: <CAOmrzkKUxxYZh1CyD2+KFum=_go77RLXh4v=i=AFv+pBryG3+A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Hi Michael,

On Wed, Jun 6, 2012 at 9:58 AM, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> =C2=A0#define ATARI_ETHERNAT_PHYS_ADDR =C2=A0 =C2=A0 =C2=A0 0x80000=
000
>>> -#define ATARI_ETHERNAT_IRQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0xc3
>>> +#define ATARI_ETHERNAT_IRQ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 140
>>
>> So the EtherNAT does have a working interrupt line?
>
> It does - at least David's and others' do.
>
>>> + =C2=A0 =C2=A0 =C2=A0 if (hwreg_present(enatc_virt)) {
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *enatc_virt |=3D=
 0x2; =C2=A0 =C2=A0 /* enable SMC91C111 interrupt */
>>
>> Do you really want to do that here?
>> Typically this is done by the driver itself, in its probe() routine.
>
> That would mean adding a bit of platform specific code to the probe
> routine - nothing major as we can infer the address of the config
> register from the card's base address. If you think it's worth a try =
I
> can change that. I'll have to redo this series anyway as you spotted
> already.
>
> The 91c111 is well behaved and won't generate interrupts before the
> card is properly started up so it does not hurt to enable the
> interrupt as soon as we're sure the card is present.

OK if it behaves well.

When I wrote that comment, I thought I had seen some Atari-specific int=
errupt
enabling/disabling in the smc driver, but it turns out that was in the =
USB part.

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
