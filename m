Return-Path: <SRS0=mY22=7K=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2FBC433DF
	for <linux-m68k@archiver.kernel.org>; Thu, 28 May 2020 20:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83AF62072D
	for <linux-m68k@archiver.kernel.org>; Thu, 28 May 2020 20:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFizhpQo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407164AbgE1UZV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 28 May 2020 16:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407151AbgE1UZU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 28 May 2020 16:25:20 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B993BC08C5C7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 May 2020 13:25:19 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e2so1273650eje.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 May 2020 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsDx1+HqzeOLmU2cGJB/R9l75f9GFU3ZdsBq6QSLDGI=;
        b=OFizhpQoKTj+VMjm+xtOr8jLrdQcPeeFyLc5xmp5dfG8OID3H/OqffYeARfWnkuG5O
         HA4PPwrUxFlvtay6z3ROI+GeI+6hTfY+YA+bzCn9qP86G9Mb7pI7ixgQtrheS4f5hlKV
         o1C6bk5UVhaug3SZIz+ny19Q/Gklhs9Cpy6ez18yVRJUhthvX9uikrs2hblQddb0suCl
         QK3eH7Mi1Iu3OcJjJyaYCG3WaZMgtVQgY1kAyq96dCjunRNRmyfsDlnxLd/Y10re4Sm5
         zj8thhrJ7w3fAgtTj9HODOJSgCbggOHA4JJ2hEnuRZnQgMXC9MaSKPPSFIvZrTJ/YZK8
         aF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsDx1+HqzeOLmU2cGJB/R9l75f9GFU3ZdsBq6QSLDGI=;
        b=gdePYusnWIc2anoFQP7MGtee5AhNcaoT7yi55qRZ0NPrBCzSZeWtdzDWJLsqIAsXvU
         qFIy0sdsYppMQb0KNgnBTTU6sI4YUavmm1bbSFsaExFH6Wher3lHQku4ADrZj9J2DY7X
         HYl/yYv3rbSMyYNKL3XpSQXgtlVlZDaCP4cG8+08Y7RjvA49BDZ9IwXnFABYIOLR1A53
         bCKUerJDESCGKU7KTW3hQzskLOFeaehm41m49sV3N5DdYTVYQmWmlXjFESv/yUwZ/nvc
         cZAHV9hfTq9hofm9rUPnMNw9WtmlvRxjvBTWlTvFoyxZ4ZEy8yQkKaIIfzfpuy2V+kno
         ZgIA==
X-Gm-Message-State: AOAM530ARBDmtRe3zF7pnFjlCAu/p4ZgbyDRTnSH+EMYHykSeef3Q1Df
        TwZEKdH0OVEH+MU5cuAtTUE=
X-Google-Smtp-Source: ABdhPJwv8scYyg/T6ia9eYVXtnoO3bR+WYJHSHo6we7TJtceAx1CigwkOPlXTHvhMvnFawEQESRXxA==
X-Received: by 2002:a17:906:bc4c:: with SMTP id s12mr4537442ejv.285.1590697518344;
        Thu, 28 May 2020 13:25:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:d98f:8461:8d2c:e59b])
        by smtp.gmail.com with ESMTPSA id y13sm5692736ejm.107.2020.05.28.13.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:25:17 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] fix missing handling of __user in nommu's uaccess()
Date:   Thu, 28 May 2020 22:25:12 +0200
Message-Id: <20200528202514.27175-1-luc.vanoostenryck@gmail.com>
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

Luc Van Oostenryck (2):
  m68k,nommu: add missing __user in uaccess' __ptr() macro
  m68k,nommu: fix implicit cast from __user in __{get,put}_user_asm()

 arch/m68k/include/asm/uaccess_no.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
