Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCF9C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Jan 2022 01:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiAMBJK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jan 2022 20:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiAMBJK (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 12 Jan 2022 20:09:10 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D3DC06173F
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:10 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id h1so7137828pls.11
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=gNioHUF8pV9tzRdTD1l7vB4RgbvGJkyZkq5oVHuDcFc=;
        b=LaeJCF9U6ZWCXhGrC0vD4hidd1bUK0VW9gEdw48Q76jib+SOB2aSisVgENRYugStnw
         b4TWFP0pnPrOjyEUKyDXacpAmZjk9d/sYdhL0YkWrZs3Al9XaiiXeq2fJ78//0yf6j6V
         C+KX7SRvH7+vBbwQNGUpUt1dgkHOLo5MgxN/d+eccrnVMpZX7PwNoT7g15J46KjjIt3U
         q7c50bdZogZnCWlNXFPC5Dm8xi1raxHhmtI5rQhRcObHEVZL3qGEu6+JrTIg5G+tHifq
         OH5USQxXlLZkrqk5UsFN3J6F3hJNxGBuVc/U6oajjFES+E/O0175k0ZKwzfvpYfWesZx
         xf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gNioHUF8pV9tzRdTD1l7vB4RgbvGJkyZkq5oVHuDcFc=;
        b=vu9x7AzLSm4xOZvrXtAepD5o9TVsR6Egj3x/d1HEJeMVKusN2LoHHYyqTC6qI2tQsH
         vSZ838tuRdYseDTwTnk29vx+YYLDc3O52x3YiBvicHeY4eX+KvVqtCoBzeGvvfJbS2jh
         g8SCvUrkcn/hsLi6KmNuTu7toy5wirc8a57uc52+6iwuUFY4mvCR+2tjGEA7qrNuOvMi
         HEnqcfisGBVLtSMW8FqaFGlFszBl2EYGD3U9OUipqDvsQxGdINWnJ7FH1z3VOki40h7z
         1DtHORqfVAgoJ7HZ//R6+Gn7pRzDNSiZ2qyhB+tlkcybi7DU/GrIgXBLa/8c8zyAP5G7
         LaaQ==
X-Gm-Message-State: AOAM533SEaFvTpsfTBqQxdl+0ZfvdDPwx1F6j9t/8eHGbKeyyxxaF4To
        spDSQ9Fmfq19fRfVw56jz8ARn8aC9qI=
X-Google-Smtp-Source: ABdhPJyRhrIpTnm81GYIMR3578HuctrcQ21ZO9btzJSAkKsiBsDR29zXOXhEBrwhEo6M+yBeVlxG6Q==
X-Received: by 2002:a05:6a00:ccf:b0:4ba:ea96:dff with SMTP id b15-20020a056a000ccf00b004baea960dffmr1975405pfv.82.1642036150022;
        Wed, 12 Jan 2022 17:09:10 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id 34sm682359pgl.72.2022.01.12.17.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 17:09:09 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 3E56436032C; Thu, 13 Jan 2022 14:09:05 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk
Subject: [PATCH v8 0/3] Add kernel seccomp support for m68k
Date:   Thu, 13 Jan 2022 14:09:00 +1300
Message-Id: <20220113010903.720-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Respin of m68k kernel seccomp support, again. 

I have split the (MMU) m68k switch to syscall_trace_enter()/
syscall_trace_leave() patch from the patch adding return code
checks for syscall_trace_enter() as suggested by Al Viro. 

Patch 1 could now replace Eric's patch 'Stop open coding
ptrace_report_syscall'.
 
Rest of the series remains unchanged.

Cheers,

	Michael

