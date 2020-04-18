Return-Path: <SRS0=06O8=6C=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A58C38A30
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Apr 2020 20:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 924DD22209
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Apr 2020 20:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgDRUzK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 18 Apr 2020 16:55:10 -0400
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:24129 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbgDRUzK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 18 Apr 2020 16:55:10 -0400
Received: from [192.168.1.41] ([90.126.162.40])
        by mwinf5d33 with ME
        id ULv22200V0scBcy03Lv3qd; Sat, 18 Apr 2020 22:55:06 +0200
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Apr 2020 22:55:06 +0200
X-ME-IP: 90.126.162.40
Subject: Re: [PATCH] m68k/PCI: Fix a memory leak in an error handling path
To:     Markus Elfring <Markus.Elfring@web.de>,
        linux-m68k@lists.linux-m68k.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Newsgroups: gmane.linux.ports.m68k,gmane.linux.kernel.janitors,gmane.linux.kernel
References: <2e00c1f1-8faa-5045-ddf5-2bf943f714f2@web.de>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <ea3d9b35-4409-fb86-8855-0ddb73989829@wanadoo.fr>
Date:   Sat, 18 Apr 2020 22:55:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2e00c1f1-8faa-5045-ddf5-2bf943f714f2@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 18/04/2020 à 22:00, Markus Elfring a écrit :
>> If 'ioremap' fails, we must free 'bridge', as done in other error handling
>> path bellow.
> I suggest to improve this change description.

I suggest you stop proposing over and over useless comments.
Please just ignore my proposals as I do for your boring, never 
constructing, replies.


> * Please avoid a typo.
>
> * Is an imperative wording preferred?
>
* is Melissa still around?

> …
>> +++ b/arch/m68k/coldfire/pci.c
>> @@ -216,8 +216,10 @@ static int __init mcf_pci_init(void)
> …
>
> I propose to move the pci_free_host_bridge() call for the desired

I propose to let patch submitter and maintainer decide about it.
I don't need your point of view. I guess that maintainers don't either.

No need to waste time trying to engage any discussion with me.
This is the first and very last exchange we will ever have.

Best regards,
CJ


> exception handling to the end of this function implementation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=c0d73a868d9b411bd2d0c8e5ff9d98bfa8563cb1#n450
>
> Regards,
> Markus
>

