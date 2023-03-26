Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F074C74A5B
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Mar 2023 08:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjCZIX2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Mar 2023 04:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjCZIX1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Mar 2023 04:23:27 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34199ED2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Mar 2023 01:23:26 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-536af432ee5so116533647b3.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Mar 2023 01:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679819006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMPWm/UNWwNEh+tuXqq8buHzHEocFm7N8w/bA5pWOoE=;
        b=tnMYmwt7K6nn7JmgKxylzjw02epmtvCoIcj8OycaCsqdDiYQRxOUHyA67XGALiDDNT
         e5YEs2M4P0JExk48kxilbDCQy9BUpi9gYp1IrN7WhMIkTpZDLvFbycMGYKGQ96UwQTQw
         ZYQjFQduzYrEXMbBX67l8flzZXMA8Z7FO6wAFHhnhHgv/5tsCu+xaJ0JvXBQAdyKDctC
         Qmr5hp/notb6JXuQ5jwNXAnS0qERxLE6H9bVDUSY1U6rGBiM1ZtYFqjwtUguXLFHvePM
         azGZ4JCI1JW5lJOS0VMCkvH9353pI+92QZvvuClyNKBH3ACGnOmX27HpK9yIc/tdVZVC
         zNrA==
X-Gm-Message-State: AAQBX9e5wXPwMCv+XLs4NV3LQxjR5Th4mo7LY9ylhuD1/xMSoLuL3CQn
        YMOTiQWU3oAJHuSA4DInYwyyIBqyed8WO8EN
X-Google-Smtp-Source: AKy350ZpC7HSViaZWKwF7R2WJOMoOmQnoMLbjHz7ibtOXxYdn9x0kBSKe6T3p/q0ECnYygJk+yQw6g==
X-Received: by 2002:a81:d547:0:b0:53c:6f12:3d34 with SMTP id l7-20020a81d547000000b0053c6f123d34mr9170156ywj.30.1679819005755;
        Sun, 26 Mar 2023 01:23:25 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id t10-20020a81e44a000000b00545a08184bfsm1371715ywl.79.2023.03.26.01.23.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 01:23:25 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-545ce8e77fcso38648687b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Mar 2023 01:23:25 -0700 (PDT)
X-Received: by 2002:a81:b65f:0:b0:544:8bc1:a179 with SMTP id
 h31-20020a81b65f000000b005448bc1a179mr3625143ywk.4.1679819004976; Sun, 26 Mar
 2023 01:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
 <CAMuHMdUJ6kbpYGTjyY5dX+-YRv3pL0ydG3HQ-H1khyeqLOa05A@mail.gmail.com>
 <072fd894-ec50-ae5f-2be5-ebbeb0e7b39b@linux-m68k.org> <20230324085927.GA6354@allandria.com>
 <0cd7f288-ba43-7764-01a7-2e1e5c7a1640@linux-m68k.org> <CAMuHMdXi1mF=j_Qzzg971AqHF-JdgfaDd+v0HymXXusFt-WBUQ@mail.gmail.com>
 <20230326000318.GB31801@allandria.com>
In-Reply-To: <20230326000318.GB31801@allandria.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 26 Mar 2023 10:23:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4EKGngXGUuyN6CUh9ByH9sVpZY-2_LsTgCiAMddbxOQ@mail.gmail.com>
Message-ID: <CAMuHMdX4EKGngXGUuyN6CUh9ByH9sVpZY-2_LsTgCiAMddbxOQ@mail.gmail.com>
Subject: Re: [PATCH v2] nubus: Don't list card resources by default
To:     Brad Boyer <flar@allandria.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Brad,

On Sun, Mar 26, 2023 at 1:03 AM Brad Boyer <flar@allandria.com> wrote:
> On Sat, Mar 25, 2023 at 01:44:43PM +0100, Geert Uytterhoeven wrote:
> > Perhaps it would be worthwhile to move the resources out of /proc,
> > but into a separate virtual file system?
> > That way people who need access to the additional info can load the
> > separate virtual file system kernel module, and mount the file system?
>
> I could be wrong, but I believe the more recent trend has been to
> move things like this out of /proc anyway.

Correct. Use sysfs, debugfs, configfs, or your own custom file system
where appropriate.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
