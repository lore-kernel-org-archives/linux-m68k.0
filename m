Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130ACC001E0
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 10:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236493AbjHOKmb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 06:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236546AbjHOKmT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Aug 2023 06:42:19 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB44A1736
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 03:42:17 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-579de633419so48681907b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 03:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692096137; x=1692700937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSzF5vEwbW6mTgS5pbSkNReugjfObhBsGWWoH9yrmj4=;
        b=XaA1fIIYMkihf+Dwzbwnpaxu9FIs9AdcE+JhAh0nOxc0RmUV43W/i25Z/ZGoyRJZat
         qV8xWUEbS1UUpgaMC0c1G9FKSbTpwPpnfYDrC3o2C4qepkuLz3hR3EiQ98nK7wewQMK3
         k567uzr4dGbzOjqvs4y68lig6nYP8zFlYutTF8RnA5E12wLmQGGg5icZMhZmzM4M43+V
         VjHATYOGnh9vl3rm3NMv5FRGBoj/NFNICI3Ha25Pt+k0Nm7dg9/ODcx13JOYohbOPAhZ
         9cqM9c4PDywJxUs7vavVSlxxdJoDrYIyKY4W2j0EKehyFoR2shpgEbSacrReTYXtN18y
         BV5A==
X-Gm-Message-State: AOJu0Yzo9z+1WtDGQoTq95W/OMvmBdjVVKV7QZUQYx96VH1MI56o1zVn
        2HcY9nLEQfZaQGPk4PhtaMQC5dEzyFc9Fg==
X-Google-Smtp-Source: AGHT+IFnMx6twz18WVsMbLS8pwA5mbo+J5hU9DBCWLHvBKsdCqmNxanVr9IFWcxiBCaxmDlVIsRUkw==
X-Received: by 2002:a0d:f0c1:0:b0:589:a9fc:ffcd with SMTP id z184-20020a0df0c1000000b00589a9fcffcdmr10021146ywe.20.1692096136616;
        Tue, 15 Aug 2023 03:42:16 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id x1-20020a818701000000b005707d7686ddsm3312995ywf.76.2023.08.15.03.42.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 03:42:16 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d690c9fbda3so1665887276.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 03:42:16 -0700 (PDT)
X-Received: by 2002:a25:84d1:0:b0:d64:6cd9:29a4 with SMTP id
 x17-20020a2584d1000000b00d646cd929a4mr8903846ybm.61.1692096135766; Tue, 15
 Aug 2023 03:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org> <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com> <ZNoNlC5fhztMFBAk@sowerbutts.com>
 <edd601bc-56c4-fa33-3a68-285eca768f13@gmail.com> <39D1BBAD-DCA8-4E0E-ACFD-529DECA233B8@linux-m68k.org>
 <e3964f47-c892-6453-f685-5a06e154f89a@linux-m68k.org> <AFCD9AA4-7A09-4AF5-B3BE-1C5554BFB8D2@linux-m68k.org>
 <e36baf9d-b027-380c-de91-c9ff52857168@gmail.com> <ZNtKGaIgs4Dy2/6b@sowerbutts.com>
In-Reply-To: <ZNtKGaIgs4Dy2/6b@sowerbutts.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Aug 2023 12:42:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoK5i+mWf9surp=ZifUCg9F_EYsCpn3X6OnWs1gKCwqA@mail.gmail.com>
Message-ID: <CAMuHMdWoK5i+mWf9surp=ZifUCg9F_EYsCpn3X6OnWs1gKCwqA@mail.gmail.com>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     William R Sowerbutts <will@sowerbutts.com>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Richard Z <rz@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi William,

On Tue, Aug 15, 2023 at 11:49 AM William R Sowerbutts
<will@sowerbutts.com> wrote:
> >We need to fix pata_falcon for Q40, and with data on William's disk in
> >little endian order, but data on other users' disks in big endian order, we
> >need to come up with a way to support both for now.
>
> I don't mind if you break my disk -- I can always byte-swap it if required,
> or patch my kernel to use my preferred byte ordering.
>
> Valid points have been made about needing to keep existing disks working.
>
> For the kernel driver to switch byte order after some specific version seems
> unexpected.
>
> On the other hand, having disks compatible with other systems is important,
> and as a naive new user the byte-swapped disk format was quite unexpected to
> me.
>
> It seems there are reasonable arguments for both sides.
>
> I had a cursory look through other drivers and could not find any that make
> byte ordering a user-selectable option.  Is there any precedent for this?  It
> would be interesting to learn how they exposed the option to the user.

IIRC, the consensus was to not add any more byteswapping _options_
to IDE drivers.  Just make sure the driver returns all data in host order.
The IDE core will take care of converting the drive identification from
little to native endian when needed (see swap_buf_le16()).

Note that "data" means both the drive identification block (as read
from the drive's firmware), as user data (as stored on the platters).
Hence if the interface is byte-swapped, the driver must swap all data
read, to make sure the drive identification block is correct.

Now, if your native (non-Linux) OS byte-swapped only the drive
identification block, but not the user data, you have an incompatibility.
Solving that is meant to be handled through a byte-swapping md layer
(although I can't seem to find that anymore?).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
