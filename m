Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03CDC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jun 2022 07:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242968AbiF1H1w convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Jun 2022 03:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242975AbiF1H1g (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Jun 2022 03:27:36 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D8A2CE23
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:27:34 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 59so18839723qvb.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hwgLtruPC06mcRCnQAsf+kJqHCP1mf00hTNnpiQ34M0=;
        b=q+lBNORnq7ADPqfWMr7i79DW05JeVuijIh4xhSPe7k2WiwDgWK9nTx/y3jLqz9358S
         kkBZGNnJLVmVDMhrF/KwFUu14TNNXsOIDWLMRbdvhBHI+44wjKU0oq8yuBFNAXsxDQTv
         uUY7+/BXWpvYZQ9xOeIvi9lyQ2NPY4zjuy6gWpgNiOIxsceAeDYg1sTJKcnzT6T1sSND
         JLEpFAGaA8gXkkuHwqVpNMqjTMb8cajevmoG0zK10ohtnuR6DM5dWHLn4SFVFikO3nfF
         GNUET3+y21jZ/qajcOOVJRzPJjYC0X491NDCIkMaRvp1vZn9kmFM8N1zrIbG4LZ65+nh
         0AOw==
X-Gm-Message-State: AJIora8xz91nMKu/wkn4mxqMiXblSsRN2IbDVrqhhN6s6/KZDGeXJ3Ft
        2Dv9qFXDPhfnOiR2gb6IoPoJUeTvuM+Xw4+u
X-Google-Smtp-Source: AGRyM1tiPow0pKJFqtaLBjNnoRE6lyaqYICU3GnbwmLyrpb8jkPKAg1wB+uoo1+vfbbh8HfoFrFVqw==
X-Received: by 2002:a05:6214:2588:b0:470:4592:1039 with SMTP id fq8-20020a056214258800b0047045921039mr1373936qvb.123.1656401253821;
        Tue, 28 Jun 2022 00:27:33 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id cc18-20020a05622a411200b0031b7441b02asm2225696qtb.89.2022.06.28.00.27.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 00:27:33 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-31bf3656517so16819687b3.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:27:33 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr20762801ywg.383.1656401253054; Tue, 28
 Jun 2022 00:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220627180432.GA136081@embeddedor>
In-Reply-To: <20220627180432.GA136081@embeddedor>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 09:27:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
Message-ID: <CAMuHMdU27TG_rpd=WTRPRcY22A4j4aN-6d_8OmK2aNpX06G3ig@mail.gmail.com>
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>, dm-devel@redhat.com,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        linux-btrfs <linux-btrfs@vger.kernel.org>,
        linux-can@vger.kernel.org,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net, io-uring@vger.kernel.org,
        lvs-devel@vger.kernel.org,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        nvdimm@lists.linux.dev,
        NetFilter <netfilter-devel@vger.kernel.org>,
        coreteam@netfilter.org, linux-perf-users@vger.kernel.org,
        linux-raid@vger.kernel.org, linux-sctp@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        scsi <linux-scsi@vger.kernel.org>,
        target-devel <target-devel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        V9FS Developers <v9fs-developer@lists.sourceforge.net>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Gustavo,

Thanks for your patch!

On Mon, Jun 27, 2022 at 8:04 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use “flexible array members”[1] for these
> cases. The older style of one-element or zero-length arrays should
> no longer be used[2].

These rules apply to the kernel, but uapi is not considered part of the
kernel, so different rules apply.  Uapi header files should work with
whatever compiler that can be used for compiling userspace.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
