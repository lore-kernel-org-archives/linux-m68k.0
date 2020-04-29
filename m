Return-Path: <SRS0=uzpD=6N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB89BC83000
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 00:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5ADC20737
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 00:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="aVXs13fu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgD2A0R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Apr 2020 20:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726355AbgD2A0R (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Apr 2020 20:26:17 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F053C03C1AD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2020 17:26:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u15so789594ljd.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2020 17:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/HiSUgy4HdIvWLjYuum+TqzLflqanBrj+3DX557LOi8=;
        b=aVXs13fuMD8tYTcF8jNfrLhu5ML+wQppMSZ7gwhyeur8B4kC35c5nL0lRaXBfd/aOZ
         Jaq0kP7S16Pzx9p7MRhsx6rGf1LDQeSkACLd6PxCA+6H9QvnpMUKmNGmRW7Wlsd10n+Y
         yKHmpMdNW/bjIOMOkcIXwVazU39dU4xjmdYZGL87YfPZ9DJtmU5NpgBCws4ORuPIQwJM
         JZ2DUtPZbFi9IaPFPG09SDx1Hs0kqJfmmM/b5Bf+VWM7SSSB5Xu5GTnekJP4nGpTU1+Z
         YrWpsRK/K7WUzonyRkIdQF5Wvb9WiCDBPCGvqYi5KGv5gfQkONF5wiCCckmOPskLBjbe
         o82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/HiSUgy4HdIvWLjYuum+TqzLflqanBrj+3DX557LOi8=;
        b=Jkl5Gs3MlEgiT2KDk+vkXKW9jp2fXbahryxTmCKj+C+FuqzGxhz/K4tqrsoPEPmQ68
         KH0c6W2BsKZgfLTuyV9riiYwV4vg2RkggpVm/WDOaW1s9cei8mgBofDDGJUOhxfLADjO
         26L2GaoLFtb3QJ5FMDvFbUquL4o1Z07cv3ZI6Jr5BG6yFG0OeLVowA8DfRaBxeiUkjDm
         xGejIUljEUedsyAi7/emFksufaoxcJsexR2s+1tIpuBQ7/eHplimI/vONGcPdEufunXY
         qPX2K+V33T5k71Qs/JmqT9S15jWQQ+pWta/e311w6t29uGy5nP8Pn08ePiY7NVp0bpqR
         8xCw==
X-Gm-Message-State: AGi0PuamaIxtJkSOPi3x6WEaqQwAuGxSseYgSUJvC1bO5/9cR+qSsvBg
        LUog8pLDVmWOo49T6QHnnOYPkA==
X-Google-Smtp-Source: APiQypL3wQKxt8REUfc+hl2eNZBwnCv5lA2SH5VyZm8esm2T3qhBylMrbIltlQMzNtSsO3KNfKA7JA==
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr18799069ljo.167.1588119974899;
        Tue, 28 Apr 2020 17:26:14 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id b73sm835023lfg.86.2020.04.28.17.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 17:26:14 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id F06BE10235A; Wed, 29 Apr 2020 03:26:24 +0300 (+03)
Date:   Wed, 29 Apr 2020 03:26:24 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 0/7] Record the mm_struct in the page table pages
Message-ID: <20200429002624.qkhb362moj6v3vtw@box>
References: <20200428194449.22615-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428194449.22615-1-willy@infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 28, 2020 at 12:44:42PM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Pages which are in use as page tables have some space unused in struct
> page.  It would be handy to have a pointer to the struct mm_struct that
> they belong to so that we can handle uncorrectable errors in page tables
> more gracefully.  There are a few other things we could use it for too,
> such as checking that the page table entry actually belongs to the task
> we think it ought to.  This patch series does none of that, but does
> lay the groundwork for it.
> 
> Matthew Wilcox (Oracle) (7):

How does it work for kernel side of virtual address space?

And your employer may be interested in semantics around
CONFIG_ARCH_WANT_HUGE_PMD_SHARE :P

-- 
 Kirill A. Shutemov
