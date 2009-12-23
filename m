From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Wed, 23 Dec 2009 19:37:27 +0100
Message-ID: <10f740e80912231037ua8724f4s8965b5c5b255ddfd@mail.gmail.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home>
	 <4AB3A4AC.6000703@codesourcery.com>
	 <4AC5BFA8.4040805@codesourcery.com>
	 <4AE5B06C.1090303@codesourcery.com>
	 <10f740e80911191131o4a58c67ejb3073a9c8cb9fd6c@mail.gmail.com>
	 <4B05A0D0.4040401@codesourcery.com>
	 <10f740e80911240501v238f023ahcdab0c1fe8600bf5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:42670 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755691AbZLWSh3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Dec 2009 13:37:29 -0500
Received: by ewy19 with SMTP id 19so6628009ewy.21
        for <linux-m68k@vger.kernel.org>; Wed, 23 Dec 2009 10:37:28 -0800 (PST)
In-Reply-To: <10f740e80911240501v238f023ahcdab0c1fe8600bf5@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

On Tue, Nov 24, 2009 at 14:01, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Thu, Nov 19, 2009 at 20:47, Maxim Kuvyrkov <maxim@codesourcery.com=
> wrote:
>> Geert Uytterhoeven wrote:
>>> On Mon, Oct 26, 2009 at 15:21, Maxim Kuvyrkov <maxim@codesourcery.c=
om>
>>> wrote:
>>>>
>>>> Maxim Kuvyrkov wrote:
>>>>>
>>>>> Maxim Kuvyrkov wrote:
>>>>>>
>>>>>> Andreas Schwab wrote:
>>
>> ...
>>>>>>
>>>>>> Moving on to the generic version of siginfo.h will certainly fix=
 the
>>>>>> problem, otherwise, one needs to pad extra 2 bytes in _timer.
>>>>>
>>>>> While the discussion is pending, here is an updated version of th=
e patch
>>>>> that also patches up sigval.
>>>>
>>>> Ping? =C2=A0Broken signal handling is a quite serious bug.
>>>>
>>>> Geert, which option of fixing would you prefer?
>>>
>>> Unfortunately I'm far from a signal expert...
>>>
>>> Fixing this breaks backwards compatibility, right?
>>
>> Not really. =C2=A0Fixing this bug will only make applications to rec=
eive expected
>> results in signal handlers they register.
>>
>>> So what are the consequences? Which applications are affected? Just
>>> gdb? So we need a fixed gdb binary in Debian?
>>
>> While GDB is a heavy user of signals, it's not the only application =
that's
>> affected. =C2=A0GLIBC is affected for sure, as is anything that is u=
sing signals
>> to the extent of checking UID of the process which sent the signal.
>>
>> The question is which solution should we adopt. =C2=A0The patch I po=
sted fixes
>> all current problems with have on our hands. =C2=A0Andreas suggested=
 to move to
>> the generic layout of `struct siginfo' which will make future proble=
ms less
>> likely, but this approach may need additional investigation.
>
> If moving to the generic layout decreases the probability of future p=
roblems,
> it's the way to go.

Do we have a patch somewhere?

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
