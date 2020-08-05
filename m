Return-Path: <SRS0=dO6p=BP=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A7BC433DF
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Aug 2020 13:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC5842312E
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Aug 2020 13:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbgHEN2D (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 5 Aug 2020 09:28:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:50244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727941AbgHEMfj (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 5 Aug 2020 08:35:39 -0400
Received: from [192.168.0.106] (110-174-24-87.tpgi.com.au [110.174.24.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5400522D03;
        Wed,  5 Aug 2020 12:23:08 +0000 (UTC)
Subject: Re: syscall_trace_enter and syscall_trace_leave for m68k w/MMU
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <422f0d12-1b06-d5fb-40eb-2b51c0e1e5da@linux-m68k.org>
Date:   Wed, 5 Aug 2020 22:23:05 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 23/7/20 8:03 pm, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> Michael and I have been working on SECCOMP in SuperH and successfully added
> the missing pieces yesterday [1].
> 
> We're now looking into what needs to be done for m68k and I have noticed that
> syscall_trace_enter and syscall_trace_leave - which needs to be touched for
> SECCOMP support - are available on ColdFire and non-MMU targets for m68k.
> 
> Is there a particular reason for that? Looking at 68000/entry.S, I can see
> that both functions are invoked [2] so I'm not sure why they are built
> for CONFIG_COLDFIRE and !CONFIG_MMM only.
> 
> Any ideas?

I am late to the party on this.

But the reason is historical more than anything else.
The time that m68knommu, which included ColdFire, spent as its own architecture
directory (arch/m68knommu) led to a few things like this diverging.
There is not technical reason.

Regards
Greg


> Adrian
> 
>> [1] https://marc.info/?l=linux-sh&m=159546012829989&w=2
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/m68k/68000/entry.S
> 
