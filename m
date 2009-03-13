From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Fri, 13 Mar 2009 13:14:32 +0100
Message-ID: <10f740e80903130514k194fbdackd373d2951a9f76ba@mail.gmail.com>
References: <200903120437.03837.rob@landley.net>
	 <20090312210216.GB14205@uranus.ravnborg.org>
	 <10f740e80903121540i30fdaddr600ce21f4159530a@mail.gmail.com>
	 <200903122225.04560.rob@landley.net> <49BA0599.6070206@snapgear.com>
	 <20090313082555.GA19045@uranus.ravnborg.org>
	 <10f740e80903130133r130b8713v690437f0f38eb0b8@mail.gmail.com>
	 <20090313085930.GA19274@uranus.ravnborg.org>
	 <49BA3B05.9020906@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <49BA3B05.9020906@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Landley <rob@landley.net>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org, linux-m68k@lists.linux-m68k.org

On Fri, Mar 13, 2009 at 11:52, Greg Ungerer <gerg@snapgear.com> wrote:
> Sam Ravnborg wrote:
>> On Fri, Mar 13, 2009 at 09:33:18AM +0100, Geert Uytterhoeven wrote:
>>> On Fri, Mar 13, 2009 at 09:25, Sam Ravnborg <sam@ravnborg.org> wrot=
e:
>>>> On Fri, Mar 13, 2009 at 05:04:57PM +1000, Greg Ungerer wrote:
>>>>> I pretty quick time I can fix up the last couple on the above lis=
t.
>>>>> But do we want to put all that change into 2.6.29-rc at this poin=
t?
>>>>
>>>> In general we do not want to have headers_check broken in mainline=
,
>>>
>>> headers_check is not broken, headers_install is.
>>>
>>> Hmm, in some sense headers_check _is_ broken, as it doesn't notice
>>> headers_install
>>> installs headers that refer to other headers that are not installed=
=2E..
>>
>> This is what scripts/headers_check are supposed to do - strange.
>>
>>> Greg, I had a quick look at your signcontext.h and signal.h merge, =
and
>>> the MMU
>>> part seems to be OK.
>>>
>>> However, some of the installed headers still have checks for CONFIG=
_MMU:
>>>
>>> param.h:#ifdef CONFIG_MMU
>>> sigcontext.h:#ifndef CONFIG_MMU
>>> sigcontext.h:#ifdef CONFIG_MMU
>>> siginfo.h:#ifdef CONFIG_MMU
>>> siginfo.h:#ifdef CONFIG_MMU
>>> siginfo.h:#endif /* CONFIG_MMU */
>>> swab.h:#elif defined(CONFIG_MMU)
>>>
>>> so these have to be added to the generic unifdef-y list (is that
>>> include/asm-generic/Kbuild.asm?).
>
> Hmmm, yes your right.
>
>
>> include/asm-generic/Kbuild.asm impacts all architectures so be caref=
ull
>> there.
>> It looks like some updates to arch/m68k/include/asm/Kbuild is needed=
,
>> and not the generic list of files to export.
>>
>> Also use og CONFIG_MMU suprises me.
>> We used #ifdef __uClinux__ in the non-merged headers to avoid use
>> of a CONFIG_* symbol that is not valid outside the kernel namespace.
>> So if param.h in m68k uses CONFIG_MMU it is broken.
>
> I have been trying to use CONFIG_MMU wherever possible (so for non-
> exported headers), since that matches what is actually in the code
> proper. I am concerned at the longer term use of __uClinux__ for
> distinguishing MMU and non-MMU. I plan on switching to use a normal
> m68k toolchain soon. And it won't define __uClinux__ on its own.
> (I already do this on ARM for example - same toolchain on both
> MMU an non-MMU).
>
> What I have done so far is or the most part a very simple merge
> of the files. I know there is room for some improvements in quite a
> few of these files.
>
> The use of CONFIG_MMU in swab.h (is this actually exported to user
> space?) is not actually for code that is MMU or non-MMU. It is
> actually architecture specific. Most ColdFire parts don't have the
> "rolw" instruction. The condition test can be better. Geert, any
> ideas on what is more appropriate here?

The `rolw' variant is already protected by `#if defined
(__mcfisaaplus__) || defined (__mcfisac__)',
so I think you can replace the `#elif defined(CONFIG_MMU)' by a plain `=
#else'.
Or are there cases where you don't want to have __arch_swab32 at all?

> I can switch back to using __uClinux__ on siginfo.h and sigcontext.h.
> If I am not mistaken we can't change these structures without breakin=
g
> backwards compatibility? =C2=A0The sigcontext change is particularly =
ugly :-(

Copying the signal experts on linux-m68k...

> Similarly for param.h, it looks like a switch back to using
> __uClinux__ for now is the only option.
>
> Now after these fixups should I create a git branch with these header
> merges in for inclusion into 2.6.29-rc? =C2=A0To fix the regression w=
e
> only need to do the handful of files that Rob listed, right?

Yes.

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
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
