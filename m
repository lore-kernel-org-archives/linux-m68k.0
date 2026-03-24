Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FE3ECBDB
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Mar 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774372388; cv=none; b=t5Iubsb2o+6bwLfNJgObQyuJYcrcOoLiVohhPYNKdQXW6M7ysIiwfPf5ZL91hJH8qNvSi6+1TzwxqYKJgi1GIxwFaW1INRezRlLaRIe1L3n8ps3rXd/iRcDIfjfumrmmgvOx9gLfUuxDwqzOUb+S5gjKBWSyDp5X5ejKeaxiEig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774372388; c=relaxed/simple;
	bh=3GEJwPfpmz1HAcFqPqDcCHr7DP7fs2OA9k1TBgcroIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyxAOUnu0nHPFTA4QHLialCtn3WLocuc7vv8yQgmfja6JeAkzPOA8gtuIgqzRVqU6yJZrD6DZPBXFGJlaTsiwute6K7G4WrSC4UJrJUQxgDyjF8c93ra7QIwGl3/Z9r1eh79JfQuMudwNo5c/isEGakuCQlPrhYgx/vfrmAcDm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b0586d5bb8so40531165ad.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Mar 2026 10:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372387; x=1774977187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imA4hBFgRxEV6K6PxesH3aFI8Gk9es7sFYCGiASF9lc=;
        b=RIMh1KURsPhcZVFI1TMYjITmNq3pOuCUyXHxvA+G3izPhfXvRNvY9zvcuXDPjQYxTE
         S6MsRpJuOxiDiVmw2Wxv0BOAKmbfwVY8JbEVN9jGaltRo0vWpnqkoA53m3b+iywJ9TuA
         RQ5kG4nh8Xjr5GN5y00cR8WjEMUnzjZGYzDudui3YRWe4mF/cVzWp8bhdMpCXX+dPZEd
         0xko01dBuem5E1/oA70shnoR1LJtsDFr+lYmJ3jpQCi4XSgTQhw1Xcuett94xcFZrKjs
         tcAEy/OOx/lWGH03FgEpsgBB7zloo/fqlqLWOpSebg+wa01iFY077sQS3WLTL7CJaQzp
         m/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXWeUxcPVMSXl1b9O77yzvcbTerpPTNwCv5ASHfaZqvrRwr4AkF9YIeq6WBgmp57UfyasetGm3NgNXe@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwMMXzyEfV/U0WsMR0i1epFaiXwaVZBak7bm5gTyAbdp7iqtWDF
	Et0HqSsiDhwzJl+nTtZWcolTDu5vcltFS/Tycs20T2ph7uQ9K4XeBD7FlVJ3nPyHoC0=
X-Gm-Gg: ATEYQzyIL1A+itduk4XLdNUQQ4khlyNxRp2RROQ2lQGIfNfZ8cqENeG+Og6ScLIGVrz
	NrggPTCKAogRAsAcvuqNup/ZojtMdVww6G7nK6YSKD4i+AxuSCVFe5lJloeR6tPpUIPfRraIt2s
	wC6kPOP9mK3zusn0X8z0rQNdAH4GWB9nttFIBfugIoNSUrHIAHROVtAC/7HG70O3PVFSlW8h2C4
	U75mVXm+lNlbr0mZEUOc7XmAuLOiQMNWMMVqXDpgMs5V8oI8GUD63mkhGwdzQUpiIYTPNEjMwkk
	FAR8QapDGbEtTGxu34Bp9TpWEmKww6ttZajdZyeG5XmVpeuMQGKQPtgGC57anxVHIDJDqL5qzZ/
	vtsqCANKu2dO/R6vCiwjuJJpuQ61HNS5lYNLx0VpF5C5pVY95sIlM4dy23757PFHkmcQeq35jvl
	Wgx+vU5gi8kUPVGPHonJZurC/jiykxJfyFnRFM1bv+OcUxy8c7+vl80it5Tp4=
X-Received: by 2002:a17:903:46c8:b0:2ae:3b9b:db34 with SMTP id d9443c01a7336-2b0b0b56f69mr3598545ad.42.1774372386074;
        Tue, 24 Mar 2026 10:13:06 -0700 (PDT)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083655b5dsm188825905ad.52.2026.03.24.10.13.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 10:13:05 -0700 (PDT)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-126ea4e9694so10567083c88.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Mar 2026 10:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVugG2/EBb64RSdCXQFwDti6YgUfq+C6OMrDxIdpxiASgD3vNJrpwJSdVJOSSU4702//hhzAQN3dFwh@lists.linux-m68k.org
X-Received: by 2002:a05:6122:1da4:b0:56b:5978:22f5 with SMTP id
 71dfb90a1353d-56d220a8b85mr416671e0c.12.1774371994638; Tue, 24 Mar 2026
 10:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Mar 2026 18:06:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
X-Gm-Features: AQROBzA3vydAXwvxX7mNaSzU55R-3eBg9lznDuFtNbFYtRdYd66gsLQKONTytjo
Message-ID: <CAMuHMdXX16=pih34yehj=3bJkg2H3ivGUj_34JDg31ABheLE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application of align
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC gerg

On Tue, 24 Mar 2026 at 17:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Aligning res->start by align inside pcibios_align_resource() is
> unnecessary because caller of pcibios_align_resource() is
> __find_resource_space() that aligns res->start with align before
> calling pcibios_align_resource().
>
> Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> result in changing start either because 0x300 bits would have not
> survived the earlier alignment if align was large enough to have an
> impact.
>
> Thus, remove the duplicated aligning from pcibios_align_resource().
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/m68k/kernel/pcibios.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> index 1415f6e4e5ce..7e286ee1976b 100644
> --- a/arch/m68k/kernel/pcibios.c
> +++ b/arch/m68k/kernel/pcibios.c
> @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, cons=
t struct resource *res,
>         if ((res->flags & IORESOURCE_IO) && (start & 0x300))
>                 start =3D (start + 0x3ff) & ~0x3ff;
>
> -       start =3D (start + align - 1) & ~(align - 1);
> -
>         return start;
>  }
>
> --
> 2.39.5
