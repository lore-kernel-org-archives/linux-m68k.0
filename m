Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC24CDB482
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 08:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbjJQIsh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Oct 2023 04:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjJQIsh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Oct 2023 04:48:37 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AF793
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:48:36 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a82f176860so45052907b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532515; x=1698137315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wdO2B9/QvvZjPAQkmDCzsWoJIs0Ay3wdYhcrR1VVXg=;
        b=HJUDL/aT/0mszKR4eJuQByesx8bx9aOFdQFXphf5Cm5YzvdsuI9+oiMputzqAJzF3e
         7/t+xvgxLU/5THKhsxeIxN1wOnQvpZo/Cths9wdFyr1MW3NT9ZV35UskIwMvTj79xUQY
         FFZjOfhQoJPXzXYvd7dwFOtvRdI8n3AIEHZv59mNtWOrmisc/xj5LLpfv6p3i4UD9qNu
         NdPcmLLwYaShkSpwZ/L0xZoLzmZ0gCb0Rx0KabJkGX4yjHCHTJnpN3flm6+N2qWYvSks
         GA9sNsQdoBrKOGY+SGlyr2sV4sD8v0TztlnQUW4mfBH9Tlvw6SJqS9kz6rdfdWzaD7YD
         CYug==
X-Gm-Message-State: AOJu0Ywopj1BdLgHJ9HgHapWe4R+FsGby2opgMMzrAnhI5o8Gj2OJA2d
        sNavQGreLEAneHXaGqpm+g7B003MemFdVQ==
X-Google-Smtp-Source: AGHT+IErK4lwvJonBD1A8rFNaqEEQ6zNVUBmrehAoCHGUdEHqJVBtaIv4G2lqfKTu4O/sNV4DPLhug==
X-Received: by 2002:a81:4996:0:b0:592:ffc:c787 with SMTP id w144-20020a814996000000b005920ffcc787mr1712022ywa.30.1697532515074;
        Tue, 17 Oct 2023 01:48:35 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id v196-20020a8148cd000000b005928ba6806dsm441948ywa.97.2023.10.17.01.48.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:48:34 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a82f176860so45052647b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:48:33 -0700 (PDT)
X-Received: by 2002:a05:690c:dc8:b0:5a8:5079:422 with SMTP id
 db8-20020a05690c0dc800b005a850790422mr2326403ywb.26.1697532513384; Tue, 17
 Oct 2023 01:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-13-hch@lst.de>
In-Reply-To: <20231016054755.915155-13-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:48:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgM1FMKSJcq4QD9Gc=B8XF7_jWxhm634bTYQ9a6voVhA@mail.gmail.com>
Message-ID: <CAMuHMdUgM1FMKSJcq4QD9Gc=B8XF7_jWxhm634bTYQ9a6voVhA@mail.gmail.com>
Subject: Re: [PATCH 12/12] m68k: remove unused includes from dma.c
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
> dma.c doesn't need most of the headers it includes.  Also there is
> no point in undefining the DEBUG symbol given that it isn't used
> anywhere in this small file.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
