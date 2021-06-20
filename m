Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8258CC48BDF
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 21:55:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D69E6108E
	for <linux-m68k@archiver.kernel.org>; Sun, 20 Jun 2021 21:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFTV6B (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Jun 2021 17:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhFTV6B (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Jun 2021 17:58:01 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F47C061574
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 14:55:47 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l1so25417736ejb.6
        for <linux-m68k@vger.kernel.org>; Sun, 20 Jun 2021 14:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kazik.de; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZxpk4P94iTAaChLPxhmboh9pwsUgpX/hbahyDurHJA=;
        b=q9rFFV+T3yjg8IyTU56aInCznD9Ael0zCATpJHje6uA4RjMWkVXFdsocBXIvT/71Nk
         WX5Nyh+BJ8R9l7Jil4I0IkH0LwCrByoglWwpsDmCqUPZ2LY3CF8KgwREbggWCUOZc1U2
         JCtmYk4tloCfC9MtzZ5rbwrUBI46aS99uN20w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZxpk4P94iTAaChLPxhmboh9pwsUgpX/hbahyDurHJA=;
        b=XRq8NsKZPN3AKTZ9SJqboMkypLMyT1gbydk03w21hKztBVbbcQg4qytIbZT8t3ZCne
         6Ph1/WyHUZXy0LOoxtl/Z6x2WeLIlXenRbCww5jdbXzVWWbcKlvBY/ze0kYBSuqxsHQ0
         WlS71aovLkiPAXXTkYoxSdAnJ3nmY7wsWgjaZr6rYkx+Dbt26lT7bfF1VoHRCOhylFUm
         QAX+XgJeck0kEc0bQFkGcfs4tJ0X2L5D3p5vSkVVTGr5sOJS+2qsbN+76c53wJvB96jG
         kz0Os8SwcM1xFceAL4pNbE1Q5/NVtrX1LrdxA9kHtGy1J7jthNZHcnI3KZi4lHyHjha2
         jp2g==
X-Gm-Message-State: AOAM531T3zfzozpolEi3bQHeo5+Bq+pY5FkEoWPg1Itt39DQSTQaoIbS
        eOb/NuLhIn6VrLFA8QDrOoEdTG0qkgBscC74s5Lu3qAkl/OU3Q9x
X-Google-Smtp-Source: ABdhPJzVAvDSEuyBgcGhTDUlvrBrSZ9vuULsTwZ4c45VdkUSVasMwrcLypNyLL++GHAz1ck7EqZgQOk3T2A5DsymUqw=
X-Received: by 2002:a17:906:128e:: with SMTP id k14mr21215413ejb.485.1624226146425;
 Sun, 20 Jun 2021 14:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <1624145073-12674-1-git-send-email-schmitzmic@gmail.com>
 <CAFFuhJry5tuJmzu1H_3-9NfGsiOYGHQpdY7aPBOockXeA7NAhw@mail.gmail.com> <77d654d2-000e-4bc5-c5c8-f0967c26ccc3@gmail.com>
In-Reply-To: <77d654d2-000e-4bc5-c5c8-f0967c26ccc3@gmail.com>
From:   ALeX Kazik <alex@kazik.de>
Date:   Sun, 20 Jun 2021 23:55:35 +0200
Message-ID: <CAFFuhJo=Qn=emtrxrs044ByuixKj3oSkQ+ZagU7TB63NMBC25Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add APNE PCMCIA 100 Mbit support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

> thanks for testing again

I'm happy to help.

> so autoprobe (no boot option) did_not_ work?

Yes, it did not work - sorry.

If anyone is curious: I'm testing with linux 5.12.9 (was the latest
stable when the v1 appeared) and an about 5 year old installation on
my A1200 with 68030+FPU@50Mhz and 64MB ram.

Alex.
