Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4451FC2B9F4
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 13:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B61461C71
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 13:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbhF1OAn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 10:00:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:60998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232343AbhF1OAk (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 28 Jun 2021 10:00:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7815A61C71;
        Mon, 28 Jun 2021 13:58:14 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] m68k: common PCI support definitions and code
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>
References: <1342441646-5645-1-git-send-email-gerg@snapgear.com>
 <1342441646-5645-2-git-send-email-gerg@snapgear.com>
 <CAMuHMdWSBLUzWfDFK0mSiuO0+=cidymmd33jR3qQ1gFmCPk02A@mail.gmail.com>
 <6796b52b-a868-7955-fedd-e841a21e6c95@linux-m68k.org>
 <CAMuHMdX5vn87B=-pm8puECC74bog4YM6Uf2vY4mondntzSg65Q@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <02eedc6b-e346-f8f4-ac1d-4d7d4a7c638c@linux-m68k.org>
Date:   Mon, 28 Jun 2021 23:58:12 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX5vn87B=-pm8puECC74bog4YM6Uf2vY4mondntzSg65Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 28/6/21 11:29 pm, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Mon, Jun 28, 2021 at 3:23 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> On 28/6/21 5:44 pm, Geert Uytterhoeven wrote:
>>> On Mon, Jul 16, 2012 at 2:25 PM <gerg@snapgear.com> wrote:
>>>> From: Greg Ungerer <gerg@uclinux.org>
>>>>
>>>> Basic set of definitions and support code required to turn on CONFIG_PCI
>>>> for the m68k architecture. Nothing specific to any PCI implementation in
>>>> any m68k class CPU hardware yet.
>>>>
>>>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
>>>
>>>> --- a/arch/m68k/include/asm/io_mm.h
>>>> +++ b/arch/m68k/include/asm/io_mm.h
>>>> @@ -340,4 +340,6 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
>>>>     */
>>>>    #define xlate_dev_kmem_ptr(p)  p
>>>>
>>>> +#define ioport_map(port, nr)   ((void __iomem *)(port))
>>>
>>> So should we dop:
>>>
>>>       config NO_IOPORT_MAP
>>>               def_bool y
>>>
>>> Triggered by seeing CONFIG_GPIO_TQMX86 being removed from allmodconfig
>>> builds due to commit c6414e1a2bd26b00 ("gpio: AMD8111 and TQMX86
>>> require HAS_IOPORT_MAP").
>>
>> I guess we could.
>> But we would have to remove the iomap/iounmap definitions in kmap.h too right?
> 
> Why? Do I need more coffee?

If you do this:

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 372e4e69c43a..a6d4b2b1fe5a 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -59,9 +59,6 @@ config TIME_LOW_RES
         bool
         default y
  
-config NO_IOPORT_MAP
-       def_bool y
-
  config ZONE_DMA
         bool
         default y


And the compile for an M5475 target for example you get this:

   CC      lib/strncpy_from_user.o
In file included from ./arch/m68k/include/asm/io_no.h:134,
                  from ./arch/m68k/include/asm/io.h:6,
                  from ./include/linux/io.h:13,
                  from ./include/linux/irq.h:20,
                  from ./include/asm-generic/hardirq.h:17,
                  from ./arch/m68k/include/generated/asm/hardirq.h:1,
                  from ./include/linux/hardirq.h:11,
                  from ./include/linux/interrupt.h:11,
                  from ./include/linux/pci.h:38,
                  from lib/iomap.c:7:
./arch/m68k/include/asm/kmap.h:61:20: error: redefinition of ‘ioport_map’
  #define ioport_map ioport_map
                     ^~~~~~~~~~
lib/iomap.c:362:15: note: in expansion of macro ‘ioport_map’
  void __iomem *ioport_map(unsigned long port, unsigned int nr)
                ^~~~~~~~~~
./arch/m68k/include/asm/kmap.h:61:20: note: previous definition of ‘ioport_map’ was here
  #define ioport_map ioport_map
                     ^~~~~~~~~~
./arch/m68k/include/asm/kmap.h:62:29: note: in expansion of macro ‘ioport_map’
  static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
                              ^~~~~~~~~~
./arch/m68k/include/asm/kmap.h:67:22: error: redefinition of ‘ioport_unmap’
  #define ioport_unmap ioport_unmap
                       ^~~~~~~~~~~~
lib/iomap.c:369:6: note: in expansion of macro ‘ioport_unmap’
  void ioport_unmap(void __iomem *addr)
       ^~~~~~~~~~~~
./arch/m68k/include/asm/kmap.h:67:22: note: previous definition of ‘ioport_unmap’ was here
  #define ioport_unmap ioport_unmap
                       ^~~~~~~~~~~~
./arch/m68k/include/asm/kmap.h:68:20: note: in expansion of macro ‘ioport_unmap’
  static inline void ioport_unmap(void __iomem *p)
                     ^~~~~~~~~~~~

Regards
Greg
