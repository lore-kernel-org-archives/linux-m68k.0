Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A36C433ED
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Apr 2021 14:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 120AE613DD
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Apr 2021 14:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236988AbhD0OkZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Apr 2021 10:40:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:49588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236173AbhD0OkY (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 27 Apr 2021 10:40:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61943613CA;
        Tue, 27 Apr 2021 14:39:40 +0000 (UTC)
Subject: Re: [PATCH] m68knommu: fix missing LCD splash screen data initializer
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel test robot <lkp@intel.com>
References: <20210427134931.1309102-1-gerg@linux-m68k.org>
 <CAK8P3a18FUkgu0uLv_4i1HLJmWdQuGH4Lc1b+F3Zi_sE7ase6A@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <fd18edff-ddaf-e10c-5649-da0ade22dafa@linux-m68k.org>
Date:   Wed, 28 Apr 2021 00:39:37 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a18FUkgu0uLv_4i1HLJmWdQuGH4Lc1b+F3Zi_sE7ase6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 28/4/21 12:16 am, Arnd Bergmann wrote:
> On Tue, Apr 27, 2021 at 3:49 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>>
>> The kernel test robot reports that the "screen_bits" splash screen data
>> is missing for the dragen platform:
>>
>>      arch/m68k/68000/dragen2.c:73:16: error: 'screen_bits' undeclared (first use in this function)
>>        73 |  LSSA = (long) screen_bits;
>>           |                ^~~~~~~~~~~
>>      arch/m68k/68000/dragen2.c:73:16: note: each undeclared identifier is reported only once for each function it appears in
>>
>> Digging around a bit I found the screen_bits data structure was originally
>> in a screen.h file that was generated from a screen.xbm file. That was
>> removed in commit 0c0e6db80683 ("m68k: drop unused parts of 68VZ328
>> Makefile").
>>
>> Other splash screen initializers for 68000 targets are kept here as the
>> C data structures so lets do the same for this one. Add the missing
>> screen.h file and include it in the dragen specific startup code.
> 
> Thanks, I certainly appreciate not getting the nag emails from the lkp bot
> any more ;-)

You and me both :-)

> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I also see that it started out like this even in linux-2.5.25 when Alan Cox
> originally merged arch/m68knommu, so presumably the platform has
> never been used (at least with a screen) after it got merged into mainline.
> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>>
> 
> Note: extra '>' in your signed-off-by line

Oops, yep. I'll fix that before I push it up to the m68knommu git tree
(which won't be for a couple of weeks at least yet).

Regards
Greg


>        Arnd
> 
