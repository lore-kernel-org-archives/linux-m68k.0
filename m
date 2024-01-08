Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A626412B71
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jan 2024 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Sq0eEL7J"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dbb7d80df8so1346912a34.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1704706353; x=1705311153; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfdL1VvrUAffk+JEt/9C7vAUDoa3/sBqju5Vv3smMQQ=;
        b=Sq0eEL7JnaEB/ASGVWyie2Vtu9gQaUXT5U1/cVX6VwJD5/abkI6VPYuFjn16VTZMXu
         X7dDkkhwM56PB5qG/rLaJZrDwYGUornPTJdVDLf125qKKrs4Atdq3WzHY/ZUElAZM4tK
         T439sW6ZMZU3wzwSH4eqU7hNIuIrZIIgRKhR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704706353; x=1705311153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfdL1VvrUAffk+JEt/9C7vAUDoa3/sBqju5Vv3smMQQ=;
        b=L047fiGQNlp5K4Fq3xLWSlWZElivDbKYclBIRf0uC5TRaWmrqGmo6ahivtHX6VnblS
         ugdBSQMe6OwX0LUXTcYM6nLo9u84Pr8r0Vya5z9sxq8t7Pz1u8bI/XhAmFK1976NILop
         WogWmu+YOrtwtYodXphUaZWXPhLMGUec+2htpTvANQcOXhfBitTBHdOhNRugi/jU+OHP
         bMpkj1d9/9HY4cM/i2L8uZq0S6IdX55qEiEsjOULIhgWX7auM3wznyCDrKxIi65rPHXb
         IXTOlC23WHZtu4QQFpnYRZEFJVnGTNV/Vvy+8tsJUs1PNst8bNZQKXs1mTgzMPI1O0aA
         fc8A==
X-Gm-Message-State: AOJu0YyT5GK86WCNFQkyx/nuuMTQ3VuruMJvmyWoHjRIy0YXNzlhb6lp
	kgx8PleBwqbOfXovkwn9xLr77mWLQpJMsQ==
X-Google-Smtp-Source: AGHT+IHOfqcx1LisFMsghCeAdvBasVv/c4m8FJbkf6lrgBZPAPZGqSJTbJFW/Lb7JJGqlKNxTU388A==
X-Received: by 2002:a9d:590a:0:b0:6db:fe20:fc1c with SMTP id t10-20020a9d590a000000b006dbfe20fc1cmr2517182oth.63.1704706352778;
        Mon, 08 Jan 2024 01:32:32 -0800 (PST)
Received: from shiro.work.home.arpa ([2400:4162:2428:2ffe:a221:b29b:7116:6ce9])
        by smtp.googlemail.com with ESMTPSA id i8-20020a632208000000b005cdbebd61d8sm5578974pgi.9.2024.01.08.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 01:32:32 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: gerg@linux-m68k.org,
	geert@linux-m68k.org,
	fthain@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 2/2] m68k: Fix interrupt stack frames for 68000
Date: Mon,  8 Jan 2024 18:32:21 +0900
Message-ID: <20240108093221.1477020-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108093221.1477020-1-daniel@0x0f.com>
References: <20240108093221.1477020-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plain old 68000 does not push the frame type/vector on the
stack when an interrupt starts like the brand new 68010 does.

This means that currently everything in struct pt_regs is
a bit off because it expects the processor to push an extra
short before the kernel interrupt code adds the rest.

In entry.S for the 68000 we already need to manually put
the vector number on the stack to work out what interrupt
is being handled because the cpu doesn't push that to the
stack.

So we can jiggle this around a bit to fix the issue:
- For 68000 use the same struct pt_regs layout as coldfire
  where frame/vector is after pc and sp.
- In entry.S push the vector number first, the stack pointer
  now lines up with the sktadj field in pt_regs and when saving
  the remaining registers the offsets match the fields in the
  struct.
- Remove the vec argument from the DragonBall interrupt
  decoding logic as it's not pushed on the stack anymore
  and not used either way.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/68000/entry.S             | 9 ++++-----
 arch/m68k/68000/ints.c              | 2 +-
 arch/m68k/include/asm/entry.h       | 3 +++
 arch/m68k/include/uapi/asm/ptrace.h | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index e1fc740412f2..58c64656713a 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -54,6 +54,7 @@ do_trace:
 	jra	ret_from_exception
 
 ENTRY(system_call)
+	movew	#32,%sp@-
 	SAVE_ALL_SYS
 
 	/* save top of frame*/
@@ -116,17 +117,15 @@ Lsignal_return:
  .macro inthandler num func
 	.globl inthandler\num
 	inthandler\num:
+	movew	#\num,%sp@-
 	SAVE_ALL_INT
-	movew	%sp@(PT_OFF_FORMATVEC), %d0
-	and	#0x3ff, %d0
 
+	/* Push frame address onto stack */
 	movel	%sp,%sp@-
-	/* put vector # on stack*/
-	movel	#\num,%sp@-
 	/* process the IRQ*/
 	jbsr	\func
 	/* pop parameters off stack*/
-	addql	#8,%sp
+	addql	#4,%sp
 	bra	ret_from_exception
  .endm
 
diff --git a/arch/m68k/68000/ints.c b/arch/m68k/68000/ints.c
index e721932e495d..67c8f9e000ca 100644
--- a/arch/m68k/68000/ints.c
+++ b/arch/m68k/68000/ints.c
@@ -77,7 +77,7 @@ asmlinkage irqreturn_t inthandler71(void);
  * into one vector and look in the blasted mask register...
  * This code is designed to be fast, almost constant time, not clean!
  */
-asmlinkage void process_int(int vec, struct pt_regs *fp)
+asmlinkage void process_int(struct pt_regs *fp)
 {
 	int irq;
 	int mask;
diff --git a/arch/m68k/include/asm/entry.h b/arch/m68k/include/asm/entry.h
index 9b52b060c76a..71396c948162 100644
--- a/arch/m68k/include/asm/entry.h
+++ b/arch/m68k/include/asm/entry.h
@@ -184,6 +184,7 @@
  * that the stack frame is NOT for syscall
  */
 .macro SAVE_ALL_INT
+					/* entry.S should populate the vector */
 	clrl	%sp@-			/* stk_adj */
 	pea	-1:w			/* orig d0 */
 	movel	%d0,%sp@-		/* d0 */
@@ -191,6 +192,7 @@
 .endm
 
 .macro SAVE_ALL_SYS
+					/* entry.S should populate the vector */
 	clrl	%sp@-			/* stk_adj */
 	movel	%d0,%sp@-		/* orig d0 */
 	movel	%d0,%sp@-		/* d0 */
@@ -202,6 +204,7 @@
 	movel	%sp@+,%d0
 	addql	#4,%sp			/* orig d0 */
 	addl	%sp@+,%sp		/* stk adj */
+	addql	#2,%sp			/* entry.S populated vector */
 	rte
 .endm
 
diff --git a/arch/m68k/include/uapi/asm/ptrace.h b/arch/m68k/include/uapi/asm/ptrace.h
index 5b50ea592e00..49d7829df77c 100644
--- a/arch/m68k/include/uapi/asm/ptrace.h
+++ b/arch/m68k/include/uapi/asm/ptrace.h
@@ -39,7 +39,7 @@ struct pt_regs {
   long     d0;
   long     orig_d0;
   long     stkadj;
-#ifdef CONFIG_COLDFIRE
+#if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
   unsigned format :  4; /* frame format specifier */
   unsigned vector : 12; /* vector offset */
   unsigned short sr;
-- 
2.43.0

