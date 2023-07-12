Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14F6EB64D9
	for <linux-m68k@archiver.kernel.org>; Wed, 12 Jul 2023 10:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjGLK1M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jul 2023 06:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjGLK1M (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 12 Jul 2023 06:27:12 -0400
Received: from mail.208.org (unknown [183.242.55.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB98CC2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jul 2023 03:27:09 -0700 (PDT)
Received: from mail.208.org (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTP id 4R1DSV6BvwzBR7b4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Jul 2023 18:27:06 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1689157626; x=1691749627; bh=NjUUY+3+UT6hCyVfFCcB4tKetyX
        PuWZgUfS/KNX/ki8=; b=zQjohs6tGYSMFdVyPE2jTYeF5v4H4z95OP652oBLHdr
        /eXfIH68mYfZnzq2OIs+1HADszJ5NL0RaE8qa4mkGCvBfH2SQ6g+9iC7dQ5GYy6q
        evbvg5GsxIw80rfi+xNGhDl5YYKmoWGExfxtIdIIoxsQONpDW3m39gAPOLlwLoWi
        i45gAjNJNVbSsD4TQxHCEnjeAzFQcThT6fhgH7wxV/FzCi67MEAK/Jiudq1xz41P
        j5wnELWheKJZybscWM9c3YSAjbv6VXCAndTxHUPzrVcRl5dBBJKvhg7YZiMFg+49
        i19De1K2t3BRcHismWe1xZZ/UjdYwX3E0bNQVT00Jjw==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
        by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id p8SgyYkni5sC for <linux-m68k@lists.linux-m68k.org>;
        Wed, 12 Jul 2023 18:27:06 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
        by mail.208.org (Postfix) with ESMTPSA id 4R1DSV3jG7zBR5lc;
        Wed, 12 Jul 2023 18:27:06 +0800 (CST)
MIME-Version: 1.0
Date:   Wed, 12 Jul 2023 18:27:06 +0800
From:   hanyu001@208suo.com
To:     sammy@sammy.net, geert@linux-m68k.org
Cc:     linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Fwd: [PATCH] scsi: snic: Convert snprintf to scnprintf
In-Reply-To: <tencent_D20A645667548A8D5B1261D32ED4369FD70A@qq.com>
References: <tencent_D20A645667548A8D5B1261D32ED4369FD70A@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <f1898ecc1966e75af3a0a238ee600212@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Coccinelle reports a warning:

drivers/scsi/snic/snic_attrs.c:35: WARNING: use scnprintf or sprintf
drivers/scsi/snic/snic_attrs.c:48: WARNING: use scnprintf or sprintf
drivers/scsi/snic/snic_attrs.c:26: WARNING: use scnprintf or sprintf:

Signed-off-by: ztt <1549089851@qq.com>
---
  drivers/scsi/snic/snic_attrs.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/snic/snic_attrs.c 
b/drivers/scsi/snic/snic_attrs.c
index 3ddbdbc3ded1..255cff16c2bd 100644
--- a/drivers/scsi/snic/snic_attrs.c
+++ b/drivers/scsi/snic/snic_attrs.c
@@ -13,7 +13,7 @@ snic_show_sym_name(struct device *dev,
  {
      struct snic *snic = shost_priv(class_to_shost(dev));

-    return snprintf(buf, PAGE_SIZE, "%s\n", snic->name);
+    return scnprintf(buf, PAGE_SIZE, "%s\n", snic->name);
  }

  static ssize_t
@@ -23,7 +23,7 @@ snic_show_state(struct device *dev,
  {
      struct snic *snic = shost_priv(class_to_shost(dev));

-    return snprintf(buf, PAGE_SIZE, "%s\n",
+    return scnprintf(buf, PAGE_SIZE, "%s\n",
              snic_state_str[snic_get_state(snic)]);
  }

@@ -32,7 +32,7 @@ snic_show_drv_version(struct device *dev,
                struct device_attribute *attr,
                char *buf)
  {
-    return snprintf(buf, PAGE_SIZE, "%s\n", SNIC_DRV_VERSION);
+    return scnprintf(buf, PAGE_SIZE, "%s\n", SNIC_DRV_VERSION);
  }

  static ssize_t
@@ -45,7 +45,7 @@ snic_show_link_state(struct device *dev,
      if (snic->config.xpt_type == SNIC_DAS)
          snic->link_status = svnic_dev_link_status(snic->vdev);

-    return snprintf(buf, PAGE_SIZE, "%s\n",
+    return scnprintf(buf, PAGE_SIZE, "%s\n",
              (snic->link_status) ? "Link Up" : "Link Down");
  }
