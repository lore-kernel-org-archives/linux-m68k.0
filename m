Return-Path: <SRS0=RUr3=5G=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770E1C4332B
	for <linux-m68k@archiver.kernel.org>; Sat, 21 Mar 2020 22:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47C7B20663
	for <linux-m68k@archiver.kernel.org>; Sat, 21 Mar 2020 22:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fmo8TK6P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbgCUWSc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 21 Mar 2020 18:18:32 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45216 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727258AbgCUWSc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 21 Mar 2020 18:18:32 -0400
Received: by mail-pf1-f195.google.com with SMTP id j10so5358553pfi.12
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Mar 2020 15:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=GZwpiXFKdWuIMRN8W/3GUjCMTFj3rPd8CIE9BNZqwhs=;
        b=Fmo8TK6PJ2+E/1n0zu5jGOHU3fOuS0jELIvzTESWBPRJib3RNhbkq8aAfY9/Pu+TXL
         OvKrr/oYX1bKTX6TOba0sbMEx/M4F5wPe1z9RaLRvhIWVxLccPtmZIcgKHIFEqWC0j1l
         IxaeLikzDRKjk15JNtbm85KgtJsKeBe+xIHQkRzzh86B5B3EZz8Wd6j3wknWIB+uvnNG
         +R/sxMND+ENmWLErf6ihGOJjI/dt/Wxr1iAQQ/7m5tvbyIs3QKUnX3KeO1R4Mj+Rjqlc
         n4oXKqPjIupk4sRzVUc0C81ExqWip+awiI8NF9gwfZO56QGNtOn8ohODE6ivDpgkcfg3
         r+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=GZwpiXFKdWuIMRN8W/3GUjCMTFj3rPd8CIE9BNZqwhs=;
        b=dyD5hf+yNBKEwgzW942QD0s/z6+m0UVloZgzu2SeYMRDSUKE2ktCRooRs9S7YTUaKd
         5X5Z8Q6W1UEG0mVO/01fdX7iWsKkFIrXX4SygdkW77xX1UGu5d76Bi5Pf9twb7+pd8Hh
         Mir+EZ8Q0Wy7i/WpS4PCvZzGPOldsSRfbLQU6z5WUeiUHLfnt+23cewi1yJHhB0/pH1s
         GV/ieLiumQKk6MbjA3ePKY11kH1aeOq6/e0F1ZFS+XrLuaL77EwcfsQ9/394qc+Qt9QA
         pa+ixeMcbqo0qMkTxr2ZhM1L0rGIEIhldqUsbguiICKjcm01ByySPbFZd8xBU1Ro16E6
         egPQ==
X-Gm-Message-State: ANhLgQ1mToIa3iD1KH5/RoC2lobHfbUN3gFizk9KmLaKzcI/vZBkUOe9
        EsJLby5raYYE+b2ufk7/Fd4=
X-Google-Smtp-Source: ADFU+vvx3/oCptBDPZVWZTbXt3tTAPsdrZN/03/w1+oRVHbDAWL9SGZTN4pR66Ipv0J9FVDQd7/9WA==
X-Received: by 2002:a65:4c88:: with SMTP id m8mr9027990pgt.192.1584829110359;
        Sat, 21 Mar 2020 15:18:30 -0700 (PDT)
Received: from [192.168.1.101] (122-58-181-188-adsl.sparkbb.co.nz. [122.58.181.188])
        by smtp.gmail.com with ESMTPSA id y15sm9309990pfc.206.2020.03.21.15.18.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Mar 2020 15:18:29 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Finn Thain <fthain@telegraphics.com.au>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <alpine.LNX.2.22.394.2003210904040.8@nippy.intranet>
 <4b2815bb-1eaf-d0a3-0ab4-5db473dfaa05@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c1e0c86d-fb71-f203-b66b-9645107a270f@gmail.com>
Date:   Sun, 22 Mar 2020 11:18:18 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <4b2815bb-1eaf-d0a3-0ab4-5db473dfaa05@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Adrian,

Am 21.03.2020 um 11:59 schrieb John Paul Adrian Glaubitz:
> On 3/20/20 11:49 PM, Finn Thain wrote:
>> I suspect (without evidence) that many m68k systems are actually virtual
>> machines. And the need for container hosting on m68k seems negligible.
>
> It isn't about security. It's about being able to build more packages
> as some packages have started to make libseccomp support mandatory.

Is there a good technical reason for this decision? I suppose most of 
these packages are not about VM or container hosting?

What about checking at runtime for availability of the library, and 
disabling VM related functionality if it wasn't possible to load?

In the event that kernel support can't be avoided: I suppose there a git 
commit for Helge's hppa changes that would help gauge the effort 
required for implementing such support?

Cheers,

	Michael


>
>> Therefore, there doesn't seem to be a lot of actual benefit from seccomp.
>
> I disagree for the aforementioned reasons.
>
>> There are 17 architectures (out of 25) lacking seccomp support. This
>> suggests that the portability issue around this missing feature can't
>> easily be pinned on m68k.
>
> The question is how many of these 17 architectures are actually supported
> by Debian.
>
> If you look at the build results for libseccomp in Debian, you can see that
> alpha, ia64, m68k, sh and sparc64 are missing the feature, everyone else
> supports it [1].
>
> Adrian
>
>> [1] https://buildd.debian.org/status/package.php?p=libseccomp&suite=sid
>
