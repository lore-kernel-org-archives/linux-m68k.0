Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B51C433E6
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Jan 2021 08:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B6CC2333F
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Jan 2021 08:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbhAMIbJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Jan 2021 03:31:09 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:33892 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbhAMIbJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Jan 2021 03:31:09 -0500
Received: by mail-ot1-f50.google.com with SMTP id a109so1200412otc.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Jan 2021 00:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VerylV3C6Oqo66H4kYjNAQFsHeQf/aqmpm/swUaIPDA=;
        b=fSfX5E5frvJsoRImBS0FxK+AxrlqkbQT/W648WqfJnPl5NDNW8sKhpxK2kryZwl/1s
         gahcRPu4PmGgePXLdg+yxmqEMUpyf8opghLEuT1skmzPJJlfyswZBGQE54QTvZ33qI0F
         F0WabUfJqNFm1Rt2x5R24IWNKFymf5vQcSaRosArv2LQBbfWxlY6cQIwcvcBzcM3vn10
         Ru/+m5ozlseN77cT0Ga695dxkaQcFxfVDsHv49wYwct73nW7ZSwVJ4lkUxxrR0uOlrLT
         QoaGWF+XAB2uVAIVmA4kZWPt+3adQr8BF/Ru1cCkIj5O5MyrMwJC6qOQZuHn9IJ0iHJ6
         VN0A==
X-Gm-Message-State: AOAM530VAkKfbAUMum7ZUyfsr2DdcvVJjQpg+NymsqZC9ReTRdSCnfmU
        QiOlLBhJp7gW46AX5lTpm5ZY6kM+Xw8aGMO93K0=
X-Google-Smtp-Source: ABdhPJyIN1vpdIV46KqwW/iEfulHBUYAUBAc/YRw4mm9/HbbklDKAesFiKIKPf1nhUOWQBIi818J1OQTzD1W+Gn1z8s=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr537624oth.250.1610526628288;
 Wed, 13 Jan 2021 00:30:28 -0800 (PST)
MIME-Version: 1.0
References: <5ffe161f.9I/JUOwwZ9adISdw%lkp@intel.com>
In-Reply-To: <5ffe161f.9I/JUOwwZ9adISdw%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 09:30:17 +0100
Message-ID: <CAMuHMdVs4fGG5k_BL=BEPHOkY2kMb7o8jFxO80Eg2yf_ypuLfw@mail.gmail.com>
Subject: Re: [m68k:m68k-queue] BUILD SUCCESS 069e2573efc3884d5b93f2fd35a9caefafc2132b
To:     kbuild test robot <lkp@intel.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi kernel test robot:

Thanks for your report!

On Tue, Jan 12, 2021 at 10:35 PM kernel test robot <lkp@intel.com> wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  m68k-queue
> branch HEAD: 069e2573efc3884d5b93f2fd35a9caefafc2132b  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support
>
> elapsed time: 798m
>
> configs tested: 237
> configs skipped: 2

Comparing this to your other email:

> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git  master
> branch HEAD: c941d009e8721648ba8eb1f5226125c3808a6cfe  Merge tag 'v5.11-rc3'
>
> elapsed time: 796m
>
> configs tested: 224
> configs skipped: 2

I deduce you're still doing separate builds for m68k/master and m68k/queue.
As both branches should have the same source tree contents, both
branches point to the same tree object:

$ git cat-file commit $(git show -s --format="%h" master) | grep tree
tree 5a8b647f6c7b356475d900715c6ca2d416b36377
$ git cat-file commit $(git show -s --format="%h" master) | grep tree
tree 5a8b647f6c7b356475d900715c6ca2d416b36377

and you could save some cycles by only building one of them.
The same may be true for other trees.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
