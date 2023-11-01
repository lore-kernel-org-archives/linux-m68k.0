Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E01CC4332F
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Nov 2023 12:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjKAMTj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Nov 2023 08:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjKAMTi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 1 Nov 2023 08:19:38 -0400
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EDF103
        for <linux-m68k@lists.linux-m68k.org>; Wed,  1 Nov 2023 05:19:29 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-da2b9234a9fso4386465276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Nov 2023 05:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698841168; x=1699445968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1XPIPR62EPrPe480flDjU5NXSmE2hZoFCqRd80jZgg=;
        b=Fv20dxVAc2kOnWtsKZ4HM6yHq5R6aHp/E0XrLuzYjmxW6VNsXhyBa85CpGvdybEOrg
         oQYHch4INL+5K16BA0ObBI5rSG+IiJ+r06t5WJo33bBHH01Gu0U+di+dUtNj4HRoqRrB
         jgYXVfpWY9Yi4KFMM7nb7+MxqOSGHTSzFx46uvfWQHeQncSW3UQsgRQBIZw6zLvTJEvj
         9ostGWLdnP/f70+NcdDUTbj3ssECWA2v6So6Lq2xep0HGpMGYP7iIPplo39nl8g8/fE9
         sc+iSaSILDD0qMMelVyJePbeR7M4xtVYa4wTLY+Ja5UJLp3kD6hiWIGBpA4iSC9p+Hbr
         +lGw==
X-Gm-Message-State: AOJu0Yx9Mi0NCSjPQr9v3tfgjRZ0JEvYPlmfP4EbIPztO6p47iRgUppL
        8zNSr+IIfN/N+JTT7SCIMpaiX6FaRy8O5Q==
X-Google-Smtp-Source: AGHT+IFKsryN0+sAexyso93NHrkYD6Db5bmuZi5X3iGArPX+gzknLeLA+uPfRT5+8Uo0sbxY6zQ95Q==
X-Received: by 2002:a25:84c9:0:b0:d9d:3a6b:d376 with SMTP id x9-20020a2584c9000000b00d9d3a6bd376mr14510498ybm.44.1698841168280;
        Wed, 01 Nov 2023 05:19:28 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id w7-20020a253007000000b00da0501b497asm1939806ybw.18.2023.11.01.05.19.27
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 05:19:27 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5b31c5143a0so22076367b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 01 Nov 2023 05:19:27 -0700 (PDT)
X-Received: by 2002:a05:690c:f8f:b0:5a8:299b:433c with SMTP id
 df15-20020a05690c0f8f00b005a8299b433cmr17919596ywb.18.1698841167527; Wed, 01
 Nov 2023 05:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdWL2TnYmkt2W6=ohBuKmyof8kR3p7ZPzmXmWSGnKj9c3g@mail.gmail.com>
 <594446aaf91b282ff3cbd95953576ffd29f38dab.camel@physik.fu-berlin.de>
In-Reply-To: <594446aaf91b282ff3cbd95953576ffd29f38dab.camel@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Nov 2023 13:19:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWv=A6MiVwUuOp8zOCcf21HxKb8cdrndzdbAZik3VRXiw@mail.gmail.com>
Message-ID: <CAMuHMdWv=A6MiVwUuOp8zOCcf21HxKb8cdrndzdbAZik3VRXiw@mail.gmail.com>
Subject: Re: Does anyone use Appletalk?
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Wed, Nov 1, 2023 at 11:55 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Wed, 2023-11-01 at 11:23 +0100, Geert Uytterhoeven wrote:
> > Appletalk, cops, and ipdpp are being removed.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1dab47139e6118a420acec8426a860ea4b40c379
> >
> > Please shout if you have any objections.
>
> Isn't that a bit late?

It can always be reverted...

> I'm a bit annoyed that Arnd doesn't announce such removal requests
> on the proper lists? This is something that should be asked among
> the retro community, not on some random Linux mailing list.
>
> And, FWIW, I am against removing AppleTalk because it actually allows
> you to build your own TimeMachine server using Linux [1]. It's really
> useful for backing up macOS machines over the network.

Thanks, good to know!

> > [1] https://dgross.ca/blog/linux-time-machine-server/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
