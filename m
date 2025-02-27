Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF9F22F38E
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Feb 2025 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662879; cv=none; b=MIiyJi7V+huXO/C87qUHP2R0TGIXVtYjk867ZRl0G289olZ4am5QVn7MaFrzWcu+5nF4WDPNyIMnL6wTfsfr5yNOQA1lAs0HndBhTGMjDkPU1NXy1mbDjpbGPRseyIG7M8y9w82EFbv8zpFm91MuS3HZMe+/eEArAY3ZlV7d8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662879; c=relaxed/simple;
	bh=KHJL4aBjL/xfUEQ3dzlxRvMvpwyqdBYuM/AU5jprt9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXLx/Z3MPU5uoZbq4dISz94wCDZaSL4M2KiGOfYya8+zs2HhwK7VDHuJcl0LZge7JPkuwugrY28O8PcR+qo2H2dIBBQRxzd2l2HxtyvmHKJA2tDE2DTYiIk48gJexAj0meBhJPt5qPcankVdNvO2IxHJuozI9Gnq8SfeXwsdQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ce886a2d5bso8530165ab.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Feb 2025 05:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740662876; x=1741267676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZScFKf+GfAOC+cGkef77m9WTcLt48410fHxRRqxMGc=;
        b=kGYnfp4AprRdpk9Dd4+mAqWzmLWiAtfzs3tO9zU38oHb/xGNnwZBGeyinRE8UiJ00X
         PviGjQK9xiKGbjrn9/oJrnpb0aprEdmeE5TJ7i4VDKnC9IkWyrI5W3ObeBfGvKekNwyP
         2g3CHomCQaFvmcl1gJG3W1FLa2LZ0QDJpo58XO2WgDEoRoY5R/68fA6AABJkl0OBDvsG
         xerJYK/CaEftmNUoXpcAwd1pa9/9DUBWb5BBKURg5yinnL9/z+w+QnQMOeZzwtne+7e7
         q8jfK+/FvpE7cSVdYFe5ZDw1vse4U3JcxsmBzcr/kKCKk+Ztgi53/iLOG4qiMQSu1LBP
         2wEA==
X-Forwarded-Encrypted: i=1; AJvYcCUyZwR/XsVIlLaza1NoPTjq5+acKW8k5joNnucaQwatnYVPtFh/fOnDRctomlUccx6+G9UHgXSceyfQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzKUKi86RVZVsyD5hQNgYRQmyn1yf1WczU72jB9nke87LSM6h2s
	uRG3+kizpbZD/Ul6cMQlgpIw1SbtAprLnwcW+4ndk4rIOEWlhtxOsdzqAlb8
X-Gm-Gg: ASbGncvvI3XPJirEJTC67kgKerfXMR1Joj1EG+aFjc6zB3tSTon/O0UNpv33C+VLQEP
	E4gR38KTor2S6AtKrUOgZeUgjAECYCKuvzWqQp2DVSBtu7ShCCo6vESFJ6b3NCbTof2WAawwb/S
	i/gggZzOczrlUVxjRgouyheIkp+UwPGizTfE6haeX11k3vOk9Poymo5u13OdOnG+dUTlzTdmL38
	Qtsq55V8wvw6mqHUF+hsXtVpJCWCGwsICR2+UQY/lPQypdIFjFy/nO9uPEJkLbhb73CcioyTSBe
	01qnQdufbZpyIgKNUggy0AK4sIw9r7wR05cFdvPMUf54ziDgR5LlCTYoMyMBampqH/Ei
X-Google-Smtp-Source: AGHT+IGwodTGyyW3HN6Dw+nIMUSZvcpsxD029lu3MlSKYcGqjmNm1mr2yeaNqwHhN/DFzntm23CgQw==
X-Received: by 2002:a05:6e02:1c09:b0:3d3:ce83:527c with SMTP id e9e14a558f8ab-3d3d1f140cdmr87543635ab.1.1740662876374;
        Thu, 27 Feb 2025 05:27:56 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3dee67bcbsm3219475ab.27.2025.02.27.05.27.55
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 05:27:55 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3cfcf8b7455so8463845ab.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Feb 2025 05:27:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMIXewgB781MiMZaEF6AtBnKkQ0TIjyFrLw+/Ex7/+YeYJkin1PDBOiMfBvsgdOGIqa4B/1qYlJQqO@lists.linux-m68k.org
X-Received: by 2002:a05:6122:1d53:b0:520:51a4:b81c with SMTP id
 71dfb90a1353d-5224ccbbe10mr3808700e0c.6.1740662495074; Thu, 27 Feb 2025
 05:21:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740454179.git.zhengqi.arch@bytedance.com> <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
In-Reply-To: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 14:21:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqe6so1GjZXdkUhIIAiYHT08E9WH9vQcbiUEIVlcQBmr8vV6ha0mxzJuRo
Message-ID: <CAMuHMdU8ttibKCiUPxSNBpJyrtBbrt1CqLa++jq6CpJFbFCwAg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mm: pgtable: convert some architectures to use tlb_remove_ptdesc()
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com, 
	vishal.moola@gmail.com, david@redhat.com, jannh@google.com, hughd@google.com, 
	willy@infradead.org, yuzhao@google.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@kernel.org, 
	npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com, 
	rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, x86@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Qi,

On Tue, 25 Feb 2025 at 04:46, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
> tlb_remove_page()). This is the same as the implementation of
> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
> convert these architectures to use tlb_remove_ptdesc().
>
> The ultimate goal is to make the architecture only use tlb_remove_ptdesc()
> or tlb_remove_table() for page table pages.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks for your patch!

>  arch/m68k/include/asm/sun3_pgalloc.h | 3 +--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

> --- a/arch/m68k/include/asm/sun3_pgalloc.h
> +++ b/arch/m68k/include/asm/sun3_pgalloc.h
> @@ -19,8 +19,7 @@ extern const char bad_pmd_string[];
>
>  #define __pte_free_tlb(tlb, pte, addr)                         \
>  do {                                                           \
> -       pagetable_dtor(page_ptdesc(pte));                       \
> -       tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));        \
> +       tlb_remove_ptdesc((tlb), page_ptdesc(pte));             \
>  } while (0)
>

With only a single statement remaining, you can remove the do { ... }
while construct, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
