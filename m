Return-Path: <SRS0=vCbO=YS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D630CA9EA0
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Oct 2019 11:49:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76D4021D7B
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Oct 2019 11:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730389AbfJYLty (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Oct 2019 07:49:54 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:45701 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393497AbfJYLty (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Oct 2019 07:49:54 -0400
Received: from [192.168.88.197] ([93.227.185.239]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mnac9-1hhB6X2w7R-00jXMi; Fri, 25 Oct 2019 13:49:49 +0200
Subject: Re: Amiga PCMCIA network card support
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@vger.kernel.org>
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
From:   Andreas 'count' Kotes 
        <count-vger.kernel.org+linux-m68k@flatline.de>
Openpgp: preference=signencrypt
Autocrypt: addr=count-vger.kernel.org+linux-m68k@flatline.de;
 prefer-encrypt=mutual; keydata=
 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
 tX+TaBAcu3SoKLjDqVsUmw==
Message-ID: <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de>
Date:   Fri, 25 Oct 2019 13:49:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lPeETDzGqYLeA9n316B+LfmAq5fZJUEak8wQv3w2xoq0wTaU6fP
 233Jy8WETCD3+kT2cznjBkm71+UgyWJXpB8rkpJGLHzK4bI0S6HKm94c+F9tJfP6+s/7Taa
 VXNhLtiZycRMIFMP2HxzmTOKP0QWepl4xS0pl+TGCUudQjkhOyGC6tdNjb4PnI8DsFz1SLy
 rhfOIMtT/40tyUoUw5/hQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AXsDhZXv6B0=:C2JeXWbjFQzDg4QjpFkLG3
 hwEJb5hWz9EYc9YxjaUqSE2eO/7gajKWfr2GTcDRdJJHE5uFukBGMpR2cUWtkDVh+lHVo/pCq
 MXUZlJ3xpUEpsRB/6kF/2vaY6jmJxh8zi4P7BhODWkyIVdK9pSzxLmx21+WBFe0O7kwGtJ3T6
 eJ5H7BIsuaLIx5sf3+m6gq++1G1OtBf1LU9UoW1mMqy+YZHtsRM/gw0PMz2te93QdYQ8dSkK5
 bwTw9fH6OdYiP4fRPcrZfRSByLj7H92I4NrCwLXvi4Hjy4btcunHGn3l/OkN7Jg8g5eZKMbtE
 smDFe8XpLPI2dplnobVmKDTpcolgqiBhH140EkY1tKAo9i6jiLsCbu7M67wZR5HNrtf4TAgPl
 m1pGmvwksEcxbdVJtrlV2enLpsDfLx70BeOsEibuuor0/Xo0nyy1pG050rpw+rBpFUC7X+OpE
 84/Ze0llkB5zLNrmrbNxOFmRSkx6624WLqlEPO5J95BlEwij9dZ5X7D0s0KMuX8V/ROwnVR+a
 VXtVU0p3qwMjQjAby+k43dm+3x8sB0L/LmD4zGy30+8sk+H60pChrw6Puk7x7OPy9b+BE6mJN
 hQ6YHJEUATUXQcM/H27vLnFevlgABW/D5K2s77A16nG5S8UETpugnyO+xMg4H2+0Uacx2Ohx5
 B2EJ7GDrXQbi4mFDA9R7FXb64ZIFbuKuSmfwjYD5U87GsB9d5Frke9Mrl86kkxtNcg9sI9e+I
 3DTdMbQmbPi4bXB2lr2ijss2Yg6cvLIIen6bp8xo5Q/B1j9YzCOkd2z13l5U3wb5e3s1DzBr9
 b/1S9B1tnAiE3qpyg2b3rbeRsNP4/G0826nAPqhxNklsiy9K7HbCyZbXqvsHJQMlJ6QidCMq6
 VGtsJnSvz7n9Ojmo3uglAno42OlSCya2F2dHTTPPoDoSWuu000BljUXZfafVRK
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello Kars,

On 25.10.19 09:25, Kars de Jong wrote:
> Op do 24 okt. 2019 om 22:56 schreef Andreas 'count' Kotes
> <count-vger.kernel.org+linux-
>> What needs to happen for stable, reliable support for existing PCMCIA
>> network cards people already have? How can we unblock those possible
>> Linux users?
> 
> That would involve quite a few things. I did most of this back in 2.6
> times, and had the standard pcnet_cs, 3c589_cs and serial_cs drivers
> working on my Amiga 1200. Some of it was a bit hackish though, changes
> to <asm/io.h> were discussed but never implemented. The need to be
> able to build a multi-machine kernel (with Atari, Q40 and Amiga
> support in a single kernel) was one of the things that interfered (it
> could probably be solved by adding an extra level of indirection ;-)).
> Then Real Life happened and I didn't touch my Amiga for 10+ years...

.. hmm, is this something that's likely to change? ;)

> 1) A proper driver for the PCMCIA slot, including hot plugging and
> proper controller reset. This involves rewriting part of the IRQ
> handling to make Gayle a separate IRQ controller instead of the hard
> coded hack that is used now. That shouldn't be too hard. Support for
> setting up different data path widths (IO_DATA_PATH_WIDTH_16 etc.)
> will require changes to <asm/io.h>, see point 2.
> 2) Rework <asm/io.h> so inb()/inw()/inl(), outb()/outw()/outl(),
> insb()/insw()/insl() and outsb()/outsw()/outsl() "just work" for
> PCMCIA address space without having to create ugly hacks in the
> generic drivers. This is not trivial because of the strange memory
> mapping of the Amiga PCMCIA slot.

ooooof. while neither sounds undoable (and looking at
http://www.ianstedman.co.uk/downloads/A1200FuncSpec.txt and
https://www.amigacoding.com/index.php/Amiga_memory_map), this is way
beyond my limited low-level experience and rusty Amiga coding experience
for me to do (by) myself - but I'd totally be willing to help kick off
and aid any serious effort for that ... or even let myself be mentored
into doing it.

I should also be able to set up an A1200 with a remotely switchable
power socket and remotely accessible Linux serial console and PLIP
network access that boots into alternating kernels to allow remote
development for interested people.

Kars, you sound like you're in Europe - will you be on the Chaos
Communcation Congress in Leipzig this year? Will there be a Linux m68k
table?

I don't know how well bounties (like
https://www.bountysource.com/issues/80706251-m68k-convert-the-backend-to-mode_cc-so-it-can-be-kept-in-future-releases)
work, but I'd certainly willing to chip in with money, time and
resources to get this addressed for good.

I think cleaning up the IRQ handling etc would also be (another?) good
showcase of linux-m68k and the Amiga platform being very much alive,
contrary to what Linus might think :D

all the best from Berlin,

  count
