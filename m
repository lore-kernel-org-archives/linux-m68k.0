Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60009C4338F
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Aug 2021 03:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39D2861004
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Aug 2021 03:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhHFDLT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 Aug 2021 23:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhHFDLS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 5 Aug 2021 23:11:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5697AC061798
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Aug 2021 20:11:02 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id mt6so13921129pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 Aug 2021 20:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=QdYUVFjYrTXDekxrcHR58/JnhSuSkPjwViKW8TUb2/A=;
        b=RXpYcQmtf1NBTZkk16P8AyTms8g5CvZrXQIVQ80TEUFXN8C8HdrtdvmsCzCtum/WJF
         /oCnZXzlUDp1rAOVmVO7nN60bCEKd4+bJUuf1k/xRtjXeiQ+Ep5Me3MHaEygy7O5itT4
         CKic3EJgN6eYaXMRnxHvWy+4ZwaMEuVwMquF5NT+X4yoCSqQyh6uB6ThHTEnDsU0U5Bx
         XvORqMbvbwkcXjslbvM0SbxkWqCFYXsMHM0E9UX3De6PlnLqjV8f0BHQxGEK8nl15hjA
         XI2cN26CBV0r2h09QWpN/+7OvLDerIDPX4byMYq0BaSloIYo00lunTgG9TKr1X2pTaBK
         wWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=QdYUVFjYrTXDekxrcHR58/JnhSuSkPjwViKW8TUb2/A=;
        b=uI3wtjiPPdP4xNd2NrThhK15f6eFYbyUmhrmObR2TYtZeVsFP6P5bDP2Dwcc4m8mB/
         ls2PruHgl7ECrgJ1QMP0tc7H/QCdTu1BZ1ZLICV4Z/+l34EgaRH82mKfRmKKoh03MjHY
         GdtFXeBsJlsH2WlnmrMbek5S/WJ6xuggKivLYjSI0EGDthkPPSDj7kEy53xArwWsf/Dq
         ohrHrBofgtY82/yaqQv1qM1Ke5JpvEjQVON8gE4moP8x/F9YZlINLZ6gRouGM/Ev9/UQ
         +nAr++N/29NK/b7xTI/7aUkesKjizw+VHcS1sLvMqLfcIGEmpAv77AwZ3EBIMwmYYPUd
         ACwQ==
X-Gm-Message-State: AOAM533DyAZOYy+fblMgE17+E59sZosYoVKdS36cmYtygz7a+RTrCgO/
        GjviRafHZMIvaVZCd3X4e2M=
X-Google-Smtp-Source: ABdhPJwoA6mFKc4RPiAErji93X8z8b1qfqZ4oXgVYjX10xLyeEexr3dCW8QuQ7pdT+652POQwKU/OA==
X-Received: by 2002:a17:90a:e50b:: with SMTP id t11mr18536591pjy.126.1628219461486;
        Thu, 05 Aug 2021 20:11:01 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-37-fibre.sparkbb.co.nz. [222.152.189.37])
        by smtp.gmail.com with ESMTPSA id g11sm7294831pju.13.2021.08.05.20.10.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Aug 2021 20:11:00 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
 <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
 <20210713085419.GA22839@lst.de>
 <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com>
 <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com>
 <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
 <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
Date:   Fri, 6 Aug 2021 15:10:55 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------3E293333351F33042270B84D"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------3E293333351F33042270B84D
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christoph,

Am 01.08.2021 um 07:31 schrieb Michael Schmitz:
> Hi Christoph,
>> I'll back out the top commit of your series (the one removing set_fs())
>> and retest. Again, this may take a few days to show any results.
>
> No further format errors, kernel panics or lockups seen after almost a
> week of tests.
>
> That suggests something is wrong with your 'm68k: remove set_fs()' commit.
>
> I'll try adding a get_fc() and warn whenever FC does not match what your
> patch expects, maybe that can help to get a clearer picture.

See attached patches, to be applied on top of your RFC series - ran this 
for five days now, with no further errors. Will run this a while longer 
yet, but in the ordinary course of testing, I'd have seen errors by now.

Haven't seen the WARN_ON trigger once yet though, which is more than a 
little odd. Heisenbug?

I am aware that this patch defeats the purpose of the 'lets lose set_fs' 
patch series, and Linus was quite convincing in saying preemption 
couldn't be an issue so saving DFC ought not to be necessary. If there 
is anything else I can try to get to the bottom of these format errors, 
please say so.

Cheers,

	Michael



--------------3E293333351F33042270B84D
Content-Type: text/x-diff;
 name="0002-m68k-warn-in-get_fc-if-DFC-is-not-USER_DATA.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0002-m68k-warn-in-get_fc-if-DFC-is-not-USER_DATA.patch"

From d5f7c3d4b4e4b437dfb54f9eb1ed6876dfb63744 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitzmic@gmail.com>
Date: Sun, 1 Aug 2021 13:06:21 +1200
Subject: [PATCH 2/2] m68k: warn in get_fc() if DFC is not USER_DATA

