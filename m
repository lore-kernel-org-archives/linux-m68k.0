Return-Path: <SRS0=dLa8=7X=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6C7C433DF
	for <linux-m68k@archiver.kernel.org>; Wed, 10 Jun 2020 16:50:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34AA32067B
	for <linux-m68k@archiver.kernel.org>; Wed, 10 Jun 2020 16:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z38WZdty"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgFJQub (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 10 Jun 2020 12:50:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25791 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729088AbgFJQua (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 10 Jun 2020 12:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591807829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=Z38WZdtyg+yuvmWZqlSR2DIgwxdH9J3PBF6TceTvikJk8f8qYiQsPCDZ0cFi7cpZI48ENs
        S9/ncr7uVLCY2My2vf6jb5qGc4pQCyhXUC5OCZ+jd3QG4cTQvQMzgZc5TVTruq4FNFWMFA
        lAMwd+t+MHnHgK8FxBlka6yJWzPVUm8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-2bYZRbhQPYCK_jvG93a0Cg-1; Wed, 10 Jun 2020 12:50:27 -0400
X-MC-Unique: 2bYZRbhQPYCK_jvG93a0Cg-1
Received: by mail-qv1-f71.google.com with SMTP id j4so2288456qvt.20
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2020 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EMwUauau342Zml1K34QLPe12sp1DuwpV44r+JLoVGLk=;
        b=FM20WmsZ8Nnz3muRvw+KXXJWfVrLzBmGROVn1rSavV4qipKN9Pnvu79GgvXLlsX6kE
         bWPlw84E5Jhi8JKfpyR2qNt5n8GC8adtXBWKiqIwAIvBTjRY0ah5JuwKkxT0TYBv67ee
         oxsLfe3yz1N8/sqK6RjwnAIDWXZ/BY1DuSsenJ5oLtdoZkCrg8x35Hwp/0yxVr5llt0H
         S7Abu3O9xj7krT9h7SGh6gn+NsXwdawwY0trzhhlpXIVK6hSGZ2iejq2gLq4AKlMkCoB
         Ww7Gi4aBht+WsNOwv8Zqrmn23zekHezVD7KSbsNn/TDtR8Od5xPnLiTomiJ+lDWMQlZ9
         isgg==
X-Gm-Message-State: AOAM530cgjVbzmMRmftaQhyInGUGFw7NVOTcoeDmtMRaO76GWfnQVPSz
        wpF77p0d3ACCgCjhDtwEP5CVukaovGgWz8Ok1Z9tBFqGgjXllIMEBr80kzJLv+Gs9WEPn9dw7SR
        pTbywkLsJSB5dNKt4TCYj4uCiSrVn
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987577qke.236.1591807826879;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn20TLNz7hD3Ni4blZzJN/2PX0jI8mrO6z2/UHNbD+ObHKXkY/kSbOK73eCMc/XFP0Ereokw==
X-Received: by 2002:a37:9cc7:: with SMTP id f190mr3987535qke.236.1591807826580;
        Wed, 10 Jun 2020 09:50:26 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
        by smtp.gmail.com with ESMTPSA id 207sm149672qki.134.2020.06.10.09.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 09:50:25 -0700 (PDT)
Date:   Wed, 10 Jun 2020 12:50:23 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Guan Xuetao <gxt@pku.edu.cn>, linux-xtensa@linux-xtensa.org,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Possible duplicate page fault accounting on some archs after
 commit 4064b9827063
Message-ID: <20200610165023.GA67179@xz-x1>
References: <20200610174811.44b94525@thinkpad>
MIME-Version: 1.0
In-Reply-To: <20200610174811.44b94525@thinkpad>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jun 10, 2020 at 05:48:11PM +0200, Gerald Schaefer wrote:
> Hi,

Hi, Gerald,

> 
> Some architectures have their page fault accounting code inside the fault
> retry loop, and rely on only going through that code once. Before commit
> 4064b9827063 ("mm: allow VM_FAULT_RETRY for multiple times"), that was
> ensured by testing for and clearing FAULT_FLAG_ALLOW_RETRY.
> 
> That commit had to remove the clearing of FAULT_FLAG_ALLOW_RETRY for all
> architectures, and introduced a subtle change to page fault accounting
> logic in the affected archs. It is now possible to go through the retry
> loop multiple times, and the affected archs would then account multiple
> page faults instead of just one.
> 
> This was found by coincidence in s390 code, and a quick check showed that
> there are quite a lot of other architectures that seem to be affected in a
> similar way. I'm preparing a fix for s390, by moving the accounting behind
> the retry loop, similar to x86. It is not completely straight-forward, so
> I leave the fix for other archs to the respective maintainers.

Sorry for not noticing this before.  The accounting part should definitely be
put at least into a check against fault_flag_allow_retry_first() to mimic what
was done before.  And I agree it would be even better to put it after the retry
logic, so if any of the page faults gets a major fault, it'll be accounted as a
major fault which makes more sense to me, just like what x86 is doing now with:

	major |= fault & VM_FAULT_MAJOR;

I'm not sure what's the preference of the arch maintainers, just let me know if
it's preferred to use a single series to address this issue for all affected
archs (or the archs besides s390), then I'll do.

Thanks!

-- 
Peter Xu

