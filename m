Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2729A39B96F
	for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Mar 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316720; cv=none; b=MTWXt45tMd2/mENqtDIDKfojLxk9xHHkYpK375awG8wR6MYxwmDvAnaJ2i8TzzwCdhxBdvZHNtr2HN5txHTK0AETsApbk6mOMI42GpyMAnDt8i8oebeywuSNWuJE15kmRxnfhCtvBUllcekFUfPsMXwJtGCUFBJ0klQym5T10Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316720; c=relaxed/simple;
	bh=wUn5pymdTtFXWFvlujRseeLPyLbQJxJdDiLiRCC0Sgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mpFwiheNafmJQAVoGQBGe2vkPbAf52u3kMU1TRNEImez7DC5hcXqk+1IUFiuGp8vDW97t7VuWArnVMMCjeDRwiTFUOwBWS4NTfdsI59xts0n3Z5ZcQJcvi78uo6YZHn5BgR1YSr/ldfJP7SdA9ARZ0xUJ/NHwa7Viy63lnuO230=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=MGhNgkRl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="MGhNgkRl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae5423b02aso6799535ad.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Mar 2026 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1773316717; x=1773921517; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InznCMohyHvQsM0e9D1LmmneJnqL55hfHvoIRkqaAsA=;
        b=MGhNgkRlwjqp7uqzcbW+0qT4gE1yIM6MHwqF7yrpiPZK/es90f0AYa6obXItLtWav3
         /Wx4C6i2XyTaIgbFUP37Kb9C8OnbpIxo3v60Jgd+xsn8xOk+6sptkaOmo1fUCRFiWrnl
         N7Zfq62h8fSvrfwLuVTx18UZtRpxnSUP4EhJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316717; x=1773921517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InznCMohyHvQsM0e9D1LmmneJnqL55hfHvoIRkqaAsA=;
        b=WvT32Xdp1yKXi5/jqj5dQ3OgZ8Lo12oJff+enOLqqaxbW9FDTa5IEP15+PiOGd2w1k
         /emuj5y7YxGzqF0dGDs1J6ydb1FY2X3lP+tlPYVJFHnclgdWutVDuOATkaJJRmaj0Cqa
         jZXx0apqvSxi55RkpCgZUvhw172lh8+/N9HbpmneVHU3Rx7JP/IPaTz9ZZE8i5NIHUoV
         X7UJghNBSR9JbOLyZvKKbPxZD4YKzGzv/ZPs/fUF57YkYWFjN8BODY1VEZdv/pbMw/E9
         XsHuaaNR9h32IILFCfd+bXsyy3OH3hT7tMtKYAYlRJIpNQTvTYdK4F3o+t7WSVUYKtqQ
         Htmg==
X-Forwarded-Encrypted: i=1; AJvYcCUY4uubTXdLH5/k6pPCtNBuvGF2MiIpud/hGE+xZE4LxnvJXDmFyE4ftMjhsd+5W1DZyfEGSu86LxJH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxcD7BRy402PjgtYCEwtcC1JN3iBplQhIWerIkDQZImVObdCTfx
	9DcQ55laSMDG20XBQAzKn/ooTv7WsOr0/kF/Q4dI2qWxb+ZUw4zH8Mg2QCpWlx2rcgk=
X-Gm-Gg: ATEYQzwZKeQAJwBcYtd2Dp/g3otaNHF3158qyJDdGd3niFP9YdMO/rcIl0A07TwMSZk
	227IadOYmgyqofb+Z7geNmgQosk4qJrXkPuqcOZCYCg10Z+vfTc0mdglTlgtauMrtDGDFcZRXw4
	hZMobpjjcyzikTupVBLa1OPO3VLIJyt1pVKmv1VZiEZ0PrZcJKTorNYwLg7KNDOdiARL8nsLGQQ
	zU9mdtIEd4eP/Q2ZiywQvJTG17mFxVm/ccH+yFNy0+oAeGCIcelUcwNRB++p3AuWfZuzRk7PuUF
	maPUF1KsmDSZoSnVYt04sRxAAy/IT/oCvKr4bgGBcTCHQtOLJPQF+wwNm90+SCoEOPosNlB02Le
	kCtdz4WuYT5tOEhbivbvU9nj7xvtLJVAHo8/WzwzFnsduCSPWxdrkgghS3F/F0Etm0jFnM5O3XF
	xgybB7m0bgrR9fB3lCCkNudHcYFtYKguJ/T/hQhM/9lwSbnrPXspFQUApTXkX27dkXC/Mg+ffQq
	5De
X-Received: by 2002:a17:902:f60f:b0:2ae:48a0:33e3 with SMTP id d9443c01a7336-2aeae904609mr63156545ad.45.1773316717331;
        Thu, 12 Mar 2026 04:58:37 -0700 (PDT)
Received: from shiro (p1766150-ipxg00e01sizuokaden.shizuoka.ocn.ne.jp. [153.167.218.150])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2aeae3614aasm55087655ad.75.2026.03.12.04.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:58:37 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: gerg@linux-m68k.org,
	geert@linux-m68k.org,
	christoph.plattner@gmx.at,
	linux-m68k@lists.linux-m68k.org
Cc: sashal@kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] m68k: Fix task info flags handling for 68000
Date: Thu, 12 Mar 2026 20:58:32 +0900
Message-ID: <20260312115832.835968-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic for deciding what to do after a syscall should be checking
if any of the lower word bits are set and then checking if the reschedule
bit is set.

Currently we are loading the top word, checking if any bits are set
(which never seems to be true) and thus jumping over loading the
whole long and checking if the reschedule bit is set.

We get the thread info in two places so split that logic out in
a macro and then fix the code so that it just loads the whole
of the flags, checks if anything is set and then checks if
the reschedule bit in particular is set.

Reported-by: Christoph Plattner <christoph.plattner@gmx.at>
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

I have had a variation of this patch for ages and haven't
gotten around to sending it. Christoph e-mailed us (Greg, Sasha and me)
to report this issue with a similar patch. Apparently this is an
issue all the way back to 5.15.

Christoph, can you check this works for you? I took this out of my
personal branch and made sure it built but I have a bunch of other
junk I need to actually boot it on the things I have.

 arch/m68k/68000/entry.S | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 72e95663b62f..cd193fd34c19 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -18,6 +18,13 @@
 
 .text
 
+/* get thread_info pointer into a2 */
+ .macro getthreadinfo
+	movel	%sp,%d1
+	andl	#-THREAD_SIZE,%d1
+	movel	%d1,%a2
+ .endm
+
 .globl system_call
 .globl resume
 .globl ret_from_exception
@@ -70,9 +77,8 @@ ENTRY(system_call)
 
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
 
-	movel	%sp,%d1			/* get thread_info pointer */
-	andl	#-THREAD_SIZE,%d1
-	movel	%d1,%a2
+	/* Doing a trace ? */
+	getthreadinfo
 	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
 	jne	do_trace
 	cmpl	#NR_syscalls,%d0
@@ -96,16 +102,15 @@ Luser_return:
 	/* heavy interrupt load*/
 	andw	#ALLOWINT,%sr
 
-	movel	%sp,%d1			/* get thread_info pointer */
-	andl	#-THREAD_SIZE,%d1
-	movel	%d1,%a2
+	getthreadinfo
 1:
-	move	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
+	/* check if any of the flags are set */
+	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
 	jne	Lwork_to_do
 	RESTORE_ALL
 
 Lwork_to_do:
-	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
+	/* check if reschedule needs to be called */
 	btst	#TIF_NEED_RESCHED,%d1
 	jne	reschedule
 
-- 
2.51.0

