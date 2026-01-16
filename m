Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3BD1C84D0
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566506; cv=none; b=RIn8DpJhUwPDOSkh+9Hr64bB4Mj4LGShhHRxtn6EjsiJ57uLi+dilVA2MOLCWPxUYruxct/Si8djmTMA6CTGbblmuv5HAjvXH9DswFgqTcJlGPH2MqC2H6/F1F29h5mu83sW9n5vVe5E2gFmC1l87q7dT2Zuc3Ohf9DveB8SjZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566506; c=relaxed/simple;
	bh=gYQMQn4Jfdw1G2Wf4o6F1QrEj1e39VDp1Bc+MstZOFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CL3aQbGuu/5tIL11B4APjVxbCULLqs3kIUIrx36vsUhMEZuVIgxSptUuBI8gloRhHBn2L83ViGOM/LfPHfxCZeFzO7twzFYSTr10SV0+cbkmin+Qy5BWN/Yy6xpb45SgfNaqj5fCy5axF03K1Bg14gFcx7dM154YYcQ5xgbn8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=kmPBFDex; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="kmPBFDex"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a09d981507so13879575ad.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1768566503; x=1769171303; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAwaQrv1W94Em81hIWbm99vsqb7U2YZNzT5rHF59/C0=;
        b=kmPBFDexkioKGC4a5BBQZhhD+Tg/nh50v+Gq5HL9CblbYSwCLCCTTXTNdObOOxy8+h
         92/dEl1IyVv0iJGunTJUWBJKEAeDcEu4D2e2bTJDxDek9MTVvJIHTeLkXYKPfoQQKQnA
         wo2JVfaO+L9ZotcUPuWs1Bi5BbfzYD0G+meUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768566503; x=1769171303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAwaQrv1W94Em81hIWbm99vsqb7U2YZNzT5rHF59/C0=;
        b=p2/UL9oCaD9p8I4/HncbwNNRvdJLhpDiDZKKAoSiWwXUCCgvn3LR4vF8w3gTY4hq/9
         sR8Elx4s/YJM+3MxviNHxFZSsEDA9o0CIYT+/JqdmXKkoEY55aNBM+3nZ8WsJxCSpxR6
         rXaeZLwc+tyZfC7G7a4OGaee+qrZbY5wnvzxGcJW0EWftn0zL/Amm8cC00o+2qwyHZPj
         ER60izPMmG3VoyQy7b7B6tiVMFW+fKc2WWbqIeXQMZrzdLhFe/H46T03H0eQFZr9oZ08
         B3tFrI7X6Ty3IGxf2HSlgriBHcjO/ZUYVXYYdYZsxh22PJLEjAdFZIJCrg4gp24xSI3X
         4QAg==
X-Gm-Message-State: AOJu0YzSk8cmuPz8YQV58TmidIB0NbxpDk3GpRE7USgkbeAgiK6kWLso
	lR9LUe8LdeSx5V5Jkt7a7NrbBpyCIdJSWmfUznz8//+fQ0/x/PTlURBNQ4kWUzNr1u8=
X-Gm-Gg: AY/fxX7X6sFfCNXjjxGmJ9PAw79VeRadOr0AW+IOiTzWwarSR0TpYnKvGLnntFx2uGs
	9olA6sn1otQDkquacS/t8suCzJMPKeU6tw10yeGlcccO07m4KZDWPkU+t2x8DD+BxRJkCx62AX4
	qB4Ffge6JV5odZsUqDyIisOtHRoQIwF6S0+N2o0ZXC1Yytl46/jMmjhmydiHET5hTzxXMmqZHTl
	/I/Gu+B5Z/4g+rPH0W2mF+07gCsNs5i6AhQuwJjVgEpLeEOMkhxi1mVmNeUCRVzBaeDmZW8vGZ5
	oOPddaVSsnaBcjmgBn3XVOg//eXObmcY4EyX3s/QIEoW3ci+3g5RtqJJ27uMdOCSTDb+SZJOjkT
	iRd9lVpzmKZS3G9CXMUh6QZB5ffeGs5Nw52Y/KUF0aC+tX1YMricyJ2fZdPZlaNnOaeuoGSq5kb
	t6lzcQEe7fOYB3XoR4c2mWEuJoDWwxjfNtKQnwScs8Usno38p+T28FbcDgxNdJbHE5mEDQvmEgm
	Wk=
X-Received: by 2002:a17:903:b0f:b0:2a1:3769:1d02 with SMTP id d9443c01a7336-2a717583bb1mr28248835ad.12.1768566502975;
        Fri, 16 Jan 2026 04:28:22 -0800 (PST)
Received: from kinako.work.home.arpa (p1567014-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [153.226.195.14])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7193dbb37sm20583555ad.46.2026.01.16.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:28:22 -0800 (PST)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net,
	gerg@linux-m68k.org,
	dalias@libc.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [RFC PATCH] tools/nolibc: HACK!: Add basic self relocation for static PIE for m68k nommu FDPIC
Date: Fri, 16 Jan 2026 21:28:12 +0900
Message-ID: <20260116122812.2421621-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is some very quick hacky code to test if this works and get some ideas..

