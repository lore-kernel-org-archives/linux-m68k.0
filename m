Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC86C54EBD
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Jan 2023 03:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjALDzk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Jan 2023 22:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234465AbjALDzi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Jan 2023 22:55:38 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D408D45667
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:37 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id v23so14042592plo.1
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nsaVzjtLmKBKYfOr85HRkNPQXXtoBkVSp0L01L9uJY=;
        b=JgpPEn+H4I+wgKr7X1pLo392TON+q/TRAwBwXcfIWeUWHMdJbIjWvbVmzLHUzl7sxc
         L8Vwj8dZXbmbXVNOOpk/5Mn5Z1efMugB+LqBAfH+q7tHXWrghcVDX0qAyFjKmyO34v2S
         xo8cQHc+EbrSOaJlNrdIaMvONlPGEjlxBON0qB/aoll1GM9LzNhWp0Zse91Rx19uvZmd
         e4J8G89H3CSXfnqj2njq0HECLXyIdphLagXy1baBhC4vSEFCOzBMUeWWfcHWHpsf5XRZ
         0Pck2F6+eu6bDWXlNhTxBpcLPurkbeHiSl8Qo70rP8YyCwAN86PUW8QapMJjXg1lEkpA
         xStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nsaVzjtLmKBKYfOr85HRkNPQXXtoBkVSp0L01L9uJY=;
        b=H+vIVm1qZr3S++ZrjFnn55SUxcEwJYPjGRwiwwlzOfUgE+hamcr4yCjwkgBy5gjKib
         6iAH0gKML1XDfGb/Hp452VxGJxxhG7THzvaXGtfWfaeDwtfBlpQuxVEPk57iuCu7+YEN
         NcXH0A2u8FUTalCwfNI8kdGitOjLs7qaHvarU3QpoP9k6o5fJaYlXQfIfJkxcZTOiKYn
         vAD55ncILnhq/PUail2Wk6lJxwTlftSNRzXu4fzFA0y6w+WM2ilmfuFZSnBxmUnlx/KP
         9Yj+WJc6ed7vBER9hDUGv69XYL9Ak6zrl9K83altQ2gsmjtGC+50vaLmAXcbSIgNuSZ4
         y+3g==
X-Gm-Message-State: AFqh2kr3OdfwjgPaw6erPh2szNF87mL2NMT3yMEPEuR3EOja0hCjnNEA
        Y/bI6Ti3fgz+AshHB4V0OvxhlkDWL6Y=
X-Google-Smtp-Source: AMrXdXtttXcHmLZeRMVX7qaNWAhE1N+h1SSVGZDh3cOxTwpcYdUBJN9de+lh3ckYPP6tIpcN8b27Dg==
X-Received: by 2002:a17:902:ccc1:b0:189:5ff5:eb92 with SMTP id z1-20020a170902ccc100b001895ff5eb92mr96436887ple.39.1673495737322;
        Wed, 11 Jan 2023 19:55:37 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id t16-20020a170902b21000b0018996404dd5sm10987869plr.109.2023.01.11.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 19:55:36 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 52BBB360312; Thu, 12 Jan 2023 16:55:32 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de
Subject: [PATCH v13 0/3] Add kernel seccomp support for m68k
Date:   Thu, 12 Jan 2023 16:55:26 +1300
Message-Id: <20230112035529.13521-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Previous version of patch 1 did overwrite a syscall return
value that was changed by ptrace or seccomp (in regs->d0)
by -ENOSYS when skipping a syscall. Branch directly to
ret_from_syscall instead of falling through to badsys (which
must set -ENOSYS). I'm sure this can be done more elegantly.

Patch 3 used the wrong struct definition for ARCH_REGS - the
kernel ptrace code copies 19 registers (from syscall stack
and switch_stack, pt_regs only contains the 14 from the
syscall stack). Stack overflow ensues.

With these changes, 79 of 94 seccomp_bpf tests now succeed.

Cheers,

   Michael


