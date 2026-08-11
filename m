Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98FD390610
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Aug 2026 06:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431312; cv=none; b=L1axtW8u+Nf52UDnzbwgn0PnMMvFAyGl7DYq4eLeadlUctjXoBLFNbzXUG3MnsYdcGT15cgmRAJFyhFQWXQxB3cexAukDOOr6dP+G6JPYhwYpYos0lyDldMREaTf5iYDBZrLsj8Ii0A1Frtpg3fMAfuNt9iVgnt+abFWq/4N9zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431312; c=relaxed/simple;
	bh=tZZLV6eyiwcGv5N3oyI6rD0AMUqGK1dWtQ5SUdhqr2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjFckyQQsdM4nLiTP69tWdYcuEgXLjDBOue4FBqo38ICV1DRGFnkHBz9fqhSTtNKosvCvj2OTPScVDr/16aFJAf3tlMas+EYB84kwjH4oduhSq1BKbvbzcWUMqJ2jRBqTa7D7HXpBElOdw0WcEPTBHc48eivDyYvYSRaqfvpzMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3567250b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 23:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786431309; x=1787036109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0iZRfAdzYvTsaTTh/J3ab87cNtJMKi7JiQC3Jqumorg=;
        b=E76DY8JMWSqeTlcVkUi/0XgxsND/IvxxbTtNGkQSfLxo3MtQ6xv0J6DTwlYQYU4bpf
         UpvXPbLKIvqEDYyaJeshMt8kJkHEUUd8UsXrBoGJB/FPQHlU8HcbQZbD+O8SUsw5qVoW
         RNq5MbssCJ06VRtF7EAQolJIlHMaN/SBv8PhfDrq9brpnDA+Ki4Gu0Lb138dY3RP+PvZ
         3pb1Q1LsjVOpjLiWoFfwWVkYyJxoiiPY3cDfnZhOKS40W6A5Rva1q9iZ8ekCL3BM91G3
         nshxtA81dg3Xfz0po8iUWtcsaIH2vTOiiti43Z/aG3ndy3Op2CIBZ4ejWAp8FO4SQGSv
         9fNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqX0WiUQvhD/zmqTLF0FXiC/+DLCS5KqNtVRCBBspmPVRAmNB4kKxzeWLaVXqQSQ+pxDSRhe0ROr7j0@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxBDAvXuw43ZvwVWpGplvTXxWZ953rih+oRuAG+vzEWulchYTMk
	hHufBELIXjID/2zCzsLeB6lkrnWaVWrURafeEwMnpq/7j7Y/ubzOkmGkdetQEvlS
X-Gm-Gg: AR+sD12Hv4Fxb3sKfrCDKZRr72cM2GXnlhMhlS8qOB8v9Coay1hECBRIQPvBPjWa9vp
	Xf5CPlrlhT75m01acVQt2N/2J+NGsX2wBGNkrX4v4b6dwPJ+yqEB8U3yNtbcY7x0OFDiHTgionW
	X6hPUhwUsJuEs5jnh7RcbLTPEJ+2HvFw3i3lJ4T4GttyIKKWFhYSu2WMOpZopZoBUCbP+zdl1Xc
	mrlVtbsTfmBPJq6N3JMjnbMpm68xU+Nj8jA9eOmeECPvOgIfmHgzxeG4i2afuYUsNUxVEEhDDpU
	s2TyN0ZbagXMHfy6OyfOBNBd/+r8/36E7pDirhJpgkoWx8/0l0WP3nLjyBs/JV3CjLlXO+DAhxL
	ghvMSezX5zUnMrpCyKZRuduioRfM1qorqdCa1gamvMZNh2EEMG4f9R9WASc8jtslqxzpkT/EUs6
	VphQxKcslpPLN4gAqvoectev6hXdxhZEToJE0z11qgBTkdxhWL7dJU/i8Q8OaaHHvT1Wgexjdi9
	LuOjmriziDBhL82SwnkHKVkdsimow==
X-Received: by 2002:a05:6a00:a211:b0:848:8715:c2d9 with SMTP id d2e1a72fcca58-84fa866d54amr1074778b3a.2.1786431309514;
        Mon, 10 Aug 2026 23:55:09 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa959267dsm183970b3a.61.2026.08.10.23.55.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 23:55:09 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3567225b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 23:55:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq9SlJya1kVC+AHbQllUMKoO55CX4BTyfh2bEVr8NnpNWjGs9327yEfgeUgAW4oqDUhgeVudXWKNeQY@lists.linux-m68k.org
X-Received: by 2002:a05:6102:c4a:b0:738:ecd7:1984 with SMTP id
 ada2fe7eead31-76b54a7a17fmr283026137.3.1786430995503; Mon, 10 Aug 2026
 23:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811042119.3652929-1-anshuman.khandual@arm.com> <20260811042119.3652929-7-anshuman.khandual@arm.com>
In-Reply-To: <20260811042119.3652929-7-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 08:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
X-Gm-Features: AUfX_mwgji-OqM2d70As4nCfmG84npBMa5IuhuEcV5XEKzcXYS3fe_Pqx16lD20
Message-ID: <CAMuHMdXfpkpYzZWGVb0fQrdn3uYHU3pyCkyAX9o2ux_Jj=2ByA@mail.gmail.com>
Subject: Re: [RFC V2 6/6] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

Thanks for your patch!

On Tue, 11 Aug 2026 at 06:22, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> pxd_ERROR() has been used in generic mm just to print the page table entry
> in pxd_clear_bad() before clearing those out with pxd_clear() later. These
> pxd_ERROR() macros have been provided by all platforms which basically did
> the same thing.
>
> Make pxd_clear_bad() use recently added ptval_to_str() instead for printing
> page table entries thus completely dropping dependency on platform provided
> pxd_ERROR() macros which can then be dropped off. First move all required
> helpers in core MM into a header file which could then be used else where.

Oh, the "x" in "pxd" is a wildcard?
Except that is not, as it does not match "pte" ;-)

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/mcf_pgtable.h           |  6 ---
>  arch/m68k/include/asm/motorola_pgtable.h      |  8 ----
>  arch/m68k/include/asm/sun3_pgtable.h          |  7 ----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
