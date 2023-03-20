Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7A3C6FD1D
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 16:10:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjCTQKm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 12:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjCTQKK (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 12:10:10 -0400
Received: from mail-io1-xd63.google.com (mail-io1-xd63.google.com [IPv6:2607:f8b0:4864:20::d63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8791346091
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 08:59:32 -0700 (PDT)
Received: by mail-io1-xd63.google.com with SMTP id f14so5614225iow.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1679327950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYHfRgyFGmfXf7uT3/vn0EeWZOwjnHEPhqCLdhvEaVc=;
        b=ZxWrpiJs8GXKz97FuIUkpX603uXClPdCVINDc9hV7KeMZQYGOuSSbdoLpkwhgtobo+
         ARwfAqQnNBfsFodNn/CQDVMOJRbBgwHMYj53Udx5uwctETte7B8YA8K4ZV9iNd6ZaQ3t
         DRUDaSKI/MpKj6epZ0TKbhrVoeUE2rkuzlSCwLmPTFTXRPHAueMhuryrLYe6vaQDkTjH
         vssgS9iP7h2ejoAaBYYa9/4z0uWamhu2QO4c7vVupzt4jS9IiYLpUJKSorUY9yJSlNtL
         O6oVaBAIx+Dw9i+YbLz04OdPIp2HNIizHbQbEEmFQBC8fMoZMFrED0xsqSgGcxPIZKMY
         BeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYHfRgyFGmfXf7uT3/vn0EeWZOwjnHEPhqCLdhvEaVc=;
        b=FZU386ISIfQOxM/Tpznl6Elq8ed+urHRORUU+ObygcI3mIGG9CO3CtiWEjkSpyOxV4
         dFXK/98QfKeB+zuJLJQXC0ZVxnMdOgFqiUBnCMtoTikkOB5q0m0wwH27W3VQT70cycT9
         d0sxSiLuHYM7JbxU196pzqsqY/sS7j0KzHngIbjJx6gQb4eJSO7D05NWqodVGPh9W1wH
         M2gB3qO4ChHXYKvKxnv/tmZDVNtZv0lm/Hblyz++f2h2jGbvEtFriL491KQOd50LIfMu
         SLWrpgO98F2ebOZA7Z7WRzKHVJFBe598tVNIcUXtZFzlwG273oScLCmitGaMo3Tf2ZBK
         GFNw==
X-Gm-Message-State: AO0yUKXIoWwJSvqm5XGd2e7P7RuhZqWrDYQkI1TB/RvCjq/KUTFie9YW
        qonkRqlMY7O4G1xCNYLVhh33WiJRkI0Z0/bpSNaZ6gorJ2RdOQ==
X-Google-Smtp-Source: AK7set80AWFqWRlEqnusarywacYoeJZQqdV4SbszNu0Fo0QocmMWzC9cQl9RbHeabQIFFidhfX9jbcr4qpjp
X-Received: by 2002:a5d:8b08:0:b0:752:dca2:6690 with SMTP id k8-20020a5d8b08000000b00752dca26690mr5482280ion.19.1679327950306;
        Mon, 20 Mar 2023 08:59:10 -0700 (PDT)
Received: from c7-smtp.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id h5-20020a022b05000000b004060ccabe70sm1726205jaa.66.2023.03.20.08.59.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Mar 2023 08:59:10 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
        by c7-smtp.dev.purestorage.com (Postfix) with ESMTP id D6AB720D24;
        Mon, 20 Mar 2023 09:59:09 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
        id D232FE402C8; Mon, 20 Mar 2023 09:59:09 -0600 (MDT)
From:   Caleb Sander <csander@purestorage.com>
To:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-nvme@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org,
        Caleb Sander <csander@purestorage.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] nvme-tcp: fix nvme_tcp_term_pdu to match spec
Date:   Mon, 20 Mar 2023 09:57:36 -0600
Message-Id: <20230320155736.1492682-1-csander@purestorage.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <linux-m68k@lists.linux-m68k.org>
References: <linux-m68k@lists.linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The FEI field of C2HTermReq/H2CTermReq is 4 bytes but not 4-byte-aligned
in the NVMe/TCP specification (it is located at offset 10 in the PDU).
Split it into two 16-bit integers in struct nvme_tcp_term_pdu
so no padding is inserted. There should also be 10 reserved bytes after.
There are currently no users of this type.

Fixes: fc221d05447aa6db ("nvme-tcp: Add protocol header")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Caleb Sander <csander@purestorage.com>
---
 include/linux/nvme-tcp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/nvme-tcp.h b/include/linux/nvme-tcp.h
index 75470159a194..57ebe1267f7f 100644
--- a/include/linux/nvme-tcp.h
+++ b/include/linux/nvme-tcp.h
@@ -113,12 +113,13 @@ struct nvme_tcp_icresp_pdu {
  * @fei:           fatal error information
  */
 struct nvme_tcp_term_pdu {
 	struct nvme_tcp_hdr	hdr;
 	__le16			fes;
-	__le32			fei;
-	__u8			rsvd[8];
+	__le16			feil;
+	__le16			feiu;
+	__u8			rsvd[10];
 };
 
 /**
  * struct nvme_tcp_cmd_pdu - nvme tcp command capsule pdu
  *
-- 
2.25.1

