Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330DE24503F
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 07:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640579; cv=none; b=UO1cxMi9a5Eyj8iXR2p2Y0GrQevO8f8Y0VbLjbhlLm32qyzDeDUtk9zTxW4t6a8OjPmyktSwKliIzByvepNSXsKt5h9SkWLCTFglFW1EFVaF+wt6KoP39AR8O8XyLJS3dbjp1xXNw21hYpdfR026PzuGvxeGofQtYA+ky7548lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640579; c=relaxed/simple;
	bh=gcLA+lDh6COrYeeUrsEF5RW8+lPWGWJ47ylMoVEyXHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pclTvVCb1iLto4c4pquB+Fn7NKCpv/jNN2O9WGuUUhQGQ5zcb17OGM8EnqVvS3hR+gqUwpj/uqtuLolKOOqKHepylrEIsFw6jMl78tQoTDrITaYdOoc8na6lzZQQo7zca9b3k8May3SnyUHKD7uGtGOH5WhZYO0iPjtO4LoIaow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-527b70bd90dso1450235e0c.3
        for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 00:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640575; x=1748245375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsCBRucdIV0PKemsyms8op7uM2ggb1lVPS4Q39myA4M=;
        b=ZgRUEUJJTrzbfEcAAiG3fWc2Kxlm/0/Dfg3ccj7VCg2nAXfl6QeHptx2B2nLtKUK/a
         L9I3PXiBs1E5KxqKqAwdeegkIkTIB+4wsiX6NIip3sJIIpjzSuUjQ5LVFK9aXIo86b9h
         byNqLTbMX3Cmv/Scy3K9lJOZQpwyjUu/39V28GcSDhlOTqrqNw4jLguOTz0F0EZrep+L
         yS3DkTKRXknW2297hMeQJBi42IKktZ0LfbdO9wJxLb8s4Rkn2BC3Y8dfUMvrUdkCNS+j
         TUNywjNUPf6900JTUrft6d+4w2I6kAtF5x4m+0UQEiyyQECo1aSmlwt+ROonAaYD95/g
         NiIw==
X-Forwarded-Encrypted: i=1; AJvYcCXtVM2MhIu+Dhm3kn/26Z/6lSXYSyMpwha9k8tPhFgC6dj5DhZWT5L3PkN1auh9LVag7/uZnJIikkW4@vger.kernel.org
X-Gm-Message-State: AOJu0YySjhJf9oL615i/oGDa51VBxAVRW/8vApEaQc7F2U5voNtofowb
	c8wszJHkIIM7mZjLhXwLNZBn4Wpj4q5QS1di+PhsT598QeCqnTDYf2oQOdfA1C2y
X-Gm-Gg: ASbGncsMBO4MJnGAufXyIO1ESISi8EXYJFxm0DVIhu4YslyR5UEox7RlMCA2vxF6Kva
	1a7mpJj9fwb4cF5GPWa25Ma4oPWEaasGLBThbBOIWBFDuy5LtWheMN3y0RAFoaQcpwGbhFVmfRD
	D/kFI1zLR7ECGWTjxb66734dG4mMhkn8bzxeR6T7rkPb7DnUu2uYStlv7Lc1HPO4dXhngpXzGX1
	xruz2TufVuWN2kj4p07uF6Utrxb4ZkqF7SjbGe3En9hBfrJNVUpF1aC1lERNMtxrU0lAzkomn2l
	jKQ86CguBJtkVgz4riirQ7UGZwY48Z/H+GRFF0l9Sh0NSUOpThBfInQKUqvMhkkmQxneMXJDwTI
	YM5HprWvszzY5wA==
X-Google-Smtp-Source: AGHT+IHJcvJ7ugLwUn5X0RDpxNc2fX1kkJh6RCbODoZZJjLDAU/kUDxERMZudyko0dCdiM1XEETgQA==
X-Received: by 2002:a05:6122:4317:b0:520:6773:e5bf with SMTP id 71dfb90a1353d-52dba800001mr9103015e0c.1.1747640574694;
        Mon, 19 May 2025 00:42:54 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba91076esm6264795e0c.3.2025.05.19.00.42.54
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 00:42:54 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c4ecf86e8bso1392986137.2
        for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 00:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/2RYzbpVFcihXQvouLUw5MEqi3G5d+44N2FGGsMGoF0hh6x/fOJFnxj/S3utx0F8J9C4EZKoJVQKY@vger.kernel.org
X-Received: by 2002:a05:6102:47:b0:4e2:83c5:9354 with SMTP id
 ada2fe7eead31-4e283c59726mr1708422137.12.1747640573948; Mon, 19 May 2025
 00:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com> <ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
In-Reply-To: <ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 09:42:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
X-Gm-Features: AX0GCFu_yu_4eE-lXcQMCl1lxr3x7T6Zhkx_RwA56PYQrXqFciJO_LEiWJ5lIx8
Message-ID: <CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Antonio Vargas Gonzalez <windenntw@gmail.com>, James Le Cuirot <chewi@aura-online.co.uk>, 
	libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>, 
	linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Sun, 18 May 2025 at 17:07, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Sun, 2025-05-18 at 16:39 +0200, Antonio Vargas Gonzalez wrote:
> > It correlates with the default in AmigaOS, which was originally
> > optimized to fit in 256K of RAM.
>
> AmigaOS doesn't use ELF though, it uses COFF. And Amiga Unix, which uses
> ELF, has a default alignment of 4 bytes as specified by the AT&T ABI.

Initially Linux didn't use ELF either, but a.out.
SunOS4 (based on BSD) did use 2-byte alignment on m68k, so I am still
surprised NetBSD didn't follow suit.
SunOS5 (based on SVR4) no longer supported m68k.

I expect (the history of) the gcc sources would tell you more about
the default alignment on other (legacy UNIX) OSes supporting m68k...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
