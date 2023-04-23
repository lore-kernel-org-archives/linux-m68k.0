Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E453EC77B76
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Apr 2023 08:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjDWIS0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Apr 2023 04:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjDWISZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Apr 2023 04:18:25 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC26D199A
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 01:18:24 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1a67bcde3a7so39141755ad.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Apr 2023 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682237904; x=1684829904;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYyEjsL+QJ+A4x6TH6VnIoUli1vUvXp93sGw+IV3VMo=;
        b=g1OlFOs8jPe7SKq1jGGcS03s/6ZYjMTHQ9GSWdWElqCdOuqWa2nyIhf9bJjdVCkpKl
         1HgxR9MY0p/S5RoyfSaHaxuJaS+KgGl9LRwthEFDZDLk4xkAmmY569sBLBJRm5zTQXlm
         ynLbZOEflkHmqPSYuH7cx0IaRAGvT5qdRBToEbLl4OLlvn6Fx+Ny3X8/2pRnwUeKji5Q
         FS5/VSb7J/vTeItKVTqNDEqgofayHyqLxyrW2PRBBcjqGer8aT2BoI2MFglW9TFjII5u
         xi5XWxXqphyhEGbPOuhXAad8HbZssdTEdQmtIXjenpsrTDXRjQT7XX4bc4UN7LGelq4w
         bPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682237904; x=1684829904;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYyEjsL+QJ+A4x6TH6VnIoUli1vUvXp93sGw+IV3VMo=;
        b=STtgIOAJjjqQXQSOf1XP0mdt3kYNf2Ajlal54TnDevY1n+DEyrvE+oh/o2JBLvxfoj
         5T3gf7CZxwo5QfQVHp1vwIJ57xmtDfHuM3sLhiVsLFZyO44/fPe0woKzvF4Fs/LhVEK7
         Ik9TSocrzvdfrIgLmmUCnnMdwtae81rhkjQAVtO4VD6lU7kOJPLZ2gODUhzNWpnSFxYt
         2vrmk3THaFr0yParF52vByRaziCdy5WbqsXU+3QPmK9b6iL/f74u/phK4THk7rI/Bndc
         hgxlf2pzIavssbxZfyGjZHsuTDhER9nHdDhVDw7qYIiZv35H6weMw3m/V22N8H1NU66s
         rOpw==
X-Gm-Message-State: AAQBX9dB31LEJA+uks2evp/Mad5XOdqB5VXTeQ74LjiFCaFJaaY7hJjn
        rXzm2ytKG40oce7t5dFntanbgOKhbP8=
X-Google-Smtp-Source: AKy350bCoYD5bI3EA2ijqWHFZhVELXLyIvEEI4Sdz164/rQLM8D3y/pUEjIx5r23qvARbkYNTvVpgw==
X-Received: by 2002:a17:902:d4c8:b0:1a6:71b1:a0b9 with SMTP id o8-20020a170902d4c800b001a671b1a0b9mr12586508plg.47.1682237903699;
        Sun, 23 Apr 2023 01:18:23 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902bd4a00b001a95aef9728sm1854221plx.19.2023.04.23.01.18.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Apr 2023 01:18:23 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
 <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
Date:   Sun, 23 Apr 2023 20:18:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn, Andreas,

Am 23.04.2023 um 13:41 schrieb Michael Schmitz:
> Hi Andreas,
>
> Am 23.04.2023 um 08:46 schrieb Andreas Schwab:
>> On Apr 23 2023, Michael Schmitz wrote:
>>
>>> I'll see whether the signal context is available on the stack even if
>>> the
>>> handler isn't passed that parameter.
>>
>> The signal context is always on the stack, and used by the
>> (rt_)sigreturn syscall.
>
> True, but at the time the signal handler (sa_handler type) runs, all I
> have is the user stack pointer upon entry to the handler. I'll have to
> calculate back from that address, if that is possible.

Wasn't too hard actually. The signo parameter passed to the handler 
turns out to be passed by reference, and signo is located 4 bytes into 
the kernel sigframe. The address of the sigcontext struct follows from 
that.

