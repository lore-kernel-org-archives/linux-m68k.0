Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC91356A2A
	for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Feb 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840874; cv=pass; b=RtozC8NMZ7zc18kjcF8mY17Yf+IwF1SxWLRfgzCxmP3KJfXySwRfiGumq3Ckt5m9sYMA1CcUImCIYfINa0b/PQJe5fVGlICGz+cT9/Rlf6maF/yT0ocHPeJf6H2vrbt+nUqoseSO8uYoJkKpPXXp2lH+mMP/T31SZQ1+r46WZqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840874; c=relaxed/simple;
	bh=XTU0SZsxOmJ3FoM/DLxyJrm+s5UGvDwm08Uhn3BjVVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJzoftSCTuqK4OcmIZC4C9JYELXlr9nWh9t/Zvb+2eorOK4mCZHdoWWm+I9iy8B1dtBGDRv9HeFN1//9JI+FzLG5NFp2RkKxsX9tvp8CPji2sNqxk+4yS4c7ohoGVrn60IbgBkZjx0fc8bMcHfdNjQgQl9HOTT7M1tI2QwIiK18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fasBUgQN; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fasBUgQN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8869cd7bb1so1034179866b.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Feb 2026 12:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770840872; cv=none;
        d=google.com; s=arc-20240605;
        b=JVq6RxKXBrKUIgkxlqnvncjM3gZLiMigeb+Dye8j2j3vZDzDeITgwgF0pmOOBX8KVm
         sW3V3jaZ/5mr9NAEAmAa6NjkxHL0UyB+sUgPTvolXdDq/OZIK4Wj42LhtqnZ6urjybzp
         bC8L0ls0t04CLHtlPX/I0E/iMEa2wTuy0TrF/YCAkQHb81lYhkHWzVzVZFwzZZw7PA32
         vCcAwUypGS42CG+O/TUzz/d3byN40e4vah7OHyc2mnMrqaHjxDO/yCA61ZBs0KL3f1gM
         tUzec2CC5G6GPUe+/r4AP0UYSHEaqtQQJisQ/MPu52nCDGq4fagmMXuc9ujqZUMcNTkq
         RozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        fh=StSVTuL+aWe2k7iIWY5ivKGdZ/Nl+4bFq2b1RS/0AaA=;
        b=k3cEr6d78fbDpHGLqb03HGoypWdLRodf/a9E/lkxdeoz6Cm5dcUgsw+ZZ0XDIxSH1o
         4zrNW0A44OqgrPr0Fr0/ufpcMJ2G/x7dCu+pZLY3lXdcCsjPIJyOTx9XskCt0vFGJW6Z
         v0HETJ08QLeo5fHMqsukvCmuYMVrlxJ0/JNH6Cp8k9x+2IpZ5xJAv/tn0noreXnUJtp9
         WqCRi0aHO7cyZUFfwgO8D3NBTX8U1+ZZ1OMgnobZjboIUkBo3aQFkKtiGoPeIUPuXj7v
         5EGds52yGQy95hUkJwU11OEFgSG3XZvg++PuPzMWq058XZrJW4sh5l82xERrN8GwIMZ/
         zZyA==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770840872; x=1771445672; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=fasBUgQNjkapdR0Xrslv7VXFifJpMoxC92+6ZR21M7i5yLP37XfCwI/tjP5BD0SmXZ
         sXMUW+VvFa7Cnv4vqgBlSaQeA8l7mnrN4yBdQa2/FaNnumplBzTuT/reAv1oc3vvI+7g
         8WzijpGdYPQX9AyKQukYtrcNtbX+nFzl7AoX+8JqkCAwVoMWygslOTKLU5bInle7KjR0
         mlsYq99JLf+AWSMMlNjoGWivK/qg8wa3SOIhSMvBGUKQ5QPn9zpqQRWqiYMYyAfloh5s
         yAOrSBDnJYy9IU5IFrlaDiElQ9MBIMSBbmlm180YxYF5tUpYPM7RkA7S9bJrsRAKR3t6
         1PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840872; x=1771445672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=28hr9LjidhOb4+7vDtUZiT7dYr2nuAMqMlceW5mXuOg=;
        b=BshUjy+3fkdr+UDNzU/bdXfPRWZACeDhEWjjA5JLKbg6RpRjtzs/JP8zto4h8/1H8r
         l3KzSxNeKFPxhnteP1nMescJXsSclqvg3+XDqStZ3QtnGnyoqA2Mkp6NQUZW3fuRzR/P
         VlRltvYmMBumcAumlgPVUH5jszkHBHHqwMwNyjr7o9zFmcFDKov8puotVnPiW6C4yL8E
         aaTetDzKHlQlirQOVarr/yQBW+TM/er5KOkgrnsWVv8BLs7F90xDQpN7J2mRo2oanryA
         DGniCECW86BU07MrHoFbZId8xp8R/xsOnSRL+YqnWQAC6azriMhoEabKXR+9tej9H6kV
         obOw==
