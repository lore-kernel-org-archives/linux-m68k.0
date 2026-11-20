Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178204;
	b=OIQwU2Do/MYWntG/ICqQDtXcOrzTUqSQLR7E8TXY1Wue9Tg3VQ632+fu25KFTKcRdprL
	 qB6PyfRbTlEnvup68KEFDN0P2IJGcu+cqms58RX+W66wY2Yc6snkKUvmU37cLu4+6MIFP
	 ANfGaTgsjaeYcopnNk+rb6dOZjpe67ozhxkZRCOeU+dkFyn5s1RTT4FPZ9thvb8P+s+TK
	 oixjc6vf14IfsG8ogBs1zOtOmi/KAQhuYWu3Ez5zKbja26HlMc2uUdHaFxaoFqoPfKMCA
	 0vwibmTIuS6lLZMQ12C3PKAf2k+cQyaIeRT2Lf6tW+Ta3Vjd6ltF4C1LPVQ3nTF/8gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
	b=k5Iqwb0fg2ebJtx1EyHNQoNziGtGhlAC18fzUBqt37UbkVLVxzaZ17cOfYQwVUW1g8Qr
	 4GUOFp6VSH4kpfc3RmdsljyzV30dbR4WqXLMa/Oc3iyd9g9UpWkMivqLa/R0EwjxIzzsZ
	 Z/ktlPVS1zN5LPVBaeR23r59uxdJehTdyDbF7LhZj3A7s4CSRy2kpjD2oiIgW6vBON7d2
	 KRsK7qwQMQn/ge9K8M+qbNL1P/nXWf9hdEAaxMU+adzx7blvVTItQxDPdMNLz2FLRYsnI
	 86I36qQ6nbJXQCWdlHrZK9iK40LSrxmNcaFusyQhqsmCbjHcQe+BiDVaTRfaNoGhwIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Kb1l7hkf;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37F606A330
	for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2026 12:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B37F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Kb1l7hkf
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2e1abf3eeso616058137.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 20 Nov 2026 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795178202; x=1795783002; darn=lists.linux-m68k.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=Kb1l7hkfiwBK1xDu5CGB3QDnV3NVPHvZuvlKrwJySGNwTze1wBZjlJ/gnJ8PAQ5ZyF
         kmWPhdEWJU1mRi5W33X+T/Jir2S8F/fhFWUw5szzzHWwCEcvrqLsex2YcRVkkqDKV3qD
         RR7qpnMQXtx9nCh2Z+mZ1wkIyOmL0uwiplsJCrcHFKCA1pSX/UaX44h5tkrr2VKg9VX3
         bXjgq2NWOVy66rRa8cyYn8pslJmenw4Pz6uQI6Aq/Ryb0dTz08tS90fOyiPhXHQ7wUyP
         +zVjhR5INH1TLBy7gPvYHHnoSH2jrDyV6ey1didN/SrZWyZ7cHanAWffJqoWl0Kp0ds4
         tm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178202; x=1795783002;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WeOrsjpJfRBrNwFvy+AQY39SEDxtlUWfYfyLARDn2qU=;
        b=E+ya2iFNVsxjZ2fbHn9F1shAjtQVeHqfIslt9hh3XtPC1yuHVTe3bhiv7I90cFSOhM
         4nOM8FDtw7ZlGy4ctFfzOODYsaNGp3UebQoauFVCHRPeeF+B+mjP31+12a0h/jUJzy++
         lUMyyXiu3et6cz9RpClYSmalEOc7l0L/tDi83MLuxq841fsz1uaxxNOantqVmmPXfeJz
         cPrTxFsNQZ5wx0yCG808x/A95Dkh6L2vrkk1AXGP8ZBHRE6fwlNtcnICQcns43N50OND
         6tNuddmZmfi36YO75IoVyGw3OaZfqy/YWGoHKFv7X7i8K/7hwGTQkH6cO2UalS9zi+tv
         KZCQ==
X-Forwarded-Encrypted: i=1; AL+hErEvk0tDpdlJFix32zrhUEbm683krYVmDbPhnON5xbIA9xYIEYzXFuaQlUh/oBAAIecqirIBK/PZqTbf@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/VVN+KhG8cEckiIajdKaX3NkBSA4cjpKUlpD6bZi8Ex7eywee9
	YEoGO5Z8wbMZpaAFMneH7QbvFLKXtjlPWFArxG+B5basDGIm8QjV2Z6qQUITSHUnoP8=
