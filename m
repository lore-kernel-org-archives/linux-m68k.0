Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEE4C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 30 Sep 2021 12:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BC7D613A5
	for <linux-m68k@archiver.kernel.org>; Thu, 30 Sep 2021 12:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350851AbhI3Mcx (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 30 Sep 2021 08:32:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350378AbhI3Mcw (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 30 Sep 2021 08:32:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25869613A0;
        Thu, 30 Sep 2021 12:31:08 +0000 (UTC)
Subject: Re: m68k: default value for MEMORY_RESERVE?
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <a1c34f2b-115c-7ab9-5b69-7c11ebc18b4f@infradead.org>
 <CAMuHMdWJGFm0p-5qSj4xybfo7pZB_PrSjt2ghcgL2HaB6TQENw@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <dcd8eb4c-f151-e1f7-cec9-8b66e860f748@linux-m68k.org>
Date:   Thu, 30 Sep 2021 22:31:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWJGFm0p-5qSj4xybfo7pZB_PrSjt2ghcgL2HaB6TQENw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy, Geert,

On 28/9/21 5:20 pm, Geert Uytterhoeven wrote:
> Hi Randy,
> 
> On Mon, Sep 27, 2021 at 11:26 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>> Would it be safe (or unsafe) to add a default value for MEMORY_RESERVE?
> 
> No idea ;-)

Me neither :-)
Looking at the code I am pretty sure a default value would be ok.

I am not sure what the need for MEMORY_RESERVE was for.
It is only used on the uCsimm and uCdimm platforms, which are DragonBall
(68328) based devices. Not obvious to me why it was needed.


>> As it is, kconfig can generate a randconfig with
>> "CONFIG_MEMORY_RESERVE=" (no value) since it has no default.
>>
>> Then a following 'make all' finds an invalid symbol value and restarts
>> the config:
>>
>> .config:214:warning: symbol value '' invalid for MEMORY_RESERVE
>> * Restart config...
>> Memory reservation (MiB) (MEMORY_RESERVE) [] (NEW)
>>
>> That's OK until I try to script/automate randconfig builds.
>>
>> Can we do anything about this or should I just add it to my
>> ignore-list?
> 
> Looking at its sole user, I guess "default 0" would be fine.
> Greg?

Yep, I think that would be fine. Looks to be harmless if set to 0.

Regards
Greg

