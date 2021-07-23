Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C66C4338F
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Jul 2021 04:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47106600D3
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Jul 2021 04:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbhGWDXg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Jul 2021 23:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234373AbhGWDXb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Jul 2021 23:23:31 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA74C08EA50
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jul 2021 21:00:33 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso7207025pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Jul 2021 21:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=zlFrdCUQ52qcpJSkZLsZqJB4I4X1uNtSjQbbezfSjHo=;
        b=bzr6NEKQJqSmgxpXVnYuecvPNT8kKM2dMZRjP774Czj2Rztl//69H6HUraBHe8Pfzw
         rHYY9kLKxWt8MfrlpQgG0+sQjhSPHwRnfkvVDpAj5XXELVVnbV6Ek4AKHUpYiXgKttxV
         X53XFGVrnyjTRLo+xWV53Ern/SLCAnkkXYaylcXwBy0IA+JGBwa3mzPHCEd7BcDEnRWY
         e9j0n01tocO262it+e6o1a9h/wywZLhVdoBc8NYaGsVemgSBPc0ewTitbZAzb9r39SYa
         pRKO1FGpz7dwHx6n49wP3hQbXfskuOUXB1NRZVQ/U2wDBR5DRgjQ+iECHP5qY4bFuVF0
         BcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=zlFrdCUQ52qcpJSkZLsZqJB4I4X1uNtSjQbbezfSjHo=;
        b=ND5u/L2xRB/XbGgTmlacVFi4W6qNL9a63X7yukLJiC1pjqhblIoeDe7ycjnYGp9KJH
         8eA3rcZAe1PiT65e+QFG+JArAtBfBkYLyOtdCSVNxBnkMo6emg+0NSv4Ygjt+YsXV1LF
         Jb8+1wz4KgBWrCBh+rPYQ3Af7O/zLyLS6B48Nb/kOg67Pw9dCmKGYhB1BiH9pom08s4Z
         TW8b4ug9rZeA2aWYtS4Rg5U9IrwfWCWRTLOsSglcbYqXUvFS9tXwwNKxrOFKXxcmwy2s
         Uq68G1A4k5rNQ6WZWH8hl8TMJNVIKBSMCiCUDjaWqNBpd3nwwJ+5M7/L/VIaDOveByMP
         4FJw==
X-Gm-Message-State: AOAM532TgRA3fldWXy5c87IhYo5ewznmIqGsFjZd9nmkzHeuzroKt7l1
        RtHRBHobe/K0/6zpeRYih6w=
X-Google-Smtp-Source: ABdhPJwO/QTxdwh6gxzBKHXaDRS8xOA0OUCJboiohap5jGBGTWCObrLSD3t1XTBI0wzJaxOJFkaw8w==
X-Received: by 2002:a17:90a:4105:: with SMTP id u5mr12252399pjf.33.1627012832972;
        Thu, 22 Jul 2021 21:00:32 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-37-fibre.sparkbb.co.nz. [222.152.189.37])
        by smtp.gmail.com with ESMTPSA id y7sm29718169pfi.204.2021.07.22.21.00.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jul 2021 21:00:32 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
 <87fswjomtm.fsf@igel.home> <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
 <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
Date:   Fri, 23 Jul 2021 16:00:26 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210721170529.GA14550@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 22.07.2021 um 05:05 schrieb Christoph Hellwig:
> FYI, I've pushed out a new version - this contains the fix from Andreas
> and drops all these uninlining tweaks as they very obviously cause more
> harm than good for now.
>
> And sorry for the delay, life has been a little busy lately.

The new version passed two rounds of tests OK - looking good so far.

Cheers,

	Michael


