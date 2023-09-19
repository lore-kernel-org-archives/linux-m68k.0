Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E19CD3447
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Sep 2023 07:20:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbjISHUQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Sep 2023 03:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231700AbjISHUP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 19 Sep 2023 03:20:15 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D283114
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 00:20:09 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d801c83325fso4903331276.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 00:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695108008; x=1695712808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oo6GeNFpLlGOQI2skflDC69t+uMur/RFCpLqTRniHYk=;
        b=w3TQsXmp03xoV4OLC1lj/kt3ye2COZ01bRZ8Q9qH+6FfbfG4HWvHDWBhbgtA/0Mr7w
         GLvAsW5eE2+P56XKIrdF4RRPkPQbMwMKFUAKQdgY39Y2tWufALwcDgSNO+vKpUT7SHlE
         S7j4m5XKF/zscQtmZjjQm9ekamC0xhhPh7ATuEygbPeY98838+BVmqyHB9MdStJTyPIP
         dF3mSjnQR1/3Yqx1Xfc0QOD++Ms6eyWlcymUF7Ww8KuDWpvwRAAkgKYnQUM3NPxny+i5
         kPnGgvCA5jUTDeXf8LMcxK4XnAl3Q4vE2feMKb8lciB2yVz828JU548E6a4c4yIe6MAD
         0Opg==
X-Gm-Message-State: AOJu0Yx6Jjm/cZQx1XoOCMi1zQWH1MLVgr9DfkYzYP5HKlspH3e6J4nL
        3nFuzWUpT+nDoBv0yrCcBnjxBI0ggCQdBQ==
X-Google-Smtp-Source: AGHT+IFatsyCoa28rWGnVGgnt2NnGOCf/Nfz0PiBEypCzDQF8uzh4SBYlaumS1uxSjCsmr7jozzZgg==
X-Received: by 2002:a25:d292:0:b0:d81:4ebc:242e with SMTP id j140-20020a25d292000000b00d814ebc242emr9931853ybg.45.1695108008437;
        Tue, 19 Sep 2023 00:20:08 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id u35-20020a25ab26000000b00d71c764379fsm2745622ybi.55.2023.09.19.00.20.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 00:20:08 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59ec6d7bb89so10536657b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Sep 2023 00:20:08 -0700 (PDT)
X-Received: by 2002:a0d:db50:0:b0:59b:cda7:893e with SMTP id
 d77-20020a0ddb50000000b0059bcda7893emr11229694ywe.15.1695108008002; Tue, 19
 Sep 2023 00:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918175529.19011-6-peter@n8pjl.ca>
In-Reply-To: <20230918175529.19011-6-peter@n8pjl.ca>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 09:19:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQaBBZgSsgZyNR2HxMsck2fWNjG6fK93eBFFeyDz0Hkw@mail.gmail.com>
Message-ID: <CAMuHMdVQaBBZgSsgZyNR2HxMsck2fWNjG6fK93eBFFeyDz0Hkw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arch: m68k: remove ReiserFS from defconfig
To:     Peter Lafreniere <peter@n8pjl.ca>
Cc:     linux-m68k@lists.linux-m68k.org, jack@suse.cz,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Peter,

On Mon, Sep 18, 2023 at 7:57 PM Peter Lafreniere <peter@n8pjl.ca> wrote:
> ReiserFS has been deprecated for a year and a half, yet is still built
> as part of a defconfig kernel.
>
> According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> filesystem is slated to be removed in 2025. Remove it from the defconfig
> profiles now, as part of its deprecation process.
>
> Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>

Thanks for your patch!

Given these defconfigs enable ReiserFS as a module (not built-in),
and that ReiserFS is still available upstream, and enabled by distros
like Debian, I would like to keep it that way.
The m68k defconfigs will be updated after the removal of ReiserFS,
as part of the regular defconfig resync.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
