From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH] m68k/atari: EtherNEC - rewrite to use mainstream ne.c
Date: Thu, 8 Mar 2012 07:42:48 +1300
Message-ID: <CAOmrzkLar4ZfdY1KFkd7QtK1h0i7Zhc0vjubd9_bohWaGpx8Ag@mail.gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org>
	<4F4B2BB6.900@gmail.com>
	<alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:47121 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756772Ab2CGSux (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 7 Mar 2012 13:50:53 -0500
In-Reply-To: <alpine.DEB.2.00.1203071053360.3196@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, netdev@vger.kernel.org

Hi Geert,

> Netdev people: are these changes to ne.c acceptable?
>
> If yes, I'll split everything and queue it up (the ne.c part through netdev,
> the rest through m68k).
> If not, do you have a better solution[*]?
> Are there other network drivers using/requiring a similar approach?

smc91x requires the same approach - the only changes necessary there
are to smc91x.h (and Kconfig).

(no patch yet; the code is stuck on my devel PC which refuses to boot ATM).

Cheers,

  Michael
