Return-Path: <SRS0=0yiB=55=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F305C2BA19
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 07:01:24 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCD45206A1
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Apr 2020 07:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="knwffW3Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD45206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbgDMHBX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Apr 2020 03:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbgDMHBX (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Apr 2020 03:01:23 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C536C008651
        for <linux-m68k@vger.kernel.org>; Mon, 13 Apr 2020 00:01:23 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id f52so8213377otf.8
        for <linux-m68k@vger.kernel.org>; Mon, 13 Apr 2020 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7tmJTXSI+2H4sRGIXZStFNup305RcwvAPhJpfP9sSp0=;
        b=knwffW3YoTkFNPwaRMA8pF4FYdazr4f0ADFsRu0ifw8pcFVl2WxA6vwSS4WuJKtkqU
         XfUN6S6/UdvmeHO+4NFv2JLcw8pm6Nbmsui3EQfvpkQJHc7/o2v2IyZq399RplClsWah
         Qto397mRmSInbU4GRmmL8KjJVtkvivg9FCoAQQRjuPhP1j5TAxtaeQEEffph+PHswVpV
         yrXfpbL+8wuKnLwMbrr/xIKn8Oz3TRzFzPl1jHC2xnk8ku6nFAwT4j97FAw9EcqB7IoH
         rXYrqcJPU1AQTk+yBOjLWIAAU1nAblcvrDGN4GcpoMY0F+oVWgTPSqlw3CB0Vk/mNgOn
         Sdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7tmJTXSI+2H4sRGIXZStFNup305RcwvAPhJpfP9sSp0=;
        b=I7WQjQaoMFv4Jco8PaLquNHZJ7KL1xhqu15SFqMGlSV8B6Y2L7U0Q4XJiBxhuOrz4r
         x9cu7ts/C278og2HIdXormq/XrJgFuA02qcaSorvAkgjFAn0NgTBHK/7lgVTR6e83+iG
         NepX8/1RZh2Al3s9jEpcUJdx40XXorH4fHmNCPU+w/sX0PeXqpOiVKG3UoDxPl9h/qkR
         VtZ+MWBkXx8w6sPcmLp09HDKP12uiIVqZG/KV/7rngaWW/IM2zmjIA6IpwHpR2SSZXp5
         8oSeh9qeJRtHxNx3pcHrj9d9wjvyn2eXJIgrsBoNf8SgkkJmlx+wCco54FXEId4msdxi
         5XxQ==
X-Gm-Message-State: AGi0PubW+WjVKxxelXMW1cPa2Ik2RPXj6d3IwinEjx/wV07+NjBD5273
        r4rkLzupdSM23oY+Ch3UsdNVi0fKiEA=
X-Google-Smtp-Source: APiQypLM8iro87R+XH2Ea25/cFR+ltHfPL90sXM7N0D/8zyF/LYj89AiMD/jzDf47ls/e4UPrCyFmQ==
X-Received: by 2002:a4a:4442:: with SMTP id o63mr66913ooa.0.1586761282124;
        Mon, 13 Apr 2020 00:01:22 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.googlemail.com with ESMTPSA id i26sm4702336otr.18.2020.04.13.00.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 00:01:21 -0700 (PDT)
Subject: Re: GCC?, was Re: Running m68k on qemu with external initramfs?
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
 <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de>
 <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
 <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet>
 <7a9ada44-e0d4-6743-3819-92dc44f3f156@landley.net>
 <alpine.LNX.2.22.394.2004131146180.15@nippy.intranet>
From:   Rob Landley <rob@landley.net>
Message-ID: <eb942a46-515f-9e1e-eeab-22c50b56e07c@landley.net>
Date:   Mon, 13 Apr 2020 02:07:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.LNX.2.22.394.2004131146180.15@nippy.intranet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On 4/13/20 12:17 AM, Finn Thain wrote:
> On Sun, 12 Apr 2020, Rob Landley wrote:
> 
>> Target: m68k-linux-musl
>> Configured with: ../src_gcc/configure --enable-languages=c,c++ CFLAGS=' -g0 -Os'
> 
> Was toysh also built with -Os in CFLAGS? If so, I suggest you try -O2. The 

It was. -O2 still segfaults the same way, but -O1 runs fine.

Sigh, tracking this down,
https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html says -O2 adds:

-falign-functions  -falign-jumps -falign-labels  -falign-loops -fcaller-saves
-fcode-hoisting -fcrossjumping -fcse-follow-jumps  -fcse-skip-blocks
-fdelete-null-pointer-checks -fdevirtualize  -fdevirtualize-speculatively
-fexpensive-optimizations -ffinite-loops -fgcse  -fgcse-lm
-fhoist-adjacent-loads -finline-functions -finline-small-functions
-findirect-inlining -fipa-bit-cp  -fipa-cp  -fipa-icf -fipa-ra  -fipa-sra
-fipa-vrp -fisolate-erroneous-paths-dereference -flra-remat
-foptimize-sibling-calls -foptimize-strlen -fpartial-inlining -fpeephole2
-freorder-blocks-algorithm=stc -freorder-blocks-and-partition
-freorder-functions -frerun-cse-after-loop  -fschedule-insns  -fschedule-insns2
-fsched-interblock  -fsched-spec -fstore-merging -fstrict-aliasing
-fthread-jumps -ftree-builtin-call-dce -ftree-pre -ftree-switch-conversion
-ftree-tail-merge -ftree-vrp

So let's try...

unrecognized command line option '-ffinite-loops'; did you mean '-fsplit-loops'?

Did I mention I'm really done with gcc development ever since they decided to
rewrite everything in C++? Sigh. [grind grind grind...]

CFLAGS='-fgcse'

That's the one.

>> I have a todo item to pare my 2700 line toysh source file (plus however 
>> muchof main.c and lib/*.c it's pulling in, "LDFLAGS=--static 
>> CROSS_COMPILE=ccc/m68k-linux-musl-cross/bin/m68k-linux-musl- make sh" 
>> makes a 99k m68k binary) down into a minimal reproduction thingy, but 
>> I'm trying to get the other targets to finish parsing the init script so 
>> I can cut a toybox release.
> 
> It would be great to have a minimal reproducer from toysh. Getting that 
> from the python build looks hard, even with creduce.
> https://embed.cs.utah.edu/creduce/

Oh it's not hard, it's just tedious.

Rob
