From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 32/35] m68k: add ColdFire FPU support for the V4e ColdFire
 CPU's
Date: Wed, 28 Dec 2011 15:53:55 +1000
Message-ID: <4EFAAEF3.6010709@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>	<1324610148-20666-33-git-send-email-gerg@snapgear.com> <CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:16092 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998Ab1L1FyN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Dec 2011 00:54:13 -0500
In-Reply-To: <CAMuHMdVBGR9p1f_dnk8abYwosvBm9n7j1foaGd+gMESKXm8+Vw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 25/12/11 05:38, Geert Uytterhoeven wrote:
> On Fri, Dec 23, 2011 at 04:15,<gerg@snapgear.com>  wrote:
>> @@ -570,15 +616,12 @@ static inline int rt_save_fpu_state(struct ucontext __user *uc, struct pt_regs *
>> 	return err;
>>  }
>>
>> -	__asm__ volatile (".chip 68k/68881\n\t"
>> -			  "fsave %0\n\t"
>> -			  ".chip 68k"
>> -			  : : "m" (*fpstate) : "memory");
>> +	__asm__ volatile ("fsave %0" : : "m" (*fpstate) : "memory");
>
> This change breaks one of my test configs, which builds for 68040 only:
>
> {standard input}: Assembler messages:
> {standard input}:475: Error: invalid instruction for this
> architecture; needs 68020 [68k, 68ec020], 68030 [68ec030], 68040
> [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334,
> 68336, 68340, 68341, 68349, 68360], 547x [5470, 5471, 5472, 5473,
> 5474, 5475], 548x [5480, 5481, 5482, 5483, 5484, 5485] -- statement
> `fsave -540(%fp)' ignored
>
> You can reproduce it by taking e.g. amiga_defconfig and disabling all of
> CONFIG_M68[236]0, or by manually compiling arch/m68k/kernel/signal.c
> with "-m68040" added (that's what 68040-only does).
>
> By convention, we always switch to the needed CPU type using the ".chip"
> directive, and switch back to generic 68k afterwards. So I'd expect it to fail
> for all my builds, but it only does for the 68040-only ones...

Yeah, the fail or not cases do seem strange here. But at the heart
of it all it is the switching back to 68k that causes problems.
And I think it is larger than just the ColdFire case.

If we are compiling specifically for a 68040 machine, where we put
a -m68040 switch on the command line, isn't all these ".chip 68k"
lines going to undo the CPU choice - and result in us now compiling
large parts of the code for the default 68020 instead of the chosen
68040?

Now I realize that for the most part this probably isn't a
big deal on any of the 68020/68030/68040/68060 (I don't know if gcc
does any clever code optimizations based on those differences).

It is a big deal we are building ColdFire, switching to 68k code
generation is wrong... and of course doesn't work.

I can easily fix this specific case. The calls to fsave and frestore
just need to be surrounded by a CPU_IS_COLDFIRE check. So the code
ends up looking like this:

         if (CPU_IS_COLDFIRE) {
                 __asm__ volatile ("fsave %0"
                                   : : "m" (*sc->sc_fpstate) : "memory");
         } else {
                 __asm__ volatile (".chip 68k/68881\n\t"
                                   "fsave %0\n\t"
                                   ".chip 68k"
                                   : : "m" (*sc->sc_fpstate) : "memory");
         }

And that now seems to compile for all the cases I tried (so good for
ColdFire, good for pure 68040 and mixed 68020/68030/68040/68060).
I have updated the patches based on this, and pushed them back up to
git.kernel.org.

I am still concerned about the use of ".chip 68k" in general though.
Just not sure how we can avoid it. I guess there is no way to jus
t revert to the original CPU choice?

Regards
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
