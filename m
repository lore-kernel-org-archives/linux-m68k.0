From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: reorganize Kconfig options to improve
 mmu/non-mmu selections
Date: Mon, 15 Aug 2011 10:54:15 +1000
Message-ID: <4E486E37.9050203@snapgear.com>
References: <1313039421-26075-1-git-send-email-gerg@snapgear.com>	<20110811061522.GC21757@merkur.ravnborg.org>	<4E437A0B.3030201@snapgear.com> <CAMuHMdWm0ZKp0GOGyFTrmZ9ZLsya9Nd8unPEtVk6NEwE5xtegw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:11002 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066Ab1HOAvP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Aug 2011 20:51:15 -0400
In-Reply-To: <CAMuHMdWm0ZKp0GOGyFTrmZ9ZLsya9Nd8unPEtVk6NEwE5xtegw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 13/08/11 19:46, Geert Uytterhoeven wrote:
> On Thu, Aug 11, 2011 at 08:43, Greg Ungerer<gerg@snapgear.com>  wrote=
:
>> On 11/08/11 16:15, Sam Ravnborg wrote:
>>> On Thu, Aug 11, 2011 at 03:10:21PM +1000, gerg@snapgear.com wrote:
>>>> diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
>>>> new file mode 100644
>>>> index 0000000..83263ec
>>>> --- /dev/null
>>>> +++ b/arch/m68k/Kconfig.bus
>>>> @@ -0,0 +1,98 @@
>>>> +if MMU
>>>> +
>>>> +comment "Bus Support"
>>>> +
>>>> +config EISA
>>>> + =C3=A1 =C3=A1 =C3=A1 bool
>>>> + =C3=A1 =C3=A1 =C3=A1 help
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 The Extended Industry Standard Archi=
tecture (EISA) bus was
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 developed as an open alternative to =
the IBM MicroChannel bus.
>>>> +
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 The EISA bus provided some of the fe=
atures of the IBM
>>>> MicroChannel
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 bus while maintaining backward compa=
tibility with cards made
>>>> for
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 the older ISA bus. =C3=A1The EISA bu=
s saw limited use between 1988
>>>> and
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 1995 when it was made obsolete by th=
e PCI bus.
>>>> +
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 Say Y here if you are building a ker=
nel for an EISA-based
>>>> machine.
>>>> +
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 Otherwise, say N.
>>>> +
>>>> +config MCA
>>>> + =C3=A1 =C3=A1 =C3=A1 bool
>>>> + =C3=A1 =C3=A1 =C3=A1 help
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 MicroChannel Architecture is found i=
n some IBM PS/2 machines
>>>> and
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 laptops. =C3=A1It is a bus system si=
milar to PCI or ISA. See
>>>> + =C3=A1 =C3=A1 =C3=A1<file:Documentation/mca.txt>  =C3=A1(and esp=
ecially the web page given
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 there) before attempting to build an=
 MCA bus kernel.
>>>> +
>>>> +config PCMCIA
>>>> + =C3=A1 =C3=A1 =C3=A1 tristate
>>>> + =C3=A1 =C3=A1 =C3=A1 help
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 Say Y here if you want to attach PCM=
CIA- or PC-cards to your
>>>> Linux
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 computer. =C3=A1These are credit-car=
d size devices such as network
>>>> cards,
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 modems or hard drives often used wit=
h laptops computers. =C3=A1There
>>>> are
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 actually two varieties of these card=
s: the older 16 bit PCMCIA
>>>> cards
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 and the newer 32 bit CardBus cards. =
=C3=A1If you want to use CardBus
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 cards, you need to say Y here and al=
so to "CardBus support"
>>>> below.
>>>> +
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 To use your PC-cards, you will need =
supporting software from
>>>> David
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 Hinds' pcmcia-cs package (see the
>>>> file<file:Documentation/Changes>
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 for location). =C3=A1Please also rea=
d the PCMCIA-HOWTO, available
>>>> from
>>>> + =C3=A1 =C3=A1 =C3=A1<http://www.tldp.org/docs.html#howto>.
>>>> +
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 To compile this driver as modules, c=
hoose M here: the
>>>> + =C3=A1 =C3=A1 =C3=A1 =C3=A1 modules will be called pcmcia_core a=
nd ds.
>>>> +
>>>> +config NUBUS
>>>> + =C3=A1 =C3=A1 =C3=A1 bool
>>>> + =C3=A1 =C3=A1 =C3=A1 depends on MAC
>>>> + =C3=A1 =C3=A1 =C3=A1 default y
>>>
>>> Do you really need EISA, MCA and PCMIA? They have no promt thus can=
not be
>>> selected by the user.
>>
>> Yes, your right, they don't look like than can be selected at all.
>> None of the default configs seem to reference them either.
>> Geert: do you know why these options might still be around?
>
> Just legacy. There was a time they needed to be there. Let them go!

Cool. I will remove them!

Regards
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
