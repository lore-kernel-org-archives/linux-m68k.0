Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FCBC77B61
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 05:18:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbjDYFSk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 01:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjDYFSj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 01:18:39 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CFC1BC9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 22:18:38 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso4506970b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 22:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682399918; x=1684991918;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVt/oaMnN1FtJSIdiVoAq2Sk2hjrFL1lR8oBw33fA2A=;
        b=Mk5vYd2dDXIPeqDJkvyIHq2tJMpyiquTm/SyQtlQeB+Pik4aSDPgtbUKGzkO7ZfjCl
         gsr76iuWYI0nnbJtmBSdiOHTXrDews1nelPeKRHFtUWZRmJq1B4k+d6DhtrxlWx4FLga
         kkuuh3LSth6MwVyyplIW5qyliS0LImO2uA7h61KKNA+mjSi4HRCTP2P81ht4k4QNyOL7
         n5kMoj+lywBra/4+ii/5zlpXNrdoIZGi/rorgFzA1wg14teOVAYsETS5wLv8j1kgeH3i
         qFabEAriI6eWyS07zJhe3YBwuOUOGX5AEk/j8lIqXiZMB/yx5RlMOVgR+ZVTxX/wC6im
         ihBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682399918; x=1684991918;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UVt/oaMnN1FtJSIdiVoAq2Sk2hjrFL1lR8oBw33fA2A=;
        b=l6EITNX8eOEFBnHFrDUuCQOLGBul1WxGZ9Gyk5nATCwOu328a868o/gkzuCAL2Xf/S
         Tu99OLoy7FyVdZpUSSwurAtrvBY9/dx+LkllXrGQaQqL8fekbwXNOchAFusTcQzwa4aV
         ChZ+Lvx50h9AYVn5ZaMnZsHTMYP4bTKyaZz86E/2tbs1wQ6KgBmBoCOj+pEIywNE4Ucm
         Q5nhEc0vUD0Ppmyf5p2XPnopMW/2rBRmOdw5qJSvv2ZEh8rbrokkDebbmy1tbO5VNdmO
         Ty8SKTwIyqf/9z7U4ZnrQ9t/+ymAj3b4O1fLXMWzmHT6X9zW1/T4Pr67e++T/Qtr7aHB
         et7Q==
X-Gm-Message-State: AAQBX9f/Ds6JFRCNXtUI0HOGNq/fzD986xdToGsxpWuv/E9SJ6qtqouT
        2gLEWErc27DE9HI8B2dxOss=
X-Google-Smtp-Source: AKy350YHDZhWP0LyGBolwoGB6FY/7ma4u3IXIR70cyZpuqB02ZmTeX0k+4p+EQMd6AnQiTPoxU89cg==
X-Received: by 2002:a05:6a00:23c4:b0:626:29ed:941f with SMTP id g4-20020a056a0023c400b0062629ed941fmr22946404pfc.5.1682399917937;
        Mon, 24 Apr 2023 22:18:37 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id b200-20020a621bd1000000b0063b1bb2e0a7sm8188442pfb.203.2023.04.24.22.18.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 22:18:37 -0700 (PDT)
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
        linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2784fc56-fe6d-11a3-19c9-3a999f447953@gmail.com>
Date:   Tue, 25 Apr 2023 17:18:32 +1200
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

As Stan and Finn report, it is actually used by recent m68k gcc version 
12.2.0 (Debian 12.2.0-12):

> Debian/sid has this struct in asm-generic/ucontext.h --
>
> struct ucontext {
>         unsigned long     uc_flags;
>         struct ucontext  *uc_link;
>         stack_t           uc_stack;
>         struct sigcontext uc_mcontext;
>         sigset_t          uc_sigmask;   /* mask last for extensibility */
> };
>
> but that lacks uc_filler[] so it's not ideal. I adapted the definitions
> from the kernel source.

Time to move this into an uapi header, or is that more hassle than it's 
worth?

Cheers,

	Michael
