Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F208220686
	for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Apr 2025 08:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013182; cv=none; b=F5PJzG09HtWWcbyfO5OV4z0Bqq4+ygMiiqHmixif0ZlGVPGk4h+J9VLDNSCNV61pCbZGqRYY8tgywHfQGy7UxDZjATxtI/IQP2LIqj9/5ZfTYaKfGrAnuG/0R+5ZmgY/UOw6fzasHoRNRiA3Rj/MQZLOu41eRLni90pLr1NFG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013182; c=relaxed/simple;
	bh=Jv1axMlTH1d7Bc5hi8tVqQgcr6gs+9TX6BEWYeJwdVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKQ957o1MSkafX5pwI7Gf9clj6PbObqcZLcQY1jcfJNOJzNpwIDpAxt1QdNKrNj/R3+XmyblYmIphZlmKkyxHL6zGP32AsswlkQglnUGDjIvB0RazXGFp36Ie39qgdJyu1oZFXS/v42rZ8J86fhpmgqfN1qi5G/gSU+BgIlDHns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523de5611a3so1808889e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Apr 2025 01:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013177; x=1744617977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=em0yD0kIpDtyZFKdGXKgNdHuMfrDjAXLZIWfYU3VNv0=;
        b=qKTZ36fQkmG29YiR6uh5hNPM9s6aErLadF5lQQwIlqp9q6TBwGUFZAtAr3t9n18gqU
         hK8BW1eIiK8qT5XVznBd9eCUgnMRK7bsTqQjLo+nMjyCTSiLBucjuYb/iS2q5BXDCbZd
         hz1mzVZyFB+3AeTeWl/gqGBumgDTR70qm0K6NvdstT796JzT4chvOE44BgBhRX33Cv8+
         leT9HQGJd9vIPqWuHRz7UUnDDPJVuGVbQ2HVz7wIX7D/BvDOKSJ4GkYF/wAkCP1/a8PR
         u+dOAhWKEPaL9Jf8kBPlXJWNbyYAlAxVbAWpzTFJ9HOeeCV+P4SsbuXpcG7S0Xbgl3jG
         OrmA==
X-Forwarded-Encrypted: i=1; AJvYcCUWtehnLD/H+aQs+jR7I3EKb/HvZR5ZHP7qzhClmtn6mBOwXJ6Zy1/BAlBejIVbQPvhdtwXY/dKXLPP@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxNw4aIv7mP4N2JHYfLotGH9DIcF70hK0Z1pRhU4UspWyzuOtEh
	JiH1EZPrNe938qngjwPX+S+d3HDaZ+3dreM+buanht7MuzmcJonpFU0/KY7l
X-Gm-Gg: ASbGncuBxaw78J3ORtyYhj9+BprQgXZCneqQ1OAtZm2aSBjPNgEYLLbz4+4cZdtfszL
	8ibGRW/IxWwtDZ8MtW8p063ztzFOPzEk5eVTfATZx/6+AvWJSB5+w/dj+aBl1CsjZmFDonZ+y9o
	UdQhugXKpK9OUs+TqMHM5TlLeRCWFMWwfFAnuXSqqetkP62pS7dBiAPitcMzf9ZPh1cJ+h0byBU
	u7WSARgm/OTcXKJ+e2eZHQ9IWdHvPVuefG6TgYyjid85sG29hqX6czMNON22JfjWGrgZAXQFwUT
	IuOytjazVShLCFrHv3D+Ik7GWR2gwl6RuOMjA5tPCUoJVvxUQBDkoWbpbpU+0yeXXnBrIXr41e5
	xizGg/LE=
X-Google-Smtp-Source: AGHT+IGPvv6jeblEH76NmMCzIZgoiY5vqTh6CMyHl0hOUai74ZngRgG/B4KoHS99SMEdb0qHCdxe8g==
X-Received: by 2002:a05:6122:1ac3:b0:524:2fe2:46ba with SMTP id 71dfb90a1353d-52764599dabmr8148059e0c.11.1744013177228;
        Mon, 07 Apr 2025 01:06:17 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275afa8dcasm1767121e0c.46.2025.04.07.01.06.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:06:16 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86d5a786c7cso1786373241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Apr 2025 01:06:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpFjozs9SZv723HBzuog5AZBlfMFQtgZhJdaFlXn9CSTyH9DdPOqOHXSwDbj0Tt+a54pyl6ke596Uc@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1622:b0:4c3:221:8f47 with SMTP id
 ada2fe7eead31-4c8553d0fafmr8533368137.13.1744013176401; Mon, 07 Apr 2025
 01:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218175735.19882-1-linmag7@gmail.com> <20250218175735.19882-2-linmag7@gmail.com>
 <4209b9816551367f8e5670cc5a08e139f0f2c215.camel@physik.fu-berlin.de>
In-Reply-To: <4209b9816551367f8e5670cc5a08e139f0f2c215.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 10:06:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLVw8aUY8aCowgOz+puxjrDqcbUXUAoVXGi8=FpTHwrA@mail.gmail.com>
X-Gm-Features: ATxdqUEtUaFZruSQ19joR0gbmVyVokHgxasQdxoPHK2-UPmtdbKL5noyYxpgMcc
Message-ID: <CAMuHMdWLVw8aUY8aCowgOz+puxjrDqcbUXUAoVXGi8=FpTHwrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org, mattst88@gmail.com, 
	ink@unseen.parts, kees@kernel.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, chris@zankel.net, 
	dinguyen@kernel.org, jcmvbkbc@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	loongarch@lists.linux.dev, monstr@monstr.eu, sparclinux@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Sat, 5 Apr 2025 at 19:22, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-02-18 at 18:55 +0100, Magnus Lindholm wrote:
> > Make pte_swp_exclusive return bool instead of int. This will better reflect
> > how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
> > problems on Alpha due pte_swp_exclusive not returning correct values when
> > _PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).
>
> Minor nitpick:
>
> "when _PAGE_SWP_EXCLUSIVE" => "when the _PAGE_SWP_EXCLUSIVE"
>
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

> > --- a/arch/alpha/include/asm/pgtable.h
> > +++ b/arch/alpha/include/asm/pgtable.h
> > @@ -334,7 +334,7 @@ extern inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
> >  #define __pte_to_swp_entry(pte)      ((swp_entry_t) { pte_val(pte) })
> >  #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
> >
> > -static inline int pte_swp_exclusive(pte_t pte)
> > +static inline bool pte_swp_exclusive(pte_t pte)
> >  {
> >       return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> >  }

> > --- a/arch/xtensa/include/asm/pgtable.h
> > +++ b/arch/xtensa/include/asm/pgtable.h
> > @@ -355,7 +355,7 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
> >  #define __pte_to_swp_entry(pte)      ((swp_entry_t) { pte_val(pte) })
> >  #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
> >
> > -static inline int pte_swp_exclusive(pte_t pte)
> > +static inline bool pte_swp_exclusive(pte_t pte)
> >  {
> >       return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> >  }
>
> I'm not so sure about this implicit cast from unsigned long to bool though.
>
> Is this verified to work correctly on all architectures? I wonder why this

Should work fine: any non-zero value is mapped to one.

> bug was not caught earlier on alpha on the other hand.

On Alpha, "pte_val(pte) & _PAGE_SWP_EXCLUSIVE" is either
_PAGE_SWP_EXCLUSIVE == 0x8000000000UL or zero.  Due to the return
type being int, the return value was truncated, and the function always
returned zero.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
