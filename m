Return-Path: <SRS0=PVSu=AI=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590D6C433DF
	for <linux-m68k@archiver.kernel.org>; Sat, 27 Jun 2020 21:23:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36B1F20775
	for <linux-m68k@archiver.kernel.org>; Sat, 27 Jun 2020 21:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrOHe2Al"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgF0VXk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 27 Jun 2020 17:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgF0VXj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 27 Jun 2020 17:23:39 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BDAC03E979
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jun 2020 14:23:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d66so6197722pfd.6
        for <linux-m68k@lists.linux-m68k.org>; Sat, 27 Jun 2020 14:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
        b=KrOHe2AlaGQ7tV28Vl9qyOQ0elfd8r//wq4xzvB5xDb5jWlg6mXfsKxabi0zi9yPbE
         a3CGp38U8cqw2mebqkt6TnvwzPA6E6KEcgpIj8HCQ1rHyHT3QVxyrownujSHvkYTCVSa
         Gy95rzA2weVyQoDCaBGwSARvG5wXI2h42LYwK1iUZUWKUYeZG14+sFo/aPCYLw2NwZJj
         nBqydL7WFvWCAVkBuzJ2gva+wATslrp9imqMIKL3E0H/YMoAyiaNhBbjIsjfeCv51DOd
         WRdGRRQ8YZYlJSkPBIPY8Mf5k8q0bkdsr138mWgQL9YfzyKrJwEngJSJT/C0ZJyP38ue
         p6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
        b=oXJ2Zw8k4oYDv1mb4v2Ip10gE2QKKzZ+shFaZ76dV9IQGSyOIAeRXK5hqUxUf2nFO3
         aQuRZLUbjfE7vQKgz25vQ5ZTJJ2sobToMOU7GTKO167KWn2EbeN6bRupwPzQUJykfnAS
         1ion2ChdKaXhIedjIuDOHEE4Qc7DTX20TgZK/7MqkkA2vFI1XW5e1IZsXGw/lwPAMUYE
         ra7AU5GmYdMJquUF707a+ARu0jGFdWOHig42XhiLPN0hbA6TjnnkY3DUX2FpNfrUlYfe
         nXawhCRiJSQLpJj9UuQ2A4I/C7Sm2nVYY36H6KpSA1YStFdkmOvS8+RFSPEM6ogPCC+d
         XvYw==
X-Gm-Message-State: AOAM532B6QLdgnH8I5aQffkujD1984E/58iPTgeafn+RVT41DqD4nBbs
        v9D6g6KrDCp6A1QBSj5+qYs=
X-Google-Smtp-Source: ABdhPJyLzAtm2TextcgHnw6pDE2t7RidtLOm1t9FNzgTafND17DEExqOaKhxKo2F07v49LSV9JtDbQ==
X-Received: by 2002:a62:e305:: with SMTP id g5mr8523544pfh.115.1593293018476;
        Sat, 27 Jun 2020 14:23:38 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
        by smtp.gmail.com with ESMTPSA id mw5sm15217406pjb.27.2020.06.27.14.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 14:23:37 -0700 (PDT)
Date:   Sun, 28 Jun 2020 06:23:35 +0900
From:   Stafford Horne <shorne@gmail.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Joerg Roedel <joro@8bytes.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org,
        sparclinux@vger.kernel.org
Subject: Re: [PATCH 2/8] opeinrisc: switch to generic version of pte
 allocation
Message-ID: <20200627212335.GJ1401039@lianli.shorne-pla.net>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-3-rppt@kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Jun 27, 2020 at 05:34:47PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Replace pte_alloc_one(), pte_free() and pte_free_kernel() with the generic
> implementation. The only actual functional change is the addition of
> __GFP_ACCOUT for the allocation of the user page tables.
> 
> The pte_alloc_one_kernel() is kept back because its implementation on
> openrisc is different than the generic one.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thank's for this.

Acked-by: Stafford Horne <shorne@gmail.com>
