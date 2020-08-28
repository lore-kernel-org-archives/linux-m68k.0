Return-Path: <SRS0=7lc4=CG=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAD1C433E2
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Aug 2020 08:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84EC52075B
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Aug 2020 08:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbgH1I6a (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Aug 2020 04:58:30 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34938 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728756AbgH1I63 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 28 Aug 2020 04:58:29 -0400
Received: by mail-oi1-f195.google.com with SMTP id k4so238898oik.2
        for <linux-m68k@vger.kernel.org>; Fri, 28 Aug 2020 01:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aX8wNPsdG2obLb/PY5tOiN583kFdxytSO3N1mPHQzb8=;
        b=jEPVoaoRm/k5aFl7GkWHHBe6eY98pUlHOqd8FScybSNOtOz9Uc0vUep/FD6OB3+Iuu
         SsaIEcMYTE0TB+FzNpfY1/5BTciVQln8hDEClCrdyksA2kALAOhHKrTsfDBIL8SQPwqh
         j3meleObyrRHPMG/YYHcUOPFzpSOxD/Bd6KuiDLxXUQUeURb1X2JTFxeIJ4NTIsoAxch
         R+YlbA1atgfcSVrk8XJ1F8p61QNQhcJEOeVq/12xNXhTgJA9u62xoKpyAa5aMEbXzg8V
         2Sfn0clxr6Y9YacoNZxNUP37eb3JhsPwrZ4Iac7ZKw5n6zoGCrBRW+txXAr7w6OlwaZ2
         4uHg==
X-Gm-Message-State: AOAM5332HVr4b9o6qNMmR4eWyz02Uh3FzoTtB/AUVjioeycitM9LneNF
        1Td6TxZQ6WmuVfSPJ3mqFb3O9cyJShHf/Qoyeck=
X-Google-Smtp-Source: ABdhPJxE0qMFgd1XF/GxZoeAveIjy6B+I3xO2CiVgZ4NVDtiE5ptNxB8n+Il3sq1TwOEbZMfBl5CjDxvyFq7AHjL+VM=
X-Received: by 2002:aca:3402:: with SMTP id b2mr328558oia.153.1598605108001;
 Fri, 28 Aug 2020 01:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com> <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com> <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
 <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com>
In-Reply-To: <0292f4c9-40c1-6469-07f6-91722806216b@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Aug 2020 10:58:17 +0200
Message-ID: <CAMuHMdUi=rFjiQRsAsBSAxr668wgxAWCL_xAszW5Fi8dn_SRww@mail.gmail.com>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Aug 27, 2020 at 9:29 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 27/08/20 9:19 PM, Geert Uytterhoeven wrote:
> > On Thu, Aug 27, 2020 at 2:08 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> On 26/08/20 11:23 PM, Geert Uytterhoeven wrote:
> >>> As your email subject didn't contain "v3", b4[*] insists on picking up
> >>> RFC v2, and refuses to pick up the latest version, even when forced
> >> Argh - I thought that since the first two were tagged 'RFC', I could
> >> just restart with v1.
> >>
> >> Never heard of b4, sorry.
> > It's the new tool to download patches and patch series, adding
> > automatically any received *-by tags, and the Link: tag.  Makes my life
> > easier ;-)
>
> I take that as read. Rather you than me :-)
>
> Do you want me to resend this as v3? And any preference on the branch
> test (non-zero, or -1)?

No need to resend, unless there will be a v4 ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
