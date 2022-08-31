Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AC7ECAAD3
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Aug 2022 07:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbiHaHpM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 Aug 2022 03:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiHaHob (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 31 Aug 2022 03:44:31 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39E3BD2AB
        for <linux-m68k@vger.kernel.org>; Wed, 31 Aug 2022 00:44:28 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id a22so7676027qtw.10
        for <linux-m68k@vger.kernel.org>; Wed, 31 Aug 2022 00:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dnPuxbkCUeZdAA61L+aCrNVWqDGiNVVYzU0Dds2HzyE=;
        b=oGAag+ziSV/mLdcQWhNgggDTxyCUc3AxhwC/xdB3PBUsYQslYntuGSggOvIek7t05e
         eN/rC2oiSvxxn7VKl0+hqLYtaYl8Cg4tOJ1AkqkrKyGtnqS96Yc60Wrqge7oG36ZsL5B
         iVIPkbJ+ltMi9gcKcsebKzN1vMFxZuya0K1s/S2LmVuLB7f8bc0ZBmsCm4jAADJJb8j6
         enX9dDUq+7cIMYmSPhro+FHyBXO6IoHDAek415Px/luPHuPDE5lNhw1MO0Li4uHQrxah
         w3OI8odm7WrNNk+NQKopljf5i+X7/bITuyN8k+mtKMxa8lcIw1RQ6dQln/4AFna4Dux7
         bwiQ==
X-Gm-Message-State: ACgBeo0A24UKnuZwgnDDfZpCKvtTPr294149Kwl2I4q2Lz3Ux5pytTEe
        DlNnP+Rr6oEqmMfFhUDZK3PGlKiHHH7igw==
X-Google-Smtp-Source: AA6agR7rnmgpz5mATPbnoCBJZmd25rvECyk5cQJ7cBAAprvyZJOBCQOFyGpnKqpga2Lq19OKUDP75A==
X-Received: by 2002:ac8:7f47:0:b0:344:8d2b:14a9 with SMTP id g7-20020ac87f47000000b003448d2b14a9mr17829200qtk.442.1661931866973;
        Wed, 31 Aug 2022 00:44:26 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id ey26-20020a05622a4c1a00b00344883d3ef8sm7942399qtb.84.2022.08.31.00.44.26
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 00:44:26 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-33dc31f25f9so299331247b3.11
        for <linux-m68k@vger.kernel.org>; Wed, 31 Aug 2022 00:44:26 -0700 (PDT)
X-Received: by 2002:a0d:d691:0:b0:340:f6e7:5654 with SMTP id
 y139-20020a0dd691000000b00340f6e75654mr11841167ywd.502.1661931866436; Wed, 31
 Aug 2022 00:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220831012539.3416470-1-gerg@linux-m68k.org>
In-Reply-To: <20220831012539.3416470-1-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Aug 2022 09:44:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOWHm6HpBRm-MC3PDy0=m6-GbG6s-S2tfGQwZcggpX7A@mail.gmail.com>
Message-ID: <CAMuHMdVOWHm6HpBRm-MC3PDy0=m6-GbG6s-S2tfGQwZcggpX7A@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] m68k: allow kexec on M68KCLASSIC with MMU enabled only
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 31, 2022 at 3:35 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> None of the no-MMU CPU types (classic or ColdFire) or ColdFire with
> MMU enabled have support for kexec yet, so the configuration as it
> stands is not quite right, and it will fail to compile on them.
>
> Make CONFIG_KEXEC depend on both CONFIG_M68KCLASSIC and CONFIG_MMU.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.1 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
