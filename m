From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 31 May 2016 12:39:52 +0200
Message-ID: <2782d89d-8baa-c4b1-b1cc-4a48008ef1fa@physik.fu-berlin.de>
References: <21393.43065.207399.530921@gargle.gargle.HOWL>
 <mvm1tuv6dhk.fsf@hawking.suse.de>
 <21426.40682.197715.245775@gargle.gargle.HOWL>
 <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com>
 <21786.40688.53001.509365@gargle.gargle.HOWL>
 <22217.61083.254294.356622@gargle.gargle.HOWL>
 <alpine.LNX.2.00.1605311429500.12286@nippy.intranet>
 <22349.25130.697316.272584@gargle.gargle.HOWL>
 <CAMuHMdVwZvPyqknDuu_v072xeKgA+i-sZVQB3Pzc0hUNMx-A6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:37930 "EHLO
	outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751325AbcEaKjz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 31 May 2016 06:39:55 -0400
In-Reply-To: <CAMuHMdVwZvPyqknDuu_v072xeKgA+i-sZVQB3Pzc0hUNMx-A6w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mikael Pettersson <mikpelinux@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Michael Schmitz <schmitzmic@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/31/2016 12:21 PM, Geert Uytterhoeven wrote:
> That's upstream commit c33bd8354f3a3bb26a98d2b6bf600b7b35657328?
> 
> Well done! Looks indeed like a suspect for the behavior you're seeing.
> I suppose you will follow up with the mm people?

Yay, great news. I'm currently building a native GHC package for Debian/m68k
on Aranym and [kswapd] is taking around half of the CPU load. The suggestion
with drop_caches doesn't help all the time, unfortunately, so I'm really
looking forward getting this fixed :).

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
