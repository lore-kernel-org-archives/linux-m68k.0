From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [uClinux-dev] [PATCH] m68k: reorganize Kconfig options to	improve
 mmu/non-mmu selections
Date: Thu, 11 Aug 2011 16:43:23 +1000
Message-ID: <4E437A0B.3030201@snapgear.com>
References: <1313039421-26075-1-git-send-email-gerg@snapgear.com> <20110811061522.GC21757@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:15391 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751922Ab1HKGkL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 11 Aug 2011 02:40:11 -0400
In-Reply-To: <20110811061522.GC21757@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Sam,

On 11/08/11 16:15, Sam Ravnborg wrote:
> On Thu, Aug 11, 2011 at 03:10:21PM +1000, gerg@snapgear.com wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> [This is a resend of this patch. Would like to hear what others think of
>> this change. It makes the top level configuration consistent for all m68k
>> type processors, and makes it much easier to allow MMU enabled or disabled
>> across all types. If no-one has any objections then I want to push this into
>> linux-next, for eventual inclusion in the 3.2 merge window.]
> I like the strutured layout.
>
>> diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
>> new file mode 100644
>> index 0000000..83263ec
>> --- /dev/null
>> +++ b/arch/m68k/Kconfig.bus
>> @@ -0,0 +1,98 @@
>> +if MMU
>> +
>> +comment "Bus Support"
>> +
>> +config EISA
>> +	bool
>> +	help
>> +	  The Extended Industry Standard Architecture (EISA) bus was
>> +	  developed as an open alternative to the IBM MicroChannel bus.
>> +
>> +	  The EISA bus provided some of the features of the IBM MicroChannel
>> +	  bus while maintaining backward compatibility with cards made for
>> +	  the older ISA bus.  The EISA bus saw limited use between 1988 and
>> +	  1995 when it was made obsolete by the PCI bus.
>> +
>> +	  Say Y here if you are building a kernel for an EISA-based machine.
>> +
>> +	  Otherwise, say N.
>> +
>> +config MCA
>> +	bool
>> +	help
>> +	  MicroChannel Architecture is found in some IBM PS/2 machines and
>> +	  laptops.  It is a bus system similar to PCI or ISA. See
>> +	<file:Documentation/mca.txt>  (and especially the web page given
>> +	  there) before attempting to build an MCA bus kernel.
>> +
>> +config PCMCIA
>> +	tristate
>> +	help
>> +	  Say Y here if you want to attach PCMCIA- or PC-cards to your Linux
>> +	  computer.  These are credit-card size devices such as network cards,
>> +	  modems or hard drives often used with laptops computers.  There are
>> +	  actually two varieties of these cards: the older 16 bit PCMCIA cards
>> +	  and the newer 32 bit CardBus cards.  If you want to use CardBus
>> +	  cards, you need to say Y here and also to "CardBus support" below.
>> +
>> +	  To use your PC-cards, you will need supporting software from David
>> +	  Hinds' pcmcia-cs package (see the file<file:Documentation/Changes>
>> +	  for location).  Please also read the PCMCIA-HOWTO, available from
>> +	<http://www.tldp.org/docs.html#howto>.
>> +
>> +	  To compile this driver as modules, choose M here: the
>> +	  modules will be called pcmcia_core and ds.
>> +
>> +config NUBUS
>> +	bool
>> +	depends on MAC
>> +	default y
>
> Do you really need EISA, MCA and PCMIA? They have no promt thus cannot be selected by the user.

Yes, your right, they don't look like than can be selected at all.
None of the default configs seem to reference them either.
Geert: do you know why these options might still be around?


>> +config ISA
>> +	bool
>> +	depends on Q40 || AMIGA_PCMCIA
>> +	default y
>> +	help
>> +	  Find out whether you have ISA slots on your motherboard.  ISA is the
>> +	  name of a bus system, i.e. the way the CPU talks to the other stuff
>> +	  inside your box.  Other bus systems are PCI, EISA, MicroChannel
>> +	  (MCA) or VESA.  ISA is an older system, now being displaced by PCI;
>> +	  newer boards don't support it.  If you have ISA, say Y, otherwise N.
>> +
>> +config GENERIC_ISA_DMA
>> +	bool
>> +	depends on Q40 || AMIGA_PCMCIA
>> +	default y
> def_bool ISA?
>
> That looks simpler IMO - and they are enabled by the same options.

Yep, I'll make that change.

Thanks for the review.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
