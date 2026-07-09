Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A23E8343
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jul 2026 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586858; cv=none; b=W7NKaNdxAVW/BA/wzGpKSNO5QvXj5CF6Ik+HCS0repVZkEQvEIY33kFO6LkDgElli8l5bfrwOdn/qyk8VDrPkHmEl0CF92PFIeNHS4AIrE3/qOCQWqjiSjaR5ivGFjsacQ9eno4mjjw3MLzLrj5A6NY1WbaO4tfW1OfhNxGo8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586858; c=relaxed/simple;
	bh=vcIYcFn8wOu64JToHCd3V3ghUBsco6aWxPDuriYHfZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYNxWZMK/Bnu0JAP1T/Jfyrgf7WtIZ+NeAViVuPTpjVvABAFM6KrTDaGA7i81qd2uukpgAEq7Tkw30peamIAL8rdBNCLiAQR3IH4tX0HyzrLuRxzreLUImQstBB1iNk0MgNl9AHHJrHaJHGStQaEqTG8n48NCtlpt90GTJBQyig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so22128885ad.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 01:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586856; x=1784191656;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=NWpzdnCw8UfSABCaUChLgOXI8XD/TnIe3puVUuHCIQvJxQaGXuvp5loS5zMUEPWazL
         ra7ZPdeAQGT0EZS5JXiU+qTd3r7k2I0gda0LhqCGVqFAMc11qsh6O5CAaHSR/kSbUil6
         Znzon4KBKUUaDenKQOl07RsysSkDDk0XYyyFF04bs9PLXANQ0Ce7aTLPgsNX+FY1/Bje
         Q3evEalq5NU/3FNHBsPgGW5KVvRa+DzGnkCk8esIK4g7j7nhvgPTuR+qMmOxutAN6HLJ
         K8YW00hukTYWr+TnUV4YFAa1D6cKFwpNrJSxCi4MohSh7LWahYGDK7bOq7IHzxnQpo1v
         D5Hw==
X-Forwarded-Encrypted: i=1; AHgh+RrcbF4+wfDvLBCYFDjgfGEO3omOlC/yciZHtlERzmvN1oYi0n5DC5bn1gxxFYlrRFvWdNauA30IuGCB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyHhMPAUywAEAd3/qV6rCHm1JANKChPakJXwlR0R9kC1r+0BVD8
	eUxXVJvFk9Wpaf3bYmU6rIQHlAZlcPJj8xK+YBqaC8+o9TaFT8FpqZl1ulaxyFBJ2ks=
X-Gm-Gg: AfdE7cn4JGkvV6679HCgGsTnBpL7krN/9APDEKK9YD6+IJQTMGI0xJs2WkaRk04FKVe
	k6csaIcgeteP5CqeHVNbNWV3e/7bMGVM2Ryp3qrq0cFQOF3+3TuJMXMroCcTI4W4AaDSHCXhbew
	+bLGBldDYxCVZchiLY9ZNDH1oU8KGD9siFwk5ZB2tmoQ5inarKl6eE8OBd6nt7Z1D9f827Oxm7h
	rIv2zyih02T15nWdm/evln2u3pf2Leu/Q4+S4ZHY7Zfj5uXU+frfV8RnXTGWU4he9/CKP/byPu1
	wGQyURTrOrvhv7He2IyHQKIpiTawDylS7NcFuSl34fDMpp+NHq7x2cYDu+x0yhMFfsbQONUwGRX
	RnOdYeiQR2zhjbWhW3ku+N/Uc0Z9U0zpJAupkLFg9LU+2uJimAEoZl3synlBz97RmIJIsi55Ail
	9st6RuIGfb5kCXX+6fI/XtecSLnKdUhzMraSuTtkAF6ND5sfpmQVdIJw==
X-Received: by 2002:a17:902:e892:b0:2ca:b1f6:b0c5 with SMTP id d9443c01a7336-2ccea45a8c9mr61916915ad.38.1783586856270;
        Thu, 09 Jul 2026 01:47:36 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm41148425ad.4.2026.07.09.01.47.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:47:36 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c999f162c9aso930596a12.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jul 2026 01:47:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEOUr3IT46uoCnmMTj/OKf/Brpv4GDNhK2AETdaLU2u+jBdDK3QkOIWXNswh6/Pe/4Mz7Hho7iKenf@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
