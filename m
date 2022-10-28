Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580E7ECAAA1
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Oct 2022 13:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiJ1NFX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Oct 2022 09:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbiJ1NFK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Oct 2022 09:05:10 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC5A31DF1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Oct 2022 06:04:57 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id h10so3994561qvq.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Oct 2022 06:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVUWwaHw02W9cOy0F44SflIYoXa5sfjHCnsNHHyNsmM=;
        b=jhuYriT+8LkceV2EIH0KtFQC89k0lBFFTVPxDLFDlloIrMlUTs3Pwzvap5quQmFb/u
         sBYry4vVlfgH99AEiQ5TQHI6vfnU4hoKf26XHjMkh92lJdv2dBuPYHzMWUIY0tFOTMg+
         b2A7iC6HYaxVdw/ZQ9+LE8jDXW0/j3dEPcCSFqUIkmdFcarHR7panBdVYqTIf5IhorrA
         LGPOBisjGm0Sjwg9q9BTVKU0xzw3+EgqcnxnnUKO8o8H/+7ADjGVRMuXg4P1jMHkLZ4R
         R8AvrI0mXfhA9DYMpN5hTBO3vK3dq5+jyqa2KBxr4AduZNPyKjYKv8BZHMKAPBXpNEcT
         9DOg==
X-Gm-Message-State: ACrzQf0QBEEjZG+zzns/DpPy+50QXmfBWf/iOOfiuobxMu5FvtbDIira
        PArEpcuO7klhEmgCaAqJVNFj5t6JXX1Oag==
X-Google-Smtp-Source: AMsMyM7pRFaft5g4rQ+AgrT6ahmKVLmADq1imHuSjurl1icgoGWwuxHwmCPLafsF1fF+cpNNTgI7TA==
X-Received: by 2002:a05:6214:20eb:b0:4bb:b277:171c with SMTP id 11-20020a05621420eb00b004bbb277171cmr1231972qvk.8.1666962296156;
        Fri, 28 Oct 2022 06:04:56 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id x4-20020a05620a258400b006bc192d277csm2958458qko.10.2022.10.28.06.04.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 06:04:55 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id j7so6023372ybb.8
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Oct 2022 06:04:55 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr46623716ybb.604.1666962295225; Fri, 28
 Oct 2022 06:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <0229879ee3e2d8828707d291cddbb89ac18a10c2.1666945731.git.geert@linux-m68k.org>
 <Y1vSjQfkDfPINUBo@debian.me>
In-Reply-To: <Y1vSjQfkDfPINUBo@debian.me>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Oct 2022 15:04:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2WAnhFWJFEGOqch4h8mQ31w459ejOmn=39KWj1wAXsQ@mail.gmail.com>
Message-ID: <CAMuHMdV2WAnhFWJFEGOqch4h8mQ31w459ejOmn=39KWj1wAXsQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mac: Reword comment using double "in"
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Bagas,

On Fri, Oct 28, 2022 at 3:01 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Fri, Oct 28, 2022 at 10:30:26AM +0200, Geert Uytterhoeven wrote:
> > People keep on sending (incorrect) patches to remove the second
> > occurrence of the word "in".  Reword the comment to stop the inflood.
>
> Ah! People who aren't fluent in English think that duplicated "in" below
> isn't OK, which after stripping that become nonsense without reading the
> actual code.
>
> > Suggested-by: Michael Schmitz <schmitzmic@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > To be queued in the m68k branch for v6.2.
>
> Should this patch be Cc: stable'ed so that no more trivial patches as
> you mentioned?

People should not be sending patches against stable in the first place.
Once this makes it upstream, the inflow should stop (hopefully ;-)

> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
