From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Network died completely in 2.6.29 - also on m68k :)
Date: Sat, 18 Apr 2009 11:28:33 +0200
Message-ID: <10f740e80904180228y222381e9sbbac7702b5624891@mail.gmail.com>
References: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:44210 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752821AbZDRJ2f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 18 Apr 2009 05:28:35 -0400
Received: by ewy24 with SMTP id 24so514298ewy.37
        for <linux-m68k@vger.kernel.org>; Sat, 18 Apr 2009 02:28:33 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: linux-m68k@vger.kernel.org, Debian m68k <debian-68k@lists.debian.org>

2009/4/16 Kolbj=C3=B8rn Barmen <linux-m68k@kolla.no>:
> After getting my ebuilds going, I compiled and installed 2.6.29 first=
 on
> aranym, where it works just fine, and then on one of my A1200s. On th=
e
> A1200 it seemed to work fine, for a while that is, suddenly the netwo=
rk
> stopped up - completely. Nothing in dmesg, but rmmod/modprobe apne do=
es
> not make any difference, and I cant even ping 127.0.0.1 - so I guess =
this
> is the infamous 2.6.29 bug that was fixed in 2.6.29.1, and that is
> described here http://lkml.org/lkml/2009/3/27/421
>
> So, I tryed to pull out a m68k-v2.6.29.1 from git, but appearantly th=
ere is no
> such thing. So=C2=B8 it is probably to add the "Disable GRO on legacy=
 netif_rx
> path" patch (in posting above) to the v2.6.29 branch, no?

Usually I do not track stable myself, that's a distributor's issue ;-)
But I gave it a try, and did:

    git remote add stable
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-2.6-stable.g=
it
    git remote update
    git merge v2.6.29.1

(git merge stable/linux-2.6.29.y should have worked, too)
and pushed the result to m68k-v2.6.29. However, I don't know if I
should keep on doing
this for each stable release, as you can easily do it yourself,
without having to wait for me.

=46urthermore, it complicates the process of extracting patches for e.g=
=2E
the Debian kernel,
unless I would rebase the m68k-v2.6.29 branch on top of the latest
stable version.
But I prefer not to rebase long-lived branches like the stable branch.

What do people think?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
