Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4522FC28D13
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Aug 2022 20:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237633AbiHVUlL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 Aug 2022 16:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237572AbiHVUlK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Aug 2022 16:41:10 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4CA45985
        for <linux-m68k@vger.kernel.org>; Mon, 22 Aug 2022 13:41:09 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id o13so1944010ilt.3
        for <linux-m68k@vger.kernel.org>; Mon, 22 Aug 2022 13:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Ers9gGJlbTx9jbZs4+E0+GvaVLNp7YDKZZqcPbruz4U=;
        b=b0vIVbNkbgI4Fl8u+nwUuaRM75hYoDSxQwfSXCpbz7xck/ILIEVxRSQKiqyRgj0+Wu
         tukZie7FblON77utS19iBktw86lY32o2nmbljTpe5hw+vNyWnkY1aQ1esjbMBPGbrIlx
         Ibm/RfD1d5C2fAXA59Jsz479rjshQ7DASvLHvMHojdgI3afgJOLa1jqD2vZ8xqZAeJzL
         KLjVPrwslX9cK/Dh4txo/pA1vNPMLHsOgTUl/PH3R3C4Fp7etVAOj9sp1nMvAldkSeMj
         vKhzlwfkeH349Tup7Q9vzRxXmP4XnWFmKbz1QE7zQstFyiN1yvhLPxbkwoP97tC0hzw0
         0vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Ers9gGJlbTx9jbZs4+E0+GvaVLNp7YDKZZqcPbruz4U=;
        b=ZmQqMxCs6mSNRB1ocP1SnWZmBb+GPDGCBtFicK2gLFxGZ3DaCDZlGRtJyLR7rkAmNK
         sFg7tXUC9EGXV6jUWS3dh9fkUQDAjtMpmvheivChkPC+ideOAp12bQ3pWDHyrWj1b7Wu
         QcoaH3VMV6BtcgMzk39jCSGDhC0abhxRuHXbxD/wyAVHi2qj35uF/UX1DA0OD1JvODzc
         OnP40/K6r9JfIeBzbMx7NXgKPMAii8Z2QWFUVPhlJJxZLDi1bVWYK0AZDR+RLok7YcHm
         fqfj65e0091HCkbxSBL8VmqKagerX6HRhkGBI0++KBoeBZP4Okt3/RvkypxGp5TwRaGW
         9TtQ==
X-Gm-Message-State: ACgBeo09DhZmcPBaUZwNwIZkrzoaFm20fh2mZXexa1uAguROxqKRIqjO
        QVkIVxbsAC1Tiv0Vypb7j3awUw==
X-Google-Smtp-Source: AA6agR5P3dP1DjUqsXHtJnf4nxAIerdU05GHq3Sujgg7HxvleO1o/j+9nsllA95TWI7JpoiaK+JmwA==
X-Received: by 2002:a05:6e02:18cd:b0:2de:73e8:3f0 with SMTP id s13-20020a056e0218cd00b002de73e803f0mr11060170ilu.69.1661200869080;
        Mon, 22 Aug 2022 13:41:09 -0700 (PDT)
Received: from [192.168.1.94] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id v12-20020a92c6cc000000b002df73ca05b0sm5405205ilm.34.2022.08.22.13.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 13:41:08 -0700 (PDT)
Message-ID: <cf6a3edc-7f9c-7a70-23b0-edf43769d994@kernel.dk>
Date:   Mon, 22 Aug 2022 14:41:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v7 2/2] block: add overflow checks for Amiga partition
 support
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Martin Steigerwald <martin@lichtvoll.de>,
        linux-block@vger.kernel.org
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Christoph Hellwig <hch@infradead.org>
References: <1539570747-19906-1-git-send-email-schmitzmic@gmail.com>
 <71d9f2fe-42d1-2a09-a860-702b42a3a733@kernel.dk>
 <0bf2e4f9-a1c1-3847-a2b5-d9b9eaaa783a@gmail.com>
 <2669426.mvXUDI8C0e@lichtvoll.de>
 <6fa2c159-e7c7-2d2c-04b5-54c2b2c9a24e@gmail.com>
 <023b3e08-8782-cde9-4eda-ea419d461bf4@kernel.dk>
 <3aca03ae-f01f-962d-b552-d6efd1cd47df@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <3aca03ae-f01f-962d-b552-d6efd1cd47df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 8/22/22 2:39 PM, Michael Schmitz wrote:
> Hi Jens,
> 
> will do - just waiting to hear back what needs to be done regarding
> backporting issues raised by Geert.

It needs to go upstream first before it can go to stable. Just mark it
with the right Fixes tags and that will happen automatically.

-- 
Jens Axboe
