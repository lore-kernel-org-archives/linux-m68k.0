Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2D39F184
	for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338553; cv=none; b=G0jev87FNb8xXF+QgAEpbnl7xUtqdoJwguZ2InqLEgGJq1s15W4PGgg++h4utwusLOcl89dqZEPZt6yZQdY6ESnvxNSgdJq128s4xTceqQAzQKSueGX/kdupwlntQ2VDA/wk97HcVVux7y5utKkxsGwGly3W0hC9B6c2RkMLWOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338553; c=relaxed/simple;
	bh=5RcGmn3E6IkK/4PLTUVN24XJ2jAiV11BodM4t9S5uGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWQCh9R8alncsbayo0Dnt97zKaJMqUo4tWAi1XG7AWyeH10yOy7B7hLGT/Zuj6inqHELel1zA7r29zzZd+RsDc2TefZO82mbTa02JsWtw9maG02WUNAKbruQphDlK0ZVT053wWbRfcIxXSsn4uKK2M54LwNsPJmpj15OJVzZ7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6137374b106so812565137.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 04:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338547; x=1776943347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6jqlHRyBmHp78NPQbVn/INUSPCxYZ/sUXVIyq1nXfE=;
        b=j5I9HdM2ZRp63pAnFR4rHTA9+NEbeonDz+I562SRMLDci/UC/FWEHUuEnQNaElMQ2t
         +nlGQudqFrEMPQEDfbhtt5atlJ3YGG+yezGcypOU7ASeBZhWf2Ay2rNoLt8ALiapnQXz
         huv9Ya1yryBzz1Qo3INI/s431DE2d1DxEDrLJHAxwx++S2R90gfugif7OJwGp2AuyFSh
         Ly0iYirTetFq3KCA1JYujSsd4aCmFOiwMV1OOVvavAR0OixhjSBsNr+8Y/MdCIXc10Ml
         3/Y4bR84XdqGxq1/bsrwHTsgbA7EvjAqNSa48wmXATVRgJftGgE8xQ9sR26NOoNvbr1I
         Q2/g==
X-Forwarded-Encrypted: i=1; AFNElJ/pPad7peE/16AgNzUE4gFYgC1d8wl8lFCUBfDBnsMp2V3nvmyHBn4REsyF3Gv/yYt70EVVhVKQudnV@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwmVoGdi4hAopJEAJOKf4g6yVJ5ANUlLtlMlF76jfEc2KeSPYF7
	SusdmmmaK/H9L4f6Q8fyo/Xx9sZ1rmnGm4IqBOuOSa9QTBEnhljHGYZYsaj3QbZ9
X-Gm-Gg: AeBDievF0O51mAn3Ve17kK1wmN7TMneJI8iH7wTVPztRZp1B7V7zaYsOm1XU77mdIn8
	BJJlqIsXPTyn1ETvxtT4uluZQg7EgSxVdS+SdBBT1sf/75I52mCxd0Zsl4qDoeEA/4maWMYs0kH
	TaIqTWjILOvq9CU5uDcaQL3oerlanPjfOZXDuGxkO8D9/XTcYiHRbMUy+KYKOCe6VQACSBCWXF7
	ADMLu77yaR0TCLuZQvgPH+BUmhoDL2NFstNufJSH27SMIPWNEJYF8ApAkd9tPO9Nn8v1EldSwUs
	EbDnOxi4OGqXYecUT4e5o/dMvebBn5wxQbCpYtmNEs5bEGkMbvP3H7JrvojL9Ao1/jEvTXw9Xik
	Hossa4GYo7Z80HCw5UklkBKl+sAirf/ykij3qbXxAJf6DaNIDu7SKxzC1et97AmwGv0jnyyrBcN
	kyvCRaV90XV1TvYMESl8AflQSMgKw6EG1fwrcleBNo5QVj6GNd9MR6fAR8JiwRu8on5isSFr/HJ
	Ur0UaBWHQ==
X-Received: by 2002:a05:6102:3fab:b0:5eb:fc32:935c with SMTP id ada2fe7eead31-609fe8a3033mr12491421137.3.1776338547628;
        Thu, 16 Apr 2026 04:22:27 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-958656c0b4dsm2097085241.10.2026.04.16.04.22.27
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:22:27 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-60579b9c0ccso6368690137.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 04:22:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/w5jREuKCQ4mNmp2CLFZ4kT7lYz8kCrsmHoVVV0NlgNfZNpj+Cnx5heWFZQHClswaw4HyPQ/QFAQKi@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6044:b0:5ff:c64d:2283 with SMTP id
 ada2fe7eead31-60a0157295cmr11348128137.30.1776338547396; Thu, 16 Apr 2026
 04:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
X-Gm-Features: AQROBzCJ6rVnwwfhi99PI36wWXAFQ5DEgo1zw3RhVwYNSXoxkTYAcgIxt5Z0K1g
Message-ID: <CAMuHMdVoo_6i9=2oQj-=yjW7nK8eL4og08bdYvk_EGj=_cQvQA@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
