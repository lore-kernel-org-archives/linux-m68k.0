From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/11] Atari: change number of interrupt sources
Date: Fri, 22 Jun 2012 11:50:06 +1200
Message-ID: <CAOmrzkJ76Zipoj3gniu7AsLGsJtNMhAY67txBH86FKj3nZ0Vvg@mail.gmail.com>
References: <E1SXMBV-0002XQ-JI@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdVXZGJmhLvQ-rfPGXHd7p90dDuSd95SZT0uBnShbYY5Rg@mail.gmail.com>
	<CAOmrzkK7MbiTzAHR0s6dQdPK2y9ov3XTdEsOhH7TOwTQOMMHNg@mail.gmail.com>
	<CAMuHMdUnooh3PR9hNSPHuh0brRCrK79YWoZiGeQ1q3hoxNmu9g@mail.gmail.com>
	<CAOmrzk+RDQF8B1KNTBMZh10QAbf6msnsPTtq0Kd5xuVqjkeh_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:57720 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760623Ab2FUXuH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Jun 2012 19:50:07 -0400
Received: by dady13 with SMTP id y13so1555896dad.19
        for <linux-m68k@vger.kernel.org>; Thu, 21 Jun 2012 16:50:07 -0700 (PDT)
In-Reply-To: <CAOmrzk+RDQF8B1KNTBMZh10QAbf6msnsPTtq0Kd5xuVqjkeh_g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,

>> Because the interrupt array starts at zero, but zero itself is not used?
>
> Most likely - I didn't think about it as an array. Still stuck with
> the irq-to-vector and vice versa stuff...

Zero is indeed used - for spurious interrupts in the irqstat array.
Everything as it should be ...

I've worked on cleaning up the patches, just have to pull your latest
changes now.

Cheers,

  Michael
