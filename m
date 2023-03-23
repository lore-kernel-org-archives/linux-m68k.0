Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF87C6FD1C
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Mar 2023 08:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbjCWImu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbjCWIme (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Mar 2023 04:42:34 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195F518B26
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 01:41:35 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id s12so25680441qtq.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 01:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSRon8uumSXX+lBmL3TUcSnxJVfZ7VdRDnDW9u3FBoo=;
        b=ilfAiqz1mVmFFvIcTfBgsKXfXJ2MkBUvjX6YOcC83V6C/3jyOjsrvsnNkyOcIaLyFS
         awuBzwSq07qRKvA4tWUXnsEBMShBGSe6A/yfmtqr7Lkz2mEHJwZt4RpnfC+xjjrhW7+f
         scbArOULV9sFGFIH+NHKiaWjoSFO2sxeu+14RYnktncARKUW/553WK3d/UIUoKytLuKa
         3HAk+Ls/XRmmpM/jaSOJ/n8kR1EbUaNe8qBQ7RNgqRJO+BPWrltfwNnBdzseZ2jCHPTs
         byELDx0hNCPrjf8j9hHK3TTuUEA/RKVfwHEJ+i0WLYRKGCIqZKetjPC/owxyUv+eZ7gN
         V++g==
X-Gm-Message-State: AO0yUKXpJ7CSqhfsdbJYkoB3RFX3fFD0bftSZMPWeg++Kp0rLbNQh40W
        yE/y8CNaQJWy6uH3/CEiLl6m3tu9AjZCKQ==
X-Google-Smtp-Source: AK7set8b2jLNmPlXGt/SCuHDulsrRSXm+j++NDZCCYeGhOUNKVESh/ioTc7zJ4/nW/8y3I9xwPDACg==
X-Received: by 2002:a05:622a:1491:b0:3e3:5ac8:c17f with SMTP id t17-20020a05622a149100b003e35ac8c17fmr11316120qtx.4.1679560893902;
        Thu, 23 Mar 2023 01:41:33 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id x22-20020ac84a16000000b003e1d8c193c1sm6672846qtq.48.2023.03.23.01.41.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:41:33 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id k17so13141481ybm.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Mar 2023 01:41:33 -0700 (PDT)
X-Received: by 2002:a25:800d:0:b0:b3b:6576:b22b with SMTP id
 m13-20020a25800d000000b00b3b6576b22bmr1711103ybk.12.1679560893219; Thu, 23
 Mar 2023 01:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
 <mvmttybx3ng.fsf@linux-m68k.org>
In-Reply-To: <mvmttybx3ng.fsf@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Mar 2023 09:41:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQ3+OUKZ-6DqcJfMgq8_90Cejzc=onhUmbaYTWJkZHRw@mail.gmail.com>
Message-ID: <CAMuHMdUQ3+OUKZ-6DqcJfMgq8_90Cejzc=onhUmbaYTWJkZHRw@mail.gmail.com>
Subject: Re: [PATCH v2] nubus: Don't list card resources by default
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On Thu, Mar 23, 2023 at 9:39 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Mär 23 2023, Finn Thain wrote:
>
> > Checkpatch says "externs should be avoided in .c files" and if this one
> > appeared twice I would agree. But as it only appears once, I can't see
> > any advantage to putting it in a new .h file instead of the .c file...
>
> Anything wrong with declaring it in <linux/nubus.h>?

It's not meant for NuBus device drivers (at least in its current form).
So a drivers/nubus/nubus.h would be the most logical place.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
