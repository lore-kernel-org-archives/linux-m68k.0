Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B393C77B7E
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Jun 2023 07:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbjFAHqn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Jun 2023 03:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbjFAHol (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Jun 2023 03:44:41 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8151712
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Jun 2023 00:42:28 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3f80cd74c63so4989001cf.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Jun 2023 00:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605347; x=1688197347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC4AZRVcHnRKNLMlbDCAYeJz9LlsudAe96MnAggdWqk=;
        b=WkWnqZmdM5ufvVHo8+iz/M0OU31LEGMLWX61Ae7yiJPCBr0XQaW/PnriTVSNukyFY8
         3LQu20vvWErbO/tKVTLnsGZ0cHpXjYeWuvrJTnE7jnsvCGqbxwZFje7tQPydWhDfPhTY
         v4ruXti7cI7TPRUS/M7mMPpkFku2pgPRvKNNjWWg+I0QRyMaK/xqPVrHQw7CzjP1kKaG
         JuBVfM3GqFoL7stLpXV4HkMovLbFQb044y91v7pXSOCziV0+KQk+nqz4Og8bcPVqA0+L
         Sn21zNnkIm6k/gyV3oIlmYQ6PxbU2r0sYMvJ4s+W/wUfUXL1fR7U6ph3lfl20OFfbcRt
         f9GQ==
X-Gm-Message-State: AC+VfDyQiVN5GF7IwsewTPFm+0ly4szJKivLI5zC20+zNUTOICKDgBu7
        hk4OQ77qoCH73QjYktcwQSqKzTIRCs7cFQ==
X-Google-Smtp-Source: ACHHUZ7XQvhHes/uGxMInmDPtkfvW/LdZ+6rExV5Tkk/M7nJgUD+rngfMYZbEVPHmXY0jWZzaaaJIw==
X-Received: by 2002:a05:622a:42:b0:3f5:938:db47 with SMTP id y2-20020a05622a004200b003f50938db47mr9895560qtw.11.1685605346636;
        Thu, 01 Jun 2023 00:42:26 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id y14-20020ac8524e000000b003e3914c6839sm7221958qtn.43.2023.06.01.00.42.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-75affe977abso58356585a.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:75b:23a1:3603 with SMTP id
 ea16-20020a05620a489000b0075b23a13603mr8693674qkb.20.1685605345152; Thu, 01
 Jun 2023 00:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-31-vishal.moola@gmail.com> <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
 <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
In-Reply-To: <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jun 2023 09:42:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Thu, Jun 1, 2023 at 9:28 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 11:33 PM Vishal Moola (Oracle)
> > <vishal.moola@gmail.com> wrote:
> > > Part of the conversions to replace pgtable constructor/destructors with
> > > ptdesc equivalents. Also cleans up some spacing issues.
> > >
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume this series is supposed to go through some mm tree?

I think so, so your Acked-by would be appreciated...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
