From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 03/16] mac_sonic: add irq resources and cleanup
Date: Sun, 13 Nov 2011 18:36:48 +0100
Message-ID: <CAMuHMdUoVzMVgvvm_fYu=SKhKdnZDHEZVvPvP1oWXgVC0LeR+w@mail.gmail.com>
References: <20111023141108.856998818@telegraphics.com.au>
	<20111023141124.538715283@telegraphics.com.au>
	<CAMuHMdUHbqqt9Rce=Mh5A0GB_BHJX21dBSggFcqb9q4omDuyBQ@mail.gmail.com>
	<alpine.LNX.2.00.1111140125340.2656@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:52136 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624Ab1KMRgt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Nov 2011 12:36:49 -0500
In-Reply-To: <alpine.LNX.2.00.1111140125340.2656@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: David Miller <davem@davemloft.net>, linux-m68k@vger.kernel.org, netdev@vger.kernel.org

On Sun, Nov 13, 2011 at 15:30, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> On Sun, 13 Nov 2011, Geert Uytterhoeven wrote:
>> Please wrap lines at 75, for easier to read "git log" output.
>
> Yes, sorry about that. It was my first batch submission by "quilt mai=
l"
> (in the past I've always used Alpine to hard wrap individual patch

Ah, you're a few years behind ;-)
I went al^H^Hpine -> quilt mail -> git send-email. I don't want to go
back.

> headers). I can fix them up and re-submit if that's easier for you.

That's unnecessary. I already did that in the m68k-queue/for-3.3 branch=
=2E

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
