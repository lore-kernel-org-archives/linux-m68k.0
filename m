Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC55C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 09:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B968613CA
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 09:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhGIJDG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 05:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbhGIJDG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 05:03:06 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C66C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 02:00:22 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x3so4542964pfc.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=MkmMU37yTu9K5CEALMhwKCsR2sJyt29epFGkyHMgX8Y=;
        b=FASuSCvB8RLiHDWg1XWl28SWqQO3iXmFn4vKMTIJGLfz6Xe/QeQQGZuQ6JVU/JOWdP
         44x6Ik809no/qJiNIO4lYo919IZeSweFmhHJliRrDqx0AeIr+uvBUdqn77U222sVNP2X
         AKhsERk7BlF8ywG8icsGT5/wkYUg/stwiI+xNEUsyWsGukIUSYIiDqzma3eQ/x1BuRZx
         jYoUJUtqy1BlS0pNbCJpFk0jveQ8VXYPXPtRHMFdn3mzeraGsSaZRFlNqqEekghbE0oC
         2+FKYj8S8W4EZljr9lwQhOYdZqHuDRED/kkZVFvX0BFTRSRlZF+RUBfIEB5XXaRTDcco
         FDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=MkmMU37yTu9K5CEALMhwKCsR2sJyt29epFGkyHMgX8Y=;
        b=g7Ga1z46KolQTSEgLUbv2z+UJWX8U+cm+EnQBn6+tTUOk+mSvQ2MaPv8X7yGVL/umR
         pCLJ04wbYKY/KKbisfadqKKQxX+N6hinK8o9h+j1Hm+wp5lj2P/LmFpmFWlQpyXq1uEc
         862qkANnOU9WxAV8EGI5cZldZ7CbX6pzrlRLw1psW6zcRRnj6uVeL4AyXHjBwKsjIBPR
         EkKiRv90tU18yXWpvuoJyfdQO3aEvPCtiPmIb+Ks6eT72sCiCTFQ7+nKsheT79lMXkVe
         byiGy+/YhkN7zjgNHkkSMzieBPxIINPuFaJQvHs0P7Z5L4XbevpcrCX4ogRm0raAm16G
         FqEQ==
X-Gm-Message-State: AOAM533IyEMrsaf9XzX6ebys1ZbzOf1kYTvEgVXFWYqNNJkpLIKpdtqJ
        SQqWkWfVn419wq+xL5CZ5SpJ/oX0HpA=
X-Google-Smtp-Source: ABdhPJzctSTPztkf7djy84p10DOxzf3JK3fHBM7/oxRbKtWcG/9tMPAk14LreV+ytgIswSb73x+nBA==
X-Received: by 2002:a62:5105:0:b029:305:324:17ae with SMTP id f5-20020a6251050000b0290305032417aemr36633010pfb.28.1625821221734;
        Fri, 09 Jul 2021 02:00:21 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id w17sm4771843pjh.54.2021.07.09.02.00.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jul 2021 02:00:21 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Christoph Hellwig <hch@lst.de>
References: <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
 <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
 <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com>
 <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com>
 <20210709085324.GA23590@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <061de3e3-91df-2c23-116f-250f579a664e@gmail.com>
Date:   Fri, 9 Jul 2021 21:00:14 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210709085324.GA23590@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Am 09.07.2021 um 20:53 schrieb Christoph Hellwig:
> On Fri, Jul 09, 2021 at 08:34:07PM +1200, Michael Schmitz wrote:
>> Just booting to a login prompt: Quite a few with 8 bytes, some with 4 bytes
>> (those from the keyboard driver), the rest is 16, 24, 36 and 92 bytes (a

Over 400x 8 bytes, 20x 4 bytes on a count with the larger one suppressed.

>
> The 4/8 byte ones can usually be switched to just use get/put_user easily.

Need to log the call sites then ... that should be fun. Something to do 
tomorrow :-)

Cheers,

	Michael



