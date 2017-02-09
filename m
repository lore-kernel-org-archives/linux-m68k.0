From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 01/22] m68k/atari: Modernize printing of kernel messages
Date: Thu, 9 Feb 2017 12:59:32 +0100
Message-ID: <CAMuHMdWU69aHsAdQggu07Wf8ePe6Fp3=akQJBiNQDHP_u3Eeqg@mail.gmail.com>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
 <1481123360-10978-2-git-send-email-geert@linux-m68k.org> <alpine.LNX.2.00.1612080925380.9219@nippy.intranet>
 <CAMuHMdXA2bseZ_JxeC7L+_X2aW=xpaRXc1QrgZZpEZyWtuE75g@mail.gmail.com> <8dd7db81-fc45-8054-82fa-3b09be455ef7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <8dd7db81-fc45-8054-82fa-3b09be455ef7@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Michael,

On Sat, Dec 10, 2016 at 1:44 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 09.12.2016 um 01:22 schrieb Geert Uytterhoeven:
>> On Wed, Dec 7, 2016 at 11:36 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>>> On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:
>>>>   - Convert from printk() to pr_*(),
>>>>   - Add missing continuations, to fix user-visible breakage,
>>>>   - Drop useless WARNING prefix,
>>>>   - Move trailing spaces to start of continuations.
>>>>
>>>> Fixes: 4bcc595ccd80decb ("printk: reinstate KERN_CONT for printing continuation lines")
>>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> ---
>>>>  arch/m68k/atari/atakeyb.c | 14 ++++++------
>>>>  arch/m68k/atari/config.c  | 56 +++++++++++++++++++++++------------------------
>>>>  2 files changed, 35 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
>>>> index 264db11268039329..37091898adb3d3b5 100644
>>>> --- a/arch/m68k/atari/atakeyb.c
>>>> +++ b/arch/m68k/atari/atakeyb.c
>>>> @@ -149,7 +149,7 @@ static irqreturn_t atari_keyboard_interrupt(int irq, void *dummy)
>>>>       if (acia_stat & ACIA_OVRN) {
>>>>               /* a very fast typist or a slow system, give a warning */
>>>>               /* ...happens often if interrupts were disabled for too long */
>>>> -             printk(KERN_DEBUG "Keyboard overrun\n");
>>>> +             pr_debug("Keyboard overrun\n");
>>>>               scancode = acia.key_data;
>>>>               if (ikbd_self_test)
>>>>                       /* During self test, don't do resyncing, just process the code */
>>>
>>> This is not equivalent (unless there is a DEBUG macro definition hinding
>>> in a header file somewhere). Since the changelog doesn't mention
>>> suppressing any output, perhaps you were deceived by the questionable API,
>>> as I have been in the past (see 16b9d870a0 and d61c5427f6).
>>
>> This is an actual message people want to see in the kernel log, even
>
> No, it's not something people want to see - clutters up the screen, and
> causes even more interrupt hogging disk IO from syslogd so exacerbates
> the problem on slow systems.
>
> But Finn is right in that output is now suppressed instead of given a
> particular log level. IMO stating that the message will now only be
> generated when the kernel has been compiled for debugging would be
> perfectly fine.

Thanks, will update the commit message.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
