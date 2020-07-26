Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB246C433E1
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 07:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC44620658
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 07:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u5BNgTee"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgGZHN4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jul 2020 03:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgGZHN4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jul 2020 03:13:56 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CFEC0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 00:13:54 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id 72so6544806ple.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 00:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=JV8zNCXQOwj+3pWcxut1Sa+hpHp4pEqdHLGsxwF/xr4=;
        b=u5BNgTeeVxpQvyaV2d/IvpkYmAkPD8kqvGSBlvh0mB5207slvZMA9CUrmU+PMqmwRI
         CTrRzv6BxKwvjhS6pshx9U8OJVWOJy8RIVVuojkzwKFLMTYFWKxDLdIMSPS61qf50zNC
         HfR+7J9R+nTGtu1Mora45R+BG+v/QLeeVA9JYiznKpJ8PhnqtTq4Aq8+G4LRTvTfke7n
         M3yDF697H802vbjio4nh2WVUrvN99Y5Lc/frlqyt25RQFbC5pHqiXMLHlu9PHK5CcpO6
         1uoFBUdqMZtkNJrwmws7qWcsv96BuH+OoT1rjXCPEKRgzBXmYJZ8BSKFNxp+lPSFWLRS
         dGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=JV8zNCXQOwj+3pWcxut1Sa+hpHp4pEqdHLGsxwF/xr4=;
        b=UoikZJ5HXn5nHHmt1MImw/gA/wbTF7gl7dnxu9gLtiH/VHhk539dyM9imuc4qfXXxp
         uSgpmlvCwC1kwZFYz4UKS4/mLv1aIF8ftkghe4lv1ArIjY2YQz9NgkU/EuFQM7Mpc//6
         MGolkGKKnYmoE22DSjDr3D1V+htcuRzv2XBJBP3Gu4xgvmpdaX60BE6lCtdGNgFz0CR+
         mPNFYuIXLqHMDbiwp5r+q1GqGl6zT+teOWN7I/LU2a5E065cdp2lsR2Ah+yQQXr1DJyO
         UOZPsHTOwi/G6l2kuck6mWwtgngiV/ILsVRYBBia37QBzPAJg0qah7Xeuetmy1onCAgy
         EqeQ==
X-Gm-Message-State: AOAM533QISKBLJRM1O1gEAMaFrKN49N0fE8l2aglPxxbXJ12yOaALaUC
        ccICLB9MC9pFsWKvkIBSC6o=
X-Google-Smtp-Source: ABdhPJyine0fJGPuYXnktF9ZEeJQ2P64YmnD8GiFMPx0WZ0bQsQOFsTeEI02UcoEOtIySztTkxN7Jw==
X-Received: by 2002:a17:90a:7483:: with SMTP id p3mr13046500pjk.64.1595747634264;
        Sun, 26 Jul 2020 00:13:54 -0700 (PDT)
Received: from [192.168.1.101] (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id m66sm989208pfd.90.2020.07.26.00.13.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 00:13:53 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
 <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
 <b0d75d13-e241-43a9-30a7-46330e68cf30@physik.fu-berlin.de>
 <ee076f6a-143a-9f6e-7bbf-51112d64ab00@gmail.com>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <d0f0bc7a-b34c-7749-dc3e-41ac657eee27@gmail.com>
Date:   Sun, 26 Jul 2020 19:13:49 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ee076f6a-143a-9f6e-7bbf-51112d64ab00@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Am 26.07.2020 um 13:34 schrieb Michael Schmitz:
> Andreas: could we preset -EPERM as return code on entering
> do_trace_entry to save another jump, possibly even without setting
> -ENOSYS before attempting the syscall, or would that break the syscall ABI?

Never mind - -ENOSYS is needed for strace only, not the syscall proper 
so a slightly simpler version saving one jump is possible.

I'll send a final version for Geert to consider if your tests show this 
actually works as intended.

Cheers,

	Michael