X-Gm-Gg: AZFdTZdS96lBCj4pDO32l+SHzWGo+S2qN4si4omHPwWc8eM/6+jKBZIvbkT8tDHeBqf
	UBcj48NR56hlVSf8bipoTv9jtYnCgFk9AuzvjXGBgKGiDqYi60yOmIsBWGnIDloarpoPcuRmVzI
	9KjQ+7KpuFN4hGcBfOvDFdzSp3lTlZ8YsTZ+g2o3wFZm6mgf1V8OBIVsj8wFVjjC5xOy7S3DuMV
	kgNTPKY6I9KslWmMSAsLLZzXPfv6cL9wMjAXAcOWbFEwaK1p+nRT2j9Gv4blKsHs2hAik4RLRdt
	PIXtyIaE39kQvf0rK2kiv/C9thqCRI/Y3+NTdQjZ2GvcoHDvhH4PhFjTODQoO3dZwyCFEkJWoS/
	/KkztL1l2pLrwrmqj9WyPx6w404NDJKnuCQ9RC9HisZLN9k8Gb041n7CFioQHg/BYuWFwAMawV6
	SYvydWbfOms0FXKK3qNCVqXEOalln8RbRJvdKvg80ZkA5BHqsJGr4mhw4/DcMOPCfQJcJonUaC9
	rsLRZKOr5a3UyNIdknMbo1vFbGgiJTjtGzS3TG+pK9gF/1vSO/SBhr2RoEuKeNidv0xQcb3As+z
	k6ExJsO/9atr3h1OjwrMwxL8f2FzKRi9/d4HHNNZi2QASwNeUNrvkJGVc0IMMbrb0GOCj82xlM2
	XLrVvn805nbL+lsPHXwRw44ZChNYpGi+KrwzllLpMKcgn284=
X-Received: by 2002:a05:6102:6441:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d739660c9fmr746735137.14.1795178202521;
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
Received: from soleen.c.googlers.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e80cb440sm2765262137.7.2026.11.20.04.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:36:42 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/2] arch, kexec: declare kexec and crash capabilities
 in Kconfig.kexec
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, 
 Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 x86@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev
In-Reply-To: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
Date: Fri, 20 Nov 2026 07:36:31 -0500
Message-Id: <179517819160.302903.17107992182494080507.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=6sWQl9lmqjTJk3yxh91YK+fuuFKvUf1mQEwavRJAVng=;
 b=owEBbAKT/ZANAwAKAbt3KEzbc3reAcsmYgBrAD7YSNYHVf2cFGXSq25iXRKWCRXN4f0ixFmnf
 ++ItKpA2qWJAjIEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCawA+2AAKCRC7dyhM23N6
 3tiPD/d31VAJSvGrL/uVfmPyx9aQ56Xv29nKPQ6VnqwxP+xMB94zunEWD8SU+Mc33Jsi99L7q8T
 EfGGkXbTCSoGd7NQv3bSnhUhMQVXfpkd18XOnWbNd0iZdBWi4KwA6+/bOhxsYpO/vNSV52HyHUl
 YH2tsnNB0E6EUN5P7dsJ2PqcWD6QjGrbW/xN/5ItrxWqVXu7AFWAGG87321F8utMVUAjMd5pbNX
 gMmicb9aVIU7JY8k0q7PhcEcRAKBjeq1d52NlSDCQyaltHTGY5+29RgVN9juLHJk/Aqy3s15ERG
 gm7x8LUDOEKOpRB5wWYYeKgpWsUscytR/AC4OBQTujXKhQIWBnWrzxr6tjgdacQJt/i9O9RHd1G
 2mft4ocO42XqcRceZtQr6UzRDuVwoDTDwn7Tgr1GRPVmpKWKbzpatvf9WPoIEE1p4+zITr10dGz
 r/38wDLPSJghOgD31RGTysREDXP/fCAYar6DdmmMDK63vuMssMRCUOe16Xd0DOIZIG4FAZ7iix4
 P8e8ny0z7tfxqx4vm+6CsIaWgFvVAxYu7Aw1xAruadzsWe+u5UqQLLBY6z+0k76JoRaBMkkcS25
 JEuj8uFaMFXD2ei4JRlUNt57apqgQNCbvhYb6KUTHwP7pocn/UNfKH5JCi9KQCFr7OzuMoLGVJq
 hED2RJ/U2jV7C
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Thu, 19 Nov 2026 08:16:56 +0200, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
> 
> The intention is to take it via kexec tree.

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

