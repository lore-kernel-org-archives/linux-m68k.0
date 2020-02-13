Return-Path: <SRS0=kS3Y=4B=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546B3C3B188
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Feb 2020 02:03:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2841720724
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Feb 2020 02:03:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O//7kG9v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbgBMCDe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Feb 2020 21:03:34 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39630 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729313AbgBMCDe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Feb 2020 21:03:34 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so1679097plp.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Feb 2020 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x4frmMXGOLlmcRjK55IB+vPQaFT4KUg/VMQvDX0jZ70=;
        b=O//7kG9vqhbWdSfyl+B8jnRk/M8p5VWm+1N7QlLfU2UhdQ0f1C3z1SmifcWi761bwy
         N3IQxDzDJUwDs6NkydmvpwUNqnr2j3kPrVNWc6FOLwR9hHXDmhoPTsP8jdBx9omGRZUW
         8fGZ3KXNxXWT72daAEqcBBeUwW13bU2NyqQjP9LMWZqpqwNcRrzm0sGCLEoQE53wNJ0P
         uTkJiRoPdpVQdvs5EHfHsuVPUPkEx3zLFc7RJGuLNBbJu1EAWw2N4eD9+PedmWI2/Q91
         YXKyLbK9dmuP3djG3aqehl41aaSxG7q26yeRKf6PYyokDDLw7sMz/UaDN6mwX9PfvrsK
         L1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x4frmMXGOLlmcRjK55IB+vPQaFT4KUg/VMQvDX0jZ70=;
        b=ZM305I7xk6FexwHMgKEZmRAp+vU5Fis4wpAHCWpgtcTuTqDrwlXZ6kXkf/dxAQ2TgC
         rY3zLTc39SpCzeQw6Fp6m8+T6RE9dC5SVueDqc3lg1GBum1NCQAuRgmssXAmH2m3R5Oj
         TfF4MdivLp7fLCm6l5TF/4swrBWa9+tfEZzchfqI9alxvdk1qzJGYpy8Bh7WOJu2mJk9
         OK+AM+3sXHgcpT608IA2G6lSGoPA1dPrk8mMbK9Xo6W+DfpboLoaQU0jhKgD4vuh5wzz
         QV6wMJMa7YL21Y7g37aS3+yhZLFhmBfA1QUbBOjiWxxD9ZDqUNOlTiWb82Com30zUHg2
         0bXA==
X-Gm-Message-State: APjAAAW7oV2elO4kWtoVj6xqGWaip+igwq4hXIK4UvjE/YV2cEfd98/b
        +I5IMO7wpiA5E2tBcHUqay4=
X-Google-Smtp-Source: APXvYqyUErjZyLodAXxDTkgukQoJFsyyrZhVcKLE8Nt+SOOTHjErXHL8vCZ/j1oym/Hn12tMqfDmCw==
X-Received: by 2002:a17:90b:46c4:: with SMTP id jx4mr2371863pjb.32.1581559413377;
        Wed, 12 Feb 2020 18:03:33 -0800 (PST)
Received: from localhost ([106.200.59.46])
        by smtp.gmail.com with ESMTPSA id k9sm459336pjo.19.2020.02.12.18.03.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 18:03:32 -0800 (PST)
Date:   Thu, 13 Feb 2020 07:33:30 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/18] m68k: Replace setup_irq() by request_irq()
Message-ID: <20200213020330.GC2684@teres>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <1941c51a3237c4e9df6d9a5b87615cd1bba572dc.1581478324.git.afzal.mohd.ma@gmail.com>
 <alpine.LNX.2.22.394.2002130912140.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2002130912140.8@nippy.intranet>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On Thu, Feb 13, 2020 at 09:25:19AM +1100, Finn Thain wrote:

> > -	setup_irq(TMR_IRQ_NUM, &m68328_timer_irq);
> > +	if (request_irq(TMR_IRQ_NUM, hw_tick, IRQF_TIMER, "timer", NULL))
> > +		pr_err("request_irq() on %s failed\n", "timer");
> 
> "request_irq() on timer failed" is bad grammar and doesn't convey what 
> went wrong. It could be taken to mean that request_irq() was called 
> because a timer went off.
> 
> Have you considered,
> 
> 		pr_err("%s: request_irq() failed\n", "timer");

i was uncomfortable with the string contents, since that didn't seem
nonsense and to avoid pondering time over it, it was used.

Your suggestion is definitely better, will use that instead.

Regards
afzal
