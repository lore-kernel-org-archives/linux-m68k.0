Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A84AC4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 07:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CFA661242
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 07:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbhHWHhI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Aug 2021 03:37:08 -0400
Received: from mail-vk1-f170.google.com ([209.85.221.170]:35564 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235038AbhHWHhI (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 23 Aug 2021 03:37:08 -0400
Received: by mail-vk1-f170.google.com with SMTP id t11so3981571vkc.2
        for <linux-m68k@vger.kernel.org>; Mon, 23 Aug 2021 00:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MVKF+IYozWYoxwAV1zdH648y1hOnJvzjpupNCRpaxHM=;
        b=foZjN70ytife/mvBFl1KqgtqTNrTpApiPEj1p+lLfpOdrCTIOsVgnPFNtfawVZ3aQ7
         SvEAfOjhzomBgA1ocP8dJNoIi8sYUlOHM+SgjULcHhb8BzSSbygyz1JsDFuuVzb6DDyj
         hS4b0dO2uzyy1YowbsZ5oj8lV0QBuGMcBM5yUIHmqNHcZtVuGuSshp1ezS99pUJoikVg
         UCjX7t+nfpZwzCo7BJbj10jRymbyqePMq63EUG+5nr0AMfGQEIavF/39iTxeQqzQa8DF
         vRsBIBWpG65pLUk1vuN2KejDVeZo2K4ywaEkySCKHlwePFfMRbvHwyxvKy495DyV55Qg
         Q8XQ==
X-Gm-Message-State: AOAM530G/PjLLf8CJJUf2rlxQ7FYXSioKdLqq8RTfB5/MouHwYPcjzPu
        fnPug+5/84S1kXWWKxE4B+Eqlib04WNa2JKMTCQ=
X-Google-Smtp-Source: ABdhPJx+GkiVcJKTVZctI8AGe85weNh9GJ2/hN/qEKIb+Qu2pHbpGUc9AUR9DVjheLwnBZxnZFEw0+L0qpX5CtW/ZW4=
X-Received: by 2002:a1f:5c83:: with SMTP id q125mr11878434vkb.9.1629704185853;
 Mon, 23 Aug 2021 00:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <1629601866-4410-1-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1629601866-4410-1-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 09:36:14 +0200
Message-ID: <CAMuHMdW5duhQE66nkOkOsURg2SoVgjAuHrZw0tGge7Eop6=mhQ@mail.gmail.com>
Subject: Re: [CFT][PATCH v2] net/8390: apne.c - read out and log PCMCIA
 cftable entries
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>,
        "Debian/m68k" <debian-68k@lists.debian.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Sun, Aug 22, 2021 at 5:11 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Read the card's CISTPL_CFTABLE_ENTRY tuple, and log to the
> kernel log buffer. This tuple ought to hold information
> about the IO width of the card memory window that can be used
> in autoprobing to detect 16 bit datapath cards.
>
> CC: Debian/m68k <debian-68k@lists.debian.org>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

> --- a/drivers/net/ethernet/8390/apne.c
> +++ b/drivers/net/ethernet/8390/apne.c
> @@ -127,6 +127,8 @@ struct net_device * __init apne_probe(int unit)
>
>  #ifndef MANUAL_CONFIG
>         char tuple[8];
> +       char cftuple[258];
> +       int len_cftuple = 0;
>  #endif
>         int err;
>
> @@ -168,6 +170,20 @@ struct net_device * __init apne_probe(int unit)
>                 free_netdev(dev);
>                 return ERR_PTR(-ENODEV);
>         }
> +
> +       if ((len_cftuple = pcmcia_copy_tuple(CISTPL_CFTABLE_ENTRY, cftuple, 256)) < 3) {
> +               pr_cont("no cftable entry for card\n");
> +               /* XXX: shouldn't we re-enable irq here? */
> +       } else {
> +               int i;
> +
> +               pr_info("CFTABLE_ENTRY tuple:\n");
> +               for (i=0; i<len_cftuple; i++) {
> +                       pr_cont("%hhx ", cftuple[i]);
> +                       if (i > 0 && !(i % 10)) pr_cont("\n");
> +               }
> +               pr_cont("\n");

print_hex_dump()?

> +       }
>  #endif
>
>         pr_cont("ethernet PCMCIA card inserted\n");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
