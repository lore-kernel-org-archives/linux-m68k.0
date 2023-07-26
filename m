Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE65EC001DC
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jul 2023 09:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbjGZJYo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jul 2023 05:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjGZJYO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jul 2023 05:24:14 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4EF2115
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jul 2023 02:22:20 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 3D5085C0125;
        Wed, 26 Jul 2023 05:22:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 26 Jul 2023 05:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1690363337; x=1690449737; bh=SrjOGIQmKRQfP
        4BPJkiEyCNKVjBeFZwiiEfuO9yXMkw=; b=dkVT8SdJ7zyY1E/Td76PTOMcxi4yx
        2yFHoD62Jox2idu5uz4ZR5sgmY8IgaTJxvwfyPanUJk0miycEmTd2m+fOWABjnup
        QmJ8sfTIC3l6W8du+P3FeMhSoPUTfQK5BpjT9PL6UFJoNItrBnqlekqWiNMGcW6W
        bmCjksIemEHgP+wlCDubHc7754icolYaLHGnECxG1q0jL+gFt059bmZOh2+Nv6W+
        P5WklGf1mHGeqWYYJGK1e6tvnpXZDuUSAP0eNHsmcKEBzWSgRkBzo1eN/D3Pi8ad
        Jil5w10HpqafxAyzO7Wr4KSrnKvJCOyPTHf2AXCKv5/BNQW4+iwRLyALw==
X-ME-Sender: <xms:yOXAZPvAIpWiGFhGA_VyPl089kcDxiw_AgrgR7jWLAdtCaw53ItcaQ>
    <xme:yOXAZAfJh5KD5eon9nk6hG1EojnNRulNXZpBHSO-xVdFUNBiqyVgXhJpmO31vQqMu
    HO3G7jr-H2F3OTkbhA>
X-ME-Received: <xmr:yOXAZCw6Qb5HKG216LmHQ0e53VS4vyU7fwQxOtLvH5rSmwVDes-FxApOzzphLzmSurPUkEgvS4YQ2tA0_SEzq9VBQbzqcHOFhUM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedriedvgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepveehveeujeejvdeiudeuleffuefgkedvveduheejjeeiveffhfejtdekhffh
    keffnecuffhomhgrihhnpehqgedtrdguvgdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhn
    uhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:yOXAZOO4fKkTJn6PiwMBiIkKquvgACJqQsIbKV_O7cQwCqeAzHJHhw>
    <xmx:yOXAZP9uvr_Zl_IqAP74k9psoepNdNWzkwWLpLWc5Lp8cS44fbSuFg>
    <xmx:yOXAZOX4yLFGo4BlpRm1gkquDgGIov7XUSqUYKJRu1Gg7Mll1hX1jw>
    <xmx:yeXAZJndDiEdxroZRouDrEZvFA9YHNcbT9SxK8BldMHYjnmqNimYaQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jul 2023 05:22:14 -0400 (EDT)
Date:   Wed, 26 Jul 2023 19:22:29 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot
 time
In-Reply-To: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
Message-ID: <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com> <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com> <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Tue, 25 Jul 2023, Michael Schmitz wrote:

> Thanks William,
> 
> On 24/07/23 23:42, William R Sowerbutts wrote:
> >> I was left with the impression that the Q40 does not actually have the IDE
> >> controller on the ISA bus.
> > This is mistaken.
> >
> > IDE is definitely accessed over the ISA bus.
> >
> > There is some documentation on the Q40/Q60 hardware here:
> > http://www.q40.de/download/harddoc.pdf
> Noted - hadn't seen this one before.
> >
> > The motherboard integrates the CPU, DRAM, video DRAM and display controller,
> > audio DACs, RTC, interrupt controller, keyboard controller, and an LED
> > output.
> 
> No disk controller on the main board - that's where my error originated.
> 
> Note that this also means that the address hardcoded for IDE may be 
> incorrect (AFAIR, IDE cards could have their IO base reassigned by 
> firmware).
> 
> > There are two ISA slots where all other I/O devices are connected. These are
> > described (concisely!) on page 7 of the linked manual:
> >
> > 8-bit ISA I/O cycles are performed for CPU byte accesses to 0xFF400001 + 4 *
> > ISA address
> >
> > 16-bit ISA I/O cycles are performed for CPU word accesses to 0xFF400000 + 4
> > * ISA address
> >
> > 8-bit ISA memory cycles are performed for CPU byte accesses to 0xFF800001 +
> > 4 * ISA address
> >
> > 16-bit ISA memory cycles are performed for CPU word accesses to 0xFF800000 +
> > 4 * ISA address
> Yep, that much is evident from the Q40 address translation scheme. But a 
> similar sort of scheme is used on other m68k platforms to wire up 
> peripherals that were originally designed for Intel systems, and these 
> are not connected through an ISA bus.

I can't figure out why those platforms don't suffer from the same "double 
translation" problem that William described on q40.

> > I understand that the machines originally shipped with a 16-bit ISA card
> > based on the W83787IF "PC super I/O" chip, integrating a floppy controller,
> > IDE interface, game port, parallel port, and two 16550A UARTs.
> OK.
> >
> > My Q40 came without this card, so I am using a card based on the similar
> > W83757 chip (the serial ports are 16450 instead of 16550A, it doesn't
> > support
> > the fancy EPP/ECP parallel port modes).
> >
> >>>> It might be a good idea to verify that IDE works in v5.13
> >>> Yes, please do.
> > It did.
> >
> >> And please also verify it's broken after 44b1fbc0f5f30e66 was applied.
> > I will try to do that!
> 
> Probably just try v5.14 - in my tree, 44b1fbc0f5f30e66 came on top of 5.13-rc2
> so 5.14 ought to have it applied (but rather check, just the same).
> 

If git is an obstacle, one may obtain the 44b1fbc0f5f30e66 tree (as 
easily as the v5.14 tree) by clicking the 'download' button here: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=44b1fbc0f5f30e66
