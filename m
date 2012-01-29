From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Sun, 29 Jan 2012 22:59:05 +0100
Message-ID: <CAMuHMdWv-On4mEwhs0wEAgM8TBxscJNBX=AvHW3HcoX-LnMrzA@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<4F1EEBEF.4000400@sigon.net>
	<CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
	<4F2053C9.3090201@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:53286 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753837Ab2A2V7H convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Jan 2012 16:59:07 -0500
Received: by wgbed3 with SMTP id ed3so3882379wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 29 Jan 2012 13:59:05 -0800 (PST)
In-Reply-To: <4F2053C9.3090201@sigon.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Cc: linux-m68k@vger.kernel.org

On Wed, Jan 25, 2012 at 20:11, Patrick Bottelberger
<patrick.bottelberger@sigon.net> wrote:
>>> Without supplying the '-p' parameter amiboot didn't output anything=
 at
>>> all, it just froze the amiga directly after entering the command.
>>
>> Even with '-d'?
>>
> Yes, even with "-d", no output is printed, after entering the command
> ("amiboot -d root=3D/dev/hda5" for example) and pressing "enter" the
> system freezes immediately.

Hmm, must be a bug in common/amiga/linuxboot.c:ckfpu(), or ckcpu346().

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
