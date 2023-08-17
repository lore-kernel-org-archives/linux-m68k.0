Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD69C2FC14
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Aug 2023 03:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347903AbjHQDuU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 23:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347925AbjHQDuI (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Aug 2023 23:50:08 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CFA26A8
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:50:07 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bee82fab5aso16003005ad.3
        for <linux-m68k@vger.kernel.org>; Wed, 16 Aug 2023 20:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692244207; x=1692849007;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvx72Sqgf7AHLcS1HrdF/0aunIvUsrljx0qf3RMhfXA=;
        b=ZSlPHjdpuipzm/1SkdDDicIXzeWrZdU24XdI5vE6voE3RZ2JJxHGxhfzYBOnrSWZo0
         1E3/genu4Ou8aYnFl4DShRhGjhBhw5LI+00ZtSOTOYOlHxAwQ2ewFNDMA7+KB1Q+a2VD
         0o6g44XmtE+PzpbtOq4uNtDQLGAqDxvaG+l8yjPbw1UCtV5GBysL8i5F9o4x3mYxXNN/
         oGZxP4xmRg+QAeiTTfGdzZpJoD6R/gYhPH27S96Q7KWbRNRrY1SDbm/oSb9qMWHKlJm1
         L+/NZbo/ZTs0MAKNXJQ7rTUjwES4Do8x4T3OHiaIyM3Ijv3DErmfujsw2p/SkjAkgpw2
         StlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692244207; x=1692849007;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvx72Sqgf7AHLcS1HrdF/0aunIvUsrljx0qf3RMhfXA=;
        b=feQ6f/kBTRX92yCC7ZM87+X1k7BX4VqaIkxiHLak7EFzqiE5BUKSnxRVaAEZ9BbD3F
         2nGBpwsGWsTS9Qnk7edSvqmJ2B2H/TIm/pPgy1Coo3HgoiHvZKLj8uJWZNR0cey/YpQq
         t+1q5uBHV24wMY0LCKXumwBfLcuXn2UZvTUz4bfr1bltLSV7E0qASrcjfyWljfMpCjy+
         CVb6qMHSr8iJ/QQo1f5uVQv1Qwd/Q+FeQZmz6XPSCFnBDt8TUWB+4msnQdri6zvLqZbG
         KvfuHSKBs88TDkKtsxdY5m3iu1AGdziugC8Vn+ylo9UcO38hdXV1TXW4oPCvMwD9afIh
         YTig==
X-Gm-Message-State: AOJu0YxETnQhAzebRMykzt/FZnV1spALFP5BfUCRSjuEh20KOhZSiU+8
        Z36kuTSbGs+qdgCRkCQbk1V48p1Bjl0=
X-Google-Smtp-Source: AGHT+IEK3BAGD6GIGOe0Pb0VY4aSjw+FoG1spmlpV7z4tmYV15WAglcdF2oJmZxnHgxzwtO7E1HmCw==
X-Received: by 2002:a17:902:d4c3:b0:1b8:33d4:77f8 with SMTP id o3-20020a170902d4c300b001b833d477f8mr5101233plg.23.1692244207266;
        Wed, 16 Aug 2023 20:50:07 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-62-141-252-fibre.sparkbb.co.nz. [122.62.141.252])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902b94300b001bb988ac243sm13808448pls.297.2023.08.16.20.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:50:06 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id D548A36032D; Thu, 17 Aug 2023 15:50:02 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     will@sowerbutts.com, linux-m68k@vger.kernel.org
Cc:     rz@linux-m68k.org, geert@linux-m68k.org
Subject: [PATCH RFC v3 0/2] Q40 IDE fixes
Date:   Thu, 17 Aug 2023 15:49:59 +1200
Message-Id: <20230817035001.8400-1-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

v4 of the Q40 IDE patch, split into two parts. First patch just fixes the
bug introduced when converting Q40 to use pata_falcon, second patch adds the
byte-swapping option requested by William.

Please review this again, just to make sure I haven't messed up anything
when applying the review comments to the split patches.

Cheers,

   Michael

