Return-Path: <SRS0=UnHi=7L=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92204C433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 19:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 671902074B
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 19:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBg3CJGj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgE2TC1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 May 2020 15:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgE2TC0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 May 2020 15:02:26 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1837C03E969
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2020 12:02:25 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y13so3110520eju.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2020 12:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSM5wNtipsPVAyBr8+6PzZYMH3IzyM52YXRRZsNV0ds=;
        b=aBg3CJGjOr7oPrlE5fYT7GtxFq2q6vcdMm3XANANb9nWk/aAX7glWi//ZkQPS2IukU
         a2dP18yIuxhczm6EvoptY66Tp6XQcKXhk0apsJyd6wGbWHCZKxGokiWzwU+Q3PYLnTtm
         hQKskcqZ/B1L1nGxUS1hCAYlDNOurLWmaz4q7iYCQbjWZo66HVOyNdWXHqX785O3VRyY
         hERd0sB5FD45ffhJZEaLmZCvLI/53uFHuSyT39PsS0TbY5GbsSNtxe+b6qXXJLuyyK7e
         slkm9eutE0k83CRXhg6rD0V0Q+eVU6wOohnHei2iFWm4plfXzLUCDJkQtUzfTlVAW+MA
         cHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSM5wNtipsPVAyBr8+6PzZYMH3IzyM52YXRRZsNV0ds=;
        b=pX6ogOKWjV60G4mzV6g7RVUF4KgBYwv0B+UUMP7ErMCY6bhZbp5bxMUpcCa8LRUbwL
         iK/9PlwpmYIEbUEPodteBeZexAfkVtkUlGqdA7ZP7nENY76V8OShw6Wt6X75l5L8hwgw
         sCm5P0d5O/yebEE4O3pGu+/4QVbYOHcPfxDKdfcpnQ1iTTeFgTmN0/2ddVVaQSIbm7ed
         cnAJSSpMBE4L2cw0U7981V+n/TOQZi60hWNb6z9s6ZjKUGEUMC28k1ar1d55gwjY6x71
         6ofTqogwztZowIc6nBD4V+qQNQTN5wdvSriWr5zANr3DoBgsftN8E85HRk+6nxNobnaG
         FvCQ==
X-Gm-Message-State: AOAM531mVeInu6nijB6kQaB8KQ+5d/DxI0mv6HxT8+ZgzEkmK/RmprIE
        N6oSW/C6KfJUkI1ywG9EB3g=
X-Google-Smtp-Source: ABdhPJzDZ/T+D+93pcaucwxTClLIx9ladIVy0a1Gll1rizB0omfCUI2KNMDokEwiIvAsEaDj5ZzmXg==
X-Received: by 2002:a17:906:1dce:: with SMTP id v14mr173609ejh.46.1590778944488;
        Fri, 29 May 2020 12:02:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:1951:ff2b:10f0:1763])
        by smtp.gmail.com with ESMTPSA id f4sm8166135ejk.17.2020.05.29.12.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:02:23 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 0/2] fix missing handling of __user in nommu's uaccess()
Date:   Fri, 29 May 2020 21:02:16 +0200
Message-Id: <20200529190218.36560-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

I received a bug report for an unrelated patch when used with m68k-nommu.
It appears that the origin of the problem is that __get_user() and
__put_user() doesn't handle correctly __user. These 2 patches fix this.

Note: this is only minimaly tested but is quite straightforward and
      since this only change __user annotation it will not change the
      generated code.


Changes since v1:
* fix typo: s/plan/plain/
* appease checkpatch with better style: s/__force*/__force */
* avoid excessive line length caused by the added cast.

Luc Van Oostenryck (2):
  m68k,nommu: add missing __user in uaccess' __ptr() macro
  m68k,nommu: fix implicit cast from __user in __{get,put}_user_asm()

 arch/m68k/include/asm/uaccess_no.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.26.2

