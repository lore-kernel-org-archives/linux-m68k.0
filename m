Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F62FB614
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Sep 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715953; cv=none; b=Iiqq1iPcG3Fbzajy9s8H51MCVZGBM29hcEhhthUZtMhKwQl+aIqaMB0+QPK62ugEYw/AlAkjvdU6jCLT/GCc4cpMDqLr3QmwuQp9QZnZnrTq0Kur9PcqLiTwuTBJXykgE7kcxGvOhW3L93SSjNhQpuMlk9jBCanYR9OUCCWTcn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715953; c=relaxed/simple;
	bh=WTjzIUF3S1zA20EdM2pk/6KkYo46Fw8eYT1zQTtvK4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gfIh/MRg/wMOxn99eHDqYxcs3iAKRy/cUrpTaR6oYZYBS15O5eYpGbe0aRxMsI9vXOEnIMzZFu4vVgoeBBKwhBsXdYg2WIJG9S7fB9ZdckkznfTELuqyxQFTkiS4FW3deAaBq3q6ThyfbHZzNCLYiTqGgBSW4e4uuL55KUGS+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89434e44afcso2439709241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715950; x=1757320750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ulv02t6E8nasXluvV9ehM0QMWfZqnXi7fBl8WMsUhHw=;
        b=PDoRM+ym2jIuV5Yd8P8hY4WS7/zUQKbdLnBOSTKWJUte2ZUsd6059zvE+uvA28sW+T
         B1Id2ZxFiTGxST7Jz+tPk1jUQKpclmWxrjJUgvpu1HRrVeoopnvdMgXHbUy0n7QA8Zcs
         7bqXNShVriLZucvyM2gcc/WGK5lsRH0ae06iYzAX4JQ154NMHxBffcTxVj7LpTMmNQt8
         aG6dkzQm+XlStDfJ8SjDYgEk6nPifF1aUUbIgsdWiVvkKfo8zBQ6BEyXkLJp8eK7uO5O
         ycgxST7xA+HPevoZq2urddjMQspzwul/249xosLFNrQJsl2Ype/MbkRWBf6FW6sBcKo5
         F84g==
X-Forwarded-Encrypted: i=1; AJvYcCXRfZFES0ezigAOcmJGRMmBnvNC3PJKfUj9w9pjZ1NAyR0o8yFWQBaAvL6W7Cgc4aWFSkMtPhS3VOfy@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzhk6x+uIAdL26x7pB0hLWobIEPFwuqkzDvxlD0lsgtbURg36Qn
	UMdHeTAsUAN0DuZsXIhKs2jx3y9hBCSVIycF9M3W4NJj9unKi5dDlJSPrXsztnO7
X-Gm-Gg: ASbGncuEOOoTRLWPEIS7QFivjOlv9C0SosOMJAARRZQ1PX5ZPK7V5zVqJkfu45lXPS8
	UR4XR2E6arbSU489+zkFI6qMq9sRYpktJbZaiuqRuwpORa4AJJbRVO84soL61yeioTBOkG7F6NZ
	Q/IYXwIDTuKli6VslZZ0teElWdNw5MRJD5awMOqSF0lUg4tXN3VZk0b5ffBGfXFsGaMfE3YmUAR
	5kXBZLv5IPZ3+9gY9t/ny3CekgLKpjM8/BnmIKqD52mZw1oNEJ1A4GXTveKLx+0j1HmhFoqfV6t
	44DLcoqCD01N/kyfLEEkvKFr52OEgryXLse47OH5SgtuZpDEDqCMreoe1uj8pvKo/tgPwtoOfP4
	CH9GUmcnf2UpaZmiWdB2uJ7qYDOCV5ICDD2NMHkG/mBMV4F1D/EJ1ar84bEoXSSPRjdfxE4A=
X-Google-Smtp-Source: AGHT+IEYEvyYZmdRGWdn342nbQsPb9NX3ZqOa3olBIGkpahTMz2en3f7Hse4VtYY2YjuOH5oWnJwCQ==
X-Received: by 2002:a05:6102:5a92:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-52b19859a58mr1891639137.9.1756715949660;
        Mon, 01 Sep 2025 01:39:09 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52af1e46f50sm2750862137.14.2025.09.01.01.39.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:39:09 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8943761ca20so2301645241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Sep 2025 01:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGhETaF9uLv0OFPgCyxkupjZJUwawLNutsc7DLCUwK/kWoZmi8DAWtqTeGv2zSOQvoJXZDC40CND9k@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5789:b0:51c:4443:16e0 with SMTP id
 ada2fe7eead31-52b1be316e5mr1967209137.30.1756715948932; Mon, 01 Sep 2025
 01:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com> <20250827223606.GA915856@bhelgaas>
In-Reply-To: <20250827223606.GA915856@bhelgaas>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 10:38:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqKT4OaX6P_1CW_e2U1GwiCmyV5sAoDVa7EWUX2r6SsA@mail.gmail.com>
X-Gm-Features: Ac12FXyky2hWsQI9uSpsphCp4R_EUgbfbVJ67zlGAAXkq-snhjMBdE6QAlpgqhY
Message-ID: <CAMuHMdUqKT4OaX6P_1CW_e2U1GwiCmyV5sAoDVa7EWUX2r6SsA@mail.gmail.com>
Subject: Re: [PATCH 00/24] PCI: Bridge window selection improvements
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andreas Larsson <andreas@gaisler.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, 
	sparclinux@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Yinghai Lu <yinghai@kernel.org>, Igor Mammedov <imammedo@redhat.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	linuxppc-dev@lists.ozlabs.org, Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC Greg

On Thu, 28 Aug 2025 at 00:36, Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Fri, Aug 22, 2025 at 05:55:41PM +0300, Ilpo J=C3=A4rvinen wrote:
> > This series is based on top of the three resource fitting and
> > assignment algorithm fixes (v3).
> >
> > PCI resource fitting and assignment code needs to find the bridge
> > window a resource belongs to in multiple places, yet, no common
> > function for that exists. Thus, each site has its own version of
> > the decision, each with their own corner cases, misbehaviors, and
> > some resulting in complex interfaces between internal functions.
> > ...
>
> > I've tried to look out for any trouble that code under arch/ could
> > cause after the flags start to behave differently and therefore ended
> > up consolidating arch/ code to use pci_enable_resources(). My
> > impression is that strictly speaking only the MIPS code would break
> > similar to PCI core's copy of pci_enable_resources(), the others were
> > much more lax in checking so they'd likely keep working but
> > consolidation seemed still the best approach there as the enable checks
> > seemed diverging for no apparent reason.
> > ...
>
> >   m68k/PCI: Use pci_enable_resources() in pcibios_enable_device()
> >   sparc/PCI: Remove pcibios_enable_device() as they do nothing extra
> >   MIPS: PCI: Use pci_enable_resources()
> > ...
>
> >  arch/m68k/kernel/pcibios.c   |  39 +-
> >  arch/mips/pci/pci-legacy.c   |  38 +-
> >  arch/sparc/kernel/leon_pci.c |  27 --
> >  arch/sparc/kernel/pci.c      |  27 --
> >  arch/sparc/kernel/pcic.c     |  27 --
> > ...
>
> I love the fact that you're doing so much cleanup.  Thanks for all the
> work in this!
>
> Obviously all this code is quite sensitive, so I put it on
> pci/resource to get more exposure in -next.  If it turns out that we
> trip over things or just don't feel comfortable yet for v6.18, we can
> always defer this part until the next cycle.
>
> I will also watch for acks from the m68k, mips, and sparc maintainers
> for those pieces.
