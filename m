Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE82C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Jan 2022 07:42:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbiA0HmH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Jan 2022 02:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiA0HmG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Jan 2022 02:42:06 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AB1C061714
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jan 2022 23:42:06 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id c3so1791397pls.5
        for <linux-m68k@vger.kernel.org>; Wed, 26 Jan 2022 23:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=+b6fKdDEPmQijC6tLXvadAPBW43O0LbQf4BnG+c5p74=;
        b=V7zkRgDPr7H50LLS/EWevfqe87WjammBuRFRIJFORig20AeqhtJW0gJJfjasQ9KRMv
         /jpB03eIXiNzbx3WsL3/6MCWN2NHQY8fUNomiyxfrnixm3K8/MFwRYWQbhH1MNRWF6XW
         jprK5rWjAeh7S+N3P2jSmf26BCkNzdR/0e7ljk360nPRcTKIhoaofRocaaAM4ZiwBrbM
         gRrTL5FbTfkR91OZN/P17MLB3H50doTNYZFZxv8TEe0A9cHHhWUTKOluvFns16WTAMqA
         WVyzbMvLCNae8Mt4enIvNl0jDiEu2/7z4nTmu+gX+j9iuNPHs9G2wzenMxzCsyxqtQKN
         lqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+b6fKdDEPmQijC6tLXvadAPBW43O0LbQf4BnG+c5p74=;
        b=Vb7TphsYd3C93S87og/U7zbrbUMCYx/h8zOySsCm2vMlqhdnbB2gidgLnh19wX/ceQ
         5ZIQzVtRDzsLIUnEHhpu0uUNDToQiH8purbgYvaKeeWvybzO8RNbC1UIzp245twObLUq
         pIQd3dTH5QjD0rvaoj/T2EfBh7fMpoasGYdpYOWgmZRpO2v3BW2V1u9RWPbp01Mmbzd1
         PTLrhgASSC590Ziex3JfaSBOLh5I1xrmNC/U/eApvWyvwXvvG4MVyRWiub181pyjQ4X9
         ez/Tx5azlbrLKdKuSwIML64BKJqlsfWkWfDkRa8y7J+b8WtaeWhfyzYfmGZSxIHwD6ZB
         XP6w==
X-Gm-Message-State: AOAM532k1Ls9NgoIHYumnRF1kQ68gXbE5CLnLE9949TnjyX8rXHSB4mC
        opbQiAvT6Wy2+9+Yn00rndg=
X-Google-Smtp-Source: ABdhPJytNLxQa8GzICkP+2e0cYZCRHeg8+uAu1Fuico2gdx7dGLnCMF2n88QxRnZIa9UzqTCiy2zww==
X-Received: by 2002:a17:903:2307:: with SMTP id d7mr2858128plh.52.1643269326088;
        Wed, 26 Jan 2022 23:42:06 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id j14sm4363144pfj.218.2022.01.26.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 23:42:05 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id F1CEA360333; Thu, 27 Jan 2022 20:42:00 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        glaubitz@physik.fu-berlin.de
Subject: [PATCH v10 0/3] Add kernel seccomp support for m68k
Date:   Thu, 27 Jan 2022 20:41:55 +1300
Message-Id: <20220127074158.25888-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Patch 3 adds the test for TIF_SECCOMP thread info flag to call
into syscall_trace_enter() when seccomp syscall filtering
is active, which was missing from earlier versions (classic
MMU m68k only - need some help with the test for 68000 and
coldfire).

The previous version required the TIF_SYSCALL_TRACE
flag to be set for syscall filtering to work

The rest of the series remains unchanged from v9. 

Tested on ARAnyM, 63 out of 89 seccomp_bpf tests now pass
(33 with the old version).

I hope you didn't waste too much effort on testing v8/v9, Adrian.
Should have a suitably large brown paper bag somewhere yet :-(

Cheers,

   Michael

