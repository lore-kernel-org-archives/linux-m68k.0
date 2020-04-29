Return-Path: <SRS0=uzpD=6N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9E8C83001
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 00:52:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 379B2206F0
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 00:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="2PRDAe4j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgD2AwP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Apr 2020 20:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726353AbgD2AwO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Apr 2020 20:52:14 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C785C03C1AC
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2020 17:52:13 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id f8so194252lfe.12
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2020 17:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YuT/xOY+th6eK/rHxIuv+OueW2AvaS5G3o5QXDKsWZk=;
        b=2PRDAe4jqELbkHosMLEoi906nCbFHQSecbav0lfwR6eYYgY372mGh4nRfMuvEOOvED
         +qC50YnVtwF2whxzMWxyiLVqPdHwVXn31hDhFL87VDzoFhZ/nvkx4/SqLEKvoZMUFN5K
         HhJjhBfKPgi3E/6odf0mDQKF4mfgdtELBlpF756FPWVu45nwdkJX2u3wqne0avMiiLtw
         Dd1h5P0BM1Jtm3jCVDvTZoOE9a7x5oCOB7dyl2GuZ0RhnVSDro6aJnu42uwtQat9E7rN
         OQsXlPpjUuZJCCGhxW0ayBVzlPBMlcvRaboDp8fJfxr4FG8JmzD7ZkfSiYObk8qvfwFG
         1rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YuT/xOY+th6eK/rHxIuv+OueW2AvaS5G3o5QXDKsWZk=;
        b=NTp4/oxebUalPDmJjbIdmHcnND6e8ez8ZpqkTl5oPMLw1au3brmwp1X4SOZhTWb++J
         RNluG6S/5XQhbNGOzeP+qorA2RhaHnPuYatqMEDXDvyhDZAhXTMBQI9zOgi9s2iriNMl
         bcUsb+J8tCegqiK4itaLyT5N2itUkSVaFBDjNFDovjBMOdilIB9DhI5b8qQPA5PwHGmZ
         9UQy6naSo7WihXZnHTLArN3zCkDWabcEm49QM4O25XibFC91SFc03yd44x+nJLgNpAWp
         6QlvIst6VTkT0w/9KzazTXOTB+MVReZ1IzAfr7UYx5bQmmJEsXi4v5xWFJpj2+U+3fNf
         5SRg==
X-Gm-Message-State: AGi0Pua4wCaS+CX45thz6VfVwhT1LGp8JZPy/dpa9xwzgfmCu1yDpkMW
        I+82ttcvudmRLjEpkgABoiLuRw==
X-Google-Smtp-Source: APiQypJR3g8SZEsvHcVIdxhOYxzG8T71U5sfYmc5ejCyTx1rQPoRNFqAuJxd38JO5R75Jsx+a0tnlA==
X-Received: by 2002:ac2:5611:: with SMTP id v17mr20733406lfd.137.1588121531721;
        Tue, 28 Apr 2020 17:52:11 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id j15sm803395lji.18.2020.04.28.17.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 17:52:11 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 20CC910235A; Wed, 29 Apr 2020 03:52:22 +0300 (+03)
Date:   Wed, 29 Apr 2020 03:52:22 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH 7/7] mm: Set pt_mm in PMD constructor
Message-ID: <20200429005222.3hwe73qsp7l4rxah@box>
References: <20200428194449.22615-1-willy@infradead.org>
 <20200428194449.22615-8-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428194449.22615-8-willy@infradead.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 28, 2020 at 12:44:49PM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> By setting pt_mm for pages in use as page tables, we can help with
> debugging and lay the foundation for handling hardware errors in page
> tables more gracefully.  It also opens up the possibility for adding
> more sanity checks in the future.
> 
> Also set and clear the PageTable bit so that we know these are page tables.

As far as I can see you don't yet introduce any checks. It makes patchset
somewhat pointless.

I'm not entirely sure how such checks would look like. The single page
table tree would have at least two pt_mm: the owner and init_mm. Hugetlb
shared page tables would make a mess here. Hm?

-- 
 Kirill A. Shutemov
