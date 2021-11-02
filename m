Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEE1C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 06:24:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4883760F0F
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Nov 2021 06:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhKBG1Z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 Nov 2021 02:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhKBG1Z (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 2 Nov 2021 02:27:25 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22110C061714
        for <linux-m68k@vger.kernel.org>; Mon,  1 Nov 2021 23:24:51 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id g11so7200173pfv.7
        for <linux-m68k@vger.kernel.org>; Mon, 01 Nov 2021 23:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Hn9Mw468iC/k7ZXDFt3TRwuut2cRkfTuSdIcbwfRxRQ=;
        b=hEw1EyrmNKBKimS1FrVa81/g7v+7PeGsF/hHXrKXGTRPAX/foAV1M037P/PTy1VG5V
         CzaDJFFcrVWiEt2ab5dfIzlEb6/iJlqzx2BXqFBMX7Qzf31IvggeVhvZ/iiG4fitujOp
         QXKDokGsMirLhWROmFZNl5781zmgR9MMk0+P+MgbWT3kTdBtS+n0Ok7gdrLG0y54Rdkx
         utNtPVM5psHqwFimAwtRUK4mCwUCqzGCWWLdXV3wMnVNvy4807va1xCo6e09myhGQ1bS
         A0h/lKqCae6dbBggTYzsSuGngZU/HQJ9RRBvlLZuB44nP1rnbdcAtlGecEAN7TWAX8g5
         4Dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Hn9Mw468iC/k7ZXDFt3TRwuut2cRkfTuSdIcbwfRxRQ=;
        b=ALXGShIXAkCfqpWHNz05HMRP9otHin+6f2LZE2EfPJpy87ZrhzFimH/pFGpaJVLtoX
         ZZyKibVAgwEHO8x8dSTOgFjWlamxVMywe9bJWSz5vu/iaVuTtX4tP9bj/nFMZSD68MQn
         TCgaAL2rGwqlZmiIsPloSvsakqqMhOGAGyRL7EabhrL954Kffg2M36bZ48j3JQh/pEIw
         39NbtmnwlKqi78rpaEag7XqX6c0XkVYhk2RYzBZF4JvYw8a4+puVH2mO0lKCaRPvtRu6
         gd6aXphv6Wwvo1Cetgycpnd0iVNkRETAfafF5/oj69oa7I1Um4Akw7gZDzuy5ZR7MK2p
         drwA==
X-Gm-Message-State: AOAM532Yf2wjNNX1ozWbLHfEY9NtOIcgLiBrEBO0tr3AEZSuyV0m4H3t
        /aWMmTfHr/n90SwDZXdpN2613AZBO7o=
X-Google-Smtp-Source: ABdhPJwpTIDDCo/PxVY4vz7X3t7SYb5G6YaEDAGgThQT18AcHdJVTWksMVSnLppgMMxgPUYWXS4jOg==
X-Received: by 2002:a63:8ac2:: with SMTP id y185mr12022940pgd.205.1635834290701;
        Mon, 01 Nov 2021 23:24:50 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id mn15sm1287367pjb.35.2021.11.01.23.24.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Nov 2021 23:24:49 -0700 (PDT)
Subject: Re: [PATCH v7 0/4] Add APNE PCMCIA 100 Mbit support
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
Cc:     alex@kazik.de
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <9283f7a8-36ba-3383-0150-c188ef2fe7b1@gmail.com>
Date:   Tue, 2 Nov 2021 19:24:36 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Ping?


On 29/08/21 15:11, Michael Schmitz wrote:
> Revisit support for the 100 Mbit APNE PCMCIA card variants, again.
>
> Add a new ISA type for these cards, and switch to that type
> from the APNE probe code in case 16 bit IO support is noted
> the PCMCIA config table data. A module parameter or kernel
> can be used to enable 16 bit IO as a fallback option.
> Support for the 16 bit 10/100 Mbit cards is now included by
> default.
>
> The first two patches enable the use of core PCMCIA code to
> parse config table entries. The remaining two patches add 16
> bit IO support to the m68k low-level IO access code, and switch
> the APNE driver to use 16 bit IO on cards that support it (the
> 100 Mbit cards).
>
> I'm in two minds about enabling CONFIG_PCMCIA - the alternative
> is to duplicate the cftable parser in amiga/pcmcia.c (which
> has been tested and works just as well). Feedback welcome.
>
> Tested by Alex on a 100 Mbit card. Not yet tested on 10 Mbit
> cards - if any of those also have the 16 bit IO feature set
> in their config table, this patch series would break on those
> cards.
>
> Note that only patch 4 has been sent to netdev. Please CC
> linux-m68k when providing comments.
>
> Cheers,
>
>    Michael
>
