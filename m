From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: How to get m68k sources?
Date: Sat, 11 Apr 2009 10:16:29 +0200
Message-ID: <10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:45655 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbZDKIQb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Apr 2009 04:16:31 -0400
Received: by ewy9 with SMTP id 9so1428915ewy.37
        for <linux-m68k@vger.kernel.org>; Sat, 11 Apr 2009 01:16:29 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

2009/4/10 Kolbj=C3=B8rn Barmen <linux-m68k@kolla.no>:
> Just wondering, what is the current procedure to get the current
> "release" (or snapshot) sources, for example 2.6.29 for m68k?
> I have used git before, allthough not much, but I have not figured ou=
t
> what to pull from where, and how to integrate the lot. A simple
> step-by-step how-to would be nice.

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux=
-m68k.git

gives you a copy of the Linux/m68k repository. The default (branch `mas=
ter')
is the current development tree (v2.6.30-rc1 for now).

2.6.29 development is done on branch `m68k-v2.6.29', use

    git checkout m68k-v2.6.29

If you want to update later, simply do (if you're not on branch
`master', you'll have to
do `checkout master' first):

    git pull

If you already have a copy of Linus' repository around, you can save di=
skspace
and download bandwidth by

  1. Adding `--reference <path-to-your-copy-of-Linus'-repository' to th=
e
    `git clone' command (if you want a separate repository for m68k)

  2. Set up a remote (if you want a combined one with Linus' and m68k):

    git remote add linux-m68k
git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
    git remote update
    git checkout linux-m68k/master
or  git checkout linux-m68k/m68k-v2.6.29

If you have more questions, feel free to ask!

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
