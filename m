Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA67C48BE6
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 21:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4285361042
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 21:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbhFPVNo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Jun 2021 17:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233872AbhFPVNn (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Jun 2021 17:13:43 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151F6C06175F
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 14:11:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id n20so951104edv.8
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kazik.de; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2xLkZERxRt4v4GXzLzwipaQjjjWRDIAdZv/suj3Yer0=;
        b=JRPsgvv/XQLYxaZpMe0uUUHWhkdu32pyA/OBgkJASwWUTI7LGZuSsj/EeEOlcxUh86
         f9oW3uf8Yyam3H1IR2R6JSm8DBLTTrluwDjn71f1Qpsom7pamCQs9bOz11sWy3N3b1q/
         A6RYwUqLidM0WRqvIYMYpL8GB3udAW5ZfAU3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2xLkZERxRt4v4GXzLzwipaQjjjWRDIAdZv/suj3Yer0=;
        b=KZ49E8N4M1+CQKWPpHoGb6El55Slr97QgyYnnW/GFtbwhWQxn0CUTu8doTJlm4LbFl
         CoaouAYlc3iEhEf9Pii08DRpGUkIwq8NE6bF8gHWwUgGtrYb9aT6zkEH9TvhIpl5qb3i
         7F6fb/yB56jILUh8RCo50LZHrqZOYc+t6P/csZH+Jv8Sl/KvosRK1AE8RpuLHN3QOKlY
         trIMRdAxjdcVNpksyNyxjWwWYj6405Vk6sd7MXhk1rBuVcDLeD5eNTUbBfoXl95uVV6n
         byIxlKz8aj6pLhj7orfieO0tjG9Gq0CtKCLXwAS+/ZViJAQ4iJQbq3lgWswZ7UHUsEMH
         cuOg==
X-Gm-Message-State: AOAM532eSQgUluBrwylgnVL87P887yzKR6gYbHx72CsxSW9M5bMdm8be
        wthX4uvj1IIN9ELPNfU16okLqtL0oH9LwqdVQUzhF1QsBovfa6Ow
X-Google-Smtp-Source: ABdhPJxEip3zVVu8KtoWRaaE7nEAhYe99Sx6rXXsL1C9hrdZ9cY3gxng+KpretTC1dRxXN6scmr4Wtkd/WlsDUoEzkg=
X-Received: by 2002:a05:6402:5256:: with SMTP id t22mr2167872edd.54.1623877895573;
 Wed, 16 Jun 2021 14:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <1623224214-4836-1-git-send-email-schmitzmic@gmail.com> <1623290953-18000-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1623290953-18000-1-git-send-email-schmitzmic@gmail.com>
From:   ALeX Kazik <alex@kazik.de>
Date:   Wed, 16 Jun 2021 23:11:24 +0200
Message-ID: <CAFFuhJpT+2h+4O_q15VjE_77iCQaxwLJC11siSFrr5GbjQ-pFw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add APNE PCMCIA 100 Mbit support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-ide@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

I've tested the patches and they work.

At first I got it only to work with the following line removed/commented out:
  if (apne_100_mbit)
And thus enabling the following line always.

I've changed, with the help of Michael, the parameters to:

  static u32 apne_100_mbit = 0;
  module_param_named(100_mbit, apne_100_mbit, uint, 0644);
  MODULE_PARM_DESC(100_mbit, "Enable 100 Mbit support");

And was able to enable it with the kernel option "apne.100_mbit=1".

It's also available as /sys/module/apne/parameters/100_mbit

The 0644 is the permission (root can change it), If it shouldn't be
changed at runtime 0444 or 0 would be used.

(I think there is also a bool option instead of the uint, but I'm glad
it works like this.)

Alex.
