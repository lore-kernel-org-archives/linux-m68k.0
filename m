Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212F0C47080
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 21:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00D5660FF2
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 21:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234747AbhFAVIW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Jun 2021 17:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFAVIV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Jun 2021 17:08:21 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294EAC061574
        for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Jun 2021 14:06:39 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso2207215pjb.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Jun 2021 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=F7YE6jGyM/PsJfI9XqoNkUHrwF1ynnqt5PE7VP20Q3s=;
        b=LTck7JtKJd6buzWrOJO2Eopd4rsGsTtjpPFa7PIgpt0rfofjJB+mv/5fwb0nlcFPR+
         0nXYYMgQa5TM6ESGj64mhoR7rl0LPMO8dtfPHzOqWWfG2Stk9VB4HxuMtXvCkQxjw5b6
         +ywwKUDLKlzcKlgC0idSvWVSuLTbQDL8dXnMwzFrw0zd6dvvbINFQLXmzzfxZ+v0x8zy
         ZLRfZsxB3exq0+9m6xqKYcbLoYo45H9bV6cBdQzZN4Rvx6P+45zZN/NCl3R0QwvhApJZ
         QwIFYpjMYxNQJWbLb9xqDHsJUAdxHk608waHWN7PLqXFIzZDp7wXmsXDT+wloAYOTcev
         n8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=F7YE6jGyM/PsJfI9XqoNkUHrwF1ynnqt5PE7VP20Q3s=;
        b=KJkuCp9IYusZX/sgNfTdwLv37yzmqCf8eSZJ5A/2+EmvjH5yQ1nCiXmICIojUWtQM3
         ZNTuuybgS7jD5cEE6RyOKzQZGwJ0BdI4vYP00tde224n/RJ3czBMAoxz3XnF/cPh/HNk
         i5OL3GiDGzI6tLGaIftZYBg7B2gco33KX14krxTHGzq6KseTB/9VjUiZAf2YJaANf4X6
         5yZwbRiQlRfkRc2UihkpOpATtLcf1aKQNnbiYg7K7zwXCjhkGL4ha6u55W4+FqIa3EEh
         J+A1NkDvUcZD147xoWRzUp+Qj2QmiF2JXcmk42wO39rmS/DcVRwIfwFnHmAg+HDa8fIt
         VLkA==
X-Gm-Message-State: AOAM531tRbFTgqM9WBo+CxBP+FF3D+JPcnm+14aA7dxBVrvL5aMMHodj
        +Aul/eJplzKL8MQN0OeW2n0hmOJvUqQ=
X-Google-Smtp-Source: ABdhPJx/t286WM4+DcTry81ikOm9K2GjV2vc4RM01W0tcQJGgcA/6F2wZLQGdMngi8W8yqVO+UaLag==
X-Received: by 2002:a17:902:988d:b029:ef:68aa:d775 with SMTP id s13-20020a170902988db02900ef68aad775mr27214758plp.57.1622581597903;
        Tue, 01 Jun 2021 14:06:37 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:55fc:750b:b437:cf19? ([2001:df0:0:200c:55fc:750b:b437:cf19])
        by smtp.gmail.com with ESMTPSA id w8sm15938362pgf.81.2021.06.01.14.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 14:05:23 -0700 (PDT)
Subject: Re: [PATCH] m68k/mac: Replace macide driver with generic platform
 driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Finn Thain <fthain@fastmail.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christoph Hellwig <hch@lst.de>,
        Joshua Thompson <funaho@jurai.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <793432cca963b632709c4d1312baa9874d73e1d8.1619341585.git.fthain@telegraphics.com.au>
 <ba908b1d-eab5-a4e5-0c0a-2c745287d121@physik.fu-berlin.de>
 <10a08764-c138-9fe5-966c-ce68349b9b6@nippy.intranet>
 <65f01f42-31d9-522a-e690-73d286405a01@gmail.com>
 <9650358f-a789-7dbd-4495-1d39ff321ded@nippy.intranet>
 <ada88dd6-f8d7-11dc-9a89-5c7e437a0981@gmail.com>
 <CAMuHMdUy_B_+pHZQpnDHYsee+gpXOs9ek_HaVxLjE2HVfGmLQg@mail.gmail.com>
 <e4635ac5-903a-a52e-51cf-b59295c76973@gmail.com>
 <dc393de9-b4ae-5c87-d7c7-b3dd55c514a5@gmail.com>
 <CAMuHMdUskb3oicq8Kbf6MY_4mn4-Y1pJ-om4fny7k48gndscgg@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6f93e32e-eaa7-bd90-13ff-6d7fbaaa7c0c@gmail.com>
