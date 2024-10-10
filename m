Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C871E47C1
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544960; cv=none; b=s5JRXGO39bdAp3gwIMqfvFX1cvcB5jgVjczLdlyNbAQCUBww3NGV/YVMjRxwXu7/gn+OnQrViynRfwUlCQlHRCkedqDNvF5rtHMmkla0O67ZEUgBwLl9TROTUtZPVCjr3G5GBBp2/Xhx5PZlytH12/dbT7nubnb+hZ/q1RT3zME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544960; c=relaxed/simple;
	bh=l3tvN995WrTW85WorpTc0P1WzFKQ+3NtgLmALeDmXf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lr34eZnsC51vZ4baT+D9fEfXMFhWRd7FlxmMimgpSwNSTfBwgoqQ3KbPb4xnnm6A++izgK9SiXDhSkHdsbXxG66c13N9D+hGtjX3X8QIy/p//Uts7eRkUsjxrisz79TkZUscoWro0X4d9CJVEhy9Ldm5RFkK6lEt7IixNdbpcJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2f4c1f79bso6369927b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 00:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544957; x=1729149757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cEkDPRbXErPkgoWEGdbZCw32b468GFBk0qa08gpGWY=;
        b=Z/HgJIObVApdY8hfuL7H6eqFWJc3F72SuzeenuF2Q7CC54LwnYLPezdTbEC6IjSn9U
         awddiK0Z4eJDwbO0A73rsGaGQs5WQuPirbZbUyNPgBFzxmlq9fI0X3Nu9MBYi4jMMtfE
         CdqrQZNhlMJZyraLuNinkfGPjUlZNevj+/ZOmvH+6ZlEX3uOQ4mX/S52kyW+YNoYPJTF
         0XlGVe/gWcwdUvOlo8lQE38tflCJlZKVIAdwNZfcwCe08bRiO2Wgzzp/Qf3TGoP+/M34
         7rEqGq+X5LrL+um4uj6jfgt/LMyoVAsjJ2Vch7ROjPdWD24jQKVU5OHKewA3/g9NN+d4
         VJOA==
X-Forwarded-Encrypted: i=1; AJvYcCXkVAmHDgORo1i9SMwztf+Uw7lG55UI0r5ACqi1TFgTbGO24EYHUMGFD8QAH0jSovGkU/NP5FaEnnTi@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzB8yLA6wMnmojflcfAXLSA4foqdn7xoP04on739R8YHgknUw/h
	uFV4vEgRVjs9K1ZQhpxYufxzJhn/RcSVkOmG/dMGS/iUh0108XUl7ynu6jXH
X-Google-Smtp-Source: AGHT+IFVymb+1G9v2ReptjEZzGRT3TyiojN92HkJYH71ipPcGrxixwT3lTlOXsxKzpPPXdJAk6rDBg==
X-Received: by 2002:a05:690c:dc1:b0:6db:31f6:a812 with SMTP id 00721157ae682-6e3221867f1mr61067797b3.4.1728544956743;
        Thu, 10 Oct 2024 00:22:36 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b61616sm1326877b3.2.2024.10.10.00.22.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 00:22:36 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dbc9a60480so6363237b3.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 00:22:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCtYmMBNEd0uKOhIcH0pBReyyvxlVpCepyBCO6zqiVq2UZX8RfKB9OaYPOh3J7GU8vU+/sUCNY6MZb@lists.linux-m68k.org
X-Received: by 2002:a05:690c:60c2:b0:6b3:a6ff:7676 with SMTP id
 00721157ae682-6e3221867cemr55553697b3.3.1728544955686; Thu, 10 Oct 2024
 00:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009180816.83591-1-rppt@kernel.org> <20241009180816.83591-4-rppt@kernel.org>
In-Reply-To: <20241009180816.83591-4-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 09:22:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Message-ID: <CAMuHMdV9TPH+mDJvvuRO3RBYfgWRwvv1kwyr_iLNju+iumb96Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] asm-generic: introduce text-patching.h
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, 
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

On Wed, Oct 9, 2024 at 8:09=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Several architectures support text patching, but they name the header
> files that declare patching functions differently.
>
> Make all such headers consistently named text-patching.h and add an empty
> header in asm-generic for architectures that do not support text patching=
.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/m68k/include/asm/Kbuild                      |  1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
