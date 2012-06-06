From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 4/11] Atari: fix EtherNAT interrupt; conditonal platform
 device register
Date: Wed, 6 Jun 2012 09:58:56 +0200
Message-ID: <CAOmrzkKUxxYZh1CyD2+KFum=_go77RLXh4v=i=AFv+pBryG3+A@mail.gmail.com>
References: <E1SXMDv-0002Xe-6F@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdUrFzgjRmB6B9N7u9M2pT3Ta_D3eAmXX68oXQK5KZD7Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59592 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750885Ab2FFH65 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 03:58:57 -0400
Received: by pbbrp8 with SMTP id rp8so8597014pbb.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 00:58:56 -0700 (PDT)
In-Reply-To: <CAMuHMdUrFzgjRmB6B9N7u9M2pT3Ta_D3eAmXX68oXQK5KZD7Rw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Hi Geert,

>> =A0#define ATARI_ETHERNAT_PHYS_ADDR =A0 =A0 =A0 0x80000000
>> -#define ATARI_ETHERNAT_IRQ =A0 =A0 =A0 =A0 =A0 =A0 0xc3
>> +#define ATARI_ETHERNAT_IRQ =A0 =A0 =A0 =A0 =A0 =A0 140
>
> So the EtherNAT does have a working interrupt line?

It does - at least David's and others' do.


>> + =A0 =A0 =A0 if (hwreg_present(enatc_virt)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *enatc_virt |=3D 0x2; =A0 =A0 /* enabl=
e SMC91C111 interrupt */
>
> Do you really want to do that here?
> Typically this is done by the driver itself, in its probe() routine.

That would mean adding a bit of platform specific code to the probe
routine - nothing major as we can infer the address of the config
register from the card's base address. If you think it's worth a try I
can change that. I'll have to redo this series anyway as you spotted
already.

The 91c111 is well behaved and won't generate interrupts before the
card is properly started up so it does not hurt to enable the
interrupt as soon as we're sure the card is present.

Cheers,

  Michael