Date:   Wed, 2 Jun 2021 09:05:04 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUskb3oicq8Kbf6MY_4mn4-Y1pJ-om4fny7k48gndscgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 1/06/21 8:43 pm, Geert Uytterhoeven wrote:
>
>> Untested (and mangled formatting, sorry):
>>
>>> diff --git a/arch/m68k/include/asm/io_mm.h b/arch/m68k/include/asm/io_mm.h
>>> index d41fa48..aaae12f 100644
>>> --- a/arch/m68k/include/asm/io_mm.h
>>> +++ b/arch/m68k/include/asm/io_mm.h
>>> @@ -135,7 +135,10 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
>>>       case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
>>>   #endif
>>>   #ifdef CONFIG_ATARI_ROM_ISA
>>> -    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_IO_B(addr);
>>>   #endif
> Bogus hunk?

Copy&paste error, more likely. What I have is:

@@ -135,7 +135,10 @@ static inline u8 __iomem *isa_itb(unsigned long addr)
      case ISA_TYPE_AG: return (u8 __iomem *)AG_ISA_IO_B(addr);
  #endif
  #ifdef CONFIG_ATARI_ROM_ISA
-    case ISA_TYPE_ENEC: return (u8 __iomem *)ENEC_ISA_IO_B(addr);
+    case ISA_TYPE_ENEC: if (addr < 1024)
+                               return (u8 __iomem *)ENEC_ISA_IO_B(addr);
+                       else
+                               return (u8 __iomem *)(addr);
  #endif
      default: return NULL; /* avoid warnings, just in case */
      }

>>> @@ -344,17 +356,17 @@ static inline void isa_delay(void)
>>>    * ROM port ISA and everything else regular ISA for IDE. read,write defined
>>>    * below.
>>>    */
>>> -#define inb(port)      ((port) < 1024 ? isa_rom_inb(port) : in_8(port))
>>> -#define inb_p(port)    ((port) < 1024 ? isa_rom_inb_p(port) : in_8(port))
>>> -#define inw(port)      ((port) < 1024 ? isa_rom_inw(port) : in_le16(port))
>>> -#define inw_p(port)    ((port) < 1024 ? isa_rom_inw_p(port) : in_le16(port))
>>> +#define inb(port)      ((port) < 1024 ? isa_rom_inb(port) : isa_inb(port))
>>> +#define inb_p(port)    ((port) < 1024 ? isa_rom_inb_p(port) : isa_inb_p(port))
>>> +#define inw(port)      ((port) < 1024 ? isa_rom_inw(port) : isa_inw(port))
>>> +#define inw_p(port)    ((port) < 1024 ? isa_rom_inw_p(port) : isa_inw_p(port))


Turns out this still won't work on Q40 - the IDE port addresses are 
0x1f0 and 0x170 there. This should do:

#define inb(port)       (((port) < 1024 && ISA_TYPE == ISA_TYPE_ENEC) ? 
isa_rom_inb(port) : isa_inb(port))
#define inb_p(port)     (((port) < 1024 && ISA_TYPE == ISA_TYPE_ENEC) ? 
isa_rom_inb_p(port) : isa_inb_p(port))
#define inw(port)       (((port) < 1024 && ISA_TYPE == ISA_TYPE_ENEC) ? 
isa_rom_inw(port) : isa_inw(port))
#define inw_p(port)     (((port) < 1024 && ISA_TYPE == ISA_TYPE_ENEC) ? 
isa_rom_inw_p(port) : isa_inw_p(port))

>> Could that have any new side effects on multiplatform kernels (other
> Sorry, being an Amiga MMIO user, I don't know my way through the
> maze of ISA I/O accessors...
'Maze' is putting it politely indeed.
>
>> than addresses < 1024 still mangled by wrong translation and IO
>> primitive on non-Atari platforms)?
> Hence q40ide is still broken on Q40 in multi-platform kernels?

That's what I _think_.

Finn found out that Atari IDE is broken if setting CONFIG_IDE only but 
not CONFIG_ATARI_ROM_ISA. It's hard to test Q40 these days, but I am 
quite sure that as soon as CONFIG_ATARI_ROM_ISA is defined, Q40 IDE 
register access does not use address translation, and will fail.

I blame that on using isa_inb() over in_8(), but I may be wrong and it's 
isa_readb() vs  in_8() instead (m68k IDE drivers should use MMIO I/O 
accessors after all). In that case, we must stop defining the special 
readb()/writeb() and readw()/writew() in the CONFIG_ATARI_ROM_ISA 
section, and use generic CONFIG_ISA variants instead.

That would require a different default address translation to catch the 
!CONFIG_ATARI_ROM_ISA case on Atari though (i.e. return (addr), not 
NULL). Not sure this will much improve the stability of the code.

I'll give this a spin on ARAnyM to explore the ramifications.

Cheers,

     Michael


