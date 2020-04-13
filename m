Return-Path: <SRS0=0yiB=55=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E96C352B6
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 08:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B23EF20737
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 08:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="N2c6Xy+J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbgDMIV5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Apr 2020 04:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:43296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgDMIV4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Apr 2020 04:21:56 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D34FC014CDB
        for <linux-m68k@vger.kernel.org>; Mon, 13 Apr 2020 01:21:56 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id g14so148986otg.10
        for <linux-m68k@vger.kernel.org>; Mon, 13 Apr 2020 01:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9oJLimYT04wat0ldE/jP7eY5kMxM5ik3YHX/lTX8cOc=;
        b=N2c6Xy+JYseHVrzLpgH+hq9zulBwy/QsYjBlqVq0C3DLTAoFOjuw7sYGGci7gpD0rI
         A9n6s2GaQg6bYqJmimVa3QivaMWZzOsLm7Y03cmtuP/IdGgID9XG0qurphSTCIrpdC7G
         vdQJMyYnS7awO28fBKWl8iAf6QeEmVfFWsqPRCdeolGGCe7SabggQrwLF3azCh/o6UWY
         PEHPFJm2/Fy9A0V2TIULw+k94D+UPZh2yaURLT6kTJfiY5iw0FVA761qde8LAeJEdLBm
         SvOW3mdn6PV4sj2Ktid64G92Te40p0IXQBO8XlHhzIuJ3qQi7jZ+MIoNrrOObEVl26nT
         z5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9oJLimYT04wat0ldE/jP7eY5kMxM5ik3YHX/lTX8cOc=;
        b=rshWWAFPORjaPdPOliQQr75hYhRTB4sHBmEaSfaEJql+HTxtkKYCMPzDv1zzrky9Tz
         A3SMUXlCkgtiOMuToFAN7aq82H9MpIr8s/tQ9egjBIsm5mG4Ce+vQ5CL1+Csb5JG4a9i
         AvWMpyy1ILNnoRR9ArxHhkV4hT/RfZF+yDbE7leyDsoIyy/kAFwXNvKW0s9G5pQLcOIE
         4yKjFAXh08W6suJjFM1SwMY7e6LHx77p/KNy6aAuH7Z+ceNqP9QHI16EnNalOzctdhgR
         52X/NRYBbX9aGyPqX2/f2aMKXmKJwkOv5FWjRfgOKBB1D7xFpDXkkJG1ZHF+1g/KWY18
         OsTA==
X-Gm-Message-State: AGi0PuaOZwChf05s61Ndt6VuUwsn8uosX6XTJU/bETHlr6EIcYMrMDuu
        mr8Jncw4XLmINL373R7ACBDLgA==
X-Google-Smtp-Source: APiQypI6Nw3oedhzWowLBuPxAo3hOAKkbOVyIok2/NltmOi9rk3+SQb/6tXRAbLHU+51HJbBTf100A==
X-Received: by 2002:a4a:1882:: with SMTP id 124mr13527417ooo.60.1586766115928;
        Mon, 13 Apr 2020 01:21:55 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id s73sm204494oih.14.2020.04.13.01.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 01:21:55 -0700 (PDT)
Subject: Re: GCC?, was Re: Running m68k on qemu with external initramfs?
From:   Rob Landley <rob@landley.net>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
 <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
 <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet>
 <7a9ada44-e0d4-6743-3819-92dc44f3f156@landley.net>
 <alpine.LNX.2.22.394.2004131146180.15@nippy.intranet>
 <eb942a46-515f-9e1e-eeab-22c50b56e07c@landley.net>
Message-ID: <29e2cf8a-35fa-b24a-bce2-84e05e54d4c5@landley.net>
Date:   Mon, 13 Apr 2020 03:27:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <eb942a46-515f-9e1e-eeab-22c50b56e07c@landley.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 4/13/20 2:07 AM, Rob Landley wrote:
>> It would be great to have a minimal reproducer from toysh. Getting that 
>> from the python build looks hard, even with creduce.
>> https://embed.cs.utah.edu/creduce/
> 
> Oh it's not hard, it's just tedious.

Did you know that if you disable optimizations you can get _more_ warnings?

_disabling_ the gcse optimization triggered one of those "may be used
uninitialized but is a false positive 99% of the time" which in this case,
turned out to have a path that could trigger in a function I added last week,
which which was called in an else case 5 lines down. (Yes, when it DIDN'T
segfault, it gave me the warning.)

My bad,

Rob
