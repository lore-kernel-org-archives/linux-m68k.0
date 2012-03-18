From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: NULL pointer dereference in 3.3-rc6
Date: Sun, 18 Mar 2012 21:03:33 +0100
Message-ID: <CAMuHMdW20E9k6MUUQQyUxHLLzQLEOQKA6CR3vMTc3FLD58fnQQ@mail.gmail.com>
References: <alpine.DEB.2.00.1203181231530.5031@ayla.of.borg>
	<m2zkbejckk.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m2zkbejckk.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Sun, Mar 18, 2012 at 13:52, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> I'm a bit puzzled, as the crash location is not a memory dereference=
 but
>> the "set_fs(MAKE_MM_SEG(wbs));" in do_040writeback1().
>
> I guess the integer unit can move ahead while the memory unit process=
es
> the write. =C2=A0Take a look at the places that jump to 0x5da8.

Thanks for the hint!

Given that a1 is zero, and d1 is 64, it looks like it's the movesl at
5e14 that caused the problem:

>>   5e14:       0e91 2800       movesl %d2,%a1@
>>   5e18:       2400            movel %d0,%d2
>>   5e1a:       608c            bras 5da8 <berr_040cleanup+0x144>

This corresponds to

        case BA_SIZE_LONG:
                res =3D put_user(wbd, (int __user *)wba);

in do_040writeback1(). So wba is zero. Oops...

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
