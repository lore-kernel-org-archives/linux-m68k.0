Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318B5C43460
	for <linux-m68k@archiver.kernel.org>; Sat, 17 Apr 2021 08:02:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C69E611AB
	for <linux-m68k@archiver.kernel.org>; Sat, 17 Apr 2021 08:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236020AbhDQIDW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 17 Apr 2021 04:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbhDQIDV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 17 Apr 2021 04:03:21 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D1BCC061756
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Apr 2021 01:02:51 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id l4so45358986ejc.10
        for <linux-m68k@lists.linux-m68k.org>; Sat, 17 Apr 2021 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PLuLkF1IGWypPI+HiFb6Lc3kbaqrvgXd5rUpp6F9OyA=;
        b=f+fB8uprWV4VzDEpOVgLGalnWXSkba8mHn2f/QgTiso7d+EBzMNLlXbHyXVbmU9/SU
         8Toc6/TybN0Tm32Iuf39deCQf/CDvKOghOYk/pRERBtjMI4iomcdBdGkpI3hsu/xHMOf
         sTO7wkJj0piCgTtOL5WwyCohvOpc8UATN2j/YyiyO/SK5AA1vlFQcUmohKN/aVRKLP06
         JNolTMYL+cDFXUHMbqMhXrxjLx7qwBxf9aQS73B2jyqg0tmHzReT8gPMYvFdxMIPSjca
         nT0j7cE4klZDLfvOJIcHP92M4tD60c+bZ4bv2m8nmToU3O0abLogE76OPzw8setdqz8l
         TJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PLuLkF1IGWypPI+HiFb6Lc3kbaqrvgXd5rUpp6F9OyA=;
        b=Ryj2Y/kRKSnbSCYnf9QySpihIJnLTw4923B29pVHKavwl9/4k8bbnoITCnwSr9ne8z
         pgDw2adFt9JOI8NLW9hGmetU3dhCyMemiQtKMsP7k9i92pdcMEMTmZN/V93gworB4afN
         Fjo0kWp0re4m4bu0ipLqp5C9qHHD1V5L7mFf89fvz/BnVyuJ4ru3Sva/FvqoqXOqONRL
         EhuFBYaFpyfRZhHvu3H/ouMAwix+Wgj6a+HvvuZR+jdhUOWnHhwsFZqTVaCmTZA7UbiD
         nl8R/yT6GWqHf+xTgeyEjUnT8roQg5reYvTF2rsjFAr8LpzCiFc10BsQxnFeRwRZzTws
         aDvQ==
X-Gm-Message-State: AOAM533pdgokk6E3hj+JGYjMzm3uPR/rc4a/ZEfRlUx2oRMtjOwDbvud
        wvcxxVKnfPkFC248aFXEUILfWQ==
X-Google-Smtp-Source: ABdhPJyIqgVZdxEPXFYbJlfPKeXXYMcbzGuCDPRZzGHX6+Kox4v/z173UZ4qXydlYv5wMfKAokc0oA==
X-Received: by 2002:a17:906:9a81:: with SMTP id ag1mr12006771ejc.464.1618646570130;
        Sat, 17 Apr 2021 01:02:50 -0700 (PDT)
Received: from tsr-lap-08.nix.tessares.net ([2a02:578:85b0:e00:5c1f:7c5f:b466:7696])
        by smtp.gmail.com with ESMTPSA id mj7sm5853512ejb.39.2021.04.17.01.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 01:02:49 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] kunit: mptcp: adhear to KUNIT formatting standard
To:     David Gow <davidgow@google.com>, Nico Pache <npache@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-ext4@vger.kernel.org, Networking <netdev@vger.kernel.org>,
        rafael@kernel.org, linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Theodore Ts'o <tytso@mit.edu>,
        mathew.j.martineau@linux.intel.com, davem@davemloft.net,
        Mark Brown <broonie@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>, mptcp@lists.linux.dev
References: <cover.1618388989.git.npache@redhat.com>
 <0fa191715b236766ad13c5f786d8daf92a9a0cf2.1618388989.git.npache@redhat.com>
 <e26fbcc8-ba3e-573a-523d-9c5d5f84bc46@tessares.net>
 <CABVgOSm9Lfcu--iiFo=PNLCWCj4vkxqAqO0aZT9B2r3Kw5Fhaw@mail.gmail.com>
 <b57a1cc8-4921-6ed5-adb8-0510d1918d28@tessares.net>
 <CABVgOS=QDATYk3nn1jLHhVRh7rXoTp1+jQhUE5pZq8P9M0VpUA@mail.gmail.com>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Message-ID: <8b8aecaa-2651-2401-e5ad-499b2c920c6d@tessares.net>
Date:   Sat, 17 Apr 2021 10:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABVgOS=QDATYk3nn1jLHhVRh7rXoTp1+jQhUE5pZq8P9M0VpUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi David, Nico,

On 17/04/2021 06:24, David Gow wrote:
> Hi Matt,
> 
>> Like patch 1/6, I can apply it in MPTCP tree and send it later to
>> net-next with other patches.
>> Except if you guys prefer to apply it in KUnit tree and send it to
>> linux-next?
> 
> Given 1/6 is going to net-next, it makes sense to send this out that
> way too, then, IMHO.

Great!
Mat sent this patch to net-next and David already applied it (thanks!):

https://git.kernel.org/netdev/net-next/c/3fcc8a25e391

> The only slight concern I have is that the m68k test config patch in
> the series will get split from the others, but that should resolve
> itself when they pick up the last patch.

I see. I guess for this MPTCP patch, we are fine because 
MPTCP_KUNIT_TESTS was not used in m68k config.

 > At the very least, this shouldn't cause any conflicts with anything
 > we're doing in the KUnit tree.

Thanks for having checked!

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
