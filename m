Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37969C47082
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 21:04:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13DB2611BD
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 21:04:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbhFHVGb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Jun 2021 17:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhFHVGb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 8 Jun 2021 17:06:31 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E8DC061787
        for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Jun 2021 14:04:37 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id fy24-20020a17090b0218b029016c5a59021fso135305pjb.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Jun 2021 14:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PvyOvUvI785U/qpRDvpJIFwyWccIcKVL5z2hCAuLUNU=;
        b=HvEwF4sNujlx8OzDpldXk+IQO+SNNpx+K4P2SIt/YqB1gd6kRQnk3LJvJCXVWQU4D0
         onB+nJUGA9taNeiWJPqRUJ3AiBWE45Adzv58nsNaa4QTNOHPQCd3WH8fr6nw2KiOug7u
         rKqWFkRphcEdjRBQquFrR9k6PJF8n6trBpV6UUN0mEB3SZixybprg4FIf4WkxmTwfzVk
         4sA9ZbS+9Iatg6iDuTfBgIyyXcMx0+9FRimi8l1SKNp7wSEuWxSAwo0h9X+j5tBuvk4N
         wFEqFXjkjlGdUL3iSGL/UkYSkIou4OhJUk+m4ior9qRi9vcMS6sw73xvAK2JuuRWpW5v
         750Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PvyOvUvI785U/qpRDvpJIFwyWccIcKVL5z2hCAuLUNU=;
        b=mVv7XFGADLxmFXV0it3RJ0j789V9vbVbOwQszn+5ZO/6Kqk0qmJz5SDDkjSfyTY3qq
         9t7z0XkvuuKP7w2hH3Uh1/j+7t2FDlSvqhRE4w5Bbq4zvCPgSOAD2H03GAoPBkAp3poA
         RsmpbOkYL7YU8UK0LHaFGU3u9gggqjai4nX8Gn+mWVLOzOV2aFz0pRKSa0fCWYr8zBsB
         SQoLREMLs8pWF10g7yulzYlRBIN5Gfcedzvd1GL/NqirxGCxvDEzPqXApX+1K+IcmFdj
         63XIMZBq9mbhl5QfLRnDpyqBLClQgq2ghEdj84x8lLOpA7hK5VRP29hdKXhaiy9VMvZ3
         mvxQ==
X-Gm-Message-State: AOAM530OUb1dtjiwunZMP4bWHUdCMB1+OB4Wrvvut4DW068+JGu7Aepd
        cJUeLBD/30bOe9CwceJNQvTNEg==
X-Google-Smtp-Source: ABdhPJyn7nt9+WHxI2BzrNERrluNVAP/em4T2g9rucG5fW7XQOQ0hi0aIT9IxlKo9nNzPFmV7tb9sg==
X-Received: by 2002:a17:90a:8c14:: with SMTP id a20mr27714031pjo.167.1623186277024;
        Tue, 08 Jun 2021 14:04:37 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id s13sm6734111pgi.36.2021.06.08.14.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 14:04:36 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Use libata platform drivers to replace deprecated
 m68k IDE drivers
To:     Christoph Hellwig <hch@infradead.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Joshua Thompson <funaho@jurai.org>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Richard Zidlicky <rz@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>
References: <cover.1623131194.git.fthain@linux-m68k.org>
 <YL+AqIEPjMgG519L@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d3c70f7a-368a-ad9a-6575-8289234b0ce0@kernel.dk>
Date:   Tue, 8 Jun 2021 15:04:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YL+AqIEPjMgG519L@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 6/8/21 8:37 AM, Christoph Hellwig wrote:
> On Tue, Jun 08, 2021 at 03:46:34PM +1000, Finn Thain wrote:
>> This patch series allows m68k platforms to switch from deprecated IDE
>> drivers to libata drivers.
> 
> Thanks, this looks good to me:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Jens, any chance you could pick this up quickly to prepare for the
> legacy IDE removal series?

I can, but had assumed it'd go through the IDE tree. But not that
important I guess. I've queued it up for now.

-- 
Jens Axboe

