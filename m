Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944C1E3DDC
	for <linux-m68k@lists.linux-m68k.org>; Wed,  9 Oct 2024 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728512636; cv=none; b=BBgZ4vKakziFZAWwtAw0BQdxD054P+RjCA7TudVyKJv6oCkrQvT7nlxyTukjDF/hLUwgriOVQ2aJpiyBTZuvhnL7a4sm+AlqFRuHoK3gQWImwCkld3sFSrE6bP2iBzK6KqOQpbyCVsApWDDOcgzgYKoZMe46/I4pe/Gfp9TjFPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728512636; c=relaxed/simple;
	bh=w4l9dzDzlilO4E+6HL//zAT4zhaj8ld4amfc5zECEfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTSp2ckFjfqb3qVt/jnccQbegslwyGu+nbVzltWoEhxMxH8NzTo4SDJeE8s2JrMG5KALFPRIDQBk+fS4gwLZIOoUtYu2bUNRGF0WO/JPH5qtUHmze4yOzDFAFUFWl89J4QFl285JbYMzv5rUnxizPcuz1OtAUbRee3otwGnOgXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wiwa3rlr; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wiwa3rlr"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 247D05C5E7E
	for <linux-m68k@lists.linux-m68k.org>; Wed,  9 Oct 2024 22:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D9EC4CED9
	for <linux-m68k@lists.linux-m68k.org>; Wed,  9 Oct 2024 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728512632;
	bh=w4l9dzDzlilO4E+6HL//zAT4zhaj8ld4amfc5zECEfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wiwa3rlrYH9BC46EoCHkt+QLbJoTT1X2QA01HAqIYKjAte3oUq44GaeL+zZ4AkJ2c
	 2fmhTarWCgJZzvugjgiXFaapdrUxRw+aMHjQkxk7R7tMQ4X8TAISQfJF8mwZjkVS1k
	 P8ckfmO9JeSeyS8x4lu0kJaTjkOtHpLIIPYKJmo4HQ1/9VWZa6uO3ff20ntiwcvv+8
	 WNsOi1fvz3WyQp8/mTsIKp1bTZX1Q46ddgghD/obeQF4nyOrExSGPC7njchLh/Wo1L
	 w8uAfe7NKlqBlMlX1oAMsBsi5zUdQStu0GaxZpBZ0z6hB0R3qZA3l0SEImsa2B3CEC
	 jNcMMmsZn1/Ag==
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-37636c3872bso1449655ab.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Oct 2024 15:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtUDoBriKCV6LKn1sM5/OSIPTXYCt0samEue/1uIlKCs60P1YUtDKkQsKqrOjsN3iCcViBW3tQ2fzQ@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwYWmYGulYHpFas1SZjfHfjjs6byCDXzqv1bg3v7G3bUjNpbPN3
	KBb7nKVdBaTbrcD371f3314QiOKZtTgZ7z8sNfGb9GuW9/X4w3teC401nVZ2mLwYP1ATYYKcpI3
	ie89PDSXvtNTqFWT/3dTjXeGfZpk=
X-Google-Smtp-Source: AGHT+IE+0c/kMVosLTSGHy+n6QvIYJcOAn6W5BXDQkMmjF/nhxZwOJHSZ6SOjh26Vu9mUcUiW0DFRwoy/+Y0vdg6KQk=
X-Received: by 2002:a05:6e02:1fe6:b0:3a0:aac2:a0a4 with SMTP id
 e9e14a558f8ab-3a397cffa21mr40549325ab.9.1728512631542; Wed, 09 Oct 2024
 15:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-5-rppt@kernel.org>
In-Reply-To: <20241009180816.83591-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 9 Oct 2024 15:23:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
Message-ID: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
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

On Wed, Oct 9, 2024 at 11:10=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
[...]
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 88ecc5e9f523..7039f609c6ef 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -367,6 +367,8 @@ enum mod_mem_type {
>
>  struct module_memory {
>         void *base;
> +       void *rw_copy;
> +       bool is_rox;
>         unsigned int size;

Do we really need to hold the rw_copy all the time? I was
thinking we only need a temporary buffer when we want to
update anything. The buffer might be much smaller than "size".

Thanks,
Song

[...]
