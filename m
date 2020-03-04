Return-Path: <SRS0=mMk4=4V=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738A5C3F2C6
	for <linux-m68k@archiver.kernel.org>; Wed,  4 Mar 2020 01:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47D952072A
	for <linux-m68k@archiver.kernel.org>; Wed,  4 Mar 2020 01:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Q+2KJA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgCDBYO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Mar 2020 20:24:14 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36441 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgCDBYM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Mar 2020 20:24:12 -0500
Received: by mail-pg1-f195.google.com with SMTP id d9so177775pgu.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Mar 2020 17:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rt8TtTL2J2teY8pg3mAMBDxFdn/EEgf4y2xMHvWn/v8=;
        b=P4Q+2KJAFjMZOlZOparRgmdpjak5uoAJFTD5Y90LErx3JpfK0UNQGBOM5TQsh4lxw0
         vnAjLQe0ENDCo0ZQ5hnkkRawhWxRuF3wImszc6mqaZAUmf32J23Y36c3qL2LATOSc2h2
         tVfjBltn2QrYuDOibSBHTKVxQDmRfLH3BblY27gzz8VkF8PU1bMMY3k4FqUDkcmeaj0i
         6J+nMb2iMJxcPnvOlMcFlR69jl/RqmbOoafXTX2H0o6QwLhM6dM9YHoCSaA6FUK7qgHW
         08QwM9aaL559yyLm5RkZljBckbvwIlaynPPEOZ1GlwrypPVsFAsDcc4ElsCiDKbYgt+y
         C6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rt8TtTL2J2teY8pg3mAMBDxFdn/EEgf4y2xMHvWn/v8=;
        b=KECVEKeJj1lijXr/GHxYlOJxJ+GtrbVbkUgDFTK4ZDF3JsRg6ImApNbsJjxHImEpW0
         XxF2mECRrDSlHLeIjoK+qNHQPcwfFyf2e5uMqEVBUDLIdywd0ihWFpV92Ir6frS3+wii
         wSFeO/QP9P3XzoM9EG7QB7BSjQOHhkLIKuT80EnVXOxAiIWdZEfD/tyekZI2erIy5hQz
         sDdpYsRNIfZsuTUVMBDAd93K55+TY0RRN/bMdIbQqW8rDBNUh3FKvcx778Eribt6xGzM
         f4mf5AHCumxUvGG7Ou1RARTCNkKP96Q0ADSrZOlqwqDZjReKOQoEsVAEyxt2/VJW2mgy
         CV6A==
X-Gm-Message-State: ANhLgQ3jSKvc1S2OfN6qv2wScXYz+C1aBQMYDUKfn2A7/mZpvRn8JEcE
        htb5wHQlkuwx9weclH8iMWE=
X-Google-Smtp-Source: ADFU+vsn8BpgZ0uD9Kj8MicwFBE3Bv2NWVCEbUXbGCPpouGZIfn6QZU1OP0ZBgg8Au4qQWr8+E19nA==
X-Received: by 2002:a62:1682:: with SMTP id 124mr550487pfw.107.1583285051211;
        Tue, 03 Mar 2020 17:24:11 -0800 (PST)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id z13sm26175369pge.29.2020.03.03.17.24.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 17:24:10 -0800 (PST)
Date:   Wed, 4 Mar 2020 06:54:08 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 06/18] m68k: Replace setup_irq() by request_irq()
Message-ID: <20200304012408.GA5014@afzalpc>
References: <cover.1582471508.git.afzal.mohd.ma@gmail.com>
 <00b0bf964278dd0bb3e093283994399ff796cca5.1582471508.git.afzal.mohd.ma@gmail.com>
 <20200229131553.GA4985@afzalpc>
 <alpine.LNX.2.22.394.2003010958170.8@nippy.intranet>
 <20200301010511.GA5195@afzalpc>
 <alpine.LNX.2.22.394.2003011337590.15@nippy.intranet>
 <20200301061327.GA5229@afzalpc>
 <alpine.LNX.2.22.394.2003021717150.8@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.394.2003021717150.8@nippy.intranet>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Mon, Mar 02, 2020 at 05:26:17PM +1100, Finn Thain wrote:

> I had assumed that your intention was to find a consensus so that the 
> whole tree could be consistently and automatically improved

Yeah, my main goal was to get rid of setup_irq(), other things were
secondary and proceeded to achieve the removal by hook or crook, but was
caught red handed :)

> > Sometimes had a feeling as though the changes in this series is akin to 
> > cutting the foot to fit the shoe ;), but still went ahead as it was 
> > legacy code, easier & less error prone. But now based on the overall 
> > feedback, to proceed, i had to change.
> > 
> 
> Not based on feedback from me I hope -- I have no veto in this case, as 
> you can see from MAINTAINERS.

i don't know what to say, i attempted to accomodate the reviews as
much as possible, some times when opinions are conflicting i had to
take a call one way or the other, with more importance to maintainer's
view.

Regards
afzal
