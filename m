From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Wed, 02 Apr 2014 22:31:25 +1000
Message-ID: <533C031D.4040100@westnet.com.au>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>	<CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com>	<CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>	<alpine.LNX.2.00.1404021529450.9604@nippy.intranet>	<CAO64nm6NJSmVWyo779AKqD_8FyXPKK-_EYEM1SsMz+N7WJWeHg@mail.gmail.com> <CAGj5WxBpHJwH5sgE_kmOGL+xq-kLNBTuab_0mZw7gy-XuEYifQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out8.external.iinet.net.au ([203.59.1.225]:22524
	"EHLO icp-osb-irony-out8.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758575AbaDBMks (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Apr 2014 08:40:48 -0400
In-Reply-To: <CAGj5WxBpHJwH5sgE_kmOGL+xq-kLNBTuab_0mZw7gy-XuEYifQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>, Daniel Palmer <danieruru@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org

Hi Luis,

On 02/04/14 20:47, Luis Alves wrote:
> Hi Daniel,
>
> Nice work.
> I remember that I managed to get gcc 4.7.2 working (I had to patch a
> few files in gcc due to abi changes).
> It is available for download at my old google code page (although it
> is compiled for 64-bit arch only):
> https://code.google.com/p/m68k/downloads/detail?name=m68k-uclinux-tools-20121115.tar.bz2&can=2&q=
>
> At that time I send a few patches but they got rejected mostly because
> it was requested to split in smaller patches and fix a LOT of those
> comments and change those 'legacy' whitespaces to tabs.
> I never got the time and patience to do it...

Thats a shame. Taking those last steps to create usable patches, that
can be pushed into the linux kernel sources, means no one has to repeat
your work in the future again.

Regards
Greg


>
> Regards,
> Luis
>
>
>
> On Wed, Apr 2, 2014 at 6:35 AM, Daniel Palmer <danieruru@gmail.com> wrote:
>> On Wed, Apr 2, 2014 at 2:06 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>>
>>>> - For the 68[EZ|VZ|SZ]328 you will need to fix up the PLL settings and
>>>> do the fixes from Luis Alves at
>>>> https://github.com/ljalves/alce68k/commit/4ef1df317c7acb6dfcd0fe9e87be9b4a60b141a4
>>>
>>> It would be nice if that work was pushed upstream. Of course, there are
>>> some hurdles to overcome (see Documentation/SubmittingPatches).
>>>
>>>> If your chip isn't running at 16MHz you have to fix up the serial driver
>>>> as it seems to assume a clock of 16MHz for it's baud rate setting.
>>>
>>> It's hard to comment without seeing patches, but Kconfig might help here.
>>
>> At the moment the only specific PLL settings are for PILOT. Everyone
>> else gets 16MHz.
>> All I needed to do was take out the bit that enables a second divider
>> on the 66MHz clock
>> from the PLL.
>>
>> --- a/arch/m68k/platform/68000/head.S
>> +++ b/arch/m68k/platform/68000/head.S
>> @@ -94,9 +94,9 @@ _start:
>>   #ifdef CONFIG_PILOT
>>          movew   #0x2410, 0xfffff200             /* PLLCR */
>>   #else
>> -       movew   #0x2400, 0xfffff200             /* PLLCR */
>> +       movew   #0x2493, 0xfffff200             /* PLLCR */
>>   #endif
>> -       movew   #0x0123, 0xfffff202             /* PLLFSR */
>> +       movew   #0x0347, 0xfffff202             /* PLLFSR */
>>          moveq   #0, %d0
>>          movew   #16384, %d0                     /* PLL settle wait loop */
>>   _pll_settle:
>> @@ -230,6 +230,13 @@ _clear_bss:
>>          cmpl    %a0, %a1                        /* check if at end */
>>          bne     _clear_bss
>>
>>
>> For both the PLL and UART baud rate issue I think a Kconfig setting
>> for the system clock would work.
>> For the EZ it should only allow <= 16MHz, for the VZ <= 32MHz and for
>> the SZ <= 66MHz ...
>> If it was a choice between 16, 33 or 66 then
>> drivers/tty/serial/68328serial.c could compile in the right table.
>> At the moment it assumes the VZ is running at 33MHz but the PLL
>> settings configure it for 16MHz.
>>
>> If I get time I'll try to put together a patch set that fixes the
>> various issues, add a defconfig for this dev kit etc.
>>
>>> I'd assume that GCC developers don't have the hardware. But I've found
>>> that they are generally inclined to help. You'd need to build and test
>>> your patches though. Crosstool-NG or OpenEmbedded can help with this.
>>
>> Here is the bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53386
>> They say to use the target m68k-uclinuxoldabi but that was deprecated
>> in GCC 4.6 so it doesn't exist any more.
>> I'm happy with GCC 4.5 for now.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
