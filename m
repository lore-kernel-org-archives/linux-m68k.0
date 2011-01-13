From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: build warnings
Date: Thu, 13 Jan 2011 21:55:59 +0100
Message-ID: <AANLkTik_BjD-vqxm5Ht4F-ucY-Xt+J7hehti+2h072jr@mail.gmail.com>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
	<AANLkTinkAfv0dFyH2yp05M4CwN=mPixHfKiXgLKrieWo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63613 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083Ab1AMU4B convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 13 Jan 2011 15:56:01 -0500
Received: by fxm20 with SMTP id 20so2091161fxm.19
        for <linux-m68k@vger.kernel.org>; Thu, 13 Jan 2011 12:55:59 -0800 (PST)
In-Reply-To: <AANLkTinkAfv0dFyH2yp05M4CwN=mPixHfKiXgLKrieWo@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Thu, Jan 13, 2011 at 20:24, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> On Fri, Jan 14, 2011 at 3:44 AM, Thorsten Glaser <tg@mirbsd.de> wrote=
:
>> currently At wOrk, but here is something from the log:
>>
>> =C2=A0CALL =C2=A0 =C2=A0/tmp/buildd/linux-2.6-2.6.37/debian/build/so=
urce_m68k_none/scripts/checksyscalls.sh
>> <stdin>:1522:2: warning: #warning syscall recvmmsg not implemented
>
> I'm sure I have seen this one before.

It's a false positive, as we implement it through the socketcall demult=
iplexer.
Some archs implement them all using individual syscalls.
BTW, PPC recently started doing both, and is trying to phase out the
socketcall way.

>> =C2=A0CC =C2=A0 =C2=A0 =C2=A0security/keys/keyctl.o
>> /tmp/buildd/linux-2.6-2.6.37/debian/build/source_m68k_none/security/=
keys/keyctl.c:1346:2: warning: #warning TIF_NOTIFY_RESUME not implement=
ed

Waiting for someone with spare time to implement it...

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
