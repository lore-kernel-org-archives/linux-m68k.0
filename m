Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F33CC77B75
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 05:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjDUFxX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Apr 2023 01:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDUFxW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Apr 2023 01:53:22 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6989B65B7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 22:53:03 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1a920d484bdso16658735ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 22:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682056382; x=1684648382;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:cc:references:to:subject:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T7mCd+9fu+XAFyTz7BVILWAWGasX9voSOyHGxpucNc=;
        b=KnZKxRC5AKpqljDTQz/rwhtFZyreQB/SboVSkHwHITm35fgNxK8HGiFXaTUMa06iE2
         VK0rjRD0+v89y1Wz3qyuSkmZwHE88P64kKoCvzKBX5xXxDIeBwZlracna2HjqA1CLXXY
         ZOewCr6eHKKGdBHwFk1EZs+vfelctNsMnURQoPoboajTk/dSxEDWh/seoT0e22kwc8GZ
         rY/OZ4aFiPXdgLL/eu3E202Ugzc3bjMsjccJpC5HHlViW4Xq8LFtG+IuEPwlmyB1aTCC
         sCANq5J5cHBwYGTl2Ljfw+M1yrUls/ptRVM7jy8+sVhJ5kTaJLlnDiTq3HgmTArKsyoQ
         wckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682056382; x=1684648382;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:cc:references:to:subject:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2T7mCd+9fu+XAFyTz7BVILWAWGasX9voSOyHGxpucNc=;
        b=izY26vlmz2/5Omun3r2qsr+EeOmezseyDIQ0pUisoens7Z4V3Z2onvrnvbwCU7826R
         yeVXg4So+w6e4yc6iY4kPpo/bCgi73loFiTLS3XdcyGqlqIRdiAZi7QYQQ3oaUYzFnyj
         HJofjm4PSN3UlgoiWzukkJQ67fYNk3SgWW/eg6178QsBjAxqibftU6axqKOr+gATgd5A
         jkdodj6vSECLF89bPwu6iDCyJNHdYHB3VimRt7qKQ1vZ9da+SNBnpiJHH5LRF+IzM7ha
         4U8jLs1WrJ0pk8IMizoAiNgEBnFso6F7kbKRNWTu3OaOSV/TCEk+fn4476RznUPrbS/0
         jWJw==
X-Gm-Message-State: AAQBX9dvOmN2pvgelA48OCXapNUaWSc/BLaJ39VxnTpvFN3Ru75omsdk
        Djw96GAeHWKQQuECzKe0GSxzXTOwb50=
X-Google-Smtp-Source: AKy350b9zmC3IEMwVNmjFt+QE/AHsekNJw57AjiMzkI5gn57SUJNc9ra0lQ/MMIq1K0kk0VdmTorMA==
X-Received: by 2002:a17:902:a5c4:b0:1a6:7b92:15e2 with SMTP id t4-20020a170902a5c400b001a67b9215e2mr3372299plq.49.1682056382360;
        Thu, 20 Apr 2023 22:53:02 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id ju18-20020a170903429200b001a526805b86sm1981357plb.191.2023.04.20.22.52.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Apr 2023 22:53:01 -0700 (PDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Message-ID: <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
Date:   Fri, 21 Apr 2023 17:52:48 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 21.04.2023 um 09:58 schrieb Michael Schmitz:
> Hi Finn,
>
> On 20/04/23 20:55, Finn Thain wrote:
>>
>>> But in any case, it looks like we can eliminate the bus error code. Same
>>> fault on both 030 and 040 with very different bus error handlers is
>>> highly unlikely.
>>>
>> There's no failure on '040. QEMU and Motorola '040 gave the same result.
>
> Sorry, my fault - I interpreted your mail as saying 030 and 040 gave the
> same result.
>
> Back to the drawing board ... I've got kernel images back to 2.4.30 and
> 2.6.37 to try and test. I'm also trying with rt signals and alternate
> signal stack (rt signals show the same behaviour).

2.4.30 behaves the same as recent kernels - stack corruption unless 
signal handlers use the alternate signal stack.

We already knew the 030 bus error code hasn't seen changes since 2.6, so 
this isn't much of a surprise.

I'll add some logging to the signal frame setup to print the user stack 
pointer, and perhaps do the same in the bus error handler (when hitting 
a moveml instruction).

How often did a page fault happen when executing moveml, in other programs?

Cheers,

	Michael




