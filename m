Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23430C2B9F4
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 13:23:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 066D861C6B
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 13:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbhF1NZw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 09:25:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:52070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232507AbhF1NZu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 28 Jun 2021 09:25:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 391E561A1D;
        Mon, 28 Jun 2021 13:23:24 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] m68k: common PCI support definitions and code
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>
References: <1342441646-5645-1-git-send-email-gerg@snapgear.com>
 <1342441646-5645-2-git-send-email-gerg@snapgear.com>
 <CAMuHMdWSBLUzWfDFK0mSiuO0+=cidymmd33jR3qQ1gFmCPk02A@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <6796b52b-a868-7955-fedd-e841a21e6c95@linux-m68k.org>
Date:   Mon, 28 Jun 2021 23:23:21 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWSBLUzWfDFK0mSiuO0+=cidymmd33jR3qQ1gFmCPk02A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 28/6/21 5:44 pm, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Mon, Jul 16, 2012 at 2:25 PM <gerg@snapgear.com> wrote:
>> From: Greg Ungerer <gerg@uclinux.org>
>>
>> Basic set of definitions and support code required to turn on CONFIG_PCI
>> for the m68k architecture. Nothing specific to any PCI implementation in
>> any m68k class CPU hardware yet.
>>
>> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> 
>> --- a/arch/m68k/include/asm/io_mm.h
>> +++ b/arch/m68k/include/asm/io_mm.h
>> @@ -340,4 +340,6 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
>>    */
>>   #define xlate_dev_kmem_ptr(p)  p
>>
>> +#define ioport_map(port, nr)   ((void __iomem *)(port))
> 
> So should we dop:
> 
>      config NO_IOPORT_MAP
>              def_bool y
> 
> Triggered by seeing CONFIG_GPIO_TQMX86 being removed from allmodconfig
> builds due to commit c6414e1a2bd26b00 ("gpio: AMD8111 and TQMX86
> require HAS_IOPORT_MAP").

I guess we could.
But we would have to remove the iomap/iounmap definitions in kmap.h too right?

Regards
Greg

