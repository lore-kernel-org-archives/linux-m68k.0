Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DFCC636CB
	for <linux-m68k@archiver.kernel.org>; Sat, 17 Jul 2021 05:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 395F7613D4
	for <linux-m68k@archiver.kernel.org>; Sat, 17 Jul 2021 05:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhGQFoX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 17 Jul 2021 01:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhGQFoW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 17 Jul 2021 01:44:22 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE15C06175F
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jul 2021 22:41:26 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id b2so1791845plx.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jul 2021 22:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=BATnV1mSPjtfOY+wSXR1+UMHUfN5Sw/6J56K8a7WEuk=;
        b=RQvxY7b7ZJFI+wFhJ03tmcWOkmq5Qc3MEaoZL4lzsVlH9uNXWoakgf6+wicVaDDmue
         uTAPAhM2L+6MaXc1aYaIXX3GFSvk8OnoeqeZNiSxGPvIAaZ3AG7aGlJGr9jNPpHbH+ZA
         zZLhsxuWQi60cNMYartZwiINMNKWaWHFNecdn+52dfSEjTQ5zW153B6+L349hxa6nA7W
         oZ00pvW/DiX8Wk37wzllCXprz2WhmGIxhqWKTZSXL4D0FilH25XY4t3NAGd1tSdP32O6
         JKqUZNwttfw0Hmzzw+G/HIvcKFNYMtDbs2MYMEW+biOA9sZjAL666Wq9sqeIDNa01PHQ
         fMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=BATnV1mSPjtfOY+wSXR1+UMHUfN5Sw/6J56K8a7WEuk=;
        b=itCA9DTcoc3ARx5wg9Fc+WwAKI0Se20Xm37htYpI2GckPWOROqIPo+HsBJUcvi6Vqd
         CCVYJzg2wDRAP/9XhsUBwH7my+ziNpTHoB0n9OQFXAHpRQlKS8XOUy5jSGGWvnvGwikQ
         /FhZGtWSnRzvzVvGqEvGIQ+9Hl3NmerZmYcWDNqWL128ys1A8fIZx+jaOHC2t773zhWO
         fIRrSmqpZ6ToZ+qVuwE1owZ+dqQG/DLOr+edncb7jNcnE/j2COb1pWzzihb9lcYcPblN
         gx3wHitL1dGNLv2h/hLC1LHc58DTX83SHIpNRwNSmJCJX+AQZXVI+zaFoR5JOzLgNzkY
         oXVg==
X-Gm-Message-State: AOAM5320YELYwJ8Dfg6WwtDZiAGCdEQ4TvlttMRlPyu54uCl3spIwpGA
        HLGhmdJzMAfd29TMOt+qnnI=
X-Google-Smtp-Source: ABdhPJw3xW2PhtfsMSUvy05tp6AiWaia7QoEdfNkA6GqqfHYEhLhQar4BLUQ2XRl1UShF3rVDXjS2g==
X-Received: by 2002:a17:90a:aa8e:: with SMTP id l14mr13445530pjq.195.1626500484147;
        Fri, 16 Jul 2021 22:41:24 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-37-fibre.sparkbb.co.nz. [222.152.189.37])
        by smtp.gmail.com with ESMTPSA id d191sm13620298pga.27.2021.07.16.22.41.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Jul 2021 22:41:23 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home>
 <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
Date:   Sat, 17 Jul 2021 17:41:17 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Am 16.07.2021 um 14:03 schrieb Michael Schmitz:
> Hi Christoph,
>
> On 15/07/21 7:26 am, Michael Schmitz wrote:
>> I've got a vague recollection that I've seen weird crashes in the past
>> related to temperature extremes (we've had a few unusually cold days
>> in our parts just now), so I've gone back to a kernel from the switch
>> stack / refactoring exit tests (which ran the stress tests fine
>> earlier) to rule that one out. Looking good so far, so I begin to
>> wonder whether we need to introduce get_fc() and use that to restore
>> the original sfc/dfc instead of assuming USER_DATA is always correct?
>
> No crashes with the known good kernel after over a day of stress testing
> - I'll try Andreas' patch once the current test run has completed.
>
> One thing I noticed with either your final or your v2 patch series - as
> far as the tests ran at all, run times were 30% increased. That's a lot

With Andreas' patch applied, the run time increase is now less severe 
(11-13%). I'll repeat that a few more times but it's looking a lot 
better so far. No instruction format errors seen anymore.

Cheers,

	Michael