Result for the original test code that Finn posted (using sa_handler):

parent usp  : 0xefa2f010
handler tos : 0xefa2efa0
frame end   : 0xefa2efb4
frame start : 0xefa2ee78
handler usp : 0xefa2ee60
signal usp  : 0xefa2f004
signal pc   : 0x80000588
signal fmtv : 0xb008
parent usp  : 0xef957ed4
handler tos : 0xef957eb0
frame end   : 0xef957ec4
frame start : 0xef957d88
handler usp : 0xef957d70
signal usp  : 0xef957ec4
signal pc   : 0xc009f37a
signal fmtv : 0x80
parent usp  : 0xef957ed4
handler tos : 0xef957eb0
frame end   : 0xef957ec4
frame start : 0xef957d88
handler usp : 0xef957d70
signal usp  : 0xef957ec4
signal pc   : 0xc009f37a
signal fmtv : 0x80
parent usp  : 0xef945ed4
handler tos : 0xef945eb0
frame end   : 0xef945ec4
frame start : 0xef945d88
handler usp : 0xef945d70
signal usp  : 0xef945ec4
signal pc   : 0xc009f37a
signal fmtv : 0x80
parent usp  : 0xef921ef8
handler tos : 0xef9b0f88
handler stack overwrote usp!
frame end   : 0xef9b0f9c
frame start : 0xef9b0e60
handler usp : 0xef9b0e48
signal usp  : 0xef9b0fec
signal pc   : 0x8000067e
signal fmtv : 0xb008
Illegal instruction (core dumped)

In this case, only on the last recursion before the core dump does the 
handler warn that the end of the kernel sigframe (shown as frame end) 
lies above the current stack pointer from the main program.

That nicely explains the overwriting of the saved register a3 (which did 
point to the stack canary) and subsequent stack corruption abort.

Though the question remains - is this expected behaviour for programs 
that do deep recursion on the stack while taking signals (and the reason 
for the option to run signal handlers on an alternate stack)?

And why does this almost always appear to happen after bus error 
exceptions (frame format b)? The extra exception stack information isn't 
even accounted for in the above frame end address!

Result with sa_sigaction handler:

parent usp  : 0xef969e28
handler tos : 0xef969e6c
handler stack overwrote usp!
frame end   : 0xef969e7c
frame start : 0xef969b58
handler usp : 0xef969b40
signal usp  : 0xef969e04
signal pc   : 0x80000696
signal fmtv : 0x114

parent usp  : 0xef955008
handler tos : 0xef955064
handler stack overwrote usp!
frame end   : 0xef955074
frame start : 0xef954d50
handler usp : 0xef954d38
signal usp  : 0xef954ffc
signal pc   : 0x80000680
signal fmtv : 0xb008

parent usp  : 0xef945eb8
handler tos : 0xef945f0c
handler stack overwrote usp!
frame end   : 0xef945f1c
frame start : 0xef945bf8
handler usp : 0xef945be0
signal usp  : 0xef945ea8
signal pc   : 0xc009f37a
signal fmtv : 0x80

parent usp  : 0xef933eb8
handler tos : 0xef933f0c
handler stack overwrote usp!
frame end   : 0xef933f1c
frame start : 0xef933bf8
handler usp : 0xef933be0
signal usp  : 0xef933ea8
signal pc   : 0xc009f37a
signal fmtv : 0x80

parent usp  : 0xef921edc
handler tos : 0xef9aaca4
handler stack overwrote usp!
frame end   : 0xef9aacb4
frame start : 0xef9aa990
handler usp : 0xef9aa978
signal usp  : 0xef9aac40
signal pc   : 0x80000782
signal fmtv : 0x114

Illegal instruction (core dumped)

Exception right before crash was an interrupt in this case (only seen 
that once in this context, though I've seen lots of those in the course 
of the test runs). Frame start calculated from siginfo pointer value in 
this case.

I'll clean up the test code and combine all signal use cases into a 
single source file so Stan and Finn can give this a spin on their hardware.

Cheers,

	Michael
