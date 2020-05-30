Return-Path: <SRS0=U4C4=7M=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A5BC433E0
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 22:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AD602076B
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 22:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfgrrOay"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729376AbgE3Wpk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 30 May 2020 18:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729183AbgE3Wpk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 30 May 2020 18:45:40 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008F6C03E969
        for <linux-m68k@vger.kernel.org>; Sat, 30 May 2020 15:45:38 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id a45so2529536pje.1
        for <linux-m68k@vger.kernel.org>; Sat, 30 May 2020 15:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JGcTC2VgtO5sYtBlOoIqkGOEU0gTv7rQyAa1pKEQMO4=;
        b=UfgrrOayGKuNX5X/3uL9z1T4dNkKZ4akAfRijpnnowFkME63hodDy9gWlceSbGKwfg
         t3wM7pN1mSSWabMPybsJbqFO0jc9BZZcKjSpZXyzvGRIhEKGewiL6kPu4cib3WX1RdgU
         S2AnjEh786tSOXvNTmoBJnGEQNOZz+D9f2fw1GCBBRBxqRWeFGSaN/mFlEw23v0eGsmV
         Zv1ZytW2tuN8lHbn09ozPPPMpESH7xgMvJNNnEBp98KhV2KtLlFN5Sq9WIMkC49Jtcg4
         u+ePOvW5xjFXrlMfUhA7Cxl2rwceKqbVeFkqv6X3D8MBSZBsbD/bThWWYy4MdW980nzX
         9y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JGcTC2VgtO5sYtBlOoIqkGOEU0gTv7rQyAa1pKEQMO4=;
        b=W/GMzTiUZKFscCJaPcR8ZRaxANgP7HpjClLLiDeW+L/mWx3YUrMY3BpOyT0biNJZiJ
         UBJv9/bHSelMq7E3g6pzSFf4uJfX5zMOHwbNQRw9JZojzX3YNZoPcPBfA/jv+W2FA31y
         Zt1Tch8r56BCrOmZTbLIyprYStL5fV1EQWzQH1ZWC46DsSZI4s2jk2B9j4U0TBbTX0En
         7kw/DvVGsVFchL+loztv/e0UUAyfAmPm1rBejI8XP1Bzv5QsgV0sMd7Z3IYUeaY7663o
         AR2PxFNZj241bS/jnPuSBIxdtot194aTJbm41Xk7EzvewHegmTLgR+wmcJ8Xz0E63UPz
         RweA==
X-Gm-Message-State: AOAM533uQNJr/XuRPR+2Y9eKRljRU0jjLzM2apbZB4A7ak+5XqP8+TEa
        KlsxuMHoMslUyWiibgeIOCpeWFIL
X-Google-Smtp-Source: ABdhPJyNxmCm9CSyELhBMjCLe/FEfvIpAYBtkM7zpKMhAvKi7XP9hQ7AusYS6SxYd8zZP7dwysQveA==
X-Received: by 2002:a17:902:a412:: with SMTP id p18mr14333065plq.111.1590878738417;
        Sat, 30 May 2020 15:45:38 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-58-178-240-adsl.sparkbb.co.nz. [122.58.178.240])
        by smtp.gmail.com with ESMTPSA id gm11sm3358976pjb.26.2020.05.30.15.45.37
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 May 2020 15:45:38 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id EF23F360079; Sun, 31 May 2020 10:45:33 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     geert@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH] m68k - annotate dummy read in Atari ROM port IO code as __maybe_unused
Date:   Sun, 31 May 2020 10:45:19 +1200
Message-Id: <1590878719-21219-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

The Atari ROM port IO code uses dummy variables to implement writes
(not supported by the hardware) as reads that encode the write data
in part of the address. The value read from the ROM port in this
operation is discarded.

Annotate dummy variables as __maybe_unused to avoid a compiler warning.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
 arch/m68k/include/asm/raw_io.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/raw_io.h b/arch/m68k/include/asm/raw_io.h
index 8a6dc6e..911826e 100644
--- a/arch/m68k/include/asm/raw_io.h
+++ b/arch/m68k/include/asm/raw_io.h
@@ -80,14 +80,14 @@
 	({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v; })
 
 #define rom_out_8(addr, b)	\
-	({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
+	({u8 __maybe_unused __w, __v = (b);  u32 _addr = ((u32) (addr)); \
 	__w = ((*(__force volatile u8 *)  ((_addr | 0x10000) + (__v<<1)))); })
 #define rom_out_be16(addr, w)	\
-	({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
+	({u16 __maybe_unused __w, __v = (w); u32 _addr = ((u32) (addr)); \
 	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
 	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
 #define rom_out_le16(addr, w)	\
-	({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
+	({u16 __maybe_unused __w, __v = (w); u32 _addr = ((u32) (addr)); \
 	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v >> 8)<<1)))); \
 	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v & 0xFF)<<1)))); })
 
-- 
1.7.0.4

