From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Sat, 6 Aug 2011 11:56:22 +0200
Message-ID: <CAMuHMdXeFH-uTw5XWB4_arvj2DfbXrb4q_9BKKhDhxNxwFvmBw@mail.gmail.com>
References: <4E369834.9070707@aalto.fi>
	<alpine.OSX.2.00.1108021532260.256@ibook.intranet>
	<4E3ACFE5.7020901@aalto.fi>
	<CAOmrzkL1ZaWBtYG6uyotwgGzoZLEdafrUCh6qfq-_siNZ9vvdQ@mail.gmail.com>
	<4E3BD9C1.6020209@aalto.fi>
	<4E3C6F8D.7030902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E3C6F8D.7030902@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Sat, Aug 6, 2011 at 00:32, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
> there is a pattern to this - most of the times the watchdog fires whe=
n the
> IDE interface is probed. In that case we have =C2=A0TSR=3D0x3, ISR=3D=
0x3 (need to
> look up what that means in the driver headers).
>
> Other times, it is either the floppy interface getting probed, or in =
one
> case, the mouse. The TSR is different there (0x5).
>
> It appears interrupts from the card get lost when other drivers disab=
le
> interrupts for too long. I'd go back to a version of the kernel befor=
e we
> moved to the genirq framework (that was at the end of May this year).=
 If
> that still works, bisect from there (man git-bisect) to find the appr=
oximate
> commit that broke Amiga ethernet.
>
> If you cannot use git-bisect, I'd have to build kernels for you to te=
st
> again and again until we find the last one that works - quite slow a
> procedure but it might be the only thing.
>
> Geert: is the genirq change simple to back out, just for tests?

The genirq conversion is not complete, and not yet on the master branch=
=2E
So it's unrelated.

> On 05/08/11 23:53, Tuomas Vainikka wrote:
>>
>> On 08/04/2011 11:45 PM, Michael Schmitz wrote:
>>>
>>> On Fri, Aug 5, 2011 at 4:59 AM, Tuomas Vainikka
>>> <tuomas.vainikka@aalto.fi> =C2=A0wrote:
>>>>
>>>> Hello,
>>>>
>>>> The other network drivers were previously compiled as modules, and=
 I
>>>> only
>>>> had apne built-in.
>>>> Now I removed the other drivers being built in any way, but I stil=
l get
>>>> an
>>>> error:
>>>
>>> Is there a way to get timestamps logged with each of the entries in
>>> the call trace below (i.e. could we rig some profiling code for tha=
t)?
>>> Would be interesting to know where exactly the kernel was spinning
>>> when the watchdog fired. But maybe that's obvious to someone.
>>>
>>> Are there potential deadlocks with printk called from softirq conte=
xt
>>> (I think not ...)? What is the message printed immediately after th=
e
>>> trace?
>>
>> I've attached full dmesg outputs from ten sequential boots with the =
kernel
>> config.
>> You can see that the trace can happen any time, or not at all.
>>>
>>> Last - has anyone ever tried to bisect this?

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
