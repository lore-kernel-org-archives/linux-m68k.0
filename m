From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 4/11] Atari: fix EtherNAT interrupt; conditonal platform
 device register
Date: Wed, 6 Jun 2012 10:25:02 +0200
Message-ID: <CAOmrzk+bATchh_sA3xKD571e9qQBBuGF13j8rZfBoqd9L=wE=Q@mail.gmail.com>
References: <E1SXMDv-0002Xe-6F@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdUrFzgjRmB6B9N7u9M2pT3Ta_D3eAmXX68oXQK5KZD7Rw@mail.gmail.com>
	<CAOmrzkKUxxYZh1CyD2+KFum=_go77RLXh4v=i=AFv+pBryG3+A@mail.gmail.com>
	<CAMuHMdVd2NsyWwS+JAJRB5w9zDWHtxz=zWQg199vfVuskgP=QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:50342 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754845Ab2FFIZD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Jun 2012 04:25:03 -0400
Received: by dady13 with SMTP id y13so8468873dad.19
        for <linux-m68k@vger.kernel.org>; Wed, 06 Jun 2012 01:25:02 -0700 (PDT)
In-Reply-To: <CAMuHMdVd2NsyWwS+JAJRB5w9zDWHtxz=zWQg199vfVuskgP=QQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,


>> The 91c111 is well behaved and won't generate interrupts before the
>> card is properly started up so it does not hurt to enable the
>> interrupt as soon as we're sure the card is present.
>
> OK if it behaves well.
>
> When I wrote that comment, I thought I had seen some Atari-specific interrupt
> enabling/disabling in the smc driver, but it turns out that was in the USB part.

That one is most certainly _not_ well behaved - enabling the interrupt
there does stop the kernel in its tracks.

I'm confident that interrupt disable/enable in the interrupt handler
is not required but this needs further testing still.

Cheers,

  Michael
