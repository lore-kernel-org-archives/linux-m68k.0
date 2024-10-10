Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874E19CD01
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580714; cv=none; b=DATYe9+tU5N2p5Fr4A0H2IM6a1XEY1Vz+tYdoRhFmAx2d1Q4YODqTEW65+HzSO7V7pdlx5TSEYSrVmulbUu/dPbX3pEG/M0bExR6uN6YGRpZ89OxWtIgAxYhaLAQxWSJPcCGwsx08mUZA3qGAQ8AcX33rBxFfkx31CaZveAbZe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580714; c=relaxed/simple;
	bh=vaucBuX2fMrEpT3kygwI4CcFnWG5blOdj+4yYIH1/lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzxn0kmUq8ejIUSbtRJF1WPOYmlRT7xRbTF6RCwRhof0Qz7IzU+FOqom1SZHYRBD5QIcgFo7Kuwz530lhW/cRjgxbSmJgq5mhGANKSaS4vj+qFNE8dk2Cpuz7tVCBJxngrCtattAMYisV1cJt3W6BySn5dD8V+hXKNjun9c2tk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGQC3YGT; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGQC3YGT"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60B2DA40EE0
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 17:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1D9C4CEC5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728580711;
	bh=vaucBuX2fMrEpT3kygwI4CcFnWG5blOdj+4yYIH1/lc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YGQC3YGTpIM/Tv02Vn7usGJD/6tt+x+KTKu3UxnMO5NCC8+C7ZPh5ezrehFriglwe
	 0kHT558np8Wr8rw+tHrk6iFdI6TYZzj/XuDQyl1ohCHGBlLvqRKvMY9o2gFo+NuycW
	 y20uvBOD9Gdu+xnvXvzrx2PBIPwMfqD7Kk74Y5ZM4wURiZxI3kabAPnyXgltKV5Te8
	 nLgYuMl0XB6UP3CI6ocVV8lyp79EB210TDlqZm0fWRLk96yJAx28fczirFRv8Ok4xn
	 g28YaYfndtMh2lJkpow1r3uH0m1V9UcGEfvj2KBq6mV0UhVTJerIhIuFum/RTZvtMI
	 Z12HDd0NC/l1Q==
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a3a7b80447so4519095ab.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 10:18:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn+L7sQo5aQ4TYIRUyx8Z0ABxj3rQ/lRNj5eQVsK7fDP83y/2xtb5kNIxFVVca+Jze2QTWrR1xl6al@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzlpM7U0r3ukTcJAMi9+NnQqt8gXmYrmwujMztLpae1YU2J5xiM
	7MK5E+3pl+ysiSfwspN9HC54wDeF1z2A5A/K8gZasZ8ovvP+pv2b1Y+WWrnh14r88FId6v7FhJ5
	5Peg9KjBIqPu1eNgMzCEetNv7CUQ=
X-Google-Smtp-Source: AGHT+IGszKBBrf1gYsUhslMqcPNpC/f6sAFFbsmL+u+zGmeEd2sYZs3+7Tvb9T+CKCsx/nhk3yidKvoEgysxI18Lmn4=
X-Received: by 2002:a05:6e02:144d:b0:3a0:92e5:af68 with SMTP id
 e9e14a558f8ab-3a3b51daa94mr2839515ab.15.1728580710921; Thu, 10 Oct 2024
 10:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-5-rppt@kernel.org>
 <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com> <ZwdpnPKKQGF5DtSv@kernel.org>
In-Reply-To: <ZwdpnPKKQGF5DtSv@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 10 Oct 2024 10:18:19 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6gb76T_75TPzb-AvfyAcYE83iYhDpjJNHJQWDd3Fki_Q@mail.gmail.com>
Message-ID: <CAPhsuW6gb76T_75TPzb-AvfyAcYE83iYhDpjJNHJQWDd3Fki_Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, 
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 10:47=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Wed, Oct 09, 2024 at 03:23:40PM -0700, Song Liu wrote:
> > On Wed, Oct 9, 2024 at 11:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > [...]
> > > diff --git a/include/linux/module.h b/include/linux/module.h
> > > index 88ecc5e9f523..7039f609c6ef 100644
> > > --- a/include/linux/module.h
> > > +++ b/include/linux/module.h
> > > @@ -367,6 +367,8 @@ enum mod_mem_type {
> > >
> > >  struct module_memory {
> > >         void *base;
> > > +       void *rw_copy;
> > > +       bool is_rox;
> > >         unsigned int size;
> >
> > Do we really need to hold the rw_copy all the time?
>
> We hold it only during module initialization, it's freed in
> post_relocation.

Ah, I missed this part. Sorry for the noise.

Song
