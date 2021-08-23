Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9FBC4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 21:42:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 182C56103C
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 21:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhHWVmu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Aug 2021 17:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbhHWVmu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 23 Aug 2021 17:42:50 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2890BC061575
        for <linux-m68k@vger.kernel.org>; Mon, 23 Aug 2021 14:42:07 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a21so16524908pfh.5
        for <linux-m68k@vger.kernel.org>; Mon, 23 Aug 2021 14:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=3o6MhcFVz9PS9+wQhlspHOO7NOzcEa2f0MypS9yEAHY=;
        b=VIit+i7Y2i53mNAUzHAuErLQpXxV1D7lqTEty9GM2ETqE0y5INgaZ6k5bCM+MHfX0v
         wx2t+yUnoV4TxrH0jawMgqr6Oql8c7iheB7mBjk10fQ4JhiVh0RIPEpJhA0kzjF20Waf
         XClBXlI8dbz4aqFg+ZvEq+W9ORSKA1hC53gpGJWZOWEidGAIraVsqAWdAy0qRH3u1W9K
         PGlNJUh51X6HZa9ogRdpweVOyUz7LlPUaP40BwYMrHW4EwJ9NfgYYwiukR9QJCpTRlrW
         +dd9/QwRnRg4TxIST3G1/8QSO4KI9gUVhVXqGxfXOfTZlUB5iEmX2NBM8SvXXLx1iZ9x
         0ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=3o6MhcFVz9PS9+wQhlspHOO7NOzcEa2f0MypS9yEAHY=;
        b=BuZ6ejy37mNxflGG5jOjY9zup//ScM2ZJ5NLSKbuhlWMzPWucBvKQfix4ZClafYm99
         HvC18ArLlMn0KhcTjNSgFJ6+phTY9B2iMUPeUTwRpUFCnV3l0e0CW7KV2a/0cayxIyIt
         scFr90UsDvOk223Sz3oMh7F9SDD8rGntf4En55NCGDEvpiIXnn+xk1aB8/Wa19+PM9uU
         rVtM7A7OXl8vHeP2lB2eTcBJ4GXYbsHlwdFAma+EcsiR83I4xAZ3K7Q3pXdPS/6rh+X/
         wd6Imw8IEjATMThljS1MmeNaUMORtTVL9SLU4KKMlh1m1d3sxigl91C+EKmXCQwuHtEM
         MYpg==
X-Gm-Message-State: AOAM5327Aml+f6as2bVoh+DZRxcigKVuwZa1wrB2OL3RmZTsFFGU063z
        rH4pZbj4wxDKmaNgiMWcSg4=
X-Google-Smtp-Source: ABdhPJybDu3zzELW3zviOxrmBId6/e3JQ21RJTP63qr8Li3YXMigqX5lHoJ7m05R5FkrEaebz6B0mQ==
X-Received: by 2002:a63:4b5a:: with SMTP id k26mr33582264pgl.241.1629754926769;
        Mon, 23 Aug 2021 14:42:06 -0700 (PDT)
Received: from [10.1.1.26] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id 138sm11220966pfz.187.2021.08.23.14.42.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 14:42:06 -0700 (PDT)
Subject: Re: [CFT][PATCH v2] net/8390: apne.c - read out and log PCMCIA
 cftable entries
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1629601866-4410-1-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdW5duhQE66nkOkOsURg2SoVgjAuHrZw0tGge7Eop6=mhQ@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>,
        Debian/m68k <debian-68k@lists.debian.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <98f062a0-3f9d-1e13-9909-ec82405981ae@gmail.com>
Date:   Tue, 24 Aug 2021 09:41:24 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW5duhQE66nkOkOsURg2SoVgjAuHrZw0tGge7Eop6=mhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,


On 23/08/21 19:36, Geert Uytterhoeven wrote:
>> +
>> +       if ((len_cftuple = pcmcia_copy_tuple(CISTPL_CFTABLE_ENTRY, cftuple, 256)) < 3) {
>> +               pr_cont("no cftable entry for card\n");
>> +               /* XXX: shouldn't we re-enable irq here? */
>> +       } else {
>> +               int i;
>> +
>> +               pr_info("CFTABLE_ENTRY tuple:\n");
>> +               for (i=0; i<len_cftuple; i++) {
>> +                       pr_cont("%hhx ", cftuple[i]);
>> +                       if (i > 0 && !(i % 10)) pr_cont("\n");
>> +               }
>> +               pr_cont("\n");
> print_hex_dump()?
Too true - I'll use that in the next iteration.

Cheers,

     Michael



