From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Sun, 29 Jan 2012 09:33:21 +1300
Message-ID: <4F245B91.60101@gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <4F0964EC.2080505@fairlite.co.uk> <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com> <loom.20120127T175834-143@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:62416 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab2A1UdZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 15:33:25 -0500
Received: by dadi2 with SMTP id i2so2410887dad.19
        for <linux-m68k@vger.kernel.org>; Sat, 28 Jan 2012 12:33:24 -0800 (PST)
In-Reply-To: <loom.20120127T175834-143@post.gmane.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,
>>> No, the kernel is too big. I've only got 4MB ST-RAM. And getting mo=
re on
> The guys at the Atari booth at OpenRheinRuhr had the same problem,
> they also had a 4/4 MiB split.
OK, worth fixing in this case.

Considering the kernel may fit into the first 4 MB, how much room does=20
that leave for RAM allocated through stram_alloc?
Do we need to set aside some RAM right at the end of the kernel code=20
segment for things like atafb (like we used to do in 2.2 or thereabouts=
)?
>> You may have to pare the kernel down to the bare minimum (i.e.
>> modularize about everything you don't need to boot to initrd). Not
>> sure where the limit for this is these days.
> Note that the Debian kernel does not use initrd to boot (to the
> finally installed system), especially as those tools are built
> with klibc, which is currently still broken on m68k, and thus
I wasn't aware of that.
> contains everything needed to get into an ext3fs / from disc,
> and then some. I don=E2=80=99t think you should be using a distro ker=
nel
> made under such constraints (nor should the distro kernel be
> stripped more down considering the problems; I think there may
> even be flavours that don=E2=80=99t _support_ initrd, outside the ima=
ge
> that is) but compile a stripped-down one yourself.
That's what I was suggesting - a stripped down kernel tailored to the T=
T=20
could then
be 'distributed' (like you do with other stuff from your people.d.o=20
page) to those
that need it.

Not that a total of 8 MB RAM would be a lot of fun to run today's kerne=
l=20
and userland on.

Cheers,

   Michael
