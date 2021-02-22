Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7200C433DB
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Feb 2021 15:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EB4064E83
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Feb 2021 15:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhBVPNn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 Feb 2021 10:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhBVPNZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 Feb 2021 10:13:25 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E0EC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Feb 2021 07:12:42 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n10so14711953wmq.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Feb 2021 07:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0TOeWb9HGAVOiFV96tO3iwrSfpr1HUMq4Lyw23rID8=;
        b=FXji/u2iaXY+XOLURddZgd2B9Komiw4Zs+cHylXgLODWE9GujYAMZXOAJt49ncgKkj
         KXasUXoXmvp4d8wnMqKd80kcI7te+i8Ssj5jDkgEWFuHlI+B6a2sASXp0MxfAR6JnXe8
         PMBmzH05uvtN8ixL0Xf+EQKCWEzHPeryma2B8WEKKwAVtI0pXqr1NlCyNenHmBJpSL8S
         /+oAK7AHbhG8Bp1qrmvN2UnpdRZab4b+NfCGuGFlZhbfGdnHHN2BEQP/z7fvhdeo8a9n
         SKJFfnaPm0+G5TFN4ZPUDwZLEAxSLZT3kXUZZdZbgYAQSBq86aQw+eD/RGBp29tx1xWa
         GH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W0TOeWb9HGAVOiFV96tO3iwrSfpr1HUMq4Lyw23rID8=;
        b=tP9p8VGXgCgTB14Lr8n/uEqK1HxubIIkB2DtAo24ZbAAmopbDcWTl4D5VUL8B1UZrM
         6b+1y5fWX3duiZPsPEYLJBl1oJR3PhYDEtPtIux2XwjMGop/M6isS1J/3Jpks294nfFA
         ctEs6DxCjwDAm7HDgq6Bu/Kv+k8ghRab6CZ4UBNANhBLfhRsSVJN69qB4bg3l/Fa/3ME
         nSwctXpQZUjvEvoEmsNmht3YMLKvW+4UeMz1T18F1Ys1RMnKWq866fWTY8gwtgVTH4o0
         OOxK0tHyH9c0douK7Jawre2KvcBM570sAK/1XSP2DCt9jiYNqrj//tEeY21BuA4X4dgT
         OKaQ==
X-Gm-Message-State: AOAM532UczcTdb6oyvm+gUnkWhYhVqqJAusltgZLBEw/fqzrdi0ZTD7d
        OOIU3t+7mXKjXI5VtHA4e+o=
X-Google-Smtp-Source: ABdhPJwJjaqNTMZMEqWfwHu3GKPnp7PUpKeoIN2SSKme4SlDCBTSRJD1aRWbEX4S9qfmjT5mjltYPQ==
X-Received: by 2002:a05:600c:26c4:: with SMTP id 4mr9157865wmv.126.1614006761746;
        Mon, 22 Feb 2021 07:12:41 -0800 (PST)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id q25sm20952001wmq.15.2021.02.22.07.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:12:41 -0800 (PST)
From:   Romain Perier <romain.perier@gmail.com>
To:     Kees Cook <keescook@chromium.org>,
        kernel-hardening@lists.openwall.com, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jiri Pirko <jiri@nvidia.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Chuck Lever <chuck.lever@oracle.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jessica Yu <jeyu@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Steffen Maier <maier@linux.ibm.com>,
        Benjamin Block <bblock@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Romain Perier <romain.perier@gmail.com>, cgroups@vger.kernel.org,
        linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-integrity@vger.kernel.org, linux-nfs@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-hwmon@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/20] Manual replacement of all strlcpy in favor of strscpy
Date:   Mon, 22 Feb 2021 16:12:11 +0100
Message-Id: <20210222151231.22572-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

strlcpy() copy a C-String into a sized buffer, the result is always a
valid NULL-terminated that fits in the buffer, howerver it has severals
issues. It reads the source buffer first, which is dangerous if it is non
NULL-terminated or if the corresponding buffer is unbounded. Its safe
replacement is strscpy(), as suggested in the deprecated interface [1].

We plan to make this contribution in two steps:
- Firsly all cases of strlcpy's return value are manually replaced by the
  corresponding calls of strscpy() with the new handling of the return
  value (as the return code is different in case of error).
- Then all other cases are automatically replaced by using coccinelle.

This series covers manual replacements.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy

Romain Perier (20):
  cgroup: Manual replacement of the deprecated strlcpy() with return
    values
  crypto: Manual replacement of the deprecated strlcpy() with return
    values
  devlink: Manual replacement of the deprecated strlcpy() with return
    values
  dma-buf: Manual replacement of the deprecated strlcpy() with return
    values
  kobject: Manual replacement of the deprecated strlcpy() with return
    values
  ima: Manual replacement of the deprecated strlcpy() with return values
  SUNRPC: Manual replacement of the deprecated strlcpy() with return
    values
  kernfs: Manual replacement of the deprecated strlcpy() with return
    values
  m68k/atari: Manual replacement of the deprecated strlcpy() with return
    values
  module: Manual replacement of the deprecated strlcpy() with return
    values
  hwmon: Manual replacement of the deprecated strlcpy() with return
    values
  s390/hmcdrv: Manual replacement of the deprecated strlcpy() with
    return values
  scsi: zfcp: Manual replacement of the deprecated strlcpy() with return
    values
  target: Manual replacement of the deprecated strlcpy() with return
    values
  ALSA: usb-audio: Manual replacement of the deprecated strlcpy() with
    return values
  tracing/probe: Manual replacement of the deprecated strlcpy() with
    return values
  vt: Manual replacement of the deprecated strlcpy() with return values
  usb: gadget: f_midi: Manual replacement of the deprecated strlcpy()
    with return values
  usbip: usbip_host: Manual replacement of the deprecated strlcpy() with
    return values
  s390/watchdog: Manual replacement of the deprecated strlcpy() with
    return values

 arch/m68k/emu/natfeat.c                 |  6 +--
 crypto/lrw.c                            |  6 +--
 crypto/xts.c                            |  6 +--
 drivers/dma-buf/dma-buf.c               |  4 +-
 drivers/hwmon/pmbus/max20730.c          | 66 +++++++++++++------------
 drivers/s390/char/diag_ftp.c            |  4 +-
 drivers/s390/char/sclp_ftp.c            |  6 +--
 drivers/s390/scsi/zfcp_fc.c             |  8 +--
 drivers/target/target_core_configfs.c   | 33 ++++---------
 drivers/tty/vt/keyboard.c               |  5 +-
 drivers/usb/gadget/function/f_midi.c    |  4 +-
 drivers/usb/gadget/function/f_printer.c |  8 +--
 drivers/usb/usbip/stub_main.c           |  6 +--
 drivers/watchdog/diag288_wdt.c          | 12 +++--
 fs/kernfs/dir.c                         | 27 +++++-----
 kernel/cgroup/cgroup.c                  |  2 +-
 kernel/module.c                         |  4 +-
 kernel/trace/trace_uprobe.c             | 11 ++---
 lib/kobject_uevent.c                    |  6 +--
 net/core/devlink.c                      |  6 +--
 net/sunrpc/clnt.c                       |  6 ++-
 security/integrity/ima/ima_policy.c     |  8 ++-
 sound/usb/card.c                        |  4 +-
 23 files changed, 129 insertions(+), 119 deletions(-)

-- 
2.20.1

