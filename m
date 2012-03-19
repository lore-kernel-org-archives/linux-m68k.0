From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: NULL pointer dereference in 3.3-rc6
Date: Mon, 19 Mar 2012 12:51:45 +0100
Message-ID: <CAMuHMdVSYAFqVsK040yJ_SwVOSvVR6m9ZTJ-t4bAU4fk-tV=aQ@mail.gmail.com>
References: <alpine.DEB.2.00.1203181231530.5031@ayla.of.borg>
	<m2zkbejckk.fsf@igel.home>
	<CAMuHMdW20E9k6MUUQQyUxHLLzQLEOQKA6CR3vMTc3FLD58fnQQ@mail.gmail.com>
	<4F66AD79.2060000@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4F66AD79.2060000@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Greg,

On Mon, Mar 19, 2012 at 04:52, Greg Ungerer <gerg@snapgear.com> wrote:
> On 19/03/12 06:03, Geert Uytterhoeven wrote:
>> Given that a1 is zero, and d1 is 64, it looks like it's the movesl a=
t
>> 5e14 that caused the problem:
>>
>>>> =C2=A0 5e14: =C2=A0 =C2=A0 =C2=A0 0e91 2800 =C2=A0 =C2=A0 =C2=A0 m=
ovesl %d2,%a1@
>>>> =C2=A0 5e18: =C2=A0 =C2=A0 =C2=A0 2400 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0movel %d0,%d2
>>>> =C2=A0 5e1a: =C2=A0 =C2=A0 =C2=A0 608c =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0bras 5da8<berr_040cleanup+0x144>
>>
>>
>> This corresponds to
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 case BA_SIZE_LONG:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D put_=
user(wbd, (int __user *)wba);
>>
>> in do_040writeback1(). So wba is zero. Oops...
>
> Did this work properly in 3.2?

Actually I had booted the same kernel image just after I compiled it 2 =
weeks
ago, and at that time I didn't get the oops.

> If so can you git bisect it to find a problem patch?

Will retry to see whether it's (sort-of) reproducible...

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
