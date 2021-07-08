Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7922C07E95
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 03:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86E2461CD9
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 03:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhGHDk0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 23:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhGHDkZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 23:40:25 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAE1C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 20:37:44 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b12so4220488pfv.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 20:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=/spBiQbh4TnzaOGx3zXO7wzBBB37NWyD5/dG3GJimXw=;
        b=dl4UNe+bP6pieTPv0u1OS4XEq2EuSnJlnhfiCiefDJcRtbtK4nd8EfI/b/agE7WLDV
         SGBylTF63dgKMiGmNT5U06s29VrfT0E5dQH+ObWsRDQgRhO2DKDCgKdUHnzQrJD/9U0u
         +mEexs7qzoAFD82XQ6BOutULHjW8HzvSDKJEhCWOIuSOr+ThVYCNpiMDGa/p/f+o9d29
         bOrwu1LKYT6EW/9E97p5ibS7I2DjJT+u9d33nAbLMgNPnzZ3qiibbcs9HD05iNkJtXhs
         TUo9SHkWJJfjC99geZRtFJgm9heIkhialCqV3c7POwW/3GeBccsAmrbDvrt3jToRt8mG
         KYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=/spBiQbh4TnzaOGx3zXO7wzBBB37NWyD5/dG3GJimXw=;
        b=o3MaGO+xrxlH7QCipkOU5pZNE5MPNDvzleCpOrFRwX2FbUo5Ku/KuY1Y3wscsFcukO
         myvN5WAnpRPPKtP6lKbjvA5qIsF7naSG1hnye6+SIn8vpP3NTo6jtNBxjLkHBAglGzyA
         M/S5JbZ/CyFcTFgLEV9i42x8okZBEy01wz2auDDR/5UfgSXqB2Mte/m/LcI5Tt1ObwPi
         lJWe7wAsKdtdk9CYKhRQCJBOhCr/iRD7B1xoI/tXPOLCkingiCsO56zoeF20YY7XcJcW
         4saFUZf9vS9ftlBMezQHRKe0fIH/DTDHrJ8HCiAYT+XHW2rWhKVCh07lEP80oq1MRhw7
         d3cg==
X-Gm-Message-State: AOAM530mI1ElIhj1bg4W8IUMOLvTJDwjfpub7ACmWuTt6Ck99G1HQRSG
        iTNOIu1u6ARlq6JvLOOsgn8=
X-Google-Smtp-Source: ABdhPJyQ55x7qZErnpDtxE+lIUCqGNh30NDI8OWUGfrPxOY5NSt9zgtcgL1Hq7+AGotYzutMEjg9kw==
X-Received: by 2002:a63:5610:: with SMTP id k16mr29083922pgb.439.1625715464170;
        Wed, 07 Jul 2021 20:37:44 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.googlemail.com with ESMTPSA id g11sm848015pgj.3.2021.07.07.20.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 20:37:43 -0700 (PDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
Message-ID: <bbe70548-4bcb-3fb0-1477-b481121767f7@gmail.com>
Date:   Thu, 8 Jul 2021 15:37:32 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Am 08.07.2021 um 15:01 schrieb Linus Torvalds:
> On Wed, Jul 7, 2021 at 7:51 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> Ok, strange. If this works for you, then the _concept_ is fine, and
>> there's something odd going on with the "macros with 'moves' vs 'move'
>> as a parameter" thing.
>
> Oh, I think I see the problem.
>
> Or rather, I see it in Christoph's version of the patch, I don't think
> I've seen Michael's version, but that one was apparently very similar,
> so maybe it has the same bug.
>
> Christoph does:
>
>    #define __put_user_asm(inst, res, x, ptr, bwl, reg)    \
>    asm volatile ("\n"                                     \
>           "1:     #inst."#bwl"    %2,%1\n"
>    ...
>
> and then uses it with code like
>
>                 __put_user_asm(MOVES, __pu_err, __pu_val, ptr, b, d);
>
> and
>
>                 __get_user_asm("move", __gk_err, __gk_dst, __gk_src, u8, b, d);
>
> and the issue is that there's a '#' too many.
>
> The '#' turns the argument into a string, but it was already
> _supposed_ to be a string. But no, the problem is that it turns the
> macro name MOVES into the _string_ "MOVES".
>
> Which happens to compile just fine, because "moves" is a real
> instruction. But it's actually _meant_ to be a macro that expands to
> either the string "moves" or "move".

Yes, that's where I got to (trying to implement what you suggested a few
days ago, after the version I just sent) and hit a wall. What I meant by
'getting overly smart with the preprocessor'.

>
> So what happens is that at least in Christoph's version, I think the
> code _always_ uses "MOVES", even in configurations where the macro
> MOVES should have just become "move".
>
> So it all builds fine, looks fine to the assembler, but it uses the
> wrong instruction.

Yep - that was easy enough to test - never mind what you define MOVES
as, that does not really matter. It always turns out 'moves'.

> Macro expansion with the '#' character and other macros used as
> arguments is something people need to be very careful with.  It's why
> we have a whole header file for just the "stringify" operation, see
> <linux/stringify.h>
>
> But in this case, it shouldn't have used '#' at all, since the
> argument was already a string, and never needed to be turned into a
> string by the pre-processor.

Testing that option next... and works!. Though I still think Christoph's
version is much cleaner...

Cheers,

	Michael

>
>              Linus
>
