From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uClinux-dev] [PATCH] m68k: reorganize Kconfig options to improve
 mmu/non-mmu selections
Date: Sat, 13 Aug 2011 11:46:54 +0200
Message-ID: <CAMuHMdWm0ZKp0GOGyFTrmZ9ZLsya9Nd8unPEtVk6NEwE5xtegw@mail.gmail.com>
References: <1313039421-26075-1-git-send-email-gerg@snapgear.com>
	<20110811061522.GC21757@merkur.ravnborg.org>
	<4E437A0B.3030201@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:58572 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751008Ab1HMJq4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Aug 2011 05:46:56 -0400
Received: by iye16 with SMTP id 16so3303761iye.1
        for <linux-m68k@vger.kernel.org>; Sat, 13 Aug 2011 02:46:55 -0700 (PDT)
In-Reply-To: <4E437A0B.3030201@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Aug 11, 2011 at 08:43, Greg Ungerer <gerg@snapgear.com> wrote:
> On 11/08/11 16:15, Sam Ravnborg wrote:
>> On Thu, Aug 11, 2011 at 03:10:21PM +1000, gerg@snapgear.com wrote:
>>> diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
>>> new file mode 100644
>>> index 0000000..83263ec
>>> --- /dev/null
>>> +++ b/arch/m68k/Kconfig.bus
>>> @@ -0,0 +1,98 @@
>>> +if MMU
>>> +
>>> +comment "Bus Support"
>>> +
>>> +config EISA
>>> + =C2=A0 =C2=A0 =C2=A0 bool
>>> + =C2=A0 =C2=A0 =C2=A0 help
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 The Extended Industry Standard Archit=
ecture (EISA) bus was
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 developed as an open alternative to t=
he IBM MicroChannel bus.
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 The EISA bus provided some of the fea=
tures of the IBM
>>> MicroChannel
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus while maintaining backward compat=
ibility with cards made
>>> for
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 the older ISA bus. =C2=A0The EISA bus=
 saw limited use between 1988
>>> and
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 1995 when it was made obsolete by the=
 PCI bus.
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Say Y here if you are building a kern=
el for an EISA-based
>>> machine.
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Otherwise, say N.
>>> +
>>> +config MCA
>>> + =C2=A0 =C2=A0 =C2=A0 bool
>>> + =C2=A0 =C2=A0 =C2=A0 help
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 MicroChannel Architecture is found in=
 some IBM PS/2 machines
>>> and
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 laptops. =C2=A0It is a bus system sim=
ilar to PCI or ISA. See
>>> + =C2=A0 =C2=A0 =C2=A0 <file:Documentation/mca.txt> =C2=A0(and espe=
cially the web page given
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 there) before attempting to build an =
MCA bus kernel.
>>> +
>>> +config PCMCIA
>>> + =C2=A0 =C2=A0 =C2=A0 tristate
>>> + =C2=A0 =C2=A0 =C2=A0 help
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Say Y here if you want to attach PCMC=
IA- or PC-cards to your
>>> Linux
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 computer. =C2=A0These are credit-card=
 size devices such as network
>>> cards,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 modems or hard drives often used with=
 laptops computers. =C2=A0There
>>> are
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 actually two varieties of these cards=
: the older 16 bit PCMCIA
>>> cards
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 and the newer 32 bit CardBus cards. =C2=
=A0If you want to use CardBus
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 cards, you need to say Y here and als=
o to "CardBus support"
>>> below.
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 To use your PC-cards, you will need s=
upporting software from
>>> David
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hinds' pcmcia-cs package (see the
>>> file<file:Documentation/Changes>
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 for location). =C2=A0Please also read=
 the PCMCIA-HOWTO, available
>>> from
>>> + =C2=A0 =C2=A0 =C2=A0 <http://www.tldp.org/docs.html#howto>.
>>> +
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 To compile this driver as modules, ch=
oose M here: the
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 modules will be called pcmcia_core an=
d ds.
>>> +
>>> +config NUBUS
>>> + =C2=A0 =C2=A0 =C2=A0 bool
>>> + =C2=A0 =C2=A0 =C2=A0 depends on MAC
>>> + =C2=A0 =C2=A0 =C2=A0 default y
>>
>> Do you really need EISA, MCA and PCMIA? They have no promt thus cann=
ot be
>> selected by the user.
>
> Yes, your right, they don't look like than can be selected at all.
> None of the default configs seem to reference them either.
> Geert: do you know why these options might still be around?

Just legacy. There was a time they needed to be there. Let them go!

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
