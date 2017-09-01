From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: allow ColdFire m5441x parts to run with MMU enabled
Date: Fri, 1 Sep 2017 15:30:25 +0200
Message-ID: <CAMuHMdW-yih8Cm3TnXNHxpCOr-UnbT+NARTKiQS8zyaU3fWL+Q@mail.gmail.com>
References: <bc3dc168-aaae-1271-b73b-4d649db5e301@sysam.it>
 <d1ce1669-0286-ebad-7c6c-e9dfe37c266c@sysam.it> <30318b18-e955-1615-975e-9b378d3201b8@westnet.com.au>
 <c095233b-15fc-53f7-c21d-a6c805711040@sysam.it> <0e1723eb-0724-7007-5b63-7d80112268a2@westnet.com.au>
 <d4e220c9-f607-cf9a-2e63-910e745dbea9@sysam.it> <c5dfd7b3-3266-1ecd-1dbf-e66bd9f5aa32@westnet.com.au>
 <f7d80fbd-3b99-66c5-38f5-592780703f96@sysam.it> <590226cf-890a-449b-6bd4-f461fff2938b@westnet.com.au>
 <c8916578-7f5a-707d-e59d-d4d274cbf7a1@sysam.it> <702374e9-7c94-1cbe-306a-d39a1fb70fdd@westnet.com.au>
 <c3357a3f-e429-8ae5-9340-064ed09e1f67@sysam.it> <f0fad6b5-96a9-6025-1fd3-7a1a0b6679d4@westnet.com.au>
 <7544f20e-a999-cf50-74cf-b45513c6eed3@sysam.it> <8eedc7bb-db70-9ae3-2304-300591a8d2bb@sysam.it>
 <CAMuHMdWMrC7EMER0ifz+5RjPov3BOjhjAbVmWHDbTEHFcCOUbQ@mail.gmail.com> <bda55359-b4b8-1af7-52bc-d00ef1dd78c4@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34772 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752125AbdIANa0 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 1 Sep 2017 09:30:26 -0400
Received: by mail-pf0-f194.google.com with SMTP id v22so143409pfk.1
        for <linux-m68k@vger.kernel.org>; Fri, 01 Sep 2017 06:30:26 -0700 (PDT)
In-Reply-To: <bda55359-b4b8-1af7-52bc-d00ef1dd78c4@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>
Cc: Angelo Dureghello <angelo@sysam.it>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Fri, Sep 1, 2017 at 3:21 PM, Greg Ungerer <gregungerer@westnet.com.au> wrote:
> On 01/09/17 17:49, Geert Uytterhoeven wrote:
>> On Fri, Sep 1, 2017 at 12:38 AM, Angelo Dureghello <angelo@sysam.it>
>> wrote:
>>> did some additional study and tests.
>>>
>>> Actually i cannot find any simpler patch, i just adjusted it a
>>> bit. I believe this patch will work on your cpu with 0-based
>>> memoryas well.
>>> I attach it for your comments.
>>
>>
>> I think your issue is caused by arch/m68k/include/asm/page_offset.h:
>>
>>      #if defined(CONFIG_RAMBASE)
>>      #define PAGE_OFFSET_RAW         CONFIG_RAMBASE
>>      #elif defined(CONFIG_SUN3)
>>      #define PAGE_OFFSET_RAW         0x0E000000
>>      #else
>>      #define PAGE_OFFSET_RAW         0x00000000
>>      #endif
>>
>> and arch/m68k/Kconfig.machine:
>>
>> if !MMU || COLDFIRE
>>
>>      config RAMBASE
>>              hex "Address of the base of RAM"
>>              default "0"
>>
>> So on MC680[2346]0 with MMU (and ignoring Sun-3, which is special),
>> PAGE_OFFSET == PAGE_OFFSET_RAW == 0.
>>
>> On Greg's zero-based Coldfire with MMU, CONFIG_RAMBASE is zero, and thus
>> PAGE_OFFSET is also zero.
>>
>> On your board CONFIG_RAMBASE is non-zero, hence PAGE_OFFSET is also
>> non-zero,
>> and thus you have to compensate for that, cfr. your second patch.
>>
>> Does it work if you force PAGE_OFFSET_RAW to zero?
>>
>> If yes, we either need:
>>
>> --- a/arch/m68k/include/asm/page_offset.h
>> +++ b/arch/m68k/include/asm/page_offset.h
>> @@ -1,6 +1,6 @@
>>   /* This handles the memory map.. */
>>
>> -#if defined(CONFIG_RAMBASE)
>> +#if !defined(CONFIG_MMU)
>>   #define PAGE_OFFSET_RAW                CONFIG_RAMBASE
>>   #elif defined(CONFIG_SUN3)
>>   #define PAGE_OFFSET_RAW                0x0E000000
>>
>> or
>>
>> --- a/arch/m68k/Kconfig.machine
>> +++ b/arch/m68k/Kconfig.machine
>> @@ -325,6 +325,7 @@ comment "RAM configuration"
>>
>>   config RAMBASE
>>          hex "Address of the base of RAM"
>> +       depends on MMU
>
>
> Did you mean "depends on !MMU" here?

Sorry, yes, depends on !MMU.

>> depending on whether anything else in the Coldfire code needs RAMBASE.
>
> There are a couple of places we depend on CONFIG_RAMBASE even
> when running with the MMU enabled. Most importantly in setting
> the cachable regions in arch/m68k/include/asm/m54xxacr.h.
> So this is probably not going to work on its own.

OK, as I already feared/expected...

> But the first patch above should be ok. It should certainly work on
> my 0 address base 5475 ColdFire setup. Angelo can you try that one?

Right.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
