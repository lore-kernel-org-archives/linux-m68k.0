Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353174;
	b=lrIg4mu/JPRvtSLXfERT2DmXRN0hxfAHByIkkwCixEQEFe4Y5egBPWQXnY6k8cy0K9cp
	 X7VFzXNrFtlgDKuYRVLGAS5BJsz6YG7XyGoZyVltvyCyVDoQax61xUo4fpKH7y6d7MZGC
	 niixdHIr/rUxj8Ek/NtJTqsZjR7PhpuN0sk5hb4tofBs6No/0SGNCTIwRaIGuDXxsSsTq
	 FzDlGdqcZfTJpc/woOtaj2akA3mweaexjiCFG0LjrETdsNzABDsiWSuJ5doITRXlQeLtc
	 wSKy3OGdiK3OSMkpSXFeLo2AuXpHLxDX8pYVnZBxjcwjXL1FajdgirPUo+nQglXXmUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353174;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=UvOO6JqfZMd+v5QBaFPCO17vd6AxfiDuRyj9QuuRkjg=;
	b=cpSWCB/HkAb4XqWTzZbRo0vV/rU9SBFVHvY6nZe21lWkF0SfBYu3iSdPUFTsv6jiJPYt
	 l3/7y87C7QYPdtHtSfcHKXUQtJvp79V1JeRSHyJpBNPOYsvvzhs++BTSegd3FLmV7sK4W
	 l0uiPhZN+ZVq40bFUQOaHXIW6EjzOungacX5IJ9XHMwD9eSy4fxgXFeU4Al8tfsehfNio
	 R7Ff3QLE6tlwchGDjc6IPRI0BEjDDwyJySO2Cn9CnKOdVgvGArKseGqJeqS1kqk3QP+Am
	 QJR4o9xOOgerv/5sobHuGpHAwvuPuctHIwJf4M4hHAVePva5V6PVKFTxYCQ87vrDueA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753B8606A31E
	for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 09:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso338845137.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 02:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353172; x=1793957972;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvOO6JqfZMd+v5QBaFPCO17vd6AxfiDuRyj9QuuRkjg=;
        b=xysNXRDSHvDneJXvUBknzqDn/FJ7r7F1lb80wTDppdqovJghquTpG4e1v0I4CUp9vH
         5pp/QtHcEaqK6k/1l1FCMpofK36yPgPgcRHIytkLUDkWraY+HSt28qiWjajNusKSip1f
         eehfAHbTvEqhQCmQfsme9HzX9PyIWW5nV7uDMBd3g7pUZAbHFzcryQWR0XSwsQc2jyAg
         e7cgdPGfBFlavlX4ucGy322DZJazFR727N7ZYr79RE16Qez0yfzCOMXOBE2xqENhQj0B
         EzpIgzcbc16xD1wUKyNi4R9EGZiJXu+j8z9pwWf6+XjQ/UE0POjim9HPu+kXtI0fyFIV
         wzWg==
X-Forwarded-Encrypted: i=1; AKwUvBxt+0DCKAvI8SjcFD+dD79YG3jTPnVxyvtcap7t0Cc0wabbDcEF3DAIc6J/IRDlcDl4KWlBm/Z8UDOY@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYKcgE6wdJop+Mzbn9LRd23DxAJxYxb/go8u8oqTGdIBH4uUuYX+
	1DpZyTFcAJ+iwESnB62zZSPdh/EHl2xDOtBYnBacjEfzYz1sqHb/c1Iv15ts7qLf
X-Gm-Gg: AYBFou30dr1KhiHZVbRF98ojwndC5ry2CmpyixOI6FAaaz4gJ9/SPcH9vh/wICQl/0I
	XYUebbmJ+gcvk2qMy60Nya7YsaiQ6sczVR0I5VtfuwxM/KuG89pdV7BxjVukxiUCy6Kz52HzolY
	ELmVVPHhnoTUS73sZUMMMf/1QIREg1Ou6ioWkgQjf5ph6gVZtt8s0kI9XEVPZ23sJAGyGIqMwI8
	pDsC2/K9kNsR+wSYqsRlQycvyI0KVjr/+G8zS9XdstfaKkUBpuQzgKRPEqBD2pUNwdsz2p2tFto
	ltD0bVw+8j8XMjnUoRHCxrabGouHkoAV4Ha+DyD+KxIFRwKqHMhJhFWFI11i2jeklWgFbBv9StP
	lDjoIwj6pauGSFE9yDS3ipFdxmjPt9dA5BGEZZ6J0wd4buL8HUIUWGBS6pPoA37oMY/6uaorV0Y
	7h15C9TmPN9kSLtaPE0AG1pctKUvN87KMCz0JNfTOuqrpUS195Lv6nWmIEvyOuH0Zx4QdVQwZHb
	LFGrBHhy5C/kynuAJFFN6elozIpPjCGu8AC2KxdlmktN5dHD38ApfgGGsXb07EE9aQ7+H5RqfB5
	X1RlUfUpfQw5Hs6SJVHNgFD3pnVVM2NcL0t214UGpzbJcjVPyVyEDQyCaC2tCANlUx8=
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr954812137.13.1793353172369;
        Fri, 30 Oct 2026 02:39:32 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee3a066esm1875089241.5.2026.10.30.02.39.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:39:31 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7a6e560f580so303668137.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2026 02:39:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxLorj3Nw0T3EAyG0aKjW8P/HvwqjEN2nIlGfZGfyxcBL1i/EDhFuaeL0yFVmxf4b4R1s56pwbrCLAv@lists.linux-m68k.org
X-Received: by 2002:a05:6102:14a3:b0:7c3:1395:a090 with SMTP id
 ada2fe7eead31-7d0726152famr950274137.6.1793353170421; Fri, 30 Oct 2026
 02:39:30 -0700 (PDT)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083800.599152-1-songmuchun@bytedance.com> <20261030083800.599152-3-songmuchun@bytedance.com>
In-Reply-To: <20261030083800.599152-3-songmuchun@bytedance.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 10:39:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYbJOGCd82fNm8dD5kXTWQvRnymkx3w2PFH-dKnH7G8g@mail.gmail.com>
X-Gm-Features: AclHuK8vFqi3dqWRxr6f8_rNGo4Y5wLrZ0prryPEwyIfD0-s59WP5msq_iDtOig
Message-ID: <CAMuHMdVYbJOGCd82fNm8dD5kXTWQvRnymkx3w2PFH-dKnH7G8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: remove redundant pagetable_dtor() calls
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Alistair Popple <apopple@nvidia.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Muchun Song <muchun.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Oct 2026 at 09:38, Muchun Song <songmuchun@bytedance.com> wrote:
> pagetable_free() now runs pagetable_dtor() for constructed page
> tables. Calling the destructor immediately before freeing the page table
> therefore duplicates the lifecycle handling at each caller.
>
> Remove the redundant calls and let pagetable_free() handle the
> destructor. No functional change is intended.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/m68k/include/asm/mcf_pgalloc.h    | 1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
