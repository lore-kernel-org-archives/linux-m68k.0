Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68221C2B9F4
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Jun 2021 18:42:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 425F260FDB
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Jun 2021 18:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhFYSov (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Jun 2021 14:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYSov (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Jun 2021 14:44:51 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1875C061574
        for <linux-m68k@vger.kernel.org>; Fri, 25 Jun 2021 11:42:29 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id a2so8573046pgi.6
        for <linux-m68k@vger.kernel.org>; Fri, 25 Jun 2021 11:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=iqkVGvlGqvnagaeE+6ZdPO8ENhnfxCC1XyhBdWI8das=;
        b=VgP2tDiFk5Iw++DNlQtucxUt86pdkWDohObWTWOIz4R99Kw3WmboOQch9cdHPZ9iDF
         LIFgWL1bHdM4LX02Qgr1sY2NDJcp9ZsE8/pDn4B9one8kfbgMGtUX7k8M621p0AR5ORS
         rK7cW9RztlNk6l+LEoho/jZW/APgiYwd3r0BDdGzsJao9ldejChdgpMit5VIkrZcksDY
         11mTkMBHx+ZvaRmLxMNf/Y0s1EuirfWObD2+V3CnbR4KkuJYeXBz7lqJ8yonxH6nL07Z
         QtAyDbLx6lhqC3l5hca2pj4Om2MpNCLhaEjKNgh0ShYAga1ALbJVKpncP2/w70GzlEr2
         78yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=iqkVGvlGqvnagaeE+6ZdPO8ENhnfxCC1XyhBdWI8das=;
        b=siBeC58vnt8oYo4QPNv2SeKmDPeQqoNStFIPIe9BW72Pp8vEXyarac8/4QN5MXe5/r
         Yd2tJ/raYv3/oErHlrrMukvVYzALkwn16u06KevoaFsLIrUwaAWJ2OxAHaLoHDODEL2f
         qd+42X3l6xCnX9PL1SZ0lv4XCktgvQ5SF8SKKbWDTwTHrm0pC92wHSfbMBB3geVXhGoh
         BkAHI+hm3t7XYN4x78VhopGXWXOQASKBJiQgCjSki6QSNmGSJTyn8iF5jmWHOrOoA2Yq
         Ylvp200HaIHQ3Oc1sH2gCn0wLgUXXwEMVHls7gO3RBCxYIbGpwnA3CJNsiNqS76IfGOV
         3x9A==
X-Gm-Message-State: AOAM5308GZa3akTwTqU5dh4zEKpdURbmqA+X6oc5j0CvmT3RoWbOfOJY
        zI+BMkbaC0KnbnMzDkF/LYm5BreDrPE=
X-Google-Smtp-Source: ABdhPJwoDkyUqVHZb2qYvEWN5EBnDdA6JGtWmDm6ZHTUCHwF/F0RBwGMYU0+2ZcFwhCh/NoMhz6HlQ==
X-Received: by 2002:a62:5c1:0:b029:2a9:7589:dd30 with SMTP id 184-20020a6205c10000b02902a97589dd30mr11917020pff.66.1624646549046;
        Fri, 25 Jun 2021 11:42:29 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id p1sm6213088pfp.137.2021.06.25.11.42.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Jun 2021 11:42:28 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
 <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdX-JBTAWDvFQg7nVGwwxu8o6sX1GYVF0ha6JpZxOxuG8g@mail.gmail.com>
 <78dee109-3714-073c-110b-3d023f66f815@gmail.com>
 <CAMuHMdVtyTyC0L-LZPZCdNsaaxqcVLXky4dsd3m8uyyLUm9drg@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3c7cb5b1-4a31-2802-dc60-021c67aa06d3@gmail.com>
Date:   Sat, 26 Jun 2021 06:42:23 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVtyTyC0L-LZPZCdNsaaxqcVLXky4dsd3m8uyyLUm9drg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 25.06.2021 um 19:31 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Thu, Jun 24, 2021 at 11:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 23/06/21 7:35 pm, Geert Uytterhoeven wrote:
>>> BTW, there was also "[PATCH] [WIP] selftests/seccomp: Add m68k support"
>>> https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261315050.25325@ramsan.of.borg/
>>>
>>> I kept on up-porting it, but haven't exercised it recently.
>>
>> See attached for test results on my ARAnyM image (Laurent's qemu image,
>> essentially).
>>
>> Is that any different from what you got in your earlier tests?
>
> Fortunately lore has a better memory than I do ;-)
>
> https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261612360.2926@ramsan.of.borg/
>
> mine: FAILED: 35 / 86 tests passed
> yours: FAILED: 35 / 87 tests passed
>
> So one new test, and it fails?

Looks like it. I must be missing some mail in my mail archive, can't 
recall ever seeing that one.

There's one new test added after your mail was sent - KILL_unknown. I 
suppose it's that one.

Anyway, both much better than without seccomp support. And going back 
over the archive, I found your patch where you added seccomp.h - and 
added a line in Kbuild as well, which I forgot. Will fix that.

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
