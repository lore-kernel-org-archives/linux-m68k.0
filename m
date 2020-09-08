Return-Path: <SRS0=nM4c=CR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E737DC433E2
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 23:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23A72080C
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 23:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgIHX0H (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Sep 2020 19:26:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgIHX0H (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 8 Sep 2020 19:26:07 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4642220732;
        Tue,  8 Sep 2020 23:26:04 +0000 (UTC)
Subject: Re: [PATCH] m68knommu: add missing __user annotations
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        kernel test robot <lkp@intel.com>
References: <20200908132647.923201-1-gerg@linux-m68k.org>
 <20200908133017.GA4042@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <cd61e5c7-dfb9-1994-2bbc-5bfbb1be26f5@linux-m68k.org>
Date:   Wed, 9 Sep 2020 09:26:01 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908133017.GA4042@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 8/9/20 11:30 pm, Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 11:26:47PM +1000, Greg Ungerer wrote:
>> Some of the m68knommu user access functions are not using the __user
>> annotation where required. Specifically __clear_user(), strnlen_user()
>> and strncpy_from_user() need their user space source address annoted
>> with __user.
> 
> You'll also need __force annotations to that sparse doesn't complain
> inside the function.  Btw, it might be worth to just use the helpers
> from asm-generic/uaccess.h as they should work for m68knommu.

I would much prefer to use the helpers in asm-generic/uaccess.h.
But that is going to involve a little more change, the put_user()
and get_user() macros can't be over-ridden with the logic as defined
in asm-generic/uaccess.h today.

It might just be the case that we can use the whole lot and not
lose optimized get_user()/set_user() anyway. I will check the
resulting code and see if it is just as good.

Regards
Greg

