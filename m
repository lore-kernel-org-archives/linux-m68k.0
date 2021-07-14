Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F98C12002
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jul 2021 20:05:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F30B1613FC
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jul 2021 20:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbhGNUH5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Jul 2021 16:07:57 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:49037 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240530AbhGNUG3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 14 Jul 2021 16:06:29 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4GQ7jf6lBBz1qwH3;
        Wed, 14 Jul 2021 22:03:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4GQ7jf60QXz1qtHJ;
        Wed, 14 Jul 2021 22:03:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Mvct4m2Pg6iW; Wed, 14 Jul 2021 22:03:33 +0200 (CEST)
X-Auth-Info: IwVMGSZJ8mFlS08oPMrAXNz+cN9qixOpxQB4WJr6TAz158wbr5Z38iFXc4jJkdlv
Received: from igel.home (ppp-46-244-191-35.dynamic.mnet-online.de [46.244.191.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 14 Jul 2021 22:03:33 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 621042C24BA; Wed, 14 Jul 2021 22:03:33 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: RFC: remove set_fs for m68k
References: <20210709070132.3387689-1-hch@lst.de>
        <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
        <87fswjomtm.fsf@igel.home>
        <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
        <20210713054134.GA5880@lst.de>
        <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
        <20210713085419.GA22839@lst.de>
        <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
X-Yow:  Did you GAIN WEIGHT in th' past 5 MINUTES or am I just DREAMING of two
 BROCCOLI FLORETS lying in an empty GAS TANK?
Date:   Wed, 14 Jul 2021 22:03:33 +0200
In-Reply-To: <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com> (Michael
        Schmitz's message of "Thu, 15 Jul 2021 07:26:04 +1200")
Message-ID: <875yxcek8a.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

diff --git a/arch/m68k/include/asm/uaccess.h b/arch/m68k/include/asm/uaccess.h
index a308f0b41154..578e643ec83d 100644
--- a/arch/m68k/include/asm/uaccess.h
+++ b/arch/m68k/include/asm/uaccess.h
@@ -193,22 +193,22 @@ do {									\
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
 do {									\
-	type __gk_dst = *(type *)(dst);					\
+	type *__gk_dst = (type *)(dst);					\
 	type *__gk_src = (type *)(src);					\
 	int __gk_err = 0;						\
 									\
 	switch (sizeof(type)) {						\
 	case 1:								\
-		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u8, b, d); \
+		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src, u8, b, d); \
 		break;							\
 	case 2:								\
-		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u16, w, r); \
+		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src, u16, w, r); \
 		break;							\
 	case 4:								\
-		__get_user_asm("move", __gk_err, __gk_dst, __gk_src, u32, l, r); \
+		__get_user_asm("move", __gk_err, *__gk_dst, __gk_src, u32, l, r); \
 		break;							\
 	case 8:								\
-		__get_user_asm8("move", __gk_err, __gk_dst, __gk_src);	\
+		__get_user_asm8("move", __gk_err, *__gk_dst, __gk_src);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