Trace uacess mode restore operations that mess up the SFC/DFC
registers - read out current DFC before changing modes and warn
when the current mode wasn't USER_DATA!

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/include/asm/processor.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 29dfa54..a8c533d 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -98,6 +98,7 @@ static inline unsigned long get_fc(void)
 {
 	unsigned long val;
 	__asm__ ("movec %/dfc,%0":"=r" (val):);
+	WARN_ON_ONCE(val != USER_DATA);
 	return val;
 }
 /*
-- 
2.7.4


--------------3E293333351F33042270B84D
Content-Type: text/x-diff;
 name="0001-m68k-add-get_fc-to-read-uaccess-mode.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-m68k-add-get_fc-to-read-uaccess-mode.patch"

From fcb3f2543125ca3fe269b50646f8c4782d31ba80 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitzmic@gmail.com>
Date: Sun, 1 Aug 2021 12:11:59 +1200
Subject: [PATCH 1/2] m68k: add get_fc() to read uaccess mode

Add back get_fc(), force_user_fc_begin() and force_user_fc_end(),
and use these to restore original DFC after uaccess operations,
instead of unconditionally setting USER_DATA.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/include/asm/processor.h | 35 +++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/tlbflush.h  |  8 ++++++--
 arch/m68k/kernel/process.c        |  2 +-
 arch/m68k/kernel/traps.c          |  6 ++++--
 arch/m68k/mm/cache.c              |  4 +++-
 5 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index debb453..29dfa54 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -94,10 +94,45 @@ static inline void set_fc(unsigned long val)
 			      "movec %0,%/dfc\n\t"
 			      : /* no outputs */ : "r" (val) : "memory");
 }
+static inline unsigned long get_fc(void)
+{
+	unsigned long val;
+	__asm__ ("movec %/dfc,%0":"=r" (val):);
+	return val;
+}
+/*
+ * Force the uaccess routines to be wired up for actual userspace access,
+ * overriding any possible set_fs(KERNEL_DS) still lingering around.  Undone
+ * using force_uaccess_end below.
+ */
+static inline unsigned long force_user_fc_begin(void)
+{
+        unsigned long fc = get_fc();
+
+        set_fc(USER_DATA);
+        return fc;
+}
+
+static inline void force_user_fc_end(unsigned long oldfc)
+{
+        set_fc(oldfc);
+}
 #else
 static inline void set_fc(unsigned long val)
 {
 }
+static inline unsigned long get_fs(void)
+{
+	return USER_DATA;
+}
+static inline unsigned long force_user_fc_begin(void)
+{
+        return USER_DATA;
+}
+
+static inline void force_user_fc_end(unsigned long oldfc)
+{
+}
 #endif /* CONFIG_CPU_HAS_ADDRESS_SPACES */
 
 struct thread_struct {
diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
index 524b13d..7c34d14 100644
--- a/arch/m68k/include/asm/tlbflush.h
+++ b/arch/m68k/include/asm/tlbflush.h
@@ -13,12 +13,13 @@ static inline void flush_tlb_kernel_page(void *addr)
 	if (CPU_IS_COLDFIRE) {
 		mmu_write(MMUOR, MMUOR_CNL);
 	} else if (CPU_IS_040_OR_060) {
+		unsigned long old_fc = get_fc();
 		set_fc(SUPER_DATA);
 		__asm__ __volatile__(".chip 68040\n\t"
 				     "pflush (%0)\n\t"
 				     ".chip 68k"
 				     : : "a" (addr));
-		set_fc(USER_DATA);
+		set_fc(old_fc);
 	} else if (CPU_IS_020_OR_030)
 		__asm__ __volatile__("pflush #4,#4,(%0)" : : "a" (addr));
 }
@@ -83,8 +84,11 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 
 static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	if (vma->vm_mm == current->active_mm)
+	if (vma->vm_mm == current->active_mm) {
+		unsigned long old_fc = force_user_fc_begin();
 		__flush_tlb_one(addr);
+		force_user_fc_end(old_fc);
+	}
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index fb257b7..cab012d 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -155,7 +155,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 	 * Must save the current SFC/DFC value, NOT the value when
 	 * the parent was last descheduled - RGH  10-08-96
 	 */
-	p->thread.fc = USER_DATA;
+	p->thread.fc = get_fc();
 
 	if (unlikely(p->flags & (PF_KTHREAD | PF_IO_WORKER))) {
 		/* kernel thread */
diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index c5e0a4f..1b07329 100644
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
 
diff --git a/arch/m68k/mm/cache.c b/arch/m68k/mm/cache.c
index d26eb1a..70fd62b 100644
--- a/arch/m68k/mm/cache.c
+++ b/arch/m68k/mm/cache.c
@@ -109,14 +109,16 @@ static void __flush_icache_range(unsigned long address, unsigned long endaddr,
 
 void flush_icache_user_range(unsigned long address, unsigned long endaddr)
 {
+	unsigned long old_fc = get_fc();
 	__flush_icache_range(address, endaddr, USER_DATA);
 }
 
 void flush_icache_range(unsigned long address, unsigned long endaddr)
 {
+	unsigned long old_fc = get_fc();
 	set_fc(SUPER_DATA);
 	__flush_icache_range(address, endaddr, SUPER_DATA);
-	set_fc(USER_DATA);
+	set_fc(old_fc);
 }
 EXPORT_SYMBOL(flush_icache_range);
 
-- 
2.7.4


--------------3E293333351F33042270B84D--
