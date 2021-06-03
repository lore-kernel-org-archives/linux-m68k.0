Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DA6C47082
	for <linux-m68k@archiver.kernel.org>; Thu,  3 Jun 2021 03:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E029D613DC
	for <linux-m68k@archiver.kernel.org>; Thu,  3 Jun 2021 03:44:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhFCDqB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 2 Jun 2021 23:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhFCDqA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Jun 2021 23:46:00 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E032C06174A
        for <linux-m68k@vger.kernel.org>; Wed,  2 Jun 2021 20:44:05 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id h12so1015374pfe.2
        for <linux-m68k@vger.kernel.org>; Wed, 02 Jun 2021 20:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Ut3WAuN7O3xn9fuDoqG5eOtbXJyXxliNPO6u9/Jerxw=;
        b=hg8x1VCYFiZXgQRbjwlbb1kKW6MtzCCnFLv8QP8OdT6FzBfD3PK5DBb5Ko6v2NAsQw
         mUokp7zZ5G27DHX4y1wSS+1bgwTo8GeRz8x89j2eFQUw5B0RAG//tDO0xMTUW4bacqci
         sF/4mp5F4PnL4BANuSU8nNz+WTOw7hjzI8nFG7g+S2+ix9cWk6W8BeiE7U0AOywdcwUl
         brV3CTL0b3OXWIdJxX+HfuAnR6Pmrn9NCmqddTV7WHXkCYa6Mxd+YcqeWIzQN9G+jL1D
         GLcLV4/kEnI2JC6kKSeG9zZLcy0WTs4LIOhTrokenugk4VtH4mFAWquDwPB941jpvvcv
         mIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Ut3WAuN7O3xn9fuDoqG5eOtbXJyXxliNPO6u9/Jerxw=;
        b=F02bMmusAH4aoPRzg9coSCkHNksmxVly+QiORx1pqDznF98LMASFPaGSuul8x5DLoq
         YRrHFEsqMbv+ab4mDurq+UxFqwprqhGqFPyLaQnjtc09PAuNGo0y7WsH55maiZsvJMMW
         yMXBxHYw9TrbYGW7xlLZ05wxG278Xftnl6IS4X5BM9ZBoffJVpEQ/waye2CTWQVoZgRA
         6oD94s8WEQaEnlGwGjUr5ej3gwRBGZI25Fi//D+H2TiG3NtD/cerNjEm4mc2pkSDcvQ+
         NN1KMBtOV7ubux8LrvYcJRJ7oSY+cmeTQMjelJZYoZFkmzrWGFH/SRNa2XR7ZhOfIeTx
         SwWg==
X-Gm-Message-State: AOAM533a1GJBR9uA5iyQHqYdi/AoS+31sG+eh5DCka5sdYLkAwswF5hX
        wdAo6x6GINYcW2w3z8FTxwWN0p/fRJ4=
X-Google-Smtp-Source: ABdhPJz1pux/oreOES/R84ikYbF1SIqvydW1fgjHBd2RqwImjW5Q6SQ2gSWP6qjBEygl39vk8Fv3Hg==
X-Received: by 2002:a62:8745:0:b029:2e9:cbec:87d6 with SMTP id i66-20020a6287450000b02902e9cbec87d6mr19469701pfe.64.1622691844733;
        Wed, 02 Jun 2021 20:44:04 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id f139sm833034pfa.38.2021.06.02.20.44.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Jun 2021 20:44:03 -0700 (PDT)
Subject: Re: [PATCH RFC 0/2] Fix m68k multiplatform ISA support
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
References: <CAMuHMdUskb3oicq8Kbf6MY_4mn4-Y1pJ-om4fny7k48gndscgg@mail.gmail.com>
 <1622611267-15825-1-git-send-email-schmitzmic@gmail.com>
Cc:     fthain@linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <4f52cce1-e894-c224-a42b-18cce4f61056@gmail.com>
Date:   Thu, 3 Jun 2021 15:43:58 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1622611267-15825-1-git-send-email-schmitzmic@gmail.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Point of detail: don't forget to run 'make clean' after applying this 
series. Modules are not automatically rebuilt after changes to our 
io_mm.h (should they?)

Cheers,

	Michael

Am 02.06.2021 um 17:21 schrieb Michael Schmitz:
> Finn Thain found out that our multiplatform support is broken when
> attempting to build a kernel with support for both Q40 and Atari (when
> setting CONFIG_ISA through CONFIG_Q40, but not CONFIG_ATARI_ROM_ISA).
>
> Inspection of the code in io_mm.h reveals that in that case, ISA I/O
> accessors with address translation are used for the Atari IDE driver, where
> MMIO accessors with no address translation would have been appropriate.
>
> Setting CONFIG_ATARI_ROM_ISA will fix the issue for Atari, but then force the
> use of I/O accessors without address translation for Q40. The code in
> io_mm.h is fundamentally broken for kernels that have both Q40 and Atari
> support.
>
> Address this by adding a check for address < 1024 to the Atari address
> translation case, changing the default address translation to return the
> untranslated address, and changing the CONFIG_ATARI_ROM_ISA section to use
> ISA I/O accessors for addresses > 1024 (i.e., those not intended to map to
> the ROM port).
>
> Tested on ARAnyM with all combinations of CONFIG_ATARI_ROM_ISA and
> CONFIG_ISA. Earlier versions tested on my Falcon hardware, all using
> pata_falcon.
>
> A thorough review in particular in regard to ramifications for Q40 and Amiga
> would be welcome. If there is a better way to implement these changes, I'd
> appreciate a hint. This is all academic as long as support for Q40 and Atari
> in the same kernel image is not needed, of course.
>
> I suspect patch 2 may not be needed, since the isa_sex variable should always
> be zero?
>
> Cheers,
>
>    Michael
>
