Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDF7C11F68
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 01:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E33D361CCC
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 01:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhGHBmd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 21:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhGHBmd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 21:42:33 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E50FC061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 18:39:51 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id x3so2093643pll.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 18:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MugysS6fxegsjcx6O/HtRLQtFsKg/Evd0lJH7q2OF14=;
        b=sAba8wcxX1BIQGp+K92nCEU5kk7c+TCiOs0MHOp9p/w+S+6wXeCiOdvR/URw5srmVT
         KlEH0UivCOMRhwMqIaXe1LZRm6uARQUzdRzkLzjYbbx2PojDtHgOkhGBXMeAKkMw6ffp
         2WZ0W9t9MjA0mtfVo0gx9+0wrSIS8UKE3WokNrSfkVE7L/V/QKXGak5N74bCDmEPq1wm
         M627P+AAxHsS6tLZ4ClkAJzTZY+qlyFHmUSNCPaPsGJJZSBqZqELJFVZmW5NkBVk4PcU
         +0F3g01DEGzNklZzx/9vyuD2ctwatYcZYJUlHIy9Fr6+HMmHlPK1d9d/HMOO5L8caYuw
         hxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MugysS6fxegsjcx6O/HtRLQtFsKg/Evd0lJH7q2OF14=;
        b=o8Zhz5Zd29eHX1oSWM1zGzUksMLmc/FIBLUedAxYgAD2AjfsvsBp1y6ldbAPn2xn4a
         pADn0+02U5Q5Ym2HS25/qpDheuwNQ4K+RnPFbV0w5aS263iM7r9Z5Cubk+fFNuIhnI1s
         e0eHHbsgn/uvBqP47ObmdOj0MFdk069crcf9EYSkBA/PYhzuNuk77U2/0A4Wif6YfTnB
         EaEpAR1lIJQ2Rv/w34KVKmO4WzTRZwgv19Yqe/YOmz8y7R8FF05GtWoLPQR9YFS9rgjv
         rTbcGCJMCoiabsbRKKw9oj6y4ByhFluHVAQlfEunekLjGQjlgA6oUJjCzNinspar8Z35
         0lig==
X-Gm-Message-State: AOAM530Os4daCKYmNMgg7Ws6rowGyqHR2mSlsHcFSJvaH+FFIEPCN83Y
        wxes1F8O1kRem76N/qmaq7Y=
X-Google-Smtp-Source: ABdhPJyN8cUhlzulvJBnjPvup3XqxSNiJ4AZ2xnmohnacPIbAvUQVm8/cLspXiG0avLgCAPxMaFcPQ==
X-Received: by 2002:a17:90a:6345:: with SMTP id v5mr2034372pjs.17.1625708390881;
        Wed, 07 Jul 2021 18:39:50 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:c565:7cd9:40a3:2148? ([2001:df0:0:200c:c565:7cd9:40a3:2148])
        by smtp.gmail.com with ESMTPSA id w5sm120901pfq.130.2021.07.07.18.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 18:39:50 -0700 (PDT)
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
References: <20210705055719.949875-1-hch@lst.de>
 <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
 <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
 <20210706041353.GA10889@lst.de>
 <CAHk-=wjZRs8icwmK4g-XSmY7PB9WUhi3=KGs5NsV7QO=uW_taw@mail.gmail.com>
 <20210707142531.GA26080@lst.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <8bda396e-0e19-85a5-8274-4f881e045539@gmail.com>
Date:   Thu, 8 Jul 2021 13:39:45 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707142531.GA26080@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 8/07/21 2:25 am, Christoph Hellwig wrote:
> On Tue, Jul 06, 2021 at 11:36:26AM -0700, Linus Torvalds wrote:
>> On Mon, Jul 5, 2021 at 9:13 PM Christoph Hellwig <hch@lst.de> wrote:
>>> It still needs "real" kernel-style set_fs for the mm/maccess.c routines,
>>> but adding __{get,put}_kernel_nofault should not be too hard.
>> Yeah, it's not that it wants set-fs(), it's that I missed that m68k
>> doesn't have HAVE_GET_KERNEL_NOFAULT.
>>
>> Implementing __get/put_kernel_nofault() should be fairly
>> straightforward: they are basically the same thing as the
>> __get/put_user() functions, except they should just use "move" instead
>> of "moves".
>>
>> The m68k uaccess.h file already kind of has support for that, but it's
>> hardcoded to the CONFIG_CPU_HAS_ADDRESS_SPACES config, rather than
>> being available as two different versions.
> So I've come up with a whole (compile tested only) series.  We don't
> really need the preempt_disable either given the m68k saves and restores
> the SFC/DFC registers on context switch:
>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/m68k-set_fs

I tried your patches (on top of m68k 5.14).

Doesn't manage to start init, independent of what disk image I use:

Starting init: /bin/sh exists but couldn't execute it (error -22)
Kernel panic - not syncing: No working init found.  Try passing init= 
option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
CPU: 0 PID: 1 Comm: sh Not tainted 5.13.0-atari-fpuemu-exitfix+ #1198
Stack from 01031f8c:
         01031f8c 00360249 00360249 002c7032 00000001 000bc486 00000000 
000020c0
         00000000 00000000 00000000 002d3ffa 00355111 002d3f28 00002980 
00000000
         00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
         00000000 00000000 00000000 20000000 00000000
Call Trace: [<002c7032>] panic+0xc0/0x282
  [<000bc486>] kfree+0x0/0x60
  [<000020c0>] try_to_run_init_process+0x0/0x36
  [<002d3ffa>] kernel_init+0xd2/0xd8
  [<002d3f28>] kernel_init+0x0/0xd8
  [<00002980>] ret_from_kernel_thread+0xc/0x14

---[ end Kernel panic - not syncing: No working init found.  Try passing 
init= option to kernel. See Linux Documentation/admin-guide/init.rst for 
guidance. ]---

And I don't think it's the return value issue Linus pointed out - the 
same thing happens with my own (quite similar, though much less 
sophisticated) patches based on what I sent in response to Linus' 
suggestions earlier...

I'll send the last version of mine that did still boot shortly.

Cheers,

     Michael






