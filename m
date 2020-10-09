Return-Path: <SRS0=PEg3=DQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9065CC433E7
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 18:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38BB121789
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 18:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kl1ryNFI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732325AbgJISmb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Oct 2020 14:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbgJISmb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Oct 2020 14:42:31 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190A2C0613D2
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Oct 2020 11:42:31 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id k6so11119239ior.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Oct 2020 11:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hx8OHz4eilyteb5eQXhrl4igK1QCIH8/I7virNMKkW4=;
        b=kl1ryNFIZQk+jiQKVSyXV9B7r4JIdDQKAW+IY2xIBGJL930XLSFqvSFTnhSPNbqup3
         Ap8Leo0EJpEKHtyVVak9NRCRKOyBg5UKohCLsX99d/Ok2iDmUI6jurcQr/t2j+UMJhJw
         QyYHMUXUpf1zCYwlXAbA6XIuF9kjTkjw/26F9P6qbzicDr0VlkK7lfgTCPU6mbcYP5Jd
         Fl/Sz7RuoZXcUXmC5h7WGP5vVs7YXMcFUVgkLOHkI+oyBe2Mpf6ewwIM0lfRz7HVjWAC
         OIngNubcmv43d9JX4R0OwWXK/+VEt4k7si83KVROSY9Z8ImwHqLayBu2zED5VfELS10U
         PJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hx8OHz4eilyteb5eQXhrl4igK1QCIH8/I7virNMKkW4=;
        b=ioLhg3LkR5fmeyJ0WdxjReQ9Art6G8EKcsMK+d+nnBan4ViNh7JPfoGKYPYisZs89u
         A7E13eneew0Ap2g3OeJ6lkUAEzwosI3HxkAUwTrEIMDFJzX92Gq8yjyd3jX/KELvwQjU
         cnD7XoXcIfetr5tS9NnGNduCgAxb53gLHY1OOVr/v2lXBlT+aqxOxCaCgw5RUQlsnAZL
         Y8O4k7brnkdD23iPAmFWGG5B2qINER8d0Aj83rFCKoovyHaOMMgsXRQVdskXXVDD+V5E
         8KiYUjzpCggGpEMtMAZtcZpU6bAJBA+OSYX+rPvtuWJoTHmk13bPgoDWYnRsmBnyI0Yg
         hb0g==
X-Gm-Message-State: AOAM531+V0IK75ydXj2PiOG9bQLG5jInOUMY8/FV69CWNPWGUn9u2T3r
        aLOXb5b62U1QPur88pPCdnyvhFDr1uccOCRHJ3TOsQ==
X-Google-Smtp-Source: ABdhPJx90uHGxkJhxHfTgoGSQVSNaYtTrHkQDm294sWHGcdp5vN+fxxcgel+lsKtL679esezc8zkbwVKGOXsn1J9u8Q=
X-Received: by 2002:a05:6638:20a:: with SMTP id e10mr12143129jaq.20.1602268949839;
 Fri, 09 Oct 2020 11:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <a75889ab-4d84-aec4-8f01-7d42e7e015c9@physik.fu-berlin.de>
In-Reply-To: <a75889ab-4d84-aec4-8f01-7d42e7e015c9@physik.fu-berlin.de>
From:   Matthew Garrett <mjg59@google.com>
Date:   Fri, 9 Oct 2020 11:42:18 -0700
Message-ID: <CACdnJuvH=8LKOHwsxoYnH-7CC=ACtGvjMig_RTq3+AoynazQiw@mail.gmail.com>
Subject: Re: Upstreaming the CD-TV CD-ROM driver
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 9, 2020 at 11:27 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi!
>
> I wanted to try out Matthew Garrett's driver for the Amiga CD-TV CD-ROM drive [1] today
> but it turns out that a simple rebase won't do it since the code in arch/m68k/amiga/dmac.c
> is no longer there.

Not answering your question here, but: my implementation isn't great,
and I suspect it doesn't work nicely on CDTVs that also have the SCSI
adapter added. An upstream implementation probably wants a cleaner
abstraction of the dmac interface.
