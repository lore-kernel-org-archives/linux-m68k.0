From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: How to get m68k sources?
Date: Sun, 12 Apr 2009 10:29:38 +0200
Message-ID: <10f740e80904120129t6c57e5dci74895b15a7804286@mail.gmail.com>
References: <alpine.LNX.2.01.0904102301250.22946@halbrend.uninett.no>
	 <10f740e80904110116j6626b564m92b0fbf9fca79106@mail.gmail.com>
	 <m2ab6nts2u.fsf@igel.home>
	 <alpine.LNX.2.01.0904120619100.22946@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:46848 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756856AbZDLI3k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2009 04:29:40 -0400
Received: by ewy9 with SMTP id 9so1720356ewy.37
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2009 01:29:38 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.01.0904120619100.22946@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

2009/4/12 Kolbj=C3=B8rn Barmen <linux-m68k@kolla.no>:
> On Sat, 11 Apr 2009, Andreas Schwab wrote:
>
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>>
>> > 2.6.29 development is done on branch `m68k-v2.6.29', use
>> >
>> > =C2=A0 =C2=A0 git checkout m68k-v2.6.29
>
> Well, noone says this, but obviously one has to step into the "linux-=
m68k"
> directory one first "cloned" to do this... so "cd linux-m68k", and th=
en...
>
>> After cloning the repository you first have to create the tracking
>> m68k-v2.6.29 branch:
>>
>> $ git checkout -t origin/m68k-v2.6.29
>
> did you test this?
>
> [kolla@haugum] /home/kolla/linux-m68k $ git checkout -t origin/m68k-v=
2.6.29
> fatal: git checkout: --track and --no-track require -b
>
> So after some fumbling...
>
> [kolla@haugum] /home/kolla/linux-m68k $ git checkout -t -b origin/m68=
k-v2.6.29
> Branch origin/m68k-v2.6.29 set up to track local branch refs/heads/ma=
ster.
> Switched to a new branch "origin/m68k-v2.6.29"

Ah, so it created a branch `origin/m68k-v2.6.29' to track the local `ma=
ster',
while the intention was to create a local `m68k-v2.6.29' branch, to tra=
ck the
remote `origin/m68k-v2.6.29' branch...

> But so what - git tells me I have switched to new branch, but where i=
s it?

`git branch -a' will tell you...

> I have not received anything, nor do I have any new files, and...

You don't have to get new files to create a new branch.
Besides, you already got all the files for the `origin/..' branches dur=
ing the
clone.

> [kolla@haugum] /home/kolla/linux-m68k $ git checkout m68k-v2.6.29
> error: pathspec 'm68k-v2.6.29' did not match any file(s) known to git=
=2E
>
> [kolla@haugum] /home/kolla/linux-m68k $ git checkout origin/m68k-v2.6=
=2E29
> warning: refname 'origin/m68k-v2.6.29' is ambiguous.
> Already on "origin/m68k-v2.6.29"
>
> [kolla@haugum] /home/kolla/linux-m68k $ git status | cat
> # On branch origin/m68k-v2.6.29
> nothing to commit (working directory clean)
>
> [kolla@haugum] /home/kolla/linux-m68k $ git pull
> From .
> =C2=A0* branch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0master =C2=A0=
 =C2=A0 -> FETCH_HEAD
> Already up-to-date.
>
> [kolla@haugum] /home/kolla/linux-m68k $ head -n5 Makefile
> VERSION =3D 2
> PATCHLEVEL =3D 6
> SUBLEVEL =3D 30
> EXTRAVERSION =3D -rc1
> NAME =3D Temporary Tasmanian Devil
>
> Obviously not 2.6.29...

Yeah, this is all `master', i.e. current development...

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
