Return-Path: <SRS0=Hd0i=DO=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F9AC4363C
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 11:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17E172075A
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Oct 2020 11:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gkoV1AWs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgJGLOm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Oct 2020 07:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28474 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726129AbgJGLOm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Oct 2020 07:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602069281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fau/zTN83bMY5VjH/VZJytUEBBQcb23cQqp/EXNoJ6M=;
        b=gkoV1AWsVlRAaNMMBLbR0SEF/fRHwj/FsB5LtEAbMEkOY3Cl8gkzZp4MUbSHSiOi9/LQDi
        4iUl9zihAgcXKnWwANTfQwRMN93+JT0dVwEw1tDdjwVjFWeBgMf/dVCigRHCURsCeOoo7J
        jORXQyEXRZa41PSpEcDC6ZwIJm6U594=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-DnkgxBYcOVqodkmnnM_rFA-1; Wed, 07 Oct 2020 07:14:39 -0400
X-MC-Unique: DnkgxBYcOVqodkmnnM_rFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A55441015EC4;
        Wed,  7 Oct 2020 11:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 524F35D9DD;
        Wed,  7 Oct 2020 11:14:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59CB8181A869;
        Wed,  7 Oct 2020 11:14:35 +0000 (UTC)
Date:   Wed, 7 Oct 2020 07:14:35 -0400 (EDT)
From:   Jan Stancek <jstancek@redhat.com>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     ltp@lists.linux.it, Ofer Levi <oferle@nvidia.com>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        linux-mips@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Guo Ren <guoren@kernel.org>,
        Greentime Hu <green.hu@gmail.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vincent Chen <deanbo422@gmail.com>
Message-ID: <1478290725.17134142.1602069275205.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201002202416.28972-1-petr.vorel@gmail.com>
References: <20201002202416.28972-1-petr.vorel@gmail.com>
Subject: Re: [LTP] [PATCH 1/1] cacheflush01: Rewrite into new API
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.208.2, 10.4.195.10]
Thread-Topic: cacheflush01: Rewrite into new API
Thread-Index: tKyuN72r4BqhTqMg7nWcjHRm2QuUYg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



----- Original Message -----
> This syscall is currently (v5.9) supported on these architectures:
> arc, csky, mips, m68k, nds32, sh
> 
> constants are missing for m68k, not sure if the testcase is valid for it.
> Untested.
> 
> Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
> <asm/cachectl.h>.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> FYI: I was going to ask for removal of this test, but all these archs are
> still supported. This test compiles on all archs now, but I haven't run
> it (I don't have access to none of these archs, not sure if LTP is even
> tested on these archs).

I haven't tested it too, but rewrite looks good.

Acked-by: Jan Stancek <jstancek@redhat.com>