- I'm messing with m68k nommu. Currently I use FLAT binaries and this is working with nolibc
  as-is mostly. Sometimes some relocations that elf2flat doesn't like get generated and the
  resulting FLAT binary doesn't have any relocation information and crashes which isn't good
  if you don't have an mmu.

- Since commit 1bde925d2354 ("fs/binfmt_elf_fdpic.c: provide NOMMU loader for regular ELF binaries")
  the FDPIC loader has apparently been able to load non-FDPIC binaries as long as they are
  PIE and can be relocated. I have been messing with this thinking that maybe I can stop using
  FLAT binaries.

- By default linking with -pie is trying to set ld.so as the interpreter to do the
  relocation. I don't think I have anything that can do that in my system. I am using uclibc but
  statically linked. Aside from my programs written with nolibc there is a busybox FLAT that is
  statically linked to uclibc and nothing else.

  Eitherway, the plan is not to have any libc and have everything compiled with nolibc. I'm writing
  a small init, shell etc with nolibc that will replace busybox and not cause constant OOMs.

- So, I can generate PIE binaries but they can't work because I have no linker to relocate them but
  apparently static PIE is a thing and with a normal toolchain you'd get a crt that does the relocation
  before jumping to main().

- I thought it shouldn't be too hard to add something like that to crt.h in nolibc and then pass
  --no-dynamic-linker when linking to not set an interpreter.

- I got it working enough that a static pie "hello, world" loads and runs:

/ # /root/test.elf
[    9.970000] FDPIC ____ LOAD 23 ____
[    9.970000] FDPIC Mapped Object [executable]:
[    9.970000] FDPIC - elfhdr   : 6d8000
[    9.970000] FDPIC - entry    : 6d83e4
[    9.970000] FDPIC - PHDR[]   : 6d8034
[    9.970000] FDPIC - DYNAMIC[]: 6da7b0
[    9.970000] FDPIC - LOAD[0] : 006d8000-006d87ad [va=0 ms=7ae]
[    9.970000] FDPIC - LOAD[1] : 006da7b0-006da873 [va=27b0 ms=c4]
[    9.970000] FDPIC - start_code  6d8000
[    9.970000] FDPIC - end_code    6d87ae
[    9.970000] FDPIC - start_data  6da7b0
[    9.970000] FDPIC - end_data    6da874
[    9.970000] FDPIC - start_brk   6e0000
[    9.970000] FDPIC - brk         6e0000
[    9.970000] FDPIC - start_stack 6fff00
hello, world!
[    9.980000] test.elf (23) used greatest stack depth: 5348 bytes left

Questions:

- My use case is weird/niche but maybe there are uses for static pie nolibc binaries?
  - If so what would be a cleaner way of implementing this?

- Right now the base address offset all of the relocations against is hardcoded.
  Maybe someone knows how I'm meant to get that properly?

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/crt.h | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
index d9262998dae9..0931915280d8 100644
--- a/tools/include/nolibc/crt.h
+++ b/tools/include/nolibc/crt.h
@@ -10,6 +10,7 @@
 #ifndef NOLIBC_NO_RUNTIME
 
 #include "compiler.h"
+#include "elf.h"
 
 char **environ __attribute__((weak));
 const unsigned long *_auxv __attribute__((weak));
@@ -47,6 +48,61 @@ void _start_c(long *sp)
 	/* initialize stack protector */
 	__stack_chk_init();
 
+#ifdef NOLIBC_STATIC_PIE
+#define R_68K_RELATIVE	22
+{
+	void *base = (void *) 0x6d8000; // TODO: how to actually get this?
+	unsigned int rela_count = 0;
+	unsigned int rela_off = 0;
+	unsigned long dyn_addr;
+	Elf32_Rela *rela;
+	Elf32_Addr *addr;
+	Elf32_Dyn *dyn;
+	int i;
+
+	/* For m68k with the FDPIC loader d5 contains the offset to the DYNAMIC segment */
+	__asm__ volatile (
+		"move.l %%d5, %0\n"
+		: "=r" (dyn_addr)
+	);
+	dyn = (Elf32_Dyn *) dyn_addr;
+
+	/* Go through the DYNAMIC segment and get the offset to rela and the number of relocations */
+	for (; dyn->d_tag != DT_NULL; dyn++) {
+		switch (dyn->d_tag) {
+		case DT_RELA:
+			rela_off = dyn->d_un.d_ptr;
+			break;
+		case DT_RELACOUNT:
+			rela_count = dyn->d_un.d_val;
+			break;
+		}
+	}
+
+	if (!rela_off || !rela_count)
+		exit(42); //TODO nonsense error
+
+	rela = base + rela_off;
+
+	/* Do the relocations, only R_68K_RELATIVE for now */
+	for (i = 0; i < rela_count; i++) {
+		Elf32_Rela *entry = &rela[i];
+
+		switch (ELF32_R_TYPE(entry->r_info)) {
+		case R_68K_RELATIVE:
+		{
+			addr = (Elf32_Addr *)(base + entry->r_offset);
+			*addr = (Elf32_Addr) (base + entry->r_addend);
+		}
+			break;
+		default:
+			exit(43); //TODO nonsense error
+			break;
+		}
+	}
+}
+#endif
+
 	/*
 	 * sp  :    argc          <-- argument count, required by main()
 	 * argv:    argv[0]       <-- argument vector, required by main()
-- 
2.51.0

