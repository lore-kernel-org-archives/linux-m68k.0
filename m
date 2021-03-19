Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AA7C433E3
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 19:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AF1C6197D
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 19:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhCSTeR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:34:17 -0400
Received: from mout.perfora.net ([74.208.4.196]:40381 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230473AbhCSTeC (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Mar 2021 15:34:02 -0400
Received: from [192.168.1.5] ([136.25.12.210]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MUGJb-1lFGHH0nVT-00RKfh;
 Fri, 19 Mar 2021 20:33:56 +0100
Subject: Re: [PATCH] m68k/mvme16x: Fix timer interrupts
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com>
 <f7fb45d-47e3-aeed-b85d-b3a36b14d7e@telegraphics.com.au>
From:   Michael Pavone <pavone@retrodev.com>
Message-ID: <bc1b0c13-9c9d-617e-3f4b-74c19b010fa7@retrodev.com>
Date:   Fri, 19 Mar 2021 12:33:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f7fb45d-47e3-aeed-b85d-b3a36b14d7e@telegraphics.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:u9wlybuzuC6SskmrKcEW3J6ku0ujZsHcGWeCK7YJT+hhotnMGeJ
 YETdyCQ57rpPVQlFlu4583Pyds/m6cYp/qSovaKmP7Mppp45rky7J4ZqaLF1NINbO+Xy0x2
 wTLapB1UKUmL0FWbytC8pgmt+gShVGU8KSYl3YH+dzxw8sGvuOaq3RAPoBjIazgwE/BHT0c
 rfriE2bp+5lxIuql8IO/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rBR03mWqt9A=:t7phpH+oS1atHckETo8sKJ
 6ssSpyO44lBK2UyexiYh6+X7RLfjUYedCx7pmarCrPpadVdDAYWgUoQ7z+oCgV/LkoOVptDFw
 jkd8M+sPhOjCfyXC58kNOAZz4Q/1LwmdZ94Qb6OmattanUe7Yo6KoGUMV89SLYyLBUfgwkQ+9
 w7QonSccjfiSQ0vUxNhRVCHPgMuNmcyryCinTLT+fs9CPNGk8BjMirOmTEVrakBOLlyPOrN1b
 SHH36hVdnlMv1F/4KD07EIXcuhdJVm9d0sQmDtHjVQeUcVHcqReVBmwWctEfauE84IEaOmDFb
 RmBLBQhRBWFePErPOwgqVk74/51trexq/lUBt0nlBceNgwhdYjPwvnP0uPVkUnDLEzIgpY9Tf
 lmzI/THKhJE/I+JEIx0crd819wa74nG1at9EkklLyts546RIdy7wMA3lk9h7EhzHuy2NsmRuw
 RIqq27p4TQ==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/19/21 12:07 AM, Finn Thain wrote:

> Since we know at compile time what bits should be set in PCCTOVR1, we can
> avoid the additional register access. We should do the same in
> mvme16x_sched_init() for clarity. What do you think about this patch?

Makes sense and your patch works fine on my MVME177.

On 3/18/21 11:35 PM, Finn Thain wrote:
> BTW, assuming you did get the kernel running on your hardware, do you know 
> if there's any need for the '#warning check me!' that still remains in 
> arch/m68k/mvme16x/config.c and arch/m68k/mvme147/config.c?

It's running in the sense that it successfully runs init, but the lack of
a proper tty driver makes it a bit painful to check anything else. I'm
going to take a stab at writing a new one next.

