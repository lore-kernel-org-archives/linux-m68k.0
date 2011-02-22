From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: merge of m68knommu and m68k arch branches?
Date: Tue, 22 Feb 2011 08:40:53 +0100
Message-ID: <AANLkTi=o9hQM1DqbBOAsDpxBW9U1uHsUZ6q3Kw48OBb6@mail.gmail.com>
References: <4D5DB83D.80205@snapgear.com>
	<alpine.LFD.2.00.1102212216540.2701@localhost6.localdomain6>
	<4D6319E0.9080907@snapgear.com>
	<AANLkTi=QkXK7=DQ5H1PFttTk+iug_npCsz112RYXd7BR@mail.gmail.com>
	<20110222072951.GA24953@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:62256 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753819Ab1BVHky convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 Feb 2011 02:40:54 -0500
In-Reply-To: <20110222072951.GA24953@merkur.ravnborg.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Greg Ungerer <gerg@snapgear.com>, Thomas Gleixner <tglx@linutronix.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Steven King <sfking00@yahoo.com>, uClinux development list <uclinux-dev@uclinux.org>, Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gregungerer@westnet.com.au>

On Tue, Feb 22, 2011 at 08:29, Sam Ravnborg <sam@ravnborg.org> wrote:
>> >> Is there a plan to move m68k to the generic facilities as well ?
>>
>> Moving m68k to genirq is (the next thing?) on my list...
>
> If I succeed migrating sparc32 to genirq I hope to be of a little hel=
p here.
> It looks like a bigger task to migrate m68k than it was/is to migrate=
 sparc32.
>
> It would be _very_ nice to get the last two architectures migrated to=
 genirq.

Aren't your forgetting s390?

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
