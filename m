Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ECCC7618E
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Apr 2023 18:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjDVSZF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Apr 2023 14:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjDVSZE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Apr 2023 14:25:04 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A5A1716
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 11:25:02 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b87d23729so2686143b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682187901; x=1684779901;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JN4pm9DABWhzGpTx1CKitJLN8R+AYf/dYqiH2Mm9D80=;
        b=XvQ92REhgJl8DVNqGbQbp8KmepEDuiS7utV1svHhBYl/3mcCDvKTXvkIwMuJLt7uT7
         ZIX3FA/oy+piOaJzxHdGK6g9ILAM64JVfLlaFwMqpCx7vHi7ZDUSHfwp06rrsQyVh2Xi
         MDQe/nNWSuMDUc6vfWO6rRbWyZCl/vl2HED0eQaZSKmI0AffaLWn09DzLFVQyXh49G0B
         Tc3IGVpfBLm47/otH/D2na41WOTpS5bZ2hpGrzaW4NZ9Yp6B9QJrQUmoHdpCoO1U8O0W
         X2AXTY+CFDAJDEKv/bpB0AEEyGY+EMYdNu5tXfDkG1JRy0iCkT33ZEhVnDZaRUmsK+58
         7VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682187901; x=1684779901;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JN4pm9DABWhzGpTx1CKitJLN8R+AYf/dYqiH2Mm9D80=;
        b=baJK0TgXgfH2p+thYa8MuKfY2SRcD7G+E74NTNMJ3r/1OzFHQLtGBRjU9Q8MvokDYq
         M+oo+9saLK8eHf1YEwwTSW87aLVVQJXcCG/LLUzpthn+eeTG5A7S+2Pj8rk8avrmEmUm
         gQy3FjFz9RC5PCPcjxYoliCsy6qBggdjgXj9PpzAxNKimoZ9JpjZbPbw5WC+zrVqU3Q4
         rI4BFpAMaDn7WkxmCV4diwO4EoHl4uBjtGiLVWCQaAlVlcANX99bC4wQVMvyZTg4k/3F
         8oB4xhi2PmlHAPBAug+7tNJ+qxgWjxl34C78w32ngqmfR1xAIKgbjnvWBVZKHnKR3lYE
         tctA==
X-Gm-Message-State: AAQBX9eGM/4hYj4jkUJ6pN2rKrofXL4U0nTpuOWedJM7K2xqKO4S3HnV
        WU9jqdR2hFv3E8eu4/KXUeOKVmau03s=
X-Google-Smtp-Source: AKy350YSqwOBm2LUcFOojEXdGs6o2sFCkC/S55Kx/NTgIBmg2GnzoJQSGzA3z8puQM1LX1vJTv4RTQ==
X-Received: by 2002:a05:6a21:6da2:b0:f0:b2f2:2020 with SMTP id wl34-20020a056a216da200b000f0b2f22020mr11629779pzb.50.1682187901367;
        Sat, 22 Apr 2023 11:25:01 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm4803334pfn.69.2023.04.22.11.24.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Apr 2023 11:25:00 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
Cc:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com>
Date:   Sun, 23 Apr 2023 06:24:55 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <878rekz0md.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 22.04.2023 um 22:12 schrieb Andreas Schwab:
> On Apr 22 2023, Michael Schmitz wrote:
>
>> This is the definition from the kernel's
>> include/uapi/asm-generic/ucontext.h:
>
> That's not actually used by m68k, it uses
> arch/m68k/include/asm/ucontext.h, which confusingly isn't an uapi
> header.

Argh - not sure how I missed that one.

>> And this is /usr/include/sys/ucontext.h:
>>
>> /* Userlevel context.  */
>> typedef struct ucontext
>> {
>>   unsigned long int uc_flags;
>>   struct ucontext *uc_link;
>>   __sigset_t uc_sigmask;
>>   stack_t uc_stack;
>>   mcontext_t uc_mcontext;
>>   long int uc_filler[174];
>> } ucontext_t;
>>
>> uc_sigmask appears before uc_stack and uc_mcontext.
>
> Yes, that got fixed as part of commit 9c986f878a back in 2006.

With the header corrected as per arch/m68k/include/asm/ucontext.h, I get 
the correct information in uc_filler[54] aka fmtvec now. Good. Every 
sigreturn possibly overwrites the user stack now (if the filler is used 
in full). Not so good.

>> I'm assuming libc just passes on what the kernel set, without reordering?
>
> Trying to rewrite the signal context would be prohibitive, yes.

Now I wonder who adds sigmask ... and whether that's also ending up on 
the user stack.

Cheers,

	Michael


>
