Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CF1C433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 22:41:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 446742065F
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 22:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOJ58jOW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgGZWlS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jul 2020 18:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgGZWlR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jul 2020 18:41:17 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1253C0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 15:41:17 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id n5so8321242pgf.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 15:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8HBThvap8+aTNaBJCcZM1UT10gstpxSxwPIDGthpDGM=;
        b=aOJ58jOWUCS4O58tzU5ssfeyCg/cpuvsDY4fJJz8h50ARuhS2/wq9b75W1EvCJbFmz
         WSTuNXVx7XZNzBjQ9EbPBR6qkIWwRzGvzvMOTosDqn6IdT/ui72SsJ0o8b9yoWpWQzVA
         A+2RPS+zmEdSbjj//08z0wCPeL8JryAvsd31Gp3VEobU1dMcOmTkIYcnmFtylM/KKYqc
         LbLo87MadTdm9Q/bUObFgRYxU7vuTgdsEyHzXN0hoGCroSMKpOQ+vZxTwJ/TxZjAl22B
         P/mjDl0MaVuLlTyO7XEPv0lgJfQUaWnN983xC5grDgpenwwaLyl5XSEFPWnCBmqQLKwp
         kNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8HBThvap8+aTNaBJCcZM1UT10gstpxSxwPIDGthpDGM=;
        b=s+xmQjnrdZpripWHqQ7bnQn5WUHS+AIilJLXyGBNuIu4oM0oKRVvMfEkZihOOzBOS+
         dHx11Nrx09D7rcxX3P8Eo3G3wqMXWFUXX/VBToFfGpubaghjsfngnHY+bFVEB4HDk6kl
         gDBYOSIpGVLfHMG5vsgR0C6CXDQko7UG/x8YyqPSivVfCRpY+EVuDk9Sf24/oPxVNtPK
         s+wtJs22iHQFNt3Z5yT1KejX8/rMHCETakwSe37lXKXIbL2rXuMXvwC06cxwQQ2KcSDB
         rFhdYF++9AePjq9Qb8R9vb6xy3KuqrX//cT8LqbbsKU/8uytE2IbbLx0ZcL3fcd3ZbIZ
         XvTQ==
X-Gm-Message-State: AOAM531WoB18HdfMIX/AVKZGT/8I0yFOEgfgGRV6rN6gknnJKtVEXLpg
        jSCww002jg7RhQZDrU2HVOz13Ive
X-Google-Smtp-Source: ABdhPJxY+ZARocm2kX7UNTFlOiKDxJNFUN4XHqWYUukT8JBPFxrdt/+wtQUrAYTeveVaekHsJfjisA==
X-Received: by 2002:aa7:9e4e:: with SMTP id z14mr17788979pfq.256.1595803276672;
        Sun, 26 Jul 2020 15:41:16 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:ec2f:8388:f010:f71a? ([2001:df0:0:200c:ec2f:8388:f010:f71a])
        by smtp.gmail.com with ESMTPSA id a26sm12881965pgm.20.2020.07.26.15.41.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 15:41:16 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
 <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
 <b0d75d13-e241-43a9-30a7-46330e68cf30@physik.fu-berlin.de>
 <ee076f6a-143a-9f6e-7bbf-51112d64ab00@gmail.com> <87sgde5yf7.fsf@igel.home>
 <419f407f-b758-9dfe-699e-be9229444cc1@gmail.com> <87365e56ek.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <9e8ebc9e-2b3d-06fd-9bd7-e42ebcba3500@gmail.com>
Date:   Mon, 27 Jul 2020 10:40:59 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87365e56ek.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 27/07/20 9:10 AM, Andreas Schwab wrote:
> On Jul 27 2020, Michael Schmitz wrote:
>
>> What I attempt to do is support syscall filtering. Returning -ENOSYS in
>> that case would run the risk of masking existing syscalls to user probe
>> code just because the user process happens to have insufficient privileges.
> What does ENOSYS have to do with privileges?

Nevermind - closer reading of the seccomp_filter docs reveals that I 
shouldn't overwrite the return code that might have been set by a 
filter. So the question of what return code to use is for the filter 
code to decide.

I'll revert back to the first version of the check.

Cheers,

     Michael


>
> Andreas.
>
