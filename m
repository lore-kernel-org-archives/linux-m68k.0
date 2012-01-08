From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 08:24:43 +1300
Message-ID: <CAOmrzk+e2CvrL3JeKgABGPHwgCeCCq81RSm2F75iaH2J7=h1mQ@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<m2vcoml3il.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:48568 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212Ab2AHTYn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 14:24:43 -0500
Received: by dajs34 with SMTP id s34so1819582daj.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 11:24:43 -0800 (PST)
In-Reply-To: <m2vcoml3il.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Andreas,

>> Ignoring memory chunk at 0x0:0x400000 before the first chunk
>
> Since 12d810c1b8c2b913d48e629e2b5c01d105029839 (m68k: discontinuous
> memory support) there is no longer support for memory regions with
> physical addresses that are out of order. =A0Before that, if the kern=
el
> was loaded to TT-RAM the ST-RAM was virtually mapped just after TT-RA=
M.

Thanks - do we need a new memory model for this now?

Cheers,

  Michael
