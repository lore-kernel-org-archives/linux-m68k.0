Return-Path: <SRS0=UZt4=7A=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA382C433E2
	for <linux-m68k@archiver.kernel.org>; Mon, 18 May 2020 19:12:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8506207F5
	for <linux-m68k@archiver.kernel.org>; Mon, 18 May 2020 19:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="qAh5Lxq2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgERTMU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 May 2020 15:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgERTMT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 18 May 2020 15:12:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7DBC05BD09
        for <linux-m68k@vger.kernel.org>; Mon, 18 May 2020 12:12:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w7so13093253wre.13
        for <linux-m68k@vger.kernel.org>; Mon, 18 May 2020 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bCXZzxOS8zJCgjyC5w6Rn+TvW8GgVJXGgkizP6xlZ7M=;
        b=qAh5Lxq2wHcGpr0KUDITIzaUFKsjIY0HfWCEsSvUR6/+4GUdyD4OxbZL/5kAd0bFhT
         eyhpuQQW+8odUeddB/J0sp/SS/eTVzipcXhDes3v9S7kYGRPblTRHOGwKNFWhnRJpRtn
         FQ37XtTu8lRvJ0ZQwpjjmiyZaxNJEp4v4GYKVEmJ4kdAcbVLTCszUZeBXEYPXSUJA+sI
         vVY0i5IwR2D8lP9NnvOKGggCpiGfEwsZS9XqQYNIRT3F2a6RKdBq/hrilUtPancO7wCx
         f0IITC/S1BGjTYIkfoFZYkj4fLtqe86ZK6jB0EFRCXio+F6YVY6qinZjMwQ4KpoYp5lT
         9y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bCXZzxOS8zJCgjyC5w6Rn+TvW8GgVJXGgkizP6xlZ7M=;
        b=IMEm1AT59vNKrrdC8fMaovqfkvNT2FX1Uqnmfq1iYMWjcO27dfv5nDa31dNhZHM8FF
         xFtZV/afKu0CnIP02KOA8VS/0D9M1WWT0C64T6PTxOmyJUsQo1F9QvWD+CftT8iIU27r
         WjUWUuxARMuvH2FAzvdbJKDW5VYtI2b/BSuw8121zDR/JDzaAWk5fe6JMEc1Zmnm3OvY
         88Ci6KPe95fxz0q8mQOKEPvJ8W7CuPmJJHtsy5r3RzVT1K+YryU2z0ewVNv7Afd/JRhO
         fCqxK1sxJiq2LzSYQvBKBxFec4SC3KsX55NWKwNyhAlI5bRgE/h74aT/DvSBDND3THkf
         WGUw==
X-Gm-Message-State: AOAM533x6ujjAPLVqw59iyy9d7z9c+P2ud9KbtvsB1sm9r/U0nLNCoIb
        2KPfhBYhSfPlObdWXDj4z0ilig==
X-Google-Smtp-Source: ABdhPJwdbLUZincjNlD04UYWm07Vh6LsPBf74FbLKNPXWp7rt5DLMbAuGoJmOsKG/qCx1T7EgO/8Mg==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr21090149wrq.169.1589829138284;
        Mon, 18 May 2020 12:12:18 -0700 (PDT)
Received: from localhost.localdomain (host203-36-dynamic.30-79-r.retail.telecomitalia.it. [79.30.36.203])
        by smtp.gmail.com with ESMTPSA id v11sm17683046wrv.53.2020.05.18.12.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 12:12:17 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        gerg@linux-m68k.org
Cc:     linux-mmc@vger.kernel.org, linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH v6 2/4] mmc: sdhci: add quirks for be to le byte swapping
Date:   Mon, 18 May 2020 21:17:40 +0200
Message-Id: <20200518191742.1251440-2-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518191742.1251440-1-angelo.dureghello@timesys.com>
References: <20200518191742.1251440-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Some controller as the ColdFire eshdc may require an endianness
byte swap, because DMA read endianness is not configurable.

Facilitate using the bounce buffer for this by adding
->copy_to_bounce_buffer().

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
Changes for v3:
- add post request callback
Changes for v4:
none
Changes for v5:
- remove useless comment before swapping bounce buffer
- rename pre_dma_transfer to copy_to_bounce_buffer
Changes for v6:
- add more details in the commit message body
- add length parameter to copy_to_bounce_buffer()
---
 drivers/mmc/host/sdhci.c | 10 +++++++---
 drivers/mmc/host/sdhci.h |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 3f716466fcfd..99613f9891a3 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -634,9 +634,13 @@ static int sdhci_pre_dma_transfer(struct sdhci_host *host,
 		}
 		if (mmc_get_dma_dir(data) == DMA_TO_DEVICE) {
 			/* Copy the data to the bounce buffer */
-			sg_copy_to_buffer(data->sg, data->sg_len,
-					  host->bounce_buffer,
-					  length);
+			if (host->ops->copy_to_bounce_buffer) {
+				host->ops->copy_to_bounce_buffer(host,
+								 data, length);
+			} else {
+				sg_copy_to_buffer(data->sg, data->sg_len,
+						  host->bounce_buffer, length);
+			}
 		}
 		/* Switch ownership to the DMA */
 		dma_sync_single_for_device(host->mmc->parent,
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 79dffbb731d3..1bf4f1d91951 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -653,6 +653,9 @@ struct sdhci_ops {
 	void	(*voltage_switch)(struct sdhci_host *host);
 	void	(*adma_write_desc)(struct sdhci_host *host, void **desc,
 				   dma_addr_t addr, int len, unsigned int cmd);
+	void	(*copy_to_bounce_buffer)(struct sdhci_host *host,
+					 struct mmc_data *data,
+					 unsigned int length);
 	void	(*request_done)(struct sdhci_host *host,
 				struct mmc_request *mrq);
 };
-- 
2.26.2

