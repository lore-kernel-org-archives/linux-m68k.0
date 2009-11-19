From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Thu, 19 Nov 2009 20:31:12 +0100
Message-ID: <10f740e80911191131o4a58c67ejb3073a9c8cb9fd6c@mail.gmail.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home>
	 <4AB3A4AC.6000703@codesourcery.com>
	 <4AC5BFA8.4040805@codesourcery.com>
	 <4AE5B06C.1090303@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:61421 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753278AbZKSTbI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Nov 2009 14:31:08 -0500
Received: by bwz27 with SMTP id 27so2725334bwz.21
        for <linux-m68k@vger.kernel.org>; Thu, 19 Nov 2009 11:31:13 -0800 (PST)
In-Reply-To: <4AE5B06C.1090303@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

On Mon, Oct 26, 2009 at 15:21, Maxim Kuvyrkov <maxim@codesourcery.com> =
wrote:
> Maxim Kuvyrkov wrote:
>> Maxim Kuvyrkov wrote:
>>> Andreas Schwab wrote:
>>>> Maxim Kuvyrkov <maxim@codesourcery.com> writes:
>>>>
>>>>> The bug is rather elegant and has been present in sources for yea=
rs.
>>>>
>>>> For more than 9 years, to be precise, when 32 bit uids were introd=
uced.
>>
>> ...
>>>>
>>>> Given that there is no way to keep backward compatibility it might=
 be a
>>>> good opportunity to do same cleanup here. =C2=A0Like going back to=
 the
>>>> generic layout.
>>>
>>> There is yet another bug in siginfo. =C2=A0si_sigval is expected to=
 be at the
>>> same offsets in _timer and _rt. =C2=A0At the moment si_sigval is at=
 offset 8 in
>>> _timer and at offset 6 in _rt (the patch for fixing uids makes that=
 8@_timer
>>> and 10@_rt).
>>>
>>> This bug causes rt/tst-*timer* tests fail.
>>>
>>> Moving on to the generic version of siginfo.h will certainly fix th=
e
>>> problem, otherwise, one needs to pad extra 2 bytes in _timer.
>>
>> While the discussion is pending, here is an updated version of the p=
atch
>> that also patches up sigval.
>
> Ping? =C2=A0Broken signal handling is a quite serious bug.
>
> Geert, which option of fixing would you prefer?

Unfortunately I'm far from a signal expert...

=46ixing this breaks backwards compatibility, right?
So what are the consequences? Which applications are affected? Just
gdb? So we need a fixed gdb binary in Debian?

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
