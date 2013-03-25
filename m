From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream and debian-kernel
Date: Tue, 26 Mar 2013 10:25:34 +1300
Message-ID: <CAOmrzk+JFTaZC-_TCASK36y-FvF-5U80_-nQvajgbpNS8MSKww@mail.gmail.com>
References: <1364193464-3890-1-git-send-email-schmitz@debian.org>
	<Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:44282 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758536Ab3CYVZf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Mar 2013 17:25:35 -0400
Received: by mail-oa0-f45.google.com with SMTP id o6so6841863oag.4
        for <linux-m68k@vger.kernel.org>; Mon, 25 Mar 2013 14:25:34 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org

Thorsten,

>>This patch series should be suitable for inclusion in the debian/68k =
kernel
>>packages (if policy allows).
>
> Sadly, policy allows only stuff that=92s in Linus=92 tree.

=46air enough. The network stuff should be possible to integrate (minus
the polled interrupt changes, perhaps). Should I split the timer D
interrupt chip patch into two (basic setup, then change to use the
polled interrupt handler), Geert?

> But once it went upstream, we can just build a bleeding
> edge kernel from Debian/experimental with no amount of
> manual fiddling required.
>
> It just won=92t go into the stable kernel. But it=92s no
> regression, as the old driver was never in it either=85

The old driver(s) might have been in earlier Debian kernels when
policy was otherwise. But I won't push for stable inclusion (upstream)
without need either.

Cheers,

  Michael
