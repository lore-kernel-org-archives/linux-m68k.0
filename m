Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEABC636C8
	for <linux-m68k@archiver.kernel.org>; Fri, 16 Jul 2021 02:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5C5C613D8
	for <linux-m68k@archiver.kernel.org>; Fri, 16 Jul 2021 02:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhGPCGI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 15 Jul 2021 22:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhGPCGH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 15 Jul 2021 22:06:07 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D118CC06175F
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jul 2021 19:03:12 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id q10so7513419pfj.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jul 2021 19:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fUVPLwCOda1qxNWKFrBB41M6dPU/AseGctk4InLhGKo=;
        b=FzvC5E6tKeF9AHpa+HzUnuK2BUGgFL57qRJaf0r9Fi5p/n2he29W7zw3oBC3H3SlG7
         OxSXb5TrEuOAf/zzUIrfNH1Py/zO2zR4fOdm6l3K+DA7xBxLznX4ufPMiLMIphuu0FPs
         Bh9GnBf8IeEMtIZdUhzsxhb2BmLhsP7LuorvIYveaSSzZm2QCrXcMRsSqNU1P4LIL1ST
         bHSrslOfIf0/lgExnOwS17UdlsVZKDwnZmXbcR+jSj0CSTCyzzMaiZsVqHOSYvke1C1i
         upb+/rRgjcEFevSq7mPVSEk973xWLpFwIWJYJgpS8VIPTtELWrr2Bi0jeZHKFOnwQ/LS
         EC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fUVPLwCOda1qxNWKFrBB41M6dPU/AseGctk4InLhGKo=;
        b=E0wKUqQI7Io+aNILD31rNDiPTf6BGBKQso4KPDuX1eHLZrtwwrvbm73P19INWEsj+7
         lLIfo9i9F//79u9mya9kwMOyknG1jzcnHpuGwzN2CkWPb5w5sLcJzi6KurHI1wIVlJlF
         2SWFOpo/F4J8RshXk2yjdpD0Fpgs4bUNOs1B7uYSTVFUI5GGb3kIk1HeP1doPn1d3jRP
         sTH5CYj/rh8Lzk4fmdNsV5mjixebUEBjbx4kYuhKcy83BaMjKXq4SqkY1TlCZKn9Lx5m
         v4RvOqFj6kZY3Cc8Ov8rCBEo9HSJFZWbb8dPmB9kzN+Y/qae26kjI/Ho6Cq15Ce5RteI
         iAEw==
X-Gm-Message-State: AOAM5325T8wFnh/IAJdL53KVxp0L2KOOjPGS0YrC0/KJjAavL2xGBqcd
        PPs6PQYwD0xKj3CPGeN5EyE=
X-Google-Smtp-Source: ABdhPJz6xlXrBd+mrQgEKqcUH5RL2q2mI6RUVbcjZIr0K2b0sW9Mq5g1SJ5tR7bmHHZOlY/H+Z1z1Q==
X-Received: by 2002:a65:578e:: with SMTP id b14mr7425312pgr.117.1626400992315;
        Thu, 15 Jul 2021 19:03:12 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:bd84:68b:cf56:4515? ([2001:df0:0:200c:bd84:68b:cf56:4515])
        by smtp.gmail.com with ESMTPSA id d22sm2384172pfl.201.2021.07.15.19.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 19:03:11 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home>
 <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
Message-ID: <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
Date:   Fri, 16 Jul 2021 14:03:06 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 15/07/21 7:26 am, Michael Schmitz wrote:
> I've got a vague recollection that I've seen weird crashes in the past 
> related to temperature extremes (we've had a few unusually cold days 
> in our parts just now), so I've gone back to a kernel from the switch 
> stack / refactoring exit tests (which ran the stress tests fine 
> earlier) to rule that one out. Looking good so far, so I begin to 
> wonder whether we need to introduce get_fc() and use that to restore 
> the original sfc/dfc instead of assuming USER_DATA is always correct?

No crashes with the known good kernel after over a day of stress testing 
- I'll try Andreas' patch once the current test run has completed.

One thing I noticed with either your final or your v2 patch series - as 
far as the tests ran at all, run times were 30% increased. That's a lot 
more than I would have expected. Large byte size user copies were 
already handled by the code in arch/m68k/lib/uaccess.c which wasn't 
explicitly inlined though the calling raw_copy_to/from_user() was. Could 
the change to no longer inline raw_copy_to/from_user() have such a large 
impact?

Cheers,

     Michael


