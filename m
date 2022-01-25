Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526B3C433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jan 2022 07:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442711AbiAYHQg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jan 2022 02:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442712AbiAYHKk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Jan 2022 02:10:40 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9A3C068097
        for <linux-m68k@vger.kernel.org>; Mon, 24 Jan 2022 22:08:29 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id k17so667238plk.0
        for <linux-m68k@vger.kernel.org>; Mon, 24 Jan 2022 22:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=D6Y7Vz7bdV7IRWe+gb+VYZFrEcjesG5E2UkNCKGDxuw=;
        b=IfD7BE2P3eBdrFqkE5EPzpwedTshKLwtZ4Fmp6z+Vgna7tumjOxSarwJvJZtaP+z2/
         kAlUjunQdhhXVgZIG7dhWGku0m0fGSs+WexXrVbogxjyQws+YHKmU5xfMAPbE7KU5aE4
         Kk9mgMpSLnLDNp1MKRdI64K3Td1+aiSw1O5B8oDTQRA71gREnPLONvwDb2Ay/DGJ8c0T
         jxkudoISGClEOFEWGn48pfb5JNFs3jPfoAUOzuJHqVLlkjh9TCJwTlMaTfBnTut5hqp9
         KorGmC6rchLOHqzHHxIoGdf5thXvIQolSdhYXbLPs6XXiLGk1G4VHe7/ELDgAWz8gk1t
         m6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D6Y7Vz7bdV7IRWe+gb+VYZFrEcjesG5E2UkNCKGDxuw=;
        b=x5PqhgY0VEJReFdwbgy6TxiIq7jiRxELwrQ4Wu1nzwkbQzksSXSbOZZLKRRtCvX8Mm
         9hLaP3vw591wjEZILrhQKwjpmSat8VJE9hz+/neeCACaRigPtcbYZgquO9M8BX+xv9V/
         HvXQv5JE0abz2DeGGUjJVw1hME8KxZDq2/vmiCWCTjv3hwjAr7Up6a1WFHUfierH5Wpx
         ZZ/Wa7fb/gUNmDbHVY8TDZI8PsfQhYtSqT/q4GepZ3oZyR+CMUmLhBrdTOuuVavxuXeX
         B+qDAAQdkhhlBsEcu86KzOITNyxn1jLquwcDM0CPknY5/QCBKoMx3DiHCjhbbLP2Lzre
         5YEA==
X-Gm-Message-State: AOAM532uM2Z5o919PZVYgBuf+4uz1naud41S27tvwkIO0/fq2LqQHd0C
        UkBimQ7XOXmLOafG1OIQhPa+/iI4imI=
X-Google-Smtp-Source: ABdhPJx2dF+Ia47U7hWRfR0w6Y0UdlJgoBQk1UAl4ePHuqu5gCTzq/UtkA7tAI652U8G1YUtUwhY+Q==
X-Received: by 2002:a17:902:a9c4:b0:14a:d4ed:7a7a with SMTP id b4-20020a170902a9c400b0014ad4ed7a7amr17315316plr.138.1643090908706;
        Mon, 24 Jan 2022 22:08:28 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id f18sm18874796pfj.6.2022.01.24.22.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 22:08:27 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 2E06F360333; Tue, 25 Jan 2022 19:08:23 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk
Subject: [PATCH v9 0/3] Add kernel seccomp support for m68k
Date:   Tue, 25 Jan 2022 19:08:18 +1300
Message-Id: <20220125060821.2405-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Respin of m68k kernel seccomp support, again. 

Patch 1 adjusted to match Eric's patch now gone into v5.17-rc1,
rest of the series remains unchanged from v8. 

Tested on 030, no regressions with VM stress tests.

Cheers,

	Michael


