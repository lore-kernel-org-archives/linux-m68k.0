Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080D9C07E96
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 00:31:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBC9061433
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 00:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhGIAee (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 20:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhGIAed (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 20:34:33 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7190BC061574
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jul 2021 17:31:50 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id y17so8164771pgf.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jul 2021 17:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Xy3dDW2SsVeih8WyytCa3VmTEi1L7kck0HGdVvOxPw0=;
        b=Df3P0Cg8Q9H0vydqS9zmJtx2jbtISA9LC5EXR3W39KyagxEcTHh6gpEMMdUY84dtfr
         GZZQF5tAWIPMJc6udIhAQkxyi4LRQB0ikeiuF4kLzVGirevYJh/PQRnLqF8zzX2faExg
         iQjh/cuNX+JSoADvJcEOIoogrdB1yLELd2+P99s3ju0BtIXJhvOVvvKV6igyZL2r4FU0
         b22snK22aAJeYA8SW9LiYcsZj6hHqdiATVkUkVC/NF3pURc6WNLEmPVq58neykLcMJcp
         anUGzpCB9kjWn2Y+wU6HFQAo/7dbK86Ici7OFYZWZGTG8k+of60hKcA5gZadTD3Qncc+
         21Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Xy3dDW2SsVeih8WyytCa3VmTEi1L7kck0HGdVvOxPw0=;
        b=AWqKSaGRNOSBYAAv1F2KBC+HUx7hbWpBi1kDpF1wfaOijeMS8q+OxxLIrDc9iWZHlr
         5/0CRqG/rpl7HCUIbt4wEaJbKopxM+vDztfVAXBioR7ukd6jhzCbT4c9eG1xZ1k0J4rI
         S6oXUk9flt6kaUli6Uo3PKQMSP3ltx3shB3KRRdzD1Nx3PvTmF0G2bJXfXRVkJwcf0Uk
         yw2+VT8+5BoCq1OIQCWtqxIx02kaU8SVnl55ORJDgIhwG/NeG4xgxDD4MLCAKL4WJgx0
         IccIoV1sMVkrRjfQP9h4mnfazanTF8zuhfeZ/GXilvVjR0AkRDr+KDdD+zEJl6EN65Cd
         Ih5Q==
X-Gm-Message-State: AOAM5311ovuSjdaYkAwx2MV4oweGtonSdV4EdIEdPzXUlv33aTG1z+5R
        7PpitOHDbni000KZCIXMvC2O//Ne6m0=
X-Google-Smtp-Source: ABdhPJxOG/fzFVgFbJFc6HRn8FMKNniGv6edW8fff8Nc/Hf81gROn3EsstY9yf8IlaA4zBlRKe4GCw==
X-Received: by 2002:a63:ba48:: with SMTP id l8mr29126985pgu.259.1625790709673;
        Thu, 08 Jul 2021 17:31:49 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:a5c1:bb20:811d:7b3b? ([2001:df0:0:200c:a5c1:bb20:811d:7b3b])
        by smtp.gmail.com with ESMTPSA id l10sm10553740pjg.26.2021.07.08.17.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 17:31:49 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
 <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
 <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
Message-ID: <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com>
Date:   Fri, 9 Jul 2021 12:31:45 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 9/07/21 7:28 am, Michael Schmitz wrote:
>
> On 9/07/21 12:57 am, Christoph Hellwig wrote:
>> I've force pushed a new version to the branch, can you give it a spin?
>
> Still the same fault (can't start init). But as Linus pointed out, 
> your __constant_copy_to_user() is still broken.

Forget that - got my git am munged up (applied yesterday's patch a 
second time, eek).

That patch works fine on a casual test. What you did to 
__constant_copy_to_user() does not appear to matter - but I haven't put 
the system under any kind of stress yet. I'm a little reluctant to do 
that (recovering from a trashed boot disk is a little dicey), I'll 
probably only try that with your changes to __constant_copy_to_user() 
from commit d36105c942e0 backed out.

That still leaves the issue of __constant_copy_to_user() possibly 
returning -EFAULT instead of the number of residual bytes to copy, but 
we can probably live with that for now (__constant_copy_to_user_asm() 
doesn't actually calculate the residual but just sets it to the number 
of bytes originally to be copied, which is the best we can do with the 
scheme used there).

Cheers,

     Michael


