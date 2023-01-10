Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A102C46467
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 20:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjAJUWv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Jan 2023 15:22:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbjAJUWu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2023 15:22:50 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320B75D416
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 12:22:50 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id z4-20020a17090a170400b00226d331390cso14750779pjd.5
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 12:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cU3MVb5ceS8PMz6IKk8KxM81lw74s5MFspv3y8p4is=;
        b=Ji0Hg5yoOpHcAAZqIWuWAck25zXZUVl12QkfXFll4DMlWoIz0SKUxNNIO0ZgHTQypx
         wDXvLgrJMc1p+0P9IrP6L/JJL4yhSvoXdjnl4tKR2/vN4+LgGYh/+wnqP0H+lM8C1ueF
         34Wz4ykQoP6j8MRG8dO9WyXBMn8V+rVTNYjmS+9FYPL8VzGyPzJ87L0luM/fi2R4dF4a
         zF57jJ4jcVXoukcXEonKR/CwFKfJI/Q8CC9W6MILDbid/pIgtZX9mVySXPGlk8xNqV/+
         nc6YCjRA8xoQDHXWe8f8l2Cx4DS0X3sHA4qqV77MO31mlN/O9jCFIpSiwstbeUl7nnnj
         1Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cU3MVb5ceS8PMz6IKk8KxM81lw74s5MFspv3y8p4is=;
        b=mH24SsX2GZszRnbYkzJj1aZ9cFveoRbqx6IUinXcEoyyhmh9ixo0odluI/kWLwmvt1
         8lDoj1juGU5K9H/xKEBzfWP+gy38eziRechW/DvGq2SVP0r2pp7LFGHiDp8whmHi5j7o
         ap2NhleLhxTSF/7VBzJUH0mgFBYqE5BfEdLexqyJqKOY/rb0fa8o4pTPLqFYBLKetYmy
         LX7c5ztFZkqPbD48RTXVZMUnUlQstMB2s/MemzYlFi1gohHX1hlPhw5FjQgu+lEgRmS9
         mR0tVfvPEEZKiqcRSqUsW5XvUK4ay4ChEYFO5BHYU2oKCD7UG1CTVr4x5uMGPPgz1hUz
         2O7w==
X-Gm-Message-State: AFqh2kp6Y0lxIhvfBQU0DCMLm4fnIcZhi4LYbqcZOUYXdj3E/qQ+Y5RU
        B4qY5Nvp4tefY+9raKDmIK+0EZS9bs0=
X-Google-Smtp-Source: AMrXdXu1EHhjpBic1MxYCcGFYbhGL64NHR2yqun2OT52jhTLikh9jQQcDz5Yk0ePnfsQO6muZ/KLDA==
X-Received: by 2002:a17:90a:a593:b0:219:3812:f254 with SMTP id b19-20020a17090aa59300b002193812f254mr72612859pjq.19.1673382169694;
        Tue, 10 Jan 2023 12:22:49 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id i5-20020a17090a64c500b0022721df27e9sm3290035pjm.11.2023.01.10.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 12:22:48 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id BEA22360312; Wed, 11 Jan 2023 09:22:44 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de
Subject: [PATCH v12 0/3] Add kernel seccomp support for m68k
Date:   Wed, 11 Jan 2023 09:22:40 +1300
Message-Id: <20230110202243.29383-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Merge conflict markers left over in v11 removed, version
number bumped in order to appease patch management tools.

No other changes from v11.

Cheers,

   Michael


