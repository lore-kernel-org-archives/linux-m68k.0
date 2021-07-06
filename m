Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27161C07E96
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 18:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F77B61C53
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 18:36:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhGFSjY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Jul 2021 14:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbhGFSjY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Jul 2021 14:39:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B96C06175F
        for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Jul 2021 11:36:45 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z9so2388770ljm.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jul 2021 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lrVJK+Q14mFOC+j3MMFLSinvwGmoJQcqPmcCDNLRRHM=;
        b=QZ8Dj/twWu+MobFnAqqgMwIPQshe/wgx78QmIFILR/IdrZE0Rrv8TsQY1snB6WWkd5
         B8kcXIxCzURQdnxbf16evkp2rGFTAjmgXHQhc9oEb/SRYEUVVZJhfRyg4JF4omSg3Pxx
         sT8eFvqdWjKTVUQnAGW5wttZKQLhMMa4vu+AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lrVJK+Q14mFOC+j3MMFLSinvwGmoJQcqPmcCDNLRRHM=;
        b=CPb/VgzhdkEyyQ4L+9IGVHjMoF3G3QADDVciNkNbY0tZRqDg3Pant5ZFUG8G2N3j1c
         zeGVuJwSVd2k5IBHl5C97+GK0fZlL07PcVkwOhgG6WX9/+Nnfj2vdb4OF7kqc/7801Kh
         rZ4TqOtAToXtlJLEr7CAIuiWYVLxE8k6RpdKYBWqyRN8Qf6TjTu/PhiHif9ei362x9XA
         MEfOfy5pCQf0J4ryjwdZ3TmekondikUqeIbAv+Mj1hGrHfRzNDIhwONU0kSkzPvligMg
         ZBB8Kmv0+Ctat3bF/xEgS9BQ/oSGoI+AbDJVskbOXXEOlwmWaA/4JVHnB5gOp+1mXGD/
         80kQ==
X-Gm-Message-State: AOAM531LXhUJt+puCFB8+nJHcLhdTjLDRd098cy6aPoL7dwbmivIpxsf
        cYIcd/iWHTlXzxDbrQdvhKyeYAMBXI/0rdbN
X-Google-Smtp-Source: ABdhPJyi4WctxH0nWF32YD4Vl9e0zTVrvlQiuF7pqg+Rxp7rHLzzDlwSYUfz6V3Nkn+RFUHCTVK6fQ==
X-Received: by 2002:a2e:2e0a:: with SMTP id u10mr7090254lju.309.1625596603132;
        Tue, 06 Jul 2021 11:36:43 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id m20sm297772lfu.8.2021.07.06.11.36.42
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 11:36:42 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id a6so30425805ljq.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jul 2021 11:36:42 -0700 (PDT)
X-Received: by 2002:a2e:50b:: with SMTP id 11mr16796098ljf.220.1625596602315;
 Tue, 06 Jul 2021 11:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
 <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com> <20210706041353.GA10889@lst.de>
In-Reply-To: <20210706041353.GA10889@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 6 Jul 2021 11:36:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZRs8icwmK4g-XSmY7PB9WUhi3=KGs5NsV7QO=uW_taw@mail.gmail.com>
Message-ID: <CAHk-=wjZRs8icwmK4g-XSmY7PB9WUhi3=KGs5NsV7QO=uW_taw@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 5, 2021 at 9:13 PM Christoph Hellwig <hch@lst.de> wrote:
>
> It still needs "real" kernel-style set_fs for the mm/maccess.c routines,
> but adding __{get,put}_kernel_nofault should not be too hard.

Yeah, it's not that it wants set-fs(), it's that I missed that m68k
doesn't have HAVE_GET_KERNEL_NOFAULT.

Implementing __get/put_kernel_nofault() should be fairly
straightforward: they are basically the same thing as the
__get/put_user() functions, except they should just use "move" instead
of "moves".

The m68k uaccess.h file already kind of has support for that, but it's
hardcoded to the CONFIG_CPU_HAS_ADDRESS_SPACES config, rather than
being available as two different versions.

           Linus
