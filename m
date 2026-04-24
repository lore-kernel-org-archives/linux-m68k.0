Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB92244687
	for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Apr 2026 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015019; cv=pass; b=q/5g0BsTu2jfozAzsH08FaAyPUsD7tFdtWRlcrh5qgHOUKeDWnef+k/WyKyz0Iw8INX5RclZUDy1tLikIp7gA9/PAhSzaQp7VLC0SsewL3+JBiVGdlAf/81tLtfwUDZBhqoTCxKOHc30J9v5arO/IcacA7vlcI2GlEi45HPtokU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015019; c=relaxed/simple;
	bh=W+ssi1VXndSbA3jTir7s/4LRoYtNUVNtJuZsueaDSGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOpCsgeVxlc5YzY2DHlaI3h/fRhwRKkQ6khl9QsisH4zcgtq6b/XhQQBuPyt3UNruyxdDNpLV2RTHazuTg0E10ArYU1Hd+1REctRe59vzt5GEDMb9qZrL9MYl2CP6eFhEJw3VGL1wAeIhay2ImV8wt1oeybTXO0QbuwLW0MDcPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCFD9E4v; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCFD9E4v"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so9603299a12.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Apr 2026 00:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777015016; cv=none;
        d=google.com; s=arc-20240605;
        b=WgDD3joC6At0sL9ZSqZowAoed0PB5dd113AdoCcoupJ466xzUleyqY6MUmWx5IOOm1
         MRmzFedKX4CO7Tgntq9Aj2Ya64mSzmNKdEKIoAiOfuMboUoOug1S50fj8V4rzkuJage2
         JU+3ao6Jq0Yv5B4Awy8UaXbcZbMNJVB3jo1ZAuohhWmXDolyE/dKNQH+5zqevGzXF6Kn
         z3zQYWBDWUkR43AU8fvmg70AU1mX6apbXv3WyFblqaKg7qO0TI18RXwBke7GUfO0cUhO
         CAH45Rsi45PBUwaRQ0wCInY1VLYtI8o/9v6BUNyZ8TH2J+Lo+6ydg13Ot/B4p+I2uNPj
         Qqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uv1ap7wfpWSK/rjkumTWgHiVOSnLQXCSFDMADgPR1Y=;
        fh=tq6tntzfBPMXdynPcX6YbqLj8jAaD674qQWC9BseIfY=;
        b=DA8V/eOxrTGg7VAEU8y0dXtiKd2y1Xmi9gPaJeTHqXgsnD5wLS4gKonPluMg5VWP82
         Af8+pbSgGcR7KPTc81uZSeWd2x8UlQ0kbkogeMUGGdivH7HpzgkPcuZbETkubUrHH3qV
         Jd/ExdZm6670GEG7Sny5VJMGvPsvSu9IHbCfcfqAirz+3RaA55V2sbNqSq5La0X6/LI1
         sacW/BSHU4DX0IFh0dLqXYam7HCz4l5H5+EpaR4PsAnyKVbDHbCMxPDkwCELCCbJsASF
         f6Y4ksUu+tI7Z2A7pjuLap1mCmEIkisOxcsfLjOqTOl0SGb6T19IcqUqY0VCoQGfDVSg
         gI2Q==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015016; x=1777619816; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uv1ap7wfpWSK/rjkumTWgHiVOSnLQXCSFDMADgPR1Y=;
        b=WCFD9E4vXSY4t5AG//G2NFpNTgMbCw6O7VCQmA5luef8tpeYRVnc20l63mLRxUUgU6
         qKmWnEoQ+8rOXpf/lh2dLRHWa7KK9VX61BYkAY76aNP/SosfGFid6HJ5Huy8qqlm/Ma2
         mPk9WezhYuYGj130ojiL8A/CQrpnmvj4Usm9O1d7Im4rFpzwS9nVD/Rl9EL2KDFbarzw
         u1CNJJcbWTAbaiW7Bn/ISImP393SOoAhIzUBnXgub1rvY5voPF/ziukuPdetNRN3ylrl
         8mnt/acPDxTHmjgRZ7tSiSxFa7EAl/j2ki+gFmte8KKgqKm3vF3GB6kkWMIQ+P4bpKXe
         W/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015016; x=1777619816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8uv1ap7wfpWSK/rjkumTWgHiVOSnLQXCSFDMADgPR1Y=;
        b=cEqku6zSUWiu0+d8anKBgQ5ELnqRXzQkUmnl1Yh9xHK++/1fYBjezNbmC53m5226zm
         syQ86wbqjQ12L9CaT1CfGSplGV4Sr150hU2gyOUqRS8Lmrly1+iaL9QOuhAMaJG9EFkH
         e4f9NrFtWY1fBP/52XoICZ3ArVDh25xIf1jm5oh5PtYDfjFEdHqBlMjVb1Qs/qApqamQ
         qPejHlIc6BcjfEo4wSR7erYrHM3vLZvr/uy0VVJvpBdk0HTAy3xaLWxm+viC/Xv/Akjj
         DalO0ooBiCREdqeAqOqBLwBeVolClx5uXslaqU3CEB6lpN2AuD4yK5ZxRE9vJT7TWifB
         AKMg==
