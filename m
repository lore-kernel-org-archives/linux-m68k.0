Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC7AC433DB
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 14:23:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B4C764E10
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 14:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhCAOWv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Mar 2021 09:22:51 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:26183 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbhCAOWh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Mar 2021 09:22:37 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 121ELErI008160;
        Mon, 1 Mar 2021 23:21:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 121ELErI008160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614608476;
        bh=/B3Ck59ciEmGWA1YNBhIcTz7DTkHFpnEVGwcAI3okrw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jsMi4cjJbKtDW08TFRVc+sWBQX30vTtqa6tKX7JwMXSGDrMhqLdyJSNOLBYE7feiI
         YNesElMJXBJw7s6MpzVB3yvCsBFwJUuO2PPpIFYnCWO2LLNs+Lv+uOLxgDoOzIcZ/C
         4fhnKHmQ3AhJqbNk+k9LcuWxBQx745gpUTTmIJLridTTIIN6T/Q4ZOocW+fazAmPoT
         Ya8riv037AGeqJ40tjBdF4vVWageRHJHKKnJpsbVY//ZdZ4DveMSoqp4GyRdJRhATs
         d/8SVVuMBpNyucINoXLjLx2ujo+BOmZLcPK3sEN2pshkh2ZSgtid0Gc1hANlW8Smwr
         zb3zU/HMkPPeg==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] m68k: syscalls: switch to generic syscallhdr.sh
Date:   Mon,  1 Mar 2021 23:21:12 +0900
Message-Id: <20210301142112.342909-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301142112.342909-1-masahiroy@kernel.org>
References: <20210301142112.342909-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Many architectures duplicate similar shell scripts.

This commit converts m68k to use scripts/syscallhdr.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/m68k/kernel/syscalls/Makefile      |  7 ++---
 arch/m68k/kernel/syscalls/syscallhdr.sh | 36 -------------------------
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 arch/m68k/kernel/syscalls/syscallhdr.sh

diff --git a/arch/m68k/kernel/syscalls/Makefile b/arch/m68k/kernel/syscalls/Makefile
index ad2492cb5568..6713c65a25e1 100644
--- a/arch/m68k/kernel/syscalls/Makefile
+++ b/arch/m68k/kernel/syscalls/Makefile
@@ -6,14 +6,11 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/$(src)/syscallhdr.sh
+syshdr := $(srctree)/scripts/syscallhdr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
-		   '$(syshdr_abis_$(basetarget))'		\
-		   '$(syshdr_pfx_$(basetarget))'		\
-		   '$(syshdr_offset_$(basetarget))'
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
 
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
diff --git a/arch/m68k/kernel/syscalls/syscallhdr.sh b/arch/m68k/kernel/syscalls/syscallhdr.sh
deleted file mode 100644
index 6f357d68ef44..000000000000
--- a/arch/m68k/kernel/syscalls/syscallhdr.sh
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-prefix="$4"
-offset="$5"
-
-fileguard=_UAPI_ASM_M68K_`basename "$out" | sed \
-	-e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
-	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	printf "#ifndef %s\n" "${fileguard}"
-	printf "#define %s\n" "${fileguard}"
-	printf "\n"
-
-	nxt=0
-	while read nr abi name entry ; do
-		if [ -z "$offset" ]; then
-			printf "#define __NR_%s%s\t%s\n" \
-				"${prefix}" "${name}" "${nr}"
-		else
-			printf "#define __NR_%s%s\t(%s + %s)\n" \
-				"${prefix}" "${name}" "${offset}" "${nr}"
-		fi
-		nxt=$((nr+1))
-	done
-
-	printf "\n"
-	printf "#ifdef __KERNEL__\n"
-	printf "#define __NR_syscalls\t%s\n" "${nxt}"
-	printf "#endif\n"
-	printf "\n"
-	printf "#endif /* %s */\n" "${fileguard}"
-) > "$out"
-- 
2.27.0

