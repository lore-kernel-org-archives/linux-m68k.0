From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH 1/11] Atari: change number of interrupt sources
Date: Thu, 7 Jun 2012 19:15:24 +0200
Message-ID: <CAOmrzk+RDQF8B1KNTBMZh10QAbf6msnsPTtq0Kd5xuVqjkeh_g@mail.gmail.com>
References: <E1SXMBV-0002XQ-JI@zirkon.biophys.uni-duesseldorf.de>
	<CAMuHMdVXZGJmhLvQ-rfPGXHd7p90dDuSd95SZT0uBnShbYY5Rg@mail.gmail.com>
	<CAOmrzkK7MbiTzAHR0s6dQdPK2y9ov3XTdEsOhH7TOwTQOMMHNg@mail.gmail.com>
	<CAMuHMdUnooh3PR9hNSPHuh0brRCrK79YWoZiGeQ1q3hoxNmu9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:56739 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932308Ab2FGRP0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Jun 2012 13:15:26 -0400
Received: by yhmm54 with SMTP id m54so609955yhm.19
        for <linux-m68k@vger.kernel.org>; Thu, 07 Jun 2012 10:15:25 -0700 (PDT)
In-Reply-To: <CAMuHMdUnooh3PR9hNSPHuh0brRCrK79YWoZiGeQ1q3hoxNmu9g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>, linux-m68k@vger.kernel.org

Geert,

>> Right - still not sure where the +1 results from though.
>
> Because the interrupt array starts at zero, but zero itself is not used?

Most likely - I didn't think about it as an array. Still stuck with
the irq-to-vector and vice versa stuff...

Thanks,

  Michael
