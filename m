Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2955CDB474
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 07:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbjJQH7W convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Oct 2023 03:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbjJQH7V (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Oct 2023 03:59:21 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52C6F1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 00:59:17 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9beb863816so1987447276.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 00:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697529557; x=1698134357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9M3vO8TKvpu7sLT3D9MNM+ZNPQeT7q9+/iFi4wqDgU=;
        b=DbhsjBHHWmfFyNMrtTMXk2XXPD4XNS0Pjck110rnFV5ZOemQOQ5lC6GKIn7Kpf1sXw
         gc/cleZ0fYIeybmtXi0WF99CML7JLBmTlMkPoGGwFRMuBErwEY59neXHJvgr/+dTn2S4
         wR6xuf05DAYH4OgznGzdCUUw6x90SMUr1gv3gAu+mpoJhHbHS6u0QbaqenwlSHmRuKQT
         xj7O650G5VuBsKfDU6W1tLbXVPmkKvJQCFafXqp2QMEaAf0jWA6zsnt2ii3okIU8CBYN
         EybcD0e9E1IP50el2CBHUxjjfsdVraPkd7ZtM0zYXa6ba3pDOL88+MSh21/WT8G0ZTHn
         EuiQ==
X-Gm-Message-State: AOJu0Yyg/usetki8vRh4y8uM6Sly+QJkFTI5FeJ3l0RdHQyx04zHRlHb
        mRRS3ZGQVsl0c3aGd35FSp5OPAerdCdijg==
X-Google-Smtp-Source: AGHT+IGIKqe6RdTJHGNSjw4jhNjir+w00STwKIJtWOfKklHANVueHIkTg2zImzvQ1bDl5p4fW+dQXw==
X-Received: by 2002:a25:1105:0:b0:d9a:5aa0:7a30 with SMTP id 5-20020a251105000000b00d9a5aa07a30mr1306934ybr.39.1697529556619;
        Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id k13-20020a25fe0d000000b00d89b8bf0147sm339459ybe.15.2023.10.17.00.59.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5a822f96aedso47252087b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 00:59:16 -0700 (PDT)
X-Received: by 2002:a0d:e9c2:0:b0:59b:c6a4:15c7 with SMTP id
 s185-20020a0de9c2000000b0059bc6a415c7mr1352703ywe.46.1697529555871; Tue, 17
 Oct 2023 00:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-4-hch@lst.de>
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 09:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXO94MVoNVh+=meozYXRwpV8jPTBivLJfDHVTvJn7nW4g@mail.gmail.com>
Message-ID: <CAMuHMdXO94MVoNVh+=meozYXRwpV8jPTBivLJfDHVTvJn7nW4g@mail.gmail.com>
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
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
> ARCH_R9A07G043 has it's own non-standard global pool based DMA coherent

its

> allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
> Add a proper dependency.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
