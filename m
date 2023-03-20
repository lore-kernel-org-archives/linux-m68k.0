Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFDAC7618A
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 15:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjCTPsb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 11:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbjCTPry (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 11:47:54 -0400
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE6026A2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 08:39:51 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id jl13so7835064qvb.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 08:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679326791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knDpxN/J+logq/gYSas38uHqDy6FJ5gT1auehUzIlVk=;
        b=egAmDYUETQ0hhrlOtG+go655yg8xyiRPJ4Xo5wkA1ERjHiIEYSyjfXaXsFFXMwJT5J
         3Yq+s7h7b4aqH9TlCXTtMvLmlo8fkS69vrDFnwe8de2R8U4Jz5/IdMN9VG02Q82xQ5A3
         87jGDnZE4SWo7QXiqaflcUQXYbeuKC78sr5M9JlFMdMP+GeIyfYZbRCR1phhFLDMkQnl
         R8BSNiY0KK5k1VA80EGXtsGswT8ODrKD7/8p4se3SJdgW/DRnLHaXz6WWMGFD0Q1uyoU
         Hh5h8s5TbqgfV9NdTJ4vj/v9xfe7sCQYJLJIyntwz+HwDe7KzJhy/PpwiILR2pGUKNCg
         Rg0w==
X-Gm-Message-State: AO0yUKVkqehSc/VB6A8uZbq3921tIqDzf3cOMpqEnRbyEqvoDme15fzV
        2uAYttxC5filLscTB3PKa2TahHluiVWktg==
X-Google-Smtp-Source: AK7set+15iNYoT8xJ4xOMBxNnAbeM6uobXAWT+vlBNuSzop9gXEHZDpvi+55MMLKWtGQXCBt9td/iA==
X-Received: by 2002:ad4:5ba5:0:b0:5ac:7fb9:3c9 with SMTP id 5-20020ad45ba5000000b005ac7fb903c9mr36727652qvq.38.1679326790694;
        Mon, 20 Mar 2023 08:39:50 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id c1-20020ae9ed01000000b007423c122457sm7482402qkg.63.2023.03.20.08.39.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 08:39:50 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-541a05e4124so231460467b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 08:39:49 -0700 (PDT)
X-Received: by 2002:a81:bd51:0:b0:541:9b14:949e with SMTP id
 n17-20020a81bd51000000b005419b14949emr10558480ywk.4.1679326788920; Mon, 20
 Mar 2023 08:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <af0a1f2194fc9a6f8a95cf6c82277b8b0377d029.1679311226.git.geert@linux-m68k.org>
 <CADUfDZocrTZq2MPKFFNuJc5yBabG48EiEURwn7-t2UBuVZxCWg@mail.gmail.com>
In-Reply-To: <CADUfDZocrTZq2MPKFFNuJc5yBabG48EiEURwn7-t2UBuVZxCWg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Mar 2023 16:39:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMih6kqSZaKq5p+UVOjTOCWdeUeif2y2ugtgcVOPmzyQ@mail.gmail.com>
Message-ID: <CAMuHMdWMih6kqSZaKq5p+UVOjTOCWdeUeif2y2ugtgcVOPmzyQ@mail.gmail.com>
Subject: Re: [PATCH] nvme-tcp: Fix implicit padding in struct nvme_tcp_term_pdu
To:     Caleb Sander <csander@purestorage.com>
Cc:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Arnd Bergmann <arnd@arndb.de>, linux-nvme@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Caleb,

On Mon, Mar 20, 2023 at 4:34 PM Caleb Sander <csander@purestorage.com> wrote:
> The nvme_tcp_term_pdu definition needs to be updated anyways to match
> the spec. FEI is at offset 10, so it isn't 4-byte-aligned. I think we
> have gotten away with this so far because the NVMe/TCP driver never
> sends H2CTermReq and doesn't interpret C2HTermReq.
> Mirroring numdl/numdu in nvme_get_log_page_command, the definition
> should look something like:
> struct nvme_tcp_term_pdu {
>         struct nvme_tcp_hdr hdr;
>         __le16 fes;
>         __le16 feil;
>         __le16 feiu;
>         __u8 rsvd[10];
> };

Great, so it was compliant only on m68k? ;-)

> On Mon, Mar 20, 2023 at 4:29 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > On m68k:
> >
> >     drivers/nvme/host/tcp.c: In function ‘nvme_tcp_init_module’:
> >     include/linux/compiler_types.h:397:38: error: call to ‘__compiletime_assert_723’ declared with attribute error: BUILD_BUG_ON failed: sizeof(struct nvme_tcp_term_pdu) != 24
> >
> > Indeed, on m68k the minimum alignment is 2 bytes, not 4 bytes, thus
> > triggering the check added in commit 7e87965d3807ab1f ("nvme-tcp: add
> > nvme-tcp pdu size build protection"), and indicating that NVMe over
> > Fabrics TCP on m68k must be incompatible with other platforms.
> >
> > Fix this by adding explicit padding.
> >
> > Fixes: fc221d05447aa6db ("nvme-tcp: Add protocol header")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  include/linux/nvme-tcp.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/nvme-tcp.h b/include/linux/nvme-tcp.h
> > index 75470159a194d97f..ba8f82672e39730f 100644
> > --- a/include/linux/nvme-tcp.h
> > +++ b/include/linux/nvme-tcp.h
> > @@ -115,6 +115,7 @@ struct nvme_tcp_icresp_pdu {
> >  struct nvme_tcp_term_pdu {
> >         struct nvme_tcp_hdr     hdr;
> >         __le16                  fes;
> > +       __u8                    rsvd2[2];
> >         __le32                  fei;
> >         __u8                    rsvd[8];
> >  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
