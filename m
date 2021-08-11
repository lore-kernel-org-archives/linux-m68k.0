Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8313EC432BE
	for <linux-m68k@archiver.kernel.org>; Wed, 11 Aug 2021 09:13:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6318D60F55
	for <linux-m68k@archiver.kernel.org>; Wed, 11 Aug 2021 09:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236661AbhHKJNZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Aug 2021 05:13:25 -0400
Received: from verein.lst.de ([213.95.11.211]:39756 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236511AbhHKJNY (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 11 Aug 2021 05:13:24 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2BBF96736F; Wed, 11 Aug 2021 11:12:59 +0200 (CEST)
Date:   Wed, 11 Aug 2021 11:12:59 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210811091259.GA15014@lst.de>
References: <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com> <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com> <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com> <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com> <20210721170529.GA14550@lst.de> <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com> <20210723051126.GA31274@lst.de> <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com> <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

from looking at your patches I suspect the 040 traps might be able
to be called witha different fc.  Can you check if the below patch,
which is a cut down version of your changes makes all the issues
go away?

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index debb4537eab5..a554e529fd26 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -94,6 +94,13 @@ static inline void set_fc(unsigned long val)
 			      "movec %0,%/dfc\n\t"
 			      : /* no outputs */ : "r" (val) : "memory");
 }
+static inline unsigned long get_fc(void)
+{
+	unsigned long val;
+	__asm__ ("movec %/dfc,%0":"=r" (val):);
+	WARN_ON_ONCE(val != USER_DATA);
+	return val;
+}
 #else
 static inline void set_fc(unsigned long val)
 {
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index c5e0a4f93bd5..1b073299fa55 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -181,6 +181,7 @@ static inline void access_error060 (struct frame *fp)
 static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
 {
 	unsigned long mmusr;
+	unsigned long old_fc = get_fc();
 
 	set_fc(wbs);
 
@@ -191,7 +192,7 @@ static inline unsigned long probe040(int iswrite, unsigned long addr, int wbs)
 
 	asm volatile (".chip 68040; movec %%mmusr,%0; .chip 68k" : "=r" (mmusr));
 
-	set_fc(USER_DATA);
+	set_fc(old_fc);
 
 	return mmusr;
 }
@@ -200,6 +201,7 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
 				   unsigned long wbd)
 {
 	int res = 0;
+	unsigned long old_fc = get_fc();
 
 	set_fc(wbs);
 
@@ -215,7 +217,7 @@ static inline int do_040writeback1(unsigned short wbs, unsigned long wba,
 		break;
 	}
 
-	set_fc(USER_DATA);
+	set_fc(old_fc);
 
 	pr_debug("do_040writeback1, res=%d\n", res);
 
