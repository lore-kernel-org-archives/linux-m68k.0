Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316692;
	b=okNFPiuteD+cnGuMiEuA/SzGa2OsERs3wsuFIjoB/yzl0OeoowdECqkfEQDdXG/+nmmA
	 TuLnQjnKi3df74Q+Y6Lusjsw/PkhdJ7tzJMeEEmq7/t7sfSs5HfIswOmWw52GQanz7kjp
	 U56j5PHbfbrdOV8nVIzQx5PW1Z0S/wC1IFc90k9OrKQ6P9yrxbzTNfgms95efneTOPRuQ
	 QBuccrYgYgX7ESIopWZvjwJHCi1tmm+We3un/KwjA5WEy9/Z5EI1Uy6yaGU4XI47qojm2
	 S20kIr5THRzRrcg+qT5GdqHKxNn8fESqmoW/cbBCyqbtR2ixOR7ZAfckTzGMOVlEVaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type;
	bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
	b=aNNw32wMuZlrVElXvKzvGOY3FFTm6udzrxslk2oZg2BANMwgo2amKcNIQfU6fCYZ9d0p
	 Ix/MY2g0tSm7J+fxp/usi6sHpAY6MWzasxuVkKUICfT/y8StZF5XO1I68FM9M73lTYn+F
	 L2+QJUHJq7X4aRb28y5+ggDl0ov1TMsi9yZWFYoru6HDb+iImF8wsfWsd/6PKahEEJMEv
	 ZmhNfY/sxdm0Pj3U/kAw2GACUZ+QnXP43XDVqqkBtah3MWZ9v3Qskntuypcu0Ryh4vsEj
	 9nvIJ8R07PgIe+ZjavPfn/HGDQKMXqgFi/8NtLpMT5XjGOgbIy3kPKAq5s/huXrrLEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6pr8bG4;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770C2606A32A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Nov 2026 03:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 770C2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6pr8bG4
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869f03af6aso968343eec.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 21 Nov 2026 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795316691; x=1795921491; darn=lists.linux-m68k.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=a6pr8bG4ZJl6cSneSoCwLgIU/iLdLZwswTvnCjtgXGn9fcIcJpS0eo3y9CGEEFnaHX
         U8KpgaGGQB838SibCadKGEi+brg2TUn4k4tFj6Y52j0h2JxoSc3jHk21KdwUU6jR0wfE
         sgiTccTnHF5l9YdW70Fr9vDwSPigI8OcXWYL67zXli9+g7mjAv9Esiw74e2Pww1WOxCA
         2E3AGnR2mr+iK9MGKDShhZCb4ZNv6V9dfZ4/il0QUXefUqHRUGH4wUAosXfnV+vxPiue
         ojYpV7MYQU78BqQDsab5KOQ8k5ZFx93OrRcPzzBLtLsedz/YtMYCKqkqYBQW05IOtTSo
         dBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316691; x=1795921491;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=R+pZ4iJnFCmB2Kytq+FleozU+mznusk5ZGhRVMRq6OnXfPs++4eotZhyLG8X0J2iCb
         jCqY8Vi+uQlS+BeKHjPsxIU5I8jAlEU8/A4R/BrGwka7G0WOhwv+53cJKd0aPhswRVQL
         nB/b3BJXrVLkwoUyOTCWB3CdbZYd2p7vAFmRiL9HhkOyjto1eSlbNu3MbOF+N+yU8+y2
         Qn7Oo2APc5q9SuOtQk7HaGnCQIeN5/056D2W4GXLr1VARczb+XRKthONMwmwJXqHuU4M
         uiBSzXEUzQu5n67qtsAzTBao9Db+j2rbMY8Qs4SLNxQdUE9JJbuZZHGsIQD8xITVRlvc
         Pv6A==
X-Forwarded-Encrypted: i=1; AL+hErEkNQaEZNwLQLw8tt4UKN5BmKzcu5e7V06dvS6O2xwvGSnTJtdTbdPlzNgsH9HUvwV9mk72aAEHgW2w@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9LFotkL7FO01Gnm6I554JcR25wAWlsc0McRsoF3Lv3YYlLtVSk
	0qYj/NUoKhhkwgOIU2pTq72UCxpBt1RVfyFlWBZ/A/DBbSBMPnWKoiGY
X-Gm-Gg: AZFdTZcnE6Ws80hz0SSo6thP2446ebyWzEh7Sx4/UEa5HS5gT+BLtwjHxOOLxqhgfwa
	UMannN2f3SGuocMVJigPWVgpYLF7tK3dNzrZk/dgaVeIZ7v496zBntkSZvsSGYyJkWOn1yW6LU5
	5qitUTLJCEWNnlG6kNr+3WWr+bnJsy5Z5njdJzLc6hsHzGTrUrgiXPv5q8loq1s6Tywc8FUAR+i
	orjSpXwwfRRkgQ13597iiy2dig96LpXTmGFMWTeB06KNFOXqlSN6j2pSwLvCR004L32pONum/Hr
	4ZPDGEOqQo1gb8Ko/wcTgkMeGLyrNJrbt3LYGIHrYiAm+W/prCfF8R1pmX4OCB/OKsK0jys0R9w
	wIg1IZTr/+2cHSnmnl0K4fEgP1JqHnvPLE27oojRe1lB3q5vXyR/jf3AKzMjwekWgQa+E4yzKDp
	kBSyrBFXktuHui2HLFvfcFONJkgj0R5xKEiJwW6b3z+8RfJ3RiIr49CDpCjUZIyzseVnRbB54JJ
	4bX8E4WZsRaU8LSnc+7gEKGl+LV9YBV96ttrEXJNFT54wvDaQPan6u+Jrzo+rwyDl4Jwh+FW+Qb
	AOB8vPT6OnmANJYHD9+Qk+0n+6Vrz5ZRD/qrGu9j01kYaafK
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr8869235eec.8.1795316691531;
        Sat, 21 Nov 2026 19:04:51 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm24302948eec.27.2026.11.21.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:04:50 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
Date: Sun, 22 Nov 2026 08:33:10 +0530
Message-ID: <wlq5k1ox.ritesh.list@gmail.com>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Mike Rapoport (Microsoft)" <rppt@kernel.org> writes:

> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

No function change observed in this patch (as described in the commit msg).

LGTM, feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc

