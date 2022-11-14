Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFEEC4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Nov 2022 15:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236990AbiKNPjp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Nov 2022 10:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237149AbiKNPj3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Nov 2022 10:39:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3BA2E9FE
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 07:39:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2A1EB8105F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 15:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7D2C433D7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 15:39:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YHHbSmZo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1668440352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oBkBwgBykfqQ+4RPvWRXFPq/+cbRK38RBj18B1Nl6wU=;
        b=YHHbSmZo/3BdFo568MdWAj2gmQ42bBjTZvl1L8wiqz6rLBKIFCvMeOUrSpTEwlzgiwDsFz
        oZbds3kxlnXSjugugiPFLy2uSjMhaZTatDw9tJQKix8GsBEhkmeH/fQbVJ+G7dsaJeYiWE
        TSRQgqCeG+LI+OK+3dYshynmYVcq80s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4125a94f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-m68k@lists.linux-m68k.org>;
        Mon, 14 Nov 2022 15:39:12 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id b81so5128975vkf.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Nov 2022 07:39:12 -0800 (PST)
X-Gm-Message-State: ANoB5pkYbLPNUQOjeIRLS0+zeXRwL6mAI5CE73S6NuG/xNpI1XCEUJ/1
        A7LQapc2vmVLjF4gYvvg+vOK+GqwiJLT5qX5UsQ=
X-Google-Smtp-Source: AA0mqf6b242IuCLyVvk1QI6aNfNb5cnEIoGsxTd/ieKi8H9nGnGpfbZoB1b6bsqXRs9BhDATBsV+d5zB3uaR2RY16Vw=
X-Received: by 2002:a05:6122:18a5:b0:3ab:2f01:7f0e with SMTP id
 bi37-20020a05612218a500b003ab2f017f0emr6659220vkb.37.1668440351836; Mon, 14
 Nov 2022 07:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20221111013532.494463-1-Jason@zx2c4.com> <Y3Jfb5fUnX3skm3+@vergenet.net>
In-Reply-To: <Y3Jfb5fUnX3skm3+@vergenet.net>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 14 Nov 2022 16:39:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9oMiDixKuC==sEHk3O5vfEV_67ouLjtUYQOnfSp9decxA@mail.gmail.com>
Message-ID: <CAHmME9oMiDixKuC==sEHk3O5vfEV_67ouLjtUYQOnfSp9decxA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND kexec-tools] m68k: pass rng seed via BI_RNG_SEED
To:     horms@kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Simon,

Sorry about that. Not sure why my toolchain missed it. v3 coming up.

Jason
