Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15263C71153
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 15:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbjH2P1z convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Aug 2023 11:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237293AbjH2P1g (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Aug 2023 11:27:36 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C0ECC0
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 08:27:30 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5922b96c5fcso52009147b3.0
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 08:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693322849; x=1693927649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mvC8ugM1vg8H4dtUsSOCZcrdKtAOjkiFP9GldFzN/o=;
        b=hSYOAkacxKeNeWQxh29JXRn01X2mFeaE3rZI4MOKnqJVuFGqkQItq/gtN/8TMpsnZO
         oEc7MB5tVNAnLcFtTDLdxb42LUVeOk3BlrJdkhXj/bp3bJQLMcSVu4Wke0crAyASCjbI
         Nqvyd0AoyRUUELfs5rJNnEXlHeC8RWezketwtgOHnVrrInX69W1fsMUH/DEORW5rvrHU
         iNjmzjL/i2FaZnjshU55qQZOdTCZi2dUHznjUzxwM/ixJYEucHWv81AWiuUND0HFYoZd
         3uIsXsnh12pjD7lkSfbaBlAUKQSdtN6jdW/yIzXSO/HX0Szui0tVbCbF0Piq7zp4DT5y
         AgMg==
X-Gm-Message-State: AOJu0YyoNP/7b29+QZKeMOdJZyrdtadpZRVNHB8+pOJWRQgBSQ9lcFCN
        MUsBEuGaLOO1tQBsBZVz21WopbbpUVhqIQ==
X-Google-Smtp-Source: AGHT+IFu+4qlfpKf4QnC1UGggpRGvCaMniOZRyzwQdVi1QIT0KkyyzkcT1N4v22Imna8t9e9SJjAmg==
X-Received: by 2002:a25:ae5e:0:b0:d7b:95ff:14f with SMTP id g30-20020a25ae5e000000b00d7b95ff014fmr351110ybe.61.1693322849595;
        Tue, 29 Aug 2023 08:27:29 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id k144-20020a252496000000b00babcd913630sm2265082ybk.3.2023.08.29.08.27.29
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 08:27:29 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d78328bc2abso4110682276.2
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 08:27:29 -0700 (PDT)
X-Received: by 2002:a25:ae1b:0:b0:d2c:32cb:c631 with SMTP id
 a27-20020a25ae1b000000b00d2c32cbc631mr29029382ybj.27.1693322849035; Tue, 29
 Aug 2023 08:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
 <dba7fd40-00ee-0ac1-19fd-5ec146aca972@linaro.org> <87134fda9b761e3f81588d440242b9a4e986ddbf.camel@physik.fu-berlin.de>
 <mvmy1hv71d7.fsf@linux-m68k.org> <c39646c885102448c49a4797140e4fcfd1769717.camel@physik.fu-berlin.de>
In-Reply-To: <c39646c885102448c49a4797140e4fcfd1769717.camel@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Aug 2023 17:27:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGsm5kScKuRnGm0N6sjeOfwTU3jS7-zUmkadqkVfZ2UQ@mail.gmail.com>
Message-ID: <CAMuHMdWGsm5kScKuRnGm0N6sjeOfwTU3jS7-zUmkadqkVfZ2UQ@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Finn Thain <fthain@linux-m68k.org>,
        James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Tue, Aug 29, 2023 at 12:51 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2023-08-28 at 15:17 +0200, Andreas Schwab wrote:
> > On Aug 28 2023, John Paul Adrian Glaubitz wrote:
> > > After all, we had to change the ABI for TLS support as well, didn't
> > > we?
> >
> > Nope.
>
> So, any binaries from Debian Potato will still work against glibc 2.38 on m68k?

They should.

I regularly boot filesys-ELF-2.0.x-1400K-2.gz, which was created in 1996,
right after m68k switched from a.out to ELF. Any failures are reported
(yes, this does happen, ca. once per decade), and fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
