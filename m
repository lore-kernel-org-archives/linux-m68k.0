Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54DDC49EA4
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 00:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA58261360
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 00:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhFWAYD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 22 Jun 2021 20:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhFWAYA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 22 Jun 2021 20:24:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89932C061756
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jun 2021 17:21:43 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id d12so195474pgd.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Jun 2021 17:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=bcpFSddWrPJ8W2Ub9oAqINluFXniubX2BEcya4POfK0=;
        b=gwBNeemJ5unhLEX+su0amWIFj9gAuivmQkyRdhLSVdn7mOpedbuU9suRoeDTbHP6Sw
         2o4aAmEQGzGyzh6dgeeKuVoJ/dcSBTRgpQWYmvLEA6WrQwVjnaxRYdM0QVrv49e8BkIm
         RUTVq4SCvjX+dHU1G9vheOoC+7Sjq7HPl+LTV6oX07oC5rjOXDrq0LB3V9rQVUjPReUN
         gbWRhJKznlKfVsonI7xnCBeTvm1LPOGc1EeUiakyQadpUvCETQCD4TtnjUW3S6fv902J
         q11Hg7hwHfIikq06WmCxf+KYppmoag7Ogof8Z6j1489hE6Soa52gcAVUrkWgB3YfOwKM
         C8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bcpFSddWrPJ8W2Ub9oAqINluFXniubX2BEcya4POfK0=;
        b=grl5qj+ChtWsSiVEkWP9aSfVQ5YCN7WnTJRlaOMBBxagzqPMKWjet5gm8aephRma4V
         E7H7yYHyk+QA90pJv+lq8OjcK9jwGwIdc4S0L7iPluvIHiOzXOgTEocKCYdgeWci7UFf
         UdYGzOL+8l+BN/coR94dzDjhoPEv4Peuz3z2LuIjLEtesbWrl1b08+ptOIqLRBZrvhIy
         vxFgdFsTcoj5otsjf+6b43wc3lIAvfbvdPlw8AkvME3zMohZ6hjhkikdcz8a1dlvOKkm
         Y+wSTkrClRO6bM4F8ZWF7x/fnJGyM8GpMxFZePWbrLuqD2zqQ5EL7omDfZSFryhVW0cG
         dIvw==
X-Gm-Message-State: AOAM531dECYnM/PDIbA1trECyqwtTIWCJncN9ya9aLL4g79M7IujKWq5
        lrVljeMNKqhARhCCFiakTeY=
X-Google-Smtp-Source: ABdhPJxfZzuKldyvpa4kU6lsJEvzGiSk/v0sOcODc77n3F5Kx2fnf3bGfzoDYoam0JBEdNlktunW2Q==
X-Received: by 2002:a63:4002:: with SMTP id n2mr1192108pga.124.1624407703055;
        Tue, 22 Jun 2021 17:21:43 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id f17sm20768764pgm.37.2021.06.22.17.21.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 17:21:42 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 84C4C3603D8; Wed, 23 Jun 2021 12:21:38 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     geert@linux-m68k.org, linux-arch@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org
Cc:     ebiederm@xmission.com, torvalds@linux-foundation.org,
        schwab@linux-m68k.org
Subject: [PATCH v4 0/3] m68k: Improved switch stack handling
Date:   Wed, 23 Jun 2021 12:21:33 +1200
Message-Id: <1624407696-20180-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k version of Eric's patch series 'alpha/ptrace: Improved
switch_stack handling'.

Registers d6, d7, a3-a6 are not saved on the stack by default
on every syscall entry by the m68k kernel. A separate switch
stack frame is pushed to save those registers as needed.
This leaves the majority of syscalls with only a subset of
registers on the stack, and access to unsaved registers in
those would expose or modify random stack addresses.  

Patch 1 and 2 add a switch stack for all syscalls that were
found to need one to allow ptrace access to all registers
outside of syscall entry/exit tracing, as well as kernel
worker threads. This ought to protect against accidents.

Patch 3 adds safety checks and debug output to m68k get_reg()
and put_reg() functions. Any unsafe register access during
process tracing will be prevented and reported. 

Suggestions for optimizations or improvements welcome!

Cheers,

   Michael
   
Link: https://lore.kernel.org/r/<87pmwlek8d.fsf_-_@disp2133>  


