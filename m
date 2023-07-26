Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC792C001DC
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jul 2023 20:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjGZUNL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jul 2023 16:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGZUNK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jul 2023 16:13:10 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D439BF
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jul 2023 13:13:09 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6bb140cd5a5so143911a34.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jul 2023 13:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690402388; x=1691007188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2Y9M8BZaNSWSxI3Ts6otXw7lgWTL2+6ld06XUbPVy8=;
        b=gmfivCWwQqOQ0/kCixlYSbtC7W8dAGWmbQvYKhAl2W2rKLHun8oBkfqTO7NQuqfvv3
         HsZUym7c/hXiILqAxMy3Zv6Ss6P9kPmIPUoSwXN4gbJebVHauHewCXBF19Hp8Agtl51q
         gXI6e5JZKLtLqjwl+pRYmlTSRW9PcRD9Il1Mv6BxLuPgDv1rn0uSOu0tfzjfDW0LX7ko
         sD3HRCprrorZ0GvsCAmNEo+NUGwa8j0Gy/O4yAGV3CRt0x7URv9PUzKatcCHzQP93rDd
         +Go3CQOLFdHFi+u7nYkrZnPYiKQVuaaqS6uB4oB9bwPRYl4AN/VD8qwrp8Rj/w11Bzjn
         tEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690402388; x=1691007188;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2Y9M8BZaNSWSxI3Ts6otXw7lgWTL2+6ld06XUbPVy8=;
        b=SVqSNrkXwbpQhatQ2yEEfrUSPRbU+FpwuCyiMnP3ZBzwNjRFWd2iUQMT7mPb4oP01H
         0PGp5g4peOktWNqjjisnBcIxWe7kdbqF0x1OBJiwDX/Jg2+KenaqgL5ygPB6Rkn6W/e9
         6KLOJ0oGgcZ/HHLixTLTLUvlUpwcBvPBVVwGsDX1j963bPQgJ1Tej2Hdn+fHPOWrNkc6
         gGcGWZ+uxioIoqZcE1DLb4PHuikZ8A51oJA53cZcHmcJvP8JphevcNA0UUYWkqFQb2JN
         JIV5ZwDeLbI2K15E0EmUnIiIVNfiQsOL5oi5l8CePb8BXQxW6Ybfaekt7ymAGo0fOUW8
         9xmg==
X-Gm-Message-State: ABy/qLZsHZcSYOlVnpicN39fHGKb6kfeNZAsxbC+PMoa01I4OOJxQB9z
        rd4MboUF1GyfC7HXzRA4ix0=
X-Google-Smtp-Source: APBJJlGwdznfARE4o+gjZdyaOP4L0/ABGpYCVAAyCjrhono37D5EiRnBAph0osJdA29MK2hFy6HByw==
X-Received: by 2002:a05:6870:64a3:b0:1b0:68f7:da8 with SMTP id cz35-20020a05687064a300b001b068f70da8mr624984oab.12.1690402388469;
        Wed, 26 Jul 2023 13:13:08 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:f94b:298a:5f33:47c6? ([2001:df0:0:200c:f94b:298a:5f33:47c6])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902d90200b001bb515e6b39sm13574973plz.306.2023.07.26.13.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 13:13:07 -0700 (PDT)
Message-ID: <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
Date:   Thu, 27 Jul 2023 08:13:03 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
 <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 26/07/23 21:22, Finn Thain wrote:
>
>>> There are two ISA slots where all other I/O devices are connected. These are
>>> described (concisely!) on page 7 of the linked manual:
>>>
>>> 8-bit ISA I/O cycles are performed for CPU byte accesses to 0xFF400001 + 4 *
>>> ISA address
>>>
>>> 16-bit ISA I/O cycles are performed for CPU word accesses to 0xFF400000 + 4
>>> * ISA address
>>>
>>> 8-bit ISA memory cycles are performed for CPU byte accesses to 0xFF800001 +
>>> 4 * ISA address
>>>
>>> 16-bit ISA memory cycles are performed for CPU word accesses to 0xFF800000 +
>>> 4 * ISA address
>> Yep, that much is evident from the Q40 address translation scheme. But a
>> similar sort of scheme is used on other m68k platforms to wire up
>> peripherals that were originally designed for Intel systems, and these
>> are not connected through an ISA bus.
> I can't figure out why those platforms don't suffer from the same "double
> translation" problem that William described on q40.

There are only two other address translation schemes in effect - Amiga 
Gayle, which handles byte/word address offsets, and gets passed IO 
addresses (in the sense that these are the addresses where registers are 
mapped in memory), and Atari EtherNEC, which handles IO ports (from the 
ne.c legacy ISA driver).

The Gayle address translation, taking MMIO addresses does not add an IO 
base address. The EtherNEC address translation, OTOH, takes IO ports and 
must add the ROM port base address as IO base.

What I did not realize at the time I rewrote the Q40 driver as platform 
driver is that the old driver used IO ports, not MMIO addresses. In 
order to reserve the IDE register area (we don't have a MMIO area 
corresponding to the IO ports range mapped on m68k), I did add the Q40 
ISA base address to the IO port range to populate the platform memory 
resources, forgetting that the same base address is then added a second 
time through the IO address translation.

Seeing as the address passed into address translation already has the IO 
base offset of 0xff400000 and register scaling of 4 applied, it could be 
sufficient to change the address translations to only add the additional 
IO mem offset of 0x00400000:

#define q40_io_mem_offset 0x00400000

#define Q40_ISA_IO_B(ioaddr) ((unsigned long)(ioaddr))
#define Q40_ISA_IO_W(ioaddr) ((unsigned long)(ioaddr))
#define Q40_ISA_MEM_B(madr)  (q40_io_mem_offset + ((unsigned long)(madr)))
#define Q40_ISA_MEM_W(madr)  (q40_io_mem_offset + ((unsigned long)(madr)))

Note that this will play havoc with all other ISA drivers on Q40, so I'd 
just suggest that to test my hypothesis about how the address 
translation affects the IDE IO.


A correct fix would keep the current IO translation intact, and instead 
use the platform mem resource to register the driver IO range, and the 
platform IO resource as base offset to populate the port ioaddr struct 
(minus the register scaling and byte offset, mind you).

I'll give this some more thought ASAP.

And yes, I'm painfully aware the m68k low level IO code is becoming a 
bit of a maintainance legacy, in no small part due to my hacks around 
Atari EtherNEC.

Cheers,

     Michael


>
>>> I understand that the machines originally shipped with a 16-bit ISA card
>>> based on the W83787IF "PC super I/O" chip, integrating a floppy controller,
>>> IDE interface, game port, parallel port, and two 16550A UARTs.
>> OK.
>>> My Q40 came without this card, so I am using a card based on the similar
>>> W83757 chip (the serial ports are 16450 instead of 16550A, it doesn't
>>> support
>>> the fancy EPP/ECP parallel port modes).
>>>
>>>>>> It might be a good idea to verify that IDE works in v5.13
>>>>> Yes, please do.
>>> It did.
>>>
>>>> And please also verify it's broken after 44b1fbc0f5f30e66 was applied.
>>> I will try to do that!
>> Probably just try v5.14 - in my tree, 44b1fbc0f5f30e66 came on top of 5.13-rc2
>> so 5.14 ought to have it applied (but rather check, just the same).
>>
> If git is an obstacle, one may obtain the 44b1fbc0f5f30e66 tree (as
> easily as the v5.14 tree) by clicking the 'download' button here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=44b1fbc0f5f30e66
