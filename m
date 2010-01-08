From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Fri, 8 Jan 2010 20:32:15 +0100
Message-ID: <10f740e81001081132g19130a1cs14644f699ef44f17@mail.gmail.com>
References: <4AB113C3.1090606@codesourcery.com> <m21vm6k76e.fsf@igel.home>
	 <4AB3A4AC.6000703@codesourcery.com>
	 <4AC5BFA8.4040805@codesourcery.com>
	 <4AE5B06C.1090303@codesourcery.com>
	 <10f740e80911191131o4a58c67ejb3073a9c8cb9fd6c@mail.gmail.com>
	 <4B05A0D0.4040401@codesourcery.com>
	 <10f740e80911240501v238f023ahcdab0c1fe8600bf5@mail.gmail.com>
	 <10f740e80912231037ua8724f4s8965b5c5b255ddfd@mail.gmail.com>
	 <4B3273E6.8030407@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.153]:31078 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752985Ab0AHTcR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jan 2010 14:32:17 -0500
Received: by fg-out-1718.google.com with SMTP id 19so8084973fgg.1
        for <linux-m68k@vger.kernel.org>; Fri, 08 Jan 2010 11:32:15 -0800 (PST)
In-Reply-To: <4B3273E6.8030407@codesourcery.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org

On Wed, Dec 23, 2009 at 20:47, Maxim Kuvyrkov <maxim@codesourcery.com> =
wrote:
> On 12/23/09 9:37 PM, Geert Uytterhoeven wrote:
>> On Tue, Nov 24, 2009 at 14:01, Geert Uytterhoeven<geert@linux-m68k.o=
rg> wrote:
>>> On Thu, Nov 19, 2009 at 20:47, Maxim Kuvyrkov<maxim@codesourcery.co=
m>wrote:
>
> ...
>>>>
>>>> The question is which solution should we adopt. =C2=A0The patch I =
posted
>>>> fixes
>>>> all current problems with have on our hands. =C2=A0Andreas suggest=
ed to move
>>>> to
>>>> the generic layout of `struct siginfo' which will make future prob=
lems
>>>> less
>>>> likely, but this approach may need additional investigation.
>>>
>>> If moving to the generic layout decreases the probability of future
>>> problems,
>>> it's the way to go.
>>
>> Do we have a patch somewhere?
>
> Here it is, the patch is rather simple.
>
> I'm swamped at the moment, so I'll appreciate if someone verifies tha=
t the
> kernel runs fine with this patch applied.

Verified and applied. Thanks a lot!

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