X-Forwarded-Encrypted: i=1; AJvYcCVGDemJXGVCMdOl7VT6MTDJqekIIS5+jOsJDS0yA4aPNpkHfForKmQmDWU17S1AzANuzlU8Aj40bOd6@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzLVI6BAIRoIkAm2X5lPT2rlAr0rCbpICWSqfJo5ucb6FmDa43q
	rolcS83HesePWdhRu1P1XUtNdKFiZy5gnc2ehTk9ZXVZWv2uCNJ6vZ6dFGY8rTkbwcGXYTZ6SPs
	9m3/A8jYn4G1FckSgwRxL+Vjrx5+QVvg=
X-Gm-Gg: AZuq6aJb3XJDQCCO1EYOrKx6d3BEXgLc4YT+Ry4IpleWT6TsnMO9CacK+2pKLiwzN6B
	6oHjAXe7p0qCGnsRayxuHWnvWUlybfAKIhvt/m/sAN9/grXPLtZPc4ceFBNknERytkwcG2R+7rc
	g+LOpw6Be4kn+O7T9lxzQgbIAGXvsaKIeTymXxY6FA/m49Z/XYRe7wojsWHcsMguAvdN/ke9qcA
	vD2VqoEKYHvsLMAp5hTOj4IH+Ld7UxaTeuq+8G3UJr35JKLTQZUU0pjIHup5T9N9uqgt5a9lMGc
	jPLIbcxIKSYtfKDLT6IRUsUkf1n1O0TW31Vutu+nmA==
X-Received: by 2002:a17:907:a08a:b0:b8e:64e:1ed with SMTP id
 a640c23a62f3a-b8f8f72d91emr17643566b.50.1770840871149; Wed, 11 Feb 2026
 12:14:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211103141.3215197-1-rppt@kernel.org> <20260211103141.3215197-4-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-4-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 11 Feb 2026 21:14:19 +0100
X-Gm-Features: AZwV_QgdPAvH3hw0825YIt93LQPupYFvh_AV-2zMkwGhubC87cSa2iVxpdoZwag
Message-ID: <CA+=Fv5T07oBJweU3tURD4Nuh7VRWovsf0zjHtA1nDAVNmO=D2w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arch, mm: consolidate empty_zero_page
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:32=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Reduce 22 declarations of empty_zero_page to 3 and 23 declarations of
> ZERO_PAGE() to 4.
>
> Every architecture defines empty_zero_page that way or another, but for t=
he
> most of them it is always a page aligned page in BSS and most definitions
> of ZERO_PAGE do virt_to_page(empty_zero_page).
>
> Move Linus vetted x86 definition of empty_zero_page and ZERO_PAGE() to th=
e
> core MM and drop these definitions in architectures that do not implement
> colored zero page (MIPS and s390).
>
> ZERO_PAGE() remains a macro because turning it to a wrapper for a static
> inline causes severe pain in header dependencies.
>
> For the most part the change is mechanical, with these being noteworthy:
>
> * alpha: aliased empty_zero_page with ZERO_PGE that was also used for boo=
t
>   parameters. Switching to a generic empty_zero_page removes the aliasing
>   and keeps ZERO_PGE for boot parameters only
> * arm64: uses __pa_symbol() in ZERO_PAGE() so that definition of
>   ZERO_PAGE() is kept intact.
> * m68k/parisc/um: allocated empty_zero_page from memblock,
>   although they do not support zero page coloring and having it in BSS
>   will work fine.
> * sparc64 can have empty_zero_page in BSS rather allocate it, but it
>   can't use virt_to_page() for BSS. Keep it's definition of ZERO_PAGE()
>   but instead of allocating it, make mem_map_zero point to
>   empty_zero_page.
> * sh: used empty_zero_page for boot parameters at the very early boot.
>   Rename the parameters page to boot_params_page and let sh use the gener=
ic
>   empty_zero_page.
> * hexagon: had an amusing comment about empty_zero_page
>
>         /* A handy thing to have if one has the RAM. Declared in head.S *=
/
>
>   that unfortunately had to go :)
>
> Acked-by: Helge Deller <deller@gmx.de>   # parisc
> Tested-by: Helge Deller <deller@gmx.de>  # parisc
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/alpha/include/asm/pgtable.h          |  6 ------

> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 90e7a9539102..12a3c5f8ece8 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -125,12 +125,6 @@ struct vm_area_struct;
>   */
>  #define pgprot_noncached(prot) (prot)
>
> -/*
> - * ZERO_PAGE is a global shared page that is always zero:  used
> - * for zero-mapped memory areas etc..
> - */
> -#define ZERO_PAGE(vaddr)       (virt_to_page(ZERO_PGE))
> -
>  /*
>   * On certain platforms whose physical address space can overlap KSEG,
>   * namely EV6 and above, we must re-twiddle the physaddr to restore the

This looks good from an Alpha perspective

Acked-by: Magnus Lindholm <linmag7@gmail.com>
