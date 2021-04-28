Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F73C433ED
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Apr 2021 23:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5987461090
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Apr 2021 23:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhD1XHZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Apr 2021 19:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhD1XHY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Apr 2021 19:07:24 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDCEC06138C
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Apr 2021 16:06:39 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id k127so9822418qkc.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Apr 2021 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9qLoG8GhVsaODXvAxNVSdW8lGghLvmtsq9pFbRDh42Y=;
        b=TDZzd9Yjn7zwOBAE6kqvkUuPXbahUd+wVeSFZKpWbKob9fl3wAJ1WJT8p4BGmnMUK/
         DuJ3P1fGBC08Jw+LZwhm+xfSjdPlfsmvxQvQuBj0399jIdirjmH5Q03qVy8G1VOVOR7e
         x+vWDHkzR7HRTU0Cs5c9Oz0pVn31wfPsKtsl5akMO//OBs3Gu+hSPMeH2f9XIdV7to6c
         NPO1MW9vE8WwwZ6C0OQOn7NHVG0s6a345neSRiErDR22MWcZUrL9IxCku2/RRZ/WZxJX
         PFP/MuNqi9PEq5PLw2kCn6xW6s7eVR7IQq5F7JLlBilwKShwJSTAqPLknTAnXJyh2Or9
         NF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9qLoG8GhVsaODXvAxNVSdW8lGghLvmtsq9pFbRDh42Y=;
        b=FRzCEipOsMoSv0XmgH3SOnsu86B8d9JPvmD+zLHhckNdpwxZUb6gaysikHeeYUnNyi
         YuVa05jrcvBExcYio+Uaew3t51Eg1qhbiIN/j7ZIdf+XlM9eF8LG8Z8uIAwBInFCM5Wr
         ktb75drn4WwqoPw3NTygh7YhfVk3+HwOlPkzw+LsaM9bRH3EOnjypDhsmobkIyjaWnUS
         hbl02c3gosvLO0p5se4YPllbrAU5E2az5zb4nyiisKNfzmbxaRhNUqIns8nA9k6jYca1
         aWjJ0tE1nVOZd4ghD6bpEidU4BOvwcKTxXxd8PEMjtbSucEu2OC6KDYU4SPGIyAdAIqf
         IyFw==
X-Gm-Message-State: AOAM533uuOQKKFIf1PjQeyxdyqx6lz1v8Ipb7MJDjILAXQ8e8hv4nwWp
        k189ObkeTJzF8+WfE8tjF3c=
X-Google-Smtp-Source: ABdhPJx7/CKXkBSSiNqr83HqQNA928kpne7Yz76AtLT3qadpPggSsUB4qoL9p1sjG/M1p1Qei8ubGg==
X-Received: by 2002:a05:620a:232:: with SMTP id u18mr8411245qkm.213.1619651198317;
        Wed, 28 Apr 2021 16:06:38 -0700 (PDT)
Received: from ?IPv6:2601:152:4100:57e0:91c9:b195:c9a6:94c1? ([2601:152:4100:57e0:91c9:b195:c9a6:94c1])
        by smtp.gmail.com with ESMTPSA id h62sm891040qkf.116.2021.04.28.16.06.36
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 28 Apr 2021 16:06:37 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
From:   Josh Juran <jjuran@gmail.com>
In-Reply-To: <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
Date:   Wed, 28 Apr 2021 19:06:10 -0400
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <F9FB9B1D-3B31-452D-AD67-D1C57A302B83@gmail.com>
References: <20210323221430.3735147-1-laurent@vivier.eu> <20210323221430.3735147-3-laurent@vivier.eu> <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.1878.6)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Apr 28, 2021, at 8:04 AM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> This can be simplified by shifting irq_pending instead of irq_bit:
> 
>    do {
>            if (irq_pending & 1)
>                    generic_handle_irq(irq_num);
> 
>            ++irq_num;
>            irq_pending >>= 1;
>    } while (irq_pending);
> 
> Unfortunately m68k doesn't have a single-instruction __ffs().

The 68000 and 68010 don't, but couldn't the 68020's BFFFO do the job?

Josh

