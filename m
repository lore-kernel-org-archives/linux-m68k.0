Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9059A3C1D72
	for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Sep 2026 03:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702944; cv=none; b=cGWbu74uXpPd4Iq+nw7E+Mq+HyqwOClxtpkaoGJJ9uNsJGBGsYh11DcUHpBoLLsRRKJotEzh0BNFzqkIGHcDYXWXvzFm6EVPXjgoJqloba9pjnSGj3XkhC3E6r5Y47McWCur4HYD/keO9UMFYMySKKhF8W8UEtqwc9MUCv2eye0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702944; c=relaxed/simple;
	bh=iP7S+cs7xoWK0wiziaKiPZjB/Vtns1Oac3YluBwB8ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JWfrao+nJesTAcacG6JPqt1QMqP9XcTwwCoevQzTZ//CuwOpcmPKtf/+TRAySgQRWPNlFZ5qZExjmQ70OVW5k4wwOBQlymguylJrzA/Pc/CI41/CrAETyDjtijW0zvbQAgSnfVFe3O4JXPXS2U+xCgxn5q7yEsGApol5w8cHAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhIvhAjb; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhIvhAjb"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso153061a91.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Sep 2026 20:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702943; x=1790307743; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9aJiL/AiFig61yUXhADWCeNUu0NOrQJGwP1Agz0gBgQ=;
        b=YhIvhAjbtjgGE09M7sVbwdUSx+IIHNVMGO2jDfSttBnRGB40G5OV7pYH+xUhcSvFVA
         bLP2iz2IN1zI3Sle77T9OGZFNr2JkedX7CzoMPVUNtyO3aAolkVbG2oBDq7APn2Wch/g
         51afdiRPVVNcQ2qpCeyd0ll3Fu54wGnqIqQuLft10GxcAQwabui9XHhRRcfNUQ4wTypa
         M0XEQYLKzUv80CmoOI4TPBt0Vl2kPF/C5oRZE5V/7xA9nbjmj8TlD/o6HZFHr70DMmGU
         tlx+a/yE5CvF3h1nBgOmjEJzUAlf24tLJkPMy3LCHavruO/hTFDQmNuuP8X2QpooQqqw
         DhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702943; x=1790307743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aJiL/AiFig61yUXhADWCeNUu0NOrQJGwP1Agz0gBgQ=;
        b=1r4JVXO/HyGLlIXh/HieVm5j2gMWWtaOzuZWJiW9xXeMLfaHms3USf0lUOWkCtyi1M
         2diunVdjyJ/3WRtsz3ppVdMDu8GkObzvy0LKZJNQIXSEZHuNbBvX42giDLCOvXa3VwUs
         hX/QPG+6Hya4Ineklo7BsdJxUJmn8i23lJ3gxPeKfeWmUiLyh923+Lq9gu3KApPKKdkg
         HuLW2FgN8kIlt9DqG8Cp4+xhUfhj0dG1yPTxCV5qm2J0GikIILhYPHzHCehvxzjORhko
         T9vyzXA2Z82YNdqDKV/WGQU2d9yEy0nKPnLattiasvevMFRjB8z8rC/zswpZudVTYHvl
         W9hg==
X-Gm-Message-State: AFuF++k3f4mqCU/E9v4USRvNRhxtu3f3idMPGbQyX7XvjsT9cp7AqwNh
	79PE+uIe/8aiseaoEQTi2iPDC/WFQGeJWXEwloyOH0zMNFRLr5HRizJb+EwB0NhNwHk=