X-Forwarded-Encrypted: i=1; AFNElJ9stSG+SANDELtoOPXSQM7msaV/WIweMk+Za/Izlk0ECRNC6D5hWh95AbMPZ1qxBINrWUsx6f7NwKFm@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy9akZJkCE3qgz6oLrDGP14AQMlQ333fR5P0uMq2UjCRKU6dYQB
	FjIM3rREBrbvZF2Rpw6ng+zGBBoUHcTzKxoRLMa5UC8y3mgRF0bUSmvD/SKSBtELVRmiV5qF6Y+
	1LYNBLdJwG6HMOc/9aIzwIScETJa0COc=
X-Gm-Gg: AeBDietnygt2WHTKeAJVaR7MtaGdeImxvf8Z2Si7ZuxB1wRD74mXFQtzxAyu+q9GNCn
	ftR7FBUdmz2mOZUGsxQmH6/iAZ+mP0HMQjJNckfQAMJmtXkneZAJhtB9EN9Xpg3iwwtm2nxCqMk
	NtjSkbYwgMePt6dm94Lu6M8B/zkVL2qrJZB76KEw46c1DcdaXo8xuh7g5zT9XGXw+x+MvHSA4BG
	hHNJvjaVgPx6iXj/RthkIAbwq5HDvuGwgXazAzdeYb3+gLVxb7ra6GDSzxoQjMXB82zec+su6cN
	H1CU1ugv7rf0sTLKDw+Bo8Y1/vUszE3Yvn3uC8FM3YaIIZm+UuI=
X-Received: by 2002:a17:907:1ca1:b0:bad:dfe1:6a56 with SMTP id
 a640c23a62f3a-baddfe16c2dmr60367766b.30.1777015016077; Fri, 24 Apr 2026
 00:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776808209.git.mst@redhat.com> <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
In-Reply-To: <006f9142e591ba8c340c3b354aee76aec5c285b9.1776808210.git.mst@redhat.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 24 Apr 2026 09:16:43 +0200
X-Gm-Features: AQROBzARFJV36R4zYM7xbfHPyy5Ua1V3EjGjDIipUn9qIBzgKGxem5ahIafz8os
Message-ID: <CA+=Fv5T83qH-c0U4eXO84HQmG=225SepaxVYzrpQh_CWMhG5hg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 10/19] mm: remove arch vma_alloc_zeroed_movable_folio
 overrides
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jason Wang <jasowang@redhat.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, 
	virtualization@lists.linux.dev, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-alpha@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:01=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> Now that the generic vma_alloc_zeroed_movable_folio() uses
> __GFP_ZERO, the arch-specific macros on alpha, m68k, s390, and
> x86 that did the same thing are redundant.  Remove them.
>
> arm64 is not affected: it has a real function override that
> handles MTE tag zeroing, not just __GFP_ZERO.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  arch/alpha/include/asm/page.h   | 3 ---
>  arch/m68k/include/asm/page_no.h | 3 ---
>  arch/s390/include/asm/page.h    | 3 ---
>  arch/x86/include/asm/page.h     | 3 ---
>  4 files changed, 12 deletions(-)
>
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 59d01f9b77f6..4327029cd660 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -12,9 +12,6 @@
>
>  extern void clear_page(void *page);
>
> -#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
> -       vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr)
> -
>  extern void copy_page(void * _to, void * _from);
>  #define copy_user_page(to, from, vaddr, pg)    copy_page(to, from)
>

From an alpha perspective, this looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
