Return-Path: <SRS0=X0A7=CS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FB8C43461
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 07:58:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AADB72087C
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 07:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgIIH6Q (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Sep 2020 03:58:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbgIIH6N (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 9 Sep 2020 03:58:13 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1A092087C;
        Wed,  9 Sep 2020 07:58:10 +0000 (UTC)
Subject: Re: [PATCH] m68knommu: switch to using asm-generic/uaccess.h
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org, arnd@arndb.de,
        kernel test robot <lkp@intel.com>
References: <20200909021831.1881990-1-gerg@linux-m68k.org>
 <20200909065639.GB9618@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <a6b3fc3e-d300-f470-f8f0-0e8f0adf704a@linux-m68k.org>
Date:   Wed, 9 Sep 2020 17:58:05 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909065639.GB9618@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 9/9/20 4:56 pm, Christoph Hellwig wrote:
> On Wed, Sep 09, 2020 at 12:18:31PM +1000, Greg Ungerer wrote:
>> Switch to using the asm-generic/uaccess functions for non-MMU builds.
>> Remove all the m68knommu local specific uaccess defines and macros.
>>
>> There is nothing so special about the m68knommu targets that they cannot
>> use all of the asm-generic uaccess support. Using the asm-generic
>> uaccess definitions also resolves some of the existing problems with
>> missing __user annotations in the m68knommu specific functions.
>>
>> The elimination of all of the contents of uaccess_no.h means we can fold
>> the uaccess_mm.h back into uaccess.h - and just have the single file
>> now.
>>
>> The resulting generated code ends up being slightly smaller (by a few
>> hundred bytes) due to the compilers ability to better optimize load
>> and stores without forcing its hand with asm statements.
>>
>> Specifically trivial cases like this contrived example:
>>
>>      get_user(x, ptr);
>>      x++;
>>      put_user(x, ptr);
>>
>> end up now being optimized to a single instruction on m68k. More
>> generally the compiler can avoid using a temporary register in many
>> cases as well.
> 
> This looks great!
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks Christoph.
I'll push this into the for-next branch of the m68knommu git tree.

Regards
Greg

