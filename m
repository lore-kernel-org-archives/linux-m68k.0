From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 2/4] m68k/atari - atafb: convert allocation of fb ram
 to new interface
Date: Tue, 1 Apr 2014 07:43:11 +1300
Message-ID: <CAOmrzk+KoMDn+_ea-gfRXCU0==szBDBWaN8Y0dE_C9qOvKQeeg@mail.gmail.com>
References: <1396253168-25601-1-git-send-email-schmitz@debian.org>
	<1396253168-25601-3-git-send-email-schmitz@debian.org>
	<CAMuHMdX+pZ_HAtODJ6zvxjxBHYpbmvG1QcBLwC-hYu_fW7HfXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:41435 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753837AbaCaSnM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 14:43:12 -0400
Received: by mail-ob0-f180.google.com with SMTP id wn1so9663400obc.39
        for <linux-m68k@vger.kernel.org>; Mon, 31 Mar 2014 11:43:11 -0700 (PDT)
In-Reply-To: <CAMuHMdX+pZ_HAtODJ6zvxjxBHYpbmvG1QcBLwC-hYu_fW7HfXQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Geert,


On Mon, Mar 31, 2014 at 10:12 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Michael,
>
> On Mon, Mar 31, 2014 at 10:06 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> The new atari_stram_alloc interface returns kernel virtual addresses
>> even if the kernel runs in FastRAM. These addresses are not
>> guaranteed to be identical with the physical addresses. Since ST-RAM
>> mappings have not been set up by mem_init, virt_to_phys() and its
>> cousin do not work and the atari_stram_to_phys() etc. helpers must
>> be used to determine physical addresses.
>
> Thanks!
>
>> @@ -2213,7 +2214,7 @@ static int ext_encode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
>>
>>  static void ext_get_par(struct atafb_par *par)
>>  {
>> -       par->screen_base = external_addr;
>> +       par->screen_base =external_screen_base;
>
> I'll add the missing space after "=".
>
>> +               external_screen_base = ioremap_writethrough((unsigned long)external_addr,
>>                                                      external_len);
>
> I'll remove the now superfluous cast.

Thanks, much appreciated!

Cheers,

  Michael
