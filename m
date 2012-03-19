From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: NULL pointer dereference in 3.3-rc6
Date: Mon, 19 Mar 2012 13:52:25 +1000
Message-ID: <4F66AD79.2060000@snapgear.com>
References: <alpine.DEB.2.00.1203181231530.5031@ayla.of.borg>	<m2zkbejckk.fsf@igel.home> <CAMuHMdW20E9k6MUUQQyUxHLLzQLEOQKA6CR3vMTc3FLD58fnQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdW20E9k6MUUQQyUxHLLzQLEOQKA6CR3vMTc3FLD58fnQQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

On 19/03/12 06:03, Geert Uytterhoeven wrote:
> On Sun, Mar 18, 2012 at 13:52, Andreas Schwab<schwab@linux-m68k.org> =
 wrote:
>> Geert Uytterhoeven<geert@linux-m68k.org>  writes:
>>
>>> I'm a bit puzzled, as the crash location is not a memory dereferenc=
e but
>>> the "set_fs(MAKE_MM_SEG(wbs));" in do_040writeback1().
>>
>> I guess the integer unit can move ahead while the memory unit proces=
ses
>> the write. =C3=A1Take a look at the places that jump to 0x5da8.
>
> Thanks for the hint!
>
> Given that a1 is zero, and d1 is 64, it looks like it's the movesl at
> 5e14 that caused the problem:
>
>>>    5e14:       0e91 2800       movesl %d2,%a1@
>>>    5e18:       2400            movel %d0,%d2
>>>    5e1a:       608c            bras 5da8<berr_040cleanup+0x144>
>
> This corresponds to
>
>          case BA_SIZE_LONG:
>                  res =3D put_user(wbd, (int __user *)wba);
>
> in do_040writeback1(). So wba is zero. Oops...

Did this work properly in 3.2?
If so can you git bisect it to find a problem patch?

There has been quite a bit of m68k core change with all the ColdFire
MMU new code coming in for 3.3. I wouldn't expect any specific problems
with existing 040 code... But it does touch a lot of code in little
ways.

Regards
Greg


-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
