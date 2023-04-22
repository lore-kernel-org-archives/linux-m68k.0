Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E01C7618E
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Apr 2023 08:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjDVIQL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Apr 2023 04:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDVIQJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Apr 2023 04:16:09 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABCF1BDC
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 01:16:08 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51f1b6e8179so2067575a12.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 01:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682151368; x=1684743368;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULxdaiMsBAy1L7o/5znhCBbkHH4AU6sG7LFUezxzLow=;
        b=Z7zsHqfxzxuJEmvcn9Z1Rmn+V1zv59Xx3s4t8xyDoYybI2414co7Mwl03TBGBAGwCu
         VaMZJdCLcAirhySx2LeRJfawx3afuEryWWiCAdnszjhygCl3bPQFbQ7v2TC/vzn/Rcm/
         TXgv0LgBhmvNAuzfnPA2QIbuds16dO5CZ1nrk5tuDF4S/FDko95ds/1Up+sRR1Uq4eeL
         ki+yegWNwn5GwuCQUo1a6GSSRlBCkJPy7tlETa3re8YMPcIIuP7m8+Q//jewFhLoQz/Z
         B2Yk4UUcRuWtgRJQCNbLVlPoAvGOUnuHtvR+NfVRl+GEeIGS+6RezjNNSZy3nbE19vEf
         1E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682151368; x=1684743368;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ULxdaiMsBAy1L7o/5znhCBbkHH4AU6sG7LFUezxzLow=;
        b=ciyLrHUzDWEns5AfmDp5altB4Gu6jzXd/N7oFQ+N39I5BT7k+rZGab71S7PqCb3Z5O
         WwIZUBTFvmmFblNYpLnBVioP5DG7pUQSP4g1FDfuLjC9+CsgwniBsFYdFEr0gdt1RLgu
         7jg8Tg7tnXkYEfgCYKMJR5s5KgUH7CzYiUsnzeWNfLx/Ntkx+1OW92l/+opbxbqbq8rc
         OWlg1YRvhMM9JNQCITw0nz48iJ84MOrHDniPsmLtcaPdcAN2tnTYXtFh/661Mw3YaKGu
         wJShvphRrqkOL8bHodMQo6oHgtE9R6qcfG17/5Uopsqcr5UkUDiQoq7Ru3QgW0WqnsGu
         QZwA==
X-Gm-Message-State: AAQBX9chBTmAXJMTOJoqin+0zcRqkS2VbnoM7GVceC+FYr/5aAH95/dU
        jaJ0bskmOe25oIVukJPywftg/B/RRhE=
X-Google-Smtp-Source: AKy350YqEaaZrEOlINxm4Myqqt3w1VuHu6J7wsAlXGTEwlQMZxbepXgbiaXr9A1GqdmwTfyGPB1Plg==
X-Received: by 2002:a05:6a20:914d:b0:f2:bb3f:3b15 with SMTP id x13-20020a056a20914d00b000f2bb3f3b15mr4337663pzc.43.1682151367817;
        Sat, 22 Apr 2023 01:16:07 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id s9-20020a63e809000000b00476d1385265sm3548756pgh.25.2023.04.22.01.16.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Apr 2023 01:16:07 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
Cc:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com>
Date:   Sat, 22 Apr 2023 20:16:01 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87fs8sz6e9.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 22.04.2023 um 20:07 schrieb Andreas Schwab:
> On Apr 22 2023, Michael Schmitz wrote:
>
>> Took a little while to figure out that the ucontext format changed in the
>> decade or two since my userland's libc headers were generated.
>
> In which way did it change?

This is the definition from the kernel's 
include/uapi/asm-generic/ucontext.h:

struct ucontext {
         unsigned long     uc_flags;
         struct ucontext  *uc_link;
         stack_t           uc_stack;
         struct sigcontext uc_mcontext;
         sigset_t          uc_sigmask;   /* mask last for extensibility */
};

And this is /usr/include/sys/ucontext.h:

/* Userlevel context.  */
typedef struct ucontext
{
   unsigned long int uc_flags;
   struct ucontext *uc_link;
   __sigset_t uc_sigmask;
   stack_t uc_stack;
   mcontext_t uc_mcontext;
   long int uc_filler[174];
} ucontext_t;

uc_sigmask appears before uc_stack and uc_mcontext.

I'm assuming libc just passes on what the kernel set, without reordering?

Cheers,

	Michael
