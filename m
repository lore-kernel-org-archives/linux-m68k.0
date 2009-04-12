From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: How to get m68k sources?
Date: Sun, 12 Apr 2009 10:25:02 +0200
Message-ID: <10f740e80904120125n216db328l5eea0bbffe66d686@mail.gmail.com>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no>
	 <10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com>
	 <m2ab6nts2u.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:62046 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756583AbZDLIZE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2009 04:25:04 -0400
Received: by ewy9 with SMTP id 9so1719597ewy.37
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2009 01:25:02 -0700 (PDT)
In-Reply-To: <m2ab6nts2u.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, Linux/m68k <linux-m68k@vger.kernel.org>

2009/4/11 Andreas Schwab <schwab@linux-m68k.org>:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> 2.6.29 development is done on branch `m68k-v2.6.29', use
>>
>> =C2=A0 =C2=A0 git checkout m68k-v2.6.29
>
> After cloning the repository you first have to create the tracking
> m68k-v2.6.29 branch:
>
> $ git checkout -t origin/m68k-v2.6.29
>
>> =C2=A0 2. Set up a remote (if you want a combined one with Linus' an=
d m68k):
>>
>> =C2=A0 =C2=A0 git remote add linux-m68k
>> git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
>> =C2=A0 =C2=A0 git remote update
>> =C2=A0 =C2=A0 git checkout linux-m68k/master
>> or =C2=A0git checkout linux-m68k/m68k-v2.6.29
>
> Same here, you need to add -t to the checkout commands to tell git to
> create tracking branches. =C2=A0In the first case when checking out
> linux-m68k/master you also have to add "-b <branch>" to name the loca=
l
> branch differently from the already existing master branch.

You can do without a tracking branch, i.e. `git checkout
linux-m68k/m68k-v2.6.29'
does work. But for my first example above (separate clone) I forgot
the `origin/',
so that had to be:

    git checkout origin/m68k-v2.6.29

But if you want to do (and check-in) actual development, and update reg=
ularly,
it's indeed better to have the tracking branches. Thanks for the update=
!

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