X-Gm-Gg: AYBFou1MtyA7rIsTolg/rKya7zmYGD0wA4lVNVzIc3++ekWzBxD5cNTx/IIgX8eevUa
	lAxjcobc4qSAoS6gSQTqBHNp38GGAYzXD9u6x2kBrvqeZu3FG6fG8VBorEkNMpkktH4W0Dm6emV
	3ZwLYA80Rr+Gis4SJYjqYY/zc1LWoKWysEKnUshBYNG7hLq7q6OOrpR8wWTgI502skVaY99GqAB
	GjrnxIBOReZTEaS9gOg5Pvr/uj5Nc+uHGBZ1klumd9RuyD8qATxQheT9gKDYjye70HDNJhX8S0T
	lXf1rFfS4HeusrS2uyRFndq9wKSSb4xKOEAF6jDc2v3jZM6g/UDg21wT3REfxeh3qGoupfPbg+R
	QzlWjUYdHq1SgER6DdUSU9GKJb6KMz3NL7WIlvZtzpyEFVDd1MjMk76kTJiZfoUZwpqkJcaC+Sx
	DZtF4MyWJMDjRMFIXMGOxc5R2FFfiKoTgaWuK52p4xwLzPFwo/iyruC+UVtAbs8EIoHMpaUOhmG
	5EA942hJQRmfsSeF1YR+fqKLVYSM+hWCIXVJzJZUH+mmYdnmqk6bMIOFWnTaXy+5jluXx3ho+dZ
	M53KI4a7Nvr7KAEL9Mi0emDJC5aDhsz7maxZagyWHCFL05aFs+ttGOsdC8rHBHyp2nc=
X-Received: by 2002:a17:90b:2b8e:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39e5500a842mr2475748a91.25.1789702942812;
        Thu, 17 Sep 2026 20:42:22 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce046d96sm985682c88.11.2026.09.17.20.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:42:22 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-m68k@lists.linux-m68k.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: remove unused <asm/quicc_simple.h> header
Date: Thu, 17 Sep 2026 20:42:13 -0700
Message-ID: <20260918034219.520193-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/m68k/include/asm/quicc_simple.h has been unused since
commit a3595962d824 ("m68knommu: remove obsolete 68360 support").
Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/m68k/include/asm/quicc_simple.h | 53 ----------------------------
 1 file changed, 53 deletions(-)
 delete mode 100644 arch/m68k/include/asm/quicc_simple.h

diff --git a/arch/m68k/include/asm/quicc_simple.h b/arch/m68k/include/asm/quicc_simple.h
deleted file mode 100644
index b9e2808b44ac..000000000000
--- a/arch/m68k/include/asm/quicc_simple.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/***********************************
- * $Id: quicc_simple.h,v 1.1 2002/03/02 15:01:10 gerg Exp $
- ***********************************
- *
- ***************************************
- * Simple drivers common header
- ***************************************
- */
-
-#ifndef __SIMPLE_H
-#define __SIMPLE_H
-
-/* #include "quicc.h" */
-
-#define GLB_SCC_0   0
-#define GLB_SCC_1   1
-#define GLB_SCC_2   2
-#define GLB_SCC_3   3
-
-typedef void (int_routine)(unsigned short interrupt_event);
-typedef int_routine *int_routine_ptr; 
-typedef void *(alloc_routine)(int length);
-typedef void (free_routine)(int scc_num, int channel_num, void *buf);
-typedef void (store_rx_buffer_routine)(int scc_num, int channel_num, void *buff, int length);
-typedef int  (handle_tx_error_routine)(int scc_num, int channel_num, QUICC_BD *tbd);
-typedef void (handle_rx_error_routine)(int scc_num, int channel_num, QUICC_BD *rbd);
-typedef void (handle_lost_error_routine)(int scc_num, int channel_num);
-
-/* user defined functions for global errors */
-typedef void (handle_glob_overrun_routine)(int scc_number);
-typedef void (handle_glob_underrun_routine)(int scc_number);
-typedef void (glob_intr_q_overflow_routine)(int scc_number);
-
-/*
- * General initialization and command routines
- */
-void quicc_issue_cmd (unsigned short cmd, int scc_num);
-void quicc_init(void);
-void quicc_scc_init(int scc_number, int number_of_rx_buf, int number_of_tx_buf);
-void quicc_smc_init(int smc_number, int number_of_rx_buf, int number_of_tx_buf);
-void quicc_scc_start(int scc_num);
-void quicc_scc_loopback(int scc_num);
-
-/* Interrupt enable/disable routines for critical pieces of code*/
-unsigned short  IntrDis(void);
-void            IntrEna(unsigned short old_sr);
-
-/* For debugging */
-void print_rbd(int scc_num);
-void print_tbd(int scc_num);
-
-#endif
-- 
2.43.0

