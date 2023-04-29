Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18590C77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 09:01:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjD2JBw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 05:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjD2JBv (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Apr 2023 05:01:51 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8D11BCD
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 02:01:50 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-24b89b9a72cso578242a91.1
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682758909; x=1685350909;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1k+Vb3pr11+GAs77tujED8BiJTiCrZnONla8w2PLCg=;
        b=GULyfFMLQxt3SkTV0T7K6sFvLmmLHLZ1lr19t21qIfGErwKWldd9cAvikrkbShsSZs
         IKxcI1TNKk44EHhIYSPNi8R/uNKZWjnjZlneDnPnLSgfyP17rPfLILi6a8wPXJhVqbnM
         IBv1wUeV1Ep+UNczzB72vzZowrsFBZjZcDib+od3tppmc0PndQAhbSMxyhB7yXoJC/hX
         zcLnzJQogpZV6KPlPdGA5s6gOK6BvC8smLWFLOUP1OGnQDTFtuwA8qcLyCU+iCrxs5z+
         RmPoLh1EAqjlRqA6occRKPgNlRn4QDQP1lAZpn3Ksrxy77Qspm3EGMpCh+97hzyRl71C
         i9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682758909; x=1685350909;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i1k+Vb3pr11+GAs77tujED8BiJTiCrZnONla8w2PLCg=;
        b=FwVTNQKqeh+w6HJrzguv+vVddMEfCC5/fznvykh6joS8iy6qSDDciP+HYmO3KWNwvL
         PIwXbK6zI187K/KMiUK35wC4qkH1ODsODboK3PTG/Y1jP2r28YR4MzVNFZgLTBnj0ECu
         ns/QYXaZNqW1W++N+r8ph4UDnxfw2QRxMXHxyg5BVBXNR0wgZYFwrH3pqiS/Q8tep2OS
         /nPCG/xLmw3fJ71NaGZ66e9jucHCXV6eO3ewiXrrPnb/dhJlUe8r1IsBwxSZUPPrlkNd
         jQFIqgGRiKg1aoNblW80Bwgw0Y0aQEkZOGUlu/k5NdaEZLiDB3mxcRSeotjLZLW95LMR
         qDCw==
X-Gm-Message-State: AC+VfDy1NB7LfWCIuK3c+8drjKBzosHwhFzn1Vn4GVksFLAmibFzlnp2
        0IXLpJDh5HbxA6zqNPIfooc=
X-Google-Smtp-Source: ACHHUZ6QrZiTU34kE2Mmn+GAiKOKuS+c8KU2MGrdpSOR1C+dLo3VNrNKoUSmWRse6Zn6c7vp5RdfmQ==
X-Received: by 2002:a17:90b:4aca:b0:24b:7550:d3b4 with SMTP id mh10-20020a17090b4aca00b0024b7550d3b4mr8296568pjb.10.1682758909397;
        Sat, 29 Apr 2023 02:01:49 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id hi17-20020a17090b30d100b002471deb13fcsm16186241pjb.6.2023.04.29.02.01.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Apr 2023 02:01:48 -0700 (PDT)
Subject: Re: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid
 stack corruption
To:     Andreas Schwab <schwab@linux-m68k.org>
References: <20230429080410.8993-1-schmitzmic@gmail.com>
 <871qk385lx.fsf@igel.home>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Finn Thain <fthain@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2b81d6ef-0cd6-86a5-a595-66b328f0eb43@gmail.com>
Date:   Sat, 29 Apr 2023 21:01:43 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <871qk385lx.fsf@igel.home>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

Am 29.04.2023 um 20:17 schrieb Andreas Schwab:
> On Apr 29 2023, Michael Schmitz wrote:
>
>> We can use the format b fault address in frame.un.fmtb.daddr
>> to find the address where the fault occurred, i.e. the
>> address where the instruction will resume.
>
> I don't think you can assume any order of transfer.

True - I've been seeing this too much through the lens of this 
particular bug - moveml to user stack faulting while crossing a page 
boundary.

The more typical case appears to look like this:

> [ 4703.880000] get_sigframe: signal stack 0xeffff758 fault daddr 0x8003f328
> [ 5009.830000] get_sigframe: signal stack 0xefffef80 fault daddr 0x80029c88
> [ 6152.750000] get_sigframe: signal stack 0xeffff3a4 fault daddr 0x8006a290
> [ 6985.290000] get_sigframe: signal stack 0xeffff3a4 fault daddr 0x8006a290
> [ 7260.060000] get_sigframe: signal stack 0xeffff020 fault daddr 0x80050cec
> [ 7794.080000] get_sigframe: signal stack 0xc0001ea0 fault daddr 0x8000c69c
> [ 7797.240000] get_sigframe: signal stack 0xeffff08c fault daddr 0xc00f4f7e
> [ 7942.460000] get_sigframe: signal stack 0xeffff3a4 fault daddr 0x80050cec
> [ 9833.180000] get_sigframe: signal stack 0xeffff3a4 fault daddr 0x80050cec
> [10153.500000] get_sigframe: signal stack 0xeffff020 fault daddr 0x8006a290
> [10781.110000] get_sigframe: signal stack 0xeffff3c8 fault daddr 0x800435dc
> [11648.290000] get_sigframe: signal stack 0xeffff8f0 fault daddr 0x800024f0
> [11773.260000] get_sigframe: signal stack 0xeffff3d0 fault daddr 0x8002f858
> [12117.380000] get_sigframe: signal stack 0xeffffa08 fault daddr 0x8006a290
> [12526.350000] get_sigframe: signal stack 0xefffef78 fault daddr 0xc006fba0
> [12875.800000] get_sigframe: signal stack 0xc043de08 fault daddr 0x800b5f68
> [15682.160000] get_sigframe: signal stack 0xeffff8f0 fault daddr 0xc00c37c8
> [16503.110000] get_sigframe: signal stack 0xeffff730 fault daddr 0x80050cec
> [16545.560000] get_sigframe: signal stack 0xeffff6ac fault daddr 0x80050cec

Fault address and USP are entirely unrelated (and no risk of overwriting 
the area where the fault occurred).

My (rather convoluted) checks that are meant to ensure fault address and 
stack pointer are on immediately adjacent pages, and not miles apart 
should take care of these above cases.

But I had indeed overlooked the case of crossing a page boundary 
upwards. Thanks for pointing that out.

As it turns out, in this case using the area on the user stack 
immediately below USP won't hurt - the transfer direction is away from 
the end of the signal frame, and as long as the signal stack remains 
below USP, it does not overwrite anything already on the stack that a 
resume would miss. No need to shift the signal frame out of the way.

What else am I missing? Examination of the stack contents from the 
signal handler before resuming the movem through rte has shown the order 
and direction of transfer is as expect for @sp-, i.e. downwards...

Cheers,

	Michael
