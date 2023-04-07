Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EE5C76196
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Apr 2023 12:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240680AbjDGMGw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 7 Apr 2023 08:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240678AbjDGMGv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 7 Apr 2023 08:06:51 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA49083CD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Apr 2023 05:06:50 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-536af432ee5so793230247b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Apr 2023 05:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680869209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyF1/Vq5lXV4j3TvetLF6XNah/cGoRxXMFwP5wEnRsg=;
        b=POxtKb+zfmyfbR12JYTMjFd5ieCbXrFK09rfkEovsSfSHXHqICfVYt/5vc6Zjk1Tqf
         X3zgQqEdEIrUvX3oufCteevAeUgufme/m70HInWyCjkGMYCrzNQdL9QxanCE4FF/4VOG
         JkxCGce+FRNCiwMiOv5Dw4SkDXM6o7Se/SznQbPnYaG2v4SRbBOttCr9whKB68/4CIWK
         VFoEYV4xwtu+R/DL2x63JNtbVbetCeWkVzGgqEthxSmNAT881eW7AbFInGCuEXVFTvyT
         UCzWdgWfApTJ0hc7uvvszxdGd732S6QO8oWC5X1b7Vk1drYvzeyN7zJ4XY4o5A97uzdh
         TYnQ==
X-Gm-Message-State: AAQBX9dmAhsrKnAKQeyyjWOGp7qVKwm7rWEQX8088av6fO3RRk4+wiHK
        pmx9jO9FseCIWeoD16s8+5UluoOJNCFlhA==
X-Google-Smtp-Source: AKy350bSGnu1fmchQgaEI/7mgq1AxKztKMPhqSrXjOzKbylkj++kXgm2CAc5PvnzJGoC/v6jUono/A==
X-Received: by 2002:a81:df0d:0:b0:542:46f5:fb20 with SMTP id c13-20020a81df0d000000b0054246f5fb20mr1468918ywn.13.1680869209510;
        Fri, 07 Apr 2023 05:06:49 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 68-20020a810f47000000b005464236834fsm973320ywp.40.2023.04.07.05.06.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 05:06:48 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id h198so5037055ybg.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Apr 2023 05:06:48 -0700 (PDT)
X-Received: by 2002:a25:76c6:0:b0:b8b:ee74:c9d4 with SMTP id
 r189-20020a2576c6000000b00b8bee74c9d4mr1729017ybc.12.1680869208686; Fri, 07
 Apr 2023 05:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com>
 <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
In-Reply-To: <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Apr 2023 14:06:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
Message-ID: <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
Subject: Re: core dump analysis, was Re: stack smashing detected
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Apr 7, 2023 at 3:58 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> The easiest way to do that is to log all wait and signal syscalls, as
> well as process exit. That might alter timing if these log messages go
> to the serial console though. Is that what you have in mind?

Store to RAM, retrieve through a new /proc file?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
