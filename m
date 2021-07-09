Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C506C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 08:34:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E0D2613CA
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 08:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhGIIg6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 04:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhGIIg5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 04:36:57 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87547C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 01:34:13 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id y4so8085087pfi.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Tkmlq5W5gybd1CfsljSN3wEfXWUQiPSD3c0yMqWfunE=;
        b=HXiyzg5Zt4xYGVyoBOgohhipuW8OOk8E78gaTDuf1UIRPSb8Yk24DxMMNdXk1k6EmX
         FsLKshmqXLbkPf0OWdUJCWyZygzqMddFK61Qm15wwCMcLBJfrmREDHmzOxfPkWnmt7db
         ouk8sjEik3uATD2TRyu+dPlV2hzG/qeEusy1uQBV6jXiu3dUpaNxtQyDB1wOdsJWYhP7
         jeMkTHLDg+ISS+Pk2Yx1wI2KFyC7rD44gr7tT8N20wqnlbwsDTKqHmAuU2PeSdt+3ipD
         Pk4ObSEdMg/YOuCq7PArrR449dIxLU+LCJRpXFdQxhpIp/9bfb5BMGbZNLG9a+36Wr0M
         YOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Tkmlq5W5gybd1CfsljSN3wEfXWUQiPSD3c0yMqWfunE=;
        b=KoMMhAu3rxwB35ylLkqLIEwT8KCAI2sSsEHsjUkeqR+vU3fpwzPGbJmPj4n01sYcFl
         WXaCLt5Kp3avdxAVkclEI9NyZvBi+DjTPylT14EiiSTuXB9ReP+eRuNk5WESwiAPtLEV
         iGnI23sgh5KdSHjR6t3C24pmXW4IWBBTGiYLRGkvFyaFNySzszm7IN3flR+BcIAWowhA
         Zz8GdDKuteuOHxAZhdxTAYE9TCewaaPoIzZcE5ipXDLwmuIqMWXJydwBNo2PSb9Mm7Af
         xEGJtGrWWnL+rhqoCzebG4riMScwsg09OF9rhuczIBb+9LnOuconiDfz2jxillj7/6ar
         0nUA==
X-Gm-Message-State: AOAM531DPLM5scSOuc+2QrPLZXAXmdmTKPkcJfJGUe6jD1/v3odkAPHw
        ZEaWeWomk5OSqWy5igdIh8pAWeNYmvA=
X-Google-Smtp-Source: ABdhPJw43hRxupUGGhVn7uNPoi2bP2w4lz3VOHN1LMrUnyGKAuV+9LEL7bmFKJAshqj54dNF6BJbNw==
X-Received: by 2002:a05:6a00:179e:b029:2e9:e53:198d with SMTP id s30-20020a056a00179eb02902e90e53198dmr36741616pfg.72.1625819652766;
        Fri, 09 Jul 2021 01:34:12 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id v69sm1840040pfc.118.2021.07.09.01.34.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jul 2021 01:34:12 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
 <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
 <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com>
 <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com>
Date:   Fri, 9 Jul 2021 20:34:07 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 09.07.2021 um 19:29 schrieb Geert Uytterhoeven:
> Hi Christoph,
>
> On Fri, Jul 9, 2021 at 6:22 AM Christoph Hellwig <hch@lst.de> wrote:
>> On Fri, Jul 09, 2021 at 12:31:45PM +1200, Michael Schmitz wrote:
>>> That patch works fine on a casual test. What you did to
>>> __constant_copy_to_user() does not appear to matter - but I haven't put the
>>> system under any kind of stress yet. I'm a little reluctant to do that
>>> (recovering from a trashed boot disk is a little dicey), I'll probably only
>>> try that with your changes to __constant_copy_to_user() from commit
>>> d36105c942e0 backed out.
>>
>> As Linus pointed out, small copy_to_user basically doesn't happen as
>> we have switched all the suspect call sites to just use put_user.
>>
>> Geert: do you care about __constant_copy_to_user at all, or can we just
>> kill it (as well as the copy_from_user side)?
>
> If it blocks you, feel free to remove it.
> BTW, do you have an idea of how many calls use small sizes?

Just booting to a login prompt: Quite a few with 8 bytes, some with 4 
bytes (those from the keyboard driver), the rest is 16, 24, 36 and 92 
bytes (a lot of those). Used ratelimiting so probably missed a few.

I'll repeat that again logging only the small sizes, but I think we can 
live with using the generic version for those few 4 and 8 byte cases.

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
